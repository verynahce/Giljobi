package com.prj.main.mapper;

import java.util.List;	

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.prj.companys.vo.CompanyVo;
import com.prj.main.vo.CareerVo;
import com.prj.main.vo.CityVo;
import com.prj.main.vo.ClarificationVo;
import com.prj.main.vo.DutyVo;
import com.prj.main.vo.EmpVo;
import com.prj.main.vo.PostClickListVo;
import com.prj.main.vo.PostClickVo;
import com.prj.main.vo.PostCountVo;
import com.prj.main.vo.PostListVo;
import com.prj.main.vo.PostVo;
import com.prj.main.vo.ResumeClickVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.main.vo.ReviewCompanyInfoVo;
import com.prj.main.vo.ReviewCompanyListVo;
import com.prj.main.vo.SkillVo;
import com.prj.main.vo.UserReviewVo;
import com.prj.users.notification.service.Notice;
import com.prj.users.vo.ApplicationVo;
import com.prj.users.vo.NoticeVo;
import com.prj.users.vo.ResumeSkillVo;
import com.prj.users.vo.UserScoutVo;

@Mapper
public interface MainMapper {
	List<CityVo> 	getCityList();
	List<DutyVo> 	getDutyList();
	List<CareerVo> 	getCareerList();
	List<EmpVo>		getEmpList();
	List<SkillVo> 	getSkillList();
	
	 /* 채용정보 부분 */
	PostListVo 			getPost(String post_idx);
	List<PostListVo>	getCompanyPost(int company_idx);
    List<PostListVo> 	getPostList();
    List<PostListVo> 	getFilteredPosts(@Param("city_id")    String cityId,
	                                 	 @Param("duty_id") 	  String dutyId,
	                                 	 @Param("career_id")  String careerId,
	                                 	 @Param("emp_id") 	  String empId,
	                                 	 @Param("skill_id")   String skillId, 
	                                 	 @Param("company_name") String companyName);
    void updatePostHit(String post_idx);
	
    
    /* 인재정보 부분 */
    ResumeListVo getResume(String resume_idx);
    List<ResumeListVo>  getUserResume(int user_idx);
	List<ResumeListVo> 	getResumeList();
	List<ResumeListVo> getFilteredResumes(@Param("city_id")   String cityId,
							        	  @Param("duty_id")   String dutyId,
							        	  @Param("career_id") String careerId,
							        	  @Param("emp_id") 	  String empId,
							        	  @Param("skill_id")  String skillId);
	void updateResumeHit(String resume_idx);
	List<ReviewCompanyListVo> getCompanyList();
	void insertApply(ApplicationVo vo);
	void insertReview(UserReviewVo vo);
	ReviewCompanyInfoVo getCompanyInfo(String company_idx);
	Integer getReviewCount(String company_idx);
	List<UserReviewVo> getUserReview(String company_idx);
	List<UserReviewVo> getMyReview(int user_idx);
	UserReviewVo vo(int review_idx);
	UserReviewVo getReviewData(int review_idx);
	void updateReview(UserReviewVo vo);
	void deleteReview(UserReviewVo vo);
	int getCount();
	Double getTotPoint(String post_idx);
	void insetScout(String resumeIdx, String postIdx);
	void bookMarkOn(String user_idx,String company_idx);
	void bookMarkOff(String user_idx,String company_idx);
	
	//북마크
	void deleteBookC(int company_idx, int resume_idx);
	String getBookC(int company_idx, String resume_idx);
	void insertBookC(int company_idx, int resume_idx);
	void insertBookU(int company_idx, int user_idx);
	void deleteBookU(int company_idx, int user_idx);	
	String getBookU(int user_idx, int company_idx);
	
	//지원자수 ,클릭 , 클릭추천공고리스트 , 인담자 톡 ,
	PostCountVo getPostCount(String post_idx);
	List<PostClickListVo> getPostClickList(int user_idx, String post_idx, int duty_id);
	PostClickVo getPostclick(int user_idx, int post_idx);
	void insertPostClick(int user_idx, int post_idx);
	ClarificationVo getClarification(String post_idx);
	ClarificationVo getClarification(int post_idx);
	int countP(String company_idx);
	List<ResumeClickVo> getResumeClickList(int resume_idx);
	void deleteResumeClickR(int resume_idx);
	void inserCarification(ClarificationVo carificationVo);
	void updateClarification(ClarificationVo clarificationVo);
	void deleteClarification(int post_idx);
	void insertCarPost(String cloth, String age, String setc, String prek, String pto, String pect, String mm, String mc, int post_idx);
	void deletePostClick(int post_idx);
	List<ResumeClickVo> getResumeClickListR(int resume_idx, int company_idx, int duty_id);
	ResumeClickVo getResumeClick(int resume_idx, int company_idx);
	void insertResumeClick(int resume_idx, int company_idx);
	List<ResumeSkillVo> getResumeSkillListLong();
	List<PostListVo> getCompanyPostIdx(int company_idx);
	List<ResumeListVo> getUserResumeIdx(int user_idx);
	List<NoticeVo> getNoticeUser(int user_idx);
	List<CompanyVo> getCompanyNameList();






	
}