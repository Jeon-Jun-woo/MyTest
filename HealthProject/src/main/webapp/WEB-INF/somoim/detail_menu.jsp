<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
/* WebKit (Chrome, Safari 등)과 Edge */
::-webkit-scrollbar {
    display: none;
}
.gallery {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 세 개의 열을 가진 그리드 생성 */
        gap: 7px; /* 열 사이의 간격 설정 */
    }

    .gallery-item {
        width: 80px;
        height: 80px;
        text-align: center;
    }

    .gallery-item img {
        width: 80px;
        height: 80px;
        display: block;
        margin: 0 auto; /* 이미지를 가운데 정렬 */
    }
</style>
</head>
<body>
                    <div class="blog-sidebar" id="togetherSomoimApp">
                        <div class="search-form">
                            <h4>Search</h4>
                            <form action="#">
                                <input type="text" placeholder="Search . . .  ">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog-catagory">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="#">축구/야구/풋살/스포츠관람</a></li>
                                <li><a href="#">클라이밍/등산/러닝/요가</a></li>
                                <li><a href="#">스키/보드/스케이트보드/서핑/수영</a></li>
                                <li><a href="#">볼링/탁구/테니스</a></li>
                            </ul>
                        </div>
                        <table>
						<tr>
						    <td class="inline" style="display: flex; align-items: center;">
						        <p style="font-size: 15px; font-weight: bold; margin-right: 10px;">가입 멤버<span>(${memberCount })</span></p>
						        <input type=button v-if="!isJoin" value="모임가입하기" style="float: left;" class="btn-danger" @click="SomoimJoin()"></button>
						        <input type=button v-else value="모임탈퇴하기" style="float: left;" class="btn-danger" @click="SomoimExit()"></button>
						        
						    </td>
						</tr>
						<tr>
							<td>
								<div id="imageGallery" style="overflow-x: auto; white-space: nowrap;">
							        <c:forEach var="mvo" items="${mList}">
							            <div style="display: inline-block; white-space: normal;">
							                <img src="${mvo.poster}" style="border-radius: 50%; height: 50px; width: 50px; margin-right: 10px;">
							            </div>
							        </c:forEach>
							    </div>
							</td>
						</tr>
						<tr>
				            <td style="height: 20px;"></td>
				        </tr>
				        </table>
                        <div class="recent-post">
                            <h4>일정 목록</h4>
                            <c:forEach var="sdvo" items="${scheduleList }">
                            <div class="recent-blog">
                                <a href="../somoim/schedule_detail.do?ssdno=${sdvo.ssdno}&sno=${sno}" class="rb-item">
                                    <div class="rb-pic">
                                        <img src="${sdvo.poster }">
                                    </div>
                                    <div class="rb-text">
                                        <p style="font-size: 13px;color: black;">${sdvo.title }</p>
                                        <p class="fa fa-map-marker">${sdvo.loc } <span>${sdvo.regdate }&nbsp;${sdvo.timee }</span></p>
                                    </div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                        <div class="community">
                        <h4 style="font-weight: 700;">커뮤니티</h4>
						    <div class="gallery">
						        <c:forEach var="cvo" items="${cList}" varStatus="loop">
						            <div class="gallery-item">
						                <a href="../somoim/community.do?scno=${cvo.scno }&sno=${sno}"><img src="${cvo.poster}" alt="Image"></a>
						            </div>
						        </c:forEach>
						    </div>
						</div>
                        <div style="height: 20px;"></div>
                        <div class="chat">
                        	<a href="../somoim/chat.do?sno=${sno }">
                        		<button class="button" style="font-weight:700;margin-bottom: 28px;width:100%;height: 50px;border-radius: 10px;">모임 채팅하기</button>
                        	</a>
                        </div>
                    </div>
                      <script>
  let replyApp=Vue.createApp({
	  data(){
		return {
			sno:${sno},
			isJoin:false
			}  
	  },
	  mounted(){
		  this.checkJoinStatus();
	  },
	  methods:{
		  checkJoinStatus() {
              axios.get('../somoim/join_check_vue.do', {
                  params: {
                  	sno: this.sno
                  }
              }).then(response => {
                  this.isJoin = response.data > 0;
              }).catch(error => {
                  console.error(error);
              });
          },
		  // 추가
		  SomoimJoin(){
			  axios.post('../somoim/join_vue.do',null,{
				  params:{
					  sno:this.sno
				  }
			  }).then(response=>{
				  console.log(response.data)
                  if (response.data === 'yes') 
                  {
                  	alert("모임에 가입되었습니다")
                      this.isLiked = true;
                  	location.href = '../somoim/detail.do?sno='+this.sno;
                  }
                  else
                  {
                  	alert("오류::모임에 가입하지 못했습니다")
                  }
			}).catch(error => {
                console.error(error);
            });
		  },
		  SomoimExit(){
			  axios.post('../somoim/exit_vue.do',null,{
				  params:{
					  
				  }
			  }).then(response=>{
				  console.log(response.data)
                  if (response.data === 'yes') 
                  {
                  	alert("모임에서 탈퇴하였습니다")
                    this.isLiked = true;
                  	location.href = '../somoim/detail.do?sno='+this.sno;
                  }
                  else
                  {
                  	alert("오류::모임에서 탈퇴하지 못했습니다")
                  }
			}).catch(error => {
                console.error(error);
            });
		  }
	  }
  }).mount('#togetherSomoimApp')
  </script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var imageGallery = document.getElementById("imageGallery");
        var isMouseDown = false;
        var lastScrollLeft = 0;
        var startX, scrollX;

        imageGallery.addEventListener('mousedown', function(e) {
            isMouseDown = true;
            startX = e.pageX - imageGallery.offsetLeft;
            lastScrollLeft = imageGallery.scrollLeft;
        });

        imageGallery.addEventListener('mouseleave', function() {
            isMouseDown = false;
        });

        imageGallery.addEventListener('mouseup', function() {
            isMouseDown = false;
        });

        imageGallery.addEventListener('mousemove', function(e) {
            if (!isMouseDown) return;
            e.preventDefault();
            scrollX = e.pageX - imageGallery.offsetLeft;
            var walk = (scrollX - startX) * 0.5;
            
            imageGallery.scrollLeft = lastScrollLeft - walk;
        });
    });
</script>
</body>
</html>