package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.SearchVO;

@Mapper
public interface ProductMapper {

	List<CompanyVO> selectCompanyList(SearchVO search);
	

}
