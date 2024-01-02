package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface CeoMapper {

	int insertMenu(@Param(value = "menu") MenuVO menu, @Param(value = "com_id") int com_id);

	List<CompanyVO> selectMycompanyList(int sIdx);

	MenuVO selectMenu(MenuVO menu);

	int updateMenu(MenuVO menu);

	int deleteMenu(MenuVO menu);

	int insertCompanyInfo(@Param("com") CompanyVO company,@Param("sId") String sId);

	CompanyVO selectEachCompany(String com_num);

	int updateComStatus(CompanyVO company);

	int updateAdGrade(CompanyVO company);

	int updateStatusClose(String com_num);

<<<<<<< HEAD
	List<CompanyVO> selectCeoList(int sIdx);

	List<ReservationVO> selectResInfo(CompanyVO company);
	
=======
	int updateCompany(CompanyVO company);
>>>>>>> stash

	
}
