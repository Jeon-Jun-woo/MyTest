<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row{
   margin: 0px auto;
   width: 960px;
}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/> <!-- 세션 -->
</sec:authorize>
	<div class="container">
		<div class="banner-section spad">
	        <div class="container-fluid">
	        	<h2 class="sectiontitle">자유 게시판</h2>
			<table class="table">
				<tr>
					<td>
						<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
							<a href="insert.do" class="btn btn-sm btn-primary">새글</a>
						</sec:authorize>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr class="danger">
					<th width="10%" class="text-center">번호</th>
					<th width="55%" class="text-center">제목</th>
					<th width="10%" class="text-center">이름</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<c:set var="count" value="${count }"/>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td width="10%" class="text-center">${count }</td>
						<td width="55%">
							<c:if test="${vo.group_tab>0 }"><!-- 댓글이 있다면 -->
								<c:forEach var="i" begin="1" end="${vo.group_tab }">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="../img/1.png" style="width: 15px; height: 15px">
							</c:if>
							<c:if test="${vo.subject=='삭제한 게시물입니다' }">
								<span style="color: gray">${vo.subject }</span>
							</c:if>
							<c:if test="${vo.subject!='삭제한 게시물입니다' }">
								<a href="detail.do?no=${vo.no }">
									${vo.subject }
								</a>
							</c:if>
						</td>
						<td width="10%" class="text-center">${vo.name }</td>
						<td width="15%" class="text-center">${vo.dbday }</td>
						<td width="10%" class="text-center">${vo.hit }</td>
					</tr>
					<c:set var="count" value="${count-1 }"/>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<!-- <td>
						<input type="checkbox" value="N" name="fd">이름
						<input type="checkbox" value="S" name="fd">제목
						<input type="checkbox" value="C" name="fd">내용
						<input type="text" class="input-sm" name="ss">
						<input type="submit" value="검색" class="btn-sm btn-info">
					</td> -->
					<td class="text-center">
						<a href="list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
						${curpage } page / ${totalpage } pages
						<a href="list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
		<div style="height: 20px"></div>
	</div>
</body>
</html>