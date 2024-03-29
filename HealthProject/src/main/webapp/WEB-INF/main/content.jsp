<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a.link:hover,img.img_click:hover{
  cursor: pointer;
}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/> <!-- 세션 -->
</sec:authorize>
  <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="../img/sports1.jpg">
                <div class="container">
                    <div class="row">
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="../img/run.jpg">
                <div class="container">
                    <div class="row">
                    </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- Hero Section End -->
    
    <!-- 헬스 / 요가 / 센터 예약 바로가기 -->
  	<br><br><br><br><br>
  	<div class="section-title text-center">
    <h2><strong>내 주변 운동시설 찾기</strong></h2>
    <h3>나에게 맞는 운동으로 건강해져요 우리💪</h3>
 `	</div>
    
    <div class="banner-section spad">
       <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="single-banner">
                        <img src="../img/photo1.jpg"  alt="헬스장">
                        <div class="inner-text">
                           <a href="../gym/gym_find.do"><h4>GYM</h4></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="single-banner">
                        <img src="../img/photo2.jpg" alt="요가/필라테스">
                        <div class="inner-text">
                            <a href="../yp/yp_find.do"><h4>YOGA/Pilates</h4></a>
                        </div>
                    </div>
                </div>
               <!--  <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="../img/photo3.jpg" alt="스포츠센터">
                        <div class="inner-text">
                            <a href="#"><h4>SportsCenter</h4></a>
                        </div>
                    </div>
                </div> -->
            </div>
        </div> 
  </div>
    <!--  바로가기 종료 -->
    
    <!-- MBTI별 나에게 맞는 운동 -->
    <br><br><br><br><br>
  	<div class="section-title text-center">
    <h2><strong>MBTI별 나에게 맞는 운동</strong></h2>
    <h3>✔이미지의 흰색 부분을 눌러주시면 페이지가 이동됩니다✔<br>
    	  재미로만 즐겨주세요!</h3>
 `	</div>
    
   <div class="banner-section spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=37"><img src="../img/INTJ.png" alt="1"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                   <a href="http://localhost:8080/web/board/detail.do?no=41"><img src="../img/INTP.png" alt="2"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=45"><img src="../img/ENTJ.png" alt="3"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                   <a href="http://localhost:8080/web/board/detail.do?no=49"><img src="../img/ENTP.png" alt="4"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=36"><img src="../img/INFJ.png" alt="5"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                   <a href="http://localhost:8080/web/board/detail.do?no=40"><img src="../img/INFP.png" alt="6"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=44"><img src="../img/ENFJ.png" alt="7"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=48"><img src="../img/ENFP.png" alt="8"></a>
                    </div>
                </div>
                    <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=34"><img src="../img/ISTJ.png" alt="9"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=35"><img src="../img/ISFJ.png" alt="10"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=42"><img src="../img/ESTJ.png" alt="11"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=43"><img src="../img/ESFJ.png" alt="12"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=38"><img src="../img/ISTP.png" alt="13"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=39"><img src="../img/ISFP.png" alt="14"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=46"><img src="../img/ESTP.png" alt="15"></a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="single-banner">
                    <a href="http://localhost:8080/web/board/detail.do?no=47"><img src="../img/ESFP.png" alt="16"></a>
                </div>
            </div>
        </div>
    </div>
</div> 

    <!-- MBTI별 운동 추천 종료 -->
    

    <!-- 소모임 페이지 연결 -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>취향으로 만나는 우리</h2>
                        <h3>소모임에서 만나요🍀</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-blog">
                        <img src="../img/somoim2.png" alt="서핑">
                        <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                    
                                </div>
                                <div class="tag-item">
                                  
                                </div>
                            </div>
                            <c:if test="${principal.username!=null }">
                            <a href="http://localhost:8080/web/somoim/detail.do?sno=79"></a>
                            </c:if>
                            <c:if test="${principal.username==null }">
                            <a href="../member/login.do"></a>
                            </c:if>
                                <h4>액티비티와 콩표면 즐거울수밖에💭</h4>
                            
                            <p>계절스포츠나 사계절활동을 같이하며 함께 즐거움을 찾아요💓</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-blog">
                        <img src="../img/somoim1.png" alt="플래시클라이밍">
                        <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                   
                                </div>
                                <div class="tag-item">
                                  
                                </div>
                            </div>
                            <c:if test="${principal.username!=null }">
                            <a href="http://localhost:8080/web/somoim/detail.do?sno=10"></a>
                             </c:if>
                            <c:if test="${principal.username==null }">
                            <a href="../member/login.do"></a>
                            </c:if>
                                <h4>플래시 클라이밍💭</h4>
                            
                            <p>플래시 크루는 신생 크루로 현재 서울숲클라이밍 종로 외 4지점에서 서울숲 위주로 운동을 하고 있습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-blog">
                        <img src="../img/somoim3.png" alt="스튜디오">
                        <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                    
                                </div>
                                <div class="tag-item">
                                    
                                </div>
                            </div>
                            <c:if test="${principal.username!=null }">
                            <a href="http://localhost:8080/web/somoim/detail.do?sno=1"></a>
                            </c:if>
                            <c:if test="${principal.username==null }">
                            <a href="../member/login.do"></a>
                            </c:if>
                                <h4>솔스티스피티스튜디오💭</h4>
                            
                            <p>오프라인에서 같이 운동모임도 하고 온라인에서 헬스&요가 운동정보, 운동인증, 식단 등을 공유하기 위해 클럽을 OPEN했습니다 :) </p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>
    <!-- Latest Blog Section End -->
</body>
</html>