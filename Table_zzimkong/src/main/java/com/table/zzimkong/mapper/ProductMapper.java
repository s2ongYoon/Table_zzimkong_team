package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.SearchVO;

@Mapper
public interface ProductMapper {

	List<CompanyVO> selectCompanyList(SearchVO search);

	List<MenuVO> selectMenuList(CompanyVO company);

	CompanyVO selectCompany(CompanyVO company);

	int selectReservationInfo(@Param("search") SearchVO search, @Param("com_id")int comId);

	List<ReservationVO> selectVisitedPeople(int user_idx);

	List<CompanyVO> selectSimilarCompanyList(@Param("sort") String sort, @Param("company")CompanyVO company, @Param("tagList")List<String> tagList);
}
