package com.prj.main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.prj.companys.mapper.CompanyMapper;
import com.prj.main.mapper.MainMapper;
import com.prj.main.mapper.PagingMapper;
import com.prj.main.vo.ImagefileVo;
import com.prj.main.vo.Pagination;
import com.prj.main.vo.PagingResponse;
import com.prj.main.vo.ReviewCompanyInfoVo;
import com.prj.main.vo.ReviewCompanyListVo;
import com.prj.main.vo.SearchVo;
import com.prj.main.vo.UserReviewVo;
import com.prj.service.PdsService;
import com.prj.users.vo.UserVo;
import com.prj.users.vo.reviewImageVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("Main/Review")
public class ReviewController {
	
	@Autowired
	private MainMapper mainMapper;
	
	@Autowired
	private PagingMapper pagingMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private PdsService pdsService;
	
	/* review 관련 */
	/*================================================================================*/
	@RequestMapping("/List")
	public ModelAndView list(@RequestParam(value="nowpage", 
		    required = false, defaultValue="1") int nowpage) {
		int count = mainMapper.getCount();
		ModelAndView mv = new ModelAndView();
		
		
		int  companyCount  = pagingMapper.companyCount();
	    PagingResponse<ReviewCompanyListVo> response = null;
	    if( companyCount < 1 ) { // 현재 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);}
	    
	    // 페이징을 위한 초기 설정
	    SearchVo searchVo = new SearchVo();
	    searchVo.setPage(nowpage);      // 현재 페이지 정보
	    searchVo.setRecordSize(5);     // 페이지당 5개
	    searchVo.setPageSize(5);       // paging.jsp에 출력할 페이지번호수
	    
	    // Pagination 설정
	    Pagination pagination = new Pagination(companyCount, searchVo);
	    int 	offset		= searchVo.getOffset();
	    int		recordSize	= searchVo.getRecordSize();

    	List<ReviewCompanyListVo> list = pagingMapper.getCompanyPagingList(offset,recordSize);;
	    response = new PagingResponse<>(list, pagination);
	    
	    System.out.println("response : " + response);
	    mv.addObject("count",count);
		mv.addObject("response",response);
		mv.addObject("nowpage",nowpage);		
		mv.addObject("searchVo",searchVo);				
		mv.setViewName("main/review/list");
		return mv;
	}
	
	@RequestMapping("/View")
	public ModelAndView view(@RequestParam ("company_idx") String company_idx) {
		ReviewCompanyInfoVo vo = mainMapper.getCompanyInfo(company_idx);
		Integer count = mainMapper.getReviewCount(company_idx);
		List<UserReviewVo> userReview = mainMapper.getUserReview(company_idx);
		int  countP = mainMapper.countP(company_idx);
		
		ImagefileVo ifvo = pdsService.getImagefile(vo.getImage_idx());
		String imagePath = "";
		if(ifvo==null) {
			 imagePath = "0";
		}else {
			imagePath = ifvo.getImage_path().replace("\\", "/");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("countP", countP);
		mv.addObject("vo",vo);
		mv.addObject("count",count);
		mv.addObject("imagePath",imagePath);
		mv.addObject("userReview",userReview);
		mv.setViewName("main/review/view");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/review/writeForm");
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(UserReviewVo vo) {
		System.out.println(vo);
		mainMapper.insertReview(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Main/Review/List");
		return mv;
	}
	
	
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(UserReviewVo urVo) {
		UserReviewVo vo = mainMapper.getReviewData(urVo.getReview_idx());
		ModelAndView mv = new ModelAndView();
		System.out.println(vo);
		mv.addObject("vo", vo);
		mv.setViewName("main/review/updateForm");
		return mv;
	}
	
	@RequestMapping("/Update")
	public ModelAndView upadte(UserReviewVo vo) {
		mainMapper.updateReview(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Main/Review/MyReview");
		return mv;
	}
	
	@RequestMapping("/Delete")
	public ModelAndView delete(UserReviewVo vo) {
		mainMapper.deleteReview(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Main/Review/MyReview");
		return mv;
	}
	
	
	@RequestMapping("/MyReview")
	public ModelAndView myReview(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVo user = (UserVo) session.getAttribute("login");
		List<UserReviewVo> myReview = mainMapper.getMyReview(user.getUser_idx());
		ModelAndView mv = new ModelAndView();
		mv.addObject("myReview",myReview);
		mv.setViewName("main/review/myReview");
		return mv;
	}
	
	@RequestMapping("/BookMarkOn")
	public void bookMarkOn(@RequestParam ("company_idx") String company_idx , @RequestParam ("user_idx") String user_idx) {
		mainMapper.bookMarkOn(user_idx,company_idx );
	}
	
	@RequestMapping("/BookMarkOff")
	public void bookMarkOff(@RequestParam ("company_idx") String company_idx , @RequestParam ("user_idx") String user_idx) {
		mainMapper.bookMarkOff(user_idx,company_idx );
	}
	
	
}
