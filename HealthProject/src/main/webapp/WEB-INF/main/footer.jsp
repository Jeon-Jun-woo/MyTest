<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.title{
		color: white;
	}
</style>
</head>
<body>
  <!-- Footer Section Begin -->
   <div class="container-fluid bg-dark text-white-50 footer pt-6 mt-6">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-6">
                                <h2 class="text-primary mb-0">COPYRIGHT (C) Help Health<br>ALL RIGHTS RESERVED.</h2>                           
                                <span>
                                사이트 내 이미지, 게시글 등의 콘텐츠는 저희에게 저작권이 있습니다.<br>
								이러한 콘텐츠는 출처를 밝히고 비상업적인 용도에서만 활용하실 수 있습니다.</span>
                        </div> <!-- s -->
                    </div>
                </div>
                <div class="row g-3">
                <div class="col-lg-4">
                        	<div class="footer-item">
                            <h4 class="text-light mb-4">Help Health 소개</h4>
                            <span> 사업자번호: 01234567890 <br>
                            사업장 주소: 대한민국 <br>
                            메일 주소: help_health@naver.com
                           </span>
                        </div>
                        </div>
                	<div class="col-lg-4">
                        	<div class="d-flex flex-column text-start footer-item">
                        	<h4 class="text-light mb-4">고객센터 1234-5678</h4>
                        	<span>운영시간은 평일 오전 9시~오후 5시입니다
                        	<br>점심시간 13-14시, 주말, 공휴일은 운영하지 않으니
                        	<br>1:1문의를 남겨주세요
                        	</span>
                        	</div>
                        	</div>
                        	
                    <%--  <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3"></h4>
                            <c:forEach var="novo" items="${noList }">
                              <a class="btn-link" href="">[${novo.type }]&nbsp;${novo.subject}</a>
                            </c:forEach>
                            
                            
                        </div>
                    </div> --%>
                     <div class="col-lg-4">
                    <div class="footer-widget">
                    	<h3 class="title">건강 관련 뉴스</h3>
                        <ul>
                            <c:forEach var="vo" items="${newList }" varStatus="s">
					          <c:if test="${s.index<3 }">
					            <li><a href="${vo.link }">${vo.title }</a></li>
					          </c:if>
					        </c:forEach>
                        </ul>
                    </div>
                </div>
            			</div>
      			  		</div>
 
</body>
</html>