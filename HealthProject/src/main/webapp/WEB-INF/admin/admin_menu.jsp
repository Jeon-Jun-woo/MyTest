<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                                <li><a href="#">스키/보드/스케이트보드/서핑/수영</a></li>
                                <li><a href="#">볼링/탁구/테니스</a></li>
                            </ul>
                        </div>
                        <div class="recent-post">
                            <h4>Recent Post</h4>
                            <div class="recent-blog" v-for="(vo, index) in cookie_list.slice(0, 4)" :key="index">
							    <a :href="'../somoim/detail.do?sno=' + vo.sno" class="rb-item">
							        <div class="rb-pic">
							            <img :src="vo.poster" alt="">
							        </div>
							        <div class="rb-text">
							            <h6>{{ vo.title }}</h6>
							            <p>{{ vo.typee }} <span>- {{ vo.loc }}</span></p>
							        </div>
							    </a>
							</div>
                        </div>
                        <div class="blog-tags">
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
                        </div>
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