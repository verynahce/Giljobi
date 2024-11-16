package com.prj.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.prj.main.vo.ReviewCompanyListVo;

@Mapper
public interface PagingMapper {

	int companyCount();


	List<ReviewCompanyListVo> getCompanyPagingList(int offset, int recordSize);

}
