<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
                    <div class="blog-sidebar" id="ListMenu">
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
                                <li><a href="#">회원관리</a></li>
                                <li><a href="#">찜목록</a></li>
                                <li><a href="#">게시판 관리</a></li>
                                <li><a href="#">볼링/탁구/테니스</a></li>
                            </ul>
                        </div>
                      <script type="text/javascript">
				      /* google.charts.load("current", {packages:["corechart"]});
				      google.charts.setOnLoadCallback(drawChart);
				      function drawChart() {
				        var data = google.visualization.arrayToDataTable([
				          ['단어', '단어횟수'],
				          <c:forEach var="vo" items="${list}">
				           ['<c:out value="${vo.word}"/>',    <c:out value="${vo.count}"/>],
				          </c:forEach>
				        ]);
				
				        var options = {
				          title: '내용분석',
				          is3D: true,
				        };
				
				        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
				        chart.draw(data, options);
				      } */
				      google.charts.load('current', {packages: ['corechart', 'bar']});
				      google.charts.setOnLoadCallback(drawBasic);

				      function drawBasic() {

				            var data = google.visualization.arrayToDataTable([
						          ['단어', '가입회원수'],
						          <c:forEach var="vo" items="${list}">
						           ['<c:out value="${vo.word}"/>',    <c:out value="${vo.count}"/>],
						          </c:forEach>
						        ]);
				            var options = {
				              title: '가입한 소모임 분류',
				              chartArea: {width: '50%'},
				              hAxis: {
				            	  title: '가입한 소모임 분류',
					              chartArea: {width: '50%'}
				              }
				            };

				            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

				            chart.draw(data, options);
				          }
    					</script>
    				<div id="chart_div" style="width: 389px; height: 500px;margin-left: -70px;margin-top: -20px;"></div> 
                        <!-- <div class="blog-tags">
                            <h4>Product Tags</h4>
                            <div class="tag-item">
                                <a href="#">클라이밍</a>
                                <a href="#">축구</a>
                                <a href="#">볼링</a>
                                <a href="#">등산</a>
                                <a href="#">탁구</a>
                                <a href="#">헬스</a>
                                <a href="#">야구</a>
                            </div>
                        </div> -->
                    </div>
<script>
let SomoimApp=Vue.createApp({
	data(){
		return{
			cookie_list:[]
		}
	},
	mounted(){
		this.dataRecv()
	},
	updated(){
		  
	  },
	methods:{
		// 공통으로 사용되는 함수 => 반복제거 
		  dataRecv(){
			  axios.get('../somoim/cookie_vue.do').then(response=>{
				  console.log(response.data)
				  this.cookie_list=response.data
			  })
		}
	}
}).mount("#ListMenu")            
</script>
                
</body>
</html>