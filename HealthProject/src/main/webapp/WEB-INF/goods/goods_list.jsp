<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.container1{
	height: 60px;
}
a.link:hover,img.img_click:hover{
  cursor: pointer;
}
div.col-lg-2 h4{
	font-weight: bold;	
}
.section1{
   height: 1480px;
} 
.pagination li a {
        color: gray;
}
.pagination li.active {
        background-color: orange;
}
.vertical-images span img {
        display: block; /* 이미지를 블록 요소로 표시하여 한 줄에 하나씩 나오도록 합니다. */
        margin-bottom: 10px; /* 이미지 사이에 간격을 주기 위해 마진을 추가합니다. */
        width:90px;
        height: 90px;
        margin-left: 20px;
    }
h5{
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
h4{
	font-weight: bold;
}
</style>
</head>

<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/> <!-- 세션 -->
</sec:authorize>
 
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
   <div class="container" id="goodsApp">
	<div class="container container1">
            <div class="inner-header">
                <div class="row">
                    
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">전체보기</button>
                            <div class="input-group">
                                <input type="text" placeholder="검색어 입력" ref="fd" v-model="fd" @keyup.enter="find()">
                                <button type="button"><i class="ti-search" @click="find()"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        
                    </div>
                </div>
            </div>
        </div>
    <!-- Product Shop Section Begin -->
    <section class="product-shop spad section1">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-6 col-sm-8 order-1 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">상품 목록</h4>
                        <ul class="filter-catagories">
                            <li><a href="../goods/goods_list.do">전체</a></li>
                            <li><a href="../goods/goods_list.do?type=1">스포츠</a></li>
                            <li><a href="../goods/goods_list.do?type=2">오메가3</a></li>
                            <li><a href="../goods/goods_list.do?type=3">허브</a></li>
                            <li><a href="../goods/goods_list.do?type=4">유산균</a></li>
                            <li><a href="../goods/goods_list.do?type=5">비타민</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                      <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                    	<h4 class="fw-title">약조합 상담예약</h4>
                    	<div class="row" style="margin-left: 5px;">
                    	<a href="../goods/goods_reserve.do" class="btn btn-sm btn-danger">일정 예약하기</a>
                    	</div>
                      </sec:authorize>
                        <!-- <h4 class="fw-title">브랜드</h4>
                        <div class="fw-brand-check">
                            <div class="bc-item">
                                <label for="bc-calvin">
                                    Calvin Klein
                                    <input type="checkbox" id="bc-calvin">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-diesel">
                                    Diesel
                                    <input type="checkbox" id="bc-diesel">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-polo">
                                    Polo
                                    <input type="checkbox" id="bc-polo">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-tommy">
                                    Tommy Hilfiger
                                    <input type="checkbox" id="bc-tommy">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div> -->
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">약국 찾기</h4>
                    	<div class="row" style="margin-left: 5px;">
                    	<a href="#" class="btn btn-sm btn-danger">바로 가기</a>
                    	</div>
                    </div>
                    <div class="filter-widget">
                        <div class="fw-color-choose">
                            
                        </div>
                    </div>
                    <div class="filter-widget">
                        <div class="fw-size-choose">
                            
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">효과</h4>
                        <div class="fw-tags">
                            <a href="#">수면개선</a>
                            <a href="#">혈액순환</a>
                            <a href="#">눈 개선</a>
                            <a href="#">스트레스</a>
                            <a href="#">황반</a>
                            <a href="#">관절</a>
                            <a href="#">장</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    <select class="sorting">
                                        <option value="">찜 많은 순</option>
                                        <option value="">높은 가격 순</option>
                                        <option value="">낮은 가격 순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                            <div class="col-lg-4 col-sm-6" v-for="vo in goods_list">
                                <div class="product-item">
                                    <div class="pi-pic">
                                       <a :href="'../goods/goods_before_detail.do?gno='+vo.gno">
                                        <img :src="vo.poster" style="height: 200px;width: 200px">
                                       </a>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a href="#">장바구니 담기</a></li>
                                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">{{vo.brand2}}</div>
                                        <a href="#">
                                            <h5>{{vo.kname}}</h5>
                                        </a>
                                        <div class="product-price">
                                            {{vo.price}}
                                            <span>원</span>
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 order-1 order-lg-2">
                  <h4 class="text-center">최근 본 상품</h4>
                  <div class="vertical-images" style="overflow-y:auto;height:700px">
				    <!-- 이미지 추가 -->
				   <span v-for="vo in cookie_list">
				    <a :href="'../goods/goods_detail.do?gno='+vo.gno">
				    <img :src="vo.poster" alt="이미지 설명">
					</a>
				    <!-- 필요한 만큼 이미지 추가 -->
				   </span>
				  </div>
                </div>
            </div>
        </div>
    </section>
      <div class="text-center">
        <ul class="pagination">
          <li v-if="startPage>1"><a class="link" @click="prev()">이전</a></li>
          <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a class="link" @click="pageChange(i)">{{i}}</a></li>
          <li v-if="endPage<totalpage"><a class="link" @click="next()">다음</a></li>
        </ul>
      </div>
   </div>
    <!-- Product Shop Section End -->
	
    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="../img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->
     
<script>
  let findApp=Vue.createApp({
	  data(){
		return {
			goods_list:[],
			fd:'오메가',
			goods_detail:{},
			page_list:{},
			gno:1,
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			cookie_list:[],
			type:${type}
		}  
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  updated(){
		  
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../goods/goods_list_vue.do',{
				  params:{
					  page:this.curpage,
					  fd:this.fd,
					  type:this.type
				  }
			  }).then(response=>{
				  console.log(response)
				  this.goods_list=response.data
			  })
			  
			  axios.get('../goods/goods_list_page_vue.do',{
				  params:{
					  page:this.curpage,
					  fd:this.fd,
					  type:this.type
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.page_list=response.data
				  
				  this.curpage=response.data.curpage
				  this.totalpage=response.data.totalpage
				  this.startPage=response.data.startPage
				  this.endPage=response.data.endPage
			  })
			  
			  axios.get('../goods/goods_cookie_vue.do').then(response=>{
				  console.log(response.data)
				  this.cookie_list=response.data
			  })
		  },
		  range(start,end){
			  let arr=[]
			  let leng=end-start
			  for(let i=0;i<=leng;i++)
			  {
				  arr[i]=start
				  start++;
			  }
			  return arr
		  },
		  prev(){
			  this.curpage=this.startPage-1
			  this.dataRecv()
		  },
		  next(){
			  this.curpage=this.endPage+1
			  this.dataRecv()
		  },
		  pageChange(page){
			  this.curpage=page
			  this.dataRecv()
		  },
		  find(){
			  this.curpage=1
			  this.dataRecv()
		  }
	  }
  }).mount('#goodsApp')
  
</script>

</body>

</html>