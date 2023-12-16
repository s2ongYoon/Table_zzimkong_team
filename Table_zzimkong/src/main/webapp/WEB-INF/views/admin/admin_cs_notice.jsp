<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${pageContext.request.contextPath }/resources/css/global.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath }/resources/css/admin_cs.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin_top.css">
<script type="text/javascript">
	function noticeRegisterForm() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/admin/cs/notice/register','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
	function noticeModifyForm() {
		/* 팝업창 중앙 정렬 */
		var popupW = 950;
		var popupH = 700;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		window.open('${pageContext.request.contextPath }/admin/cs/notice/modify','','width='+popupW+',height='+popupH+',left='+left+',top='+top+',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no')	
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	<section class="notice">
	  <div class="text">
		  <div class="page-title">
		        <span class="container">
		            <h3>고객센터 - 공지사항 관리</h3>
		        </span>
		        <span>
					<button type="button" id="buttonQna" onclick="location.href='qna'">1:1 문의 관리</button>	
					<button type="button" id="buttonFaq" onclick="location.href='faq'">자주묻는 질문 관리</button>	
		    		<button type="button" id="buttonRegister" onclick="noticeRegisterForm()">새글작성</button>
		    	</span>
		    </div>
		
		    <!-- board seach area -->
		    <div id="board-search">
		        <div class="container">
		            <div class="search-window">
		                <form action="">
		                	<div class="search_and_date">
			                	<span class="date_input_wrap">
				                    <div class="datepicker dp1">
				                        <input type="date" maxlength="10" name="sdate" id="sdate" class="hasDatepicker" placeholder="">
				                    </div>
				                    <span>~</span>
				                    <div class="datepicker dp2">
				                        <input type="date" maxlength="10" name="edate" id="edate" class="hasDatepicker">
				                    </div>
			                	</span>
			                    <span class="search-wrap">
			                        <label for="search" class="blind">공지사항 내용 검색</label>
			                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
			                        <button type="submit" class="btn btn-dark">검색</button>
			                    </span>
		                   </div>
		                </form>
		            </div>
		        </div>
		    </div>
		
		   <div id="board-list">
		   		<div class="container">
				    <table class="board-table">
				        <thead>
				        <tr>
				            <th scope="col" class="th-num" rowspan="2">번호</th>
				            <th scope="col" class="th-category">게시판유형</th>
				            <th scope="col" class="th-title" rowspan="2">제목</th>
				            <th scope="col" class="th-date" rowspan="2">등록일</th>
				        </tr>
				        <tr>
				            <th scope="col" class="th-category">
								<select class="user_select">
				            		<option>회원유형</option>
									<option>일반회원</option>
									<option>사업자회원</option>
				            	</select>
							</th>
				        </tr>
				        </thead>
				        <tbody>
				        <tr>
				            <td>3</td>
				            <th class="cs_th">사업자회원</th>
				            <th class="cs_th">
				              <a onclick="noticeModifyForm()">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
				              <p>테스트</p>
				            </th>
				            <td>2017.07.13</td>
				        </tr>
				        <tr>
				            <td>2</td>
				            <th class="cs_th">사업자회원</th>
				            <th class="cs_th">
				              <a onclick="noticeModifyForm()">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
				              <p>테스트</p>
				            </th>
				            <td>2017.07.13</td>
				        </tr>
				        <tr>
				            <td>1</td>
				            <th class="cs_th">사업자회원</th>
				            <th class="cs_th">
				              <a onclick="noticeModifyForm()">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
				              <p>테스트</p>
				            </th>
				            <td>2017.07.13</td>
				        </tr>
				        
				        </tbody>
				    </table>
				</div>
		   </div> 
		</div>
	</section>
<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/admin_topup.jsp"/>
	<%-- 	<jsp:include page="../inc/bottom_main.jsp"/> --%>
	</footer>
</body>
</html>