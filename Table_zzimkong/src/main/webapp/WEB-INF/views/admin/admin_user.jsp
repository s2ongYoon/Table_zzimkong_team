<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_user.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin_article.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin_script.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_top.jsp"/>
	</header>
	
	<section class="article">
        <div class="text">
        
			<%-- 검색창 --%>
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form action="/zzimkong/admin/user">
							<div class="search-wrap">
								<select name="searchMemberType" class="search_select">
									<option value="member_all" <c:if test="${param.searchMemberType eq 'member_all'}">selected</c:if>>아이디&닉네임</option>
									<option value="member_id" <c:if test="${param.searchMemberType eq 'member_id'}">selected</c:if>>아이디</option>
									<option value="member_nick" <c:if test="${param.searchMemberType eq 'member_nick'}">selected</c:if>>닉네임</option>
								</select>
								
		                        <input id="search" type="search" name="searchMemberKeyword" placeholder="검색어를 입력해주세요." value="${param.searchMemberKeyword}">
								<button type="submit" class="btn btn-dark"><i class="material-icons search_icon">&#xe8b6;</i></button>
		                    </div>
		                </form>
		            </div>
		        </div>
	        </div>
	        <div class="float_after"></div>
	        
			<h3>회원 관리</h3>
			
			<form action="/zzimkong/admin/user/withdraw/Pro" method="POST" id="withdrawForm">
				<table border="1">
					<tr>
						<th>회원번호</th>
						<%-- 카테고리 필터 : 회원 구분 --%>
						<th>
							<select id="memberCategory">
							    <option value="member_all" selected>회원구분</option>
							    <option value="member_user">일반회원</option>
							    <option value="member_ceo">업주회원</option>
							</select>
						</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>포인트</th>
						<th>가입일자</th>
						<%-- 카테고리 필터 : 회원 상태 --%>
						<th>
							<select id="memberStatusCategory">
							    <option value="member_status_all" selected>회원상태</option>
							    <option value="member_status_1">정상</option>
							    <option value="member_status_2">휴면/정지</option>
							    <option value="member_status_3">탈퇴</option>
							</select>
						</th>
						<th>탈퇴</th>	
					</tr>
					<%-- 아래로 회원 목록 출력 --%>
					<c:forEach var="member" items="#{memberList}">
						<tr>
							<td>${member.user_idx}</td>
							<%-- 회원 구분 --%>
							<c:choose>
								<c:when test="${member.user_category eq 1}">
									<td class="member_item" data-category="member_user">일반회원</td>
								</c:when>
								<c:when test="${member.user_category eq 2}">
									<td class="member_item" data-category="member_ceo">업주회원</td>
								</c:when>
								<c:when test="${member.user_category eq 3}">
									<td class="member_item" data-category="member_admin" style="color:blue;">관리자</td>
								</c:when>
								<c:otherwise>
									<td class="member_item" data-category="member_unknown" style="color:red;">알수없음</td>
								</c:otherwise>
							</c:choose>
							<td>${member.user_id}</td>
							<td>${member.user_nick}</td>
							<td>
								<%-- 숫자값 : 쉼표로 구분된 형식으로 --%>
								<fmt:formatNumber value="${member.total_point}" groupingUsed="true"/>p
							</td>
							<td>${member.user_reg_date}</td>
							<%-- 회원 상태 --%>
							<c:choose>
								<c:when test="${member.user_status eq 1}">
									<td class="member_status_item" data-category="member_status_1">정상</td>
								</c:when>
								<c:when test="${member.user_status eq 2}">
									<td class="member_status_item" data-category="member_status_2">휴면/정지</td>
								</c:when>
								<c:when test="${member.user_status eq 3}">
									<td class="member_status_item" data-category="member_status_3">탈퇴</td>
								</c:when>
								<c:otherwise>
									<td class="member_status_item" data-category="member_status_unknown" style="color:red;">알수없음</td>
								</c:otherwise>
							</c:choose>
							<%-- 회원 탈퇴 --%>
							<td>
								<input type="hidden" id="user_idx" name="user_idx">
								<c:choose>
									<c:when test="${member.user_status eq 1 || member.user_status eq 2}">
										<button type="submit" onclick="user_withdraw(${member.user_idx})" class="button_cancel">탈퇴</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="button_grey2">탈퇴</button>
									</c:otherwise>
								</c:choose>
							</td>	
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</section>

	<%-- 상단으로/bottom --%>
	<footer>
		<jsp:include page="../inc/topup.jsp"/>
		<jsp:include page="../inc/bottom_main.jsp"/>
	</footer>
</body>
</html>