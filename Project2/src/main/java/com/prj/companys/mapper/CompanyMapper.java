package com.prj.companys.mapper;

import java.util.List;	

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.prj.companys.vo.ComApplyVo;
import com.prj.companys.vo.ComBookmarkVo;
import com.prj.companys.vo.CompanyVo;
import com.prj.companys.vo.EvaluateVo;
import com.prj.companys.vo.PostSkillFormVo;
import com.prj.companys.vo.PostSkillVo;
import com.prj.companys.vo.PostWriteVo;
import com.prj.companys.vo.RConutVo;
import com.prj.main.vo.CareerVo;
import com.prj.main.vo.CityVo;
import com.prj.main.vo.DutyVo;
import com.prj.main.vo.EmpVo;
import com.prj.main.vo.PostListVo;
import com.prj.main.vo.PostVo;
import com.prj.main.vo.ResumeListVo;
import com.prj.main.vo.SkillVo;
import com.prj.users.vo.EduVo;
import com.prj.users.vo.ScoreVo;

@Mapper
public interface CompanyMapper {

	void insertCompany(CompanyVo companyVo);

	CompanyVo login(String userid, String passwd);

	int countP(int company_idx);

	int countB(int company_idx);

	int countA(int company_idx);

	List<PostVo> getPostList(PostVo postVo);

	PostVo getPost(PostVo postVo);

	void updateCompany(CompanyVo companyVo);

	CompanyVo getCompany(CompanyVo postVo);

	List<DutyVo> getDuty();

	List<EmpVo> getEmp();

	List<CareerVo> getCareer();

	List<EduVo> getEdu();

	List<CityVo> getCity();

	List<SkillVo> getSkill();

	void insertPost(PostWriteVo postWriteVo);

	void insertPostSkill(PostWriteVo postWriteVo);

	void deletePost(PostWriteVo postWriteVo);

	void deletePostSkill(PostWriteVo postWriteVo);

	void updatePost(PostWriteVo vo);

	void updatePostSkill(PostWriteVo vo);

	PostWriteVo getCompanys(PostWriteVo postWriteVo);

	PostVo getSalary(PostVo postVo);

	PostVo getContent(PostVo postVo);

	PostVo getPosts(PostVo postVo);

	DutyVo getDutyName(DutyVo dutyVo);

	PostListVo getSkills(PostListVo postListVo);
	
	
	
	List<ComBookmarkVo> getBookList(CompanyVo companyVo);

	void insertBook(int user_idx, int post_idx);

	void deleteBook(int cb_idx);

	List<RConutVo> getRCount(int company_idx);

	List<ComApplyVo> getapplyList(int post_idx);

	void updateApply(int appli_idx, String appli_status);

	void deleteApply(int appli_idx);

	ScoreVo getReviewScore(int company_idx);

	PostSkillVo getSkillIDX(int post_idx);

	void deleteSkill(int post_idx);

	void insertSkill(PostWriteVo vo);

	void deleteCompany(CompanyVo companyvo);

	CompanyVo getCompanyById(String company_id);

	void insertEvaluate(EvaluateVo evaluateVo);

	EvaluateVo getEvaluate(@Param("evaluateIdx") List<EvaluateVo> evaluateIdx);

	void updateEvaluate(EvaluateVo evaluateVo);

	List<EvaluateVo> getEvaluateIdx(@Param("appli_idx") int appli_idx);

	List<ComApplyVo> getAppliIdx(int resume_idx);

	void updatePostimage(PostWriteVo vo);

	int getpostC(int post_idx);

	void updateRemove(int appli_idx);

	void insertTotalScore(EvaluateVo evaluate);

	void updateTotalScore(EvaluateVo evaluate);

	void updateCompanyMax(CompanyVo companyVo);

	void insertSkillList( @Param("skillList") List<PostSkillFormVo> skillList);

	List<PostSkillVo> getPostSkillList(int post_idx);

	void updateSkillList( @Param("skillList")List<PostSkillFormVo> skillList);

	List<ComApplyVo> getapplyListSkill(int post_idx);

	void updateApplyByEvaluate(@Param("appli_idx") int appli_idx, @Param("appli_status") String appli_status);

	String getAppliStatus(List<ComApplyVo> appli_idx);







	
	

}
