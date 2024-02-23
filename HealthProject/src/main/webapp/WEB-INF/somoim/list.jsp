<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
a.alink:hover{
   cursor: pointer;
}
</style>
 <script>
        var somoimno = "${vo.sno}";
    </script>
</head>
<body>
	<div class="list" id="listApp">
                <div class="row">
                        <div class="col-lg-6 col-sm-6" v-for="vo in somoim_list">
                            <div class="blog-item">
                                <div class="bi-pic">
                                    <img :src="vo.poster" style="width:330px;height: 330px;">
                                </div>
                                <div class="bi-text">
                                <!-- +'&hostname='+vo.hostname -->
                                    <a :href="'../somoim/before_detail.do?sno='+vo.sno">
                                        <h4>{{vo.title}}</h4>
                                        
                                    </a>
                                    <p><span></span></p>
                                    <p>{{vo.typee}} <span>{{vo.hostname}}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <!-- Blog Section End -->
				    <div rowspan="2">
				      <div class="text-center">
				        <ul class="pagination">
						  <li v-if="startpage>1"><a class="alink" @click="prev()">&laquo;</a></li>
						  <li v-for="i in range(startpage,endpage)" :class="i===curpage?'active':''"><a class="alink" @click="pageChange(i)">{{i}}</a></li>
						  <li v-if="endpage<totalpage"><a class="alink" @click="next()">&raquo;</a></li>
						</ul>
				      </div>
                	</div>
	</div>
  <script>
   let App=Vue.createApp({
	   data(){
		   return {
			   // 멤버변수
			   somoim_list:[], // LIST => JSON
			   curpage:1,
			   totalpage:0,
			   startpage:0,
			   endpage:0,
			   type:${type}
			   
		   }
	   },
	   mounted(){
		   // CallBack => Vue에서 자동 호출되는 생명주기 함수 => onload() => $(function(){})
		   this.dataRecv()
	   },
	   updated(){
		   
	   },
	   //사용자 정의 함수 => 이벤트 , 데이터 읽기 , 데이터 보내기 
	   methods:{
		   dataRecv(){
			   // 데이터 목록 
			   axios.get('../somoim/list_vue.do',{
				   params:{
					   page:this.curpage,
					   type:this.type
				   }
			   }).then(response=>{
				   console.log(response.data);
				   this.somoim_list=response.data
			   })
			   
			   //페이지 정보 받기 
			   axios.get("../somoim/page_vue.do",{
				   params:{
					   page:this.curpage,
					   type:this.type
				   }
			   }).then(response=>{
				   /*
				       map.put("curpage", page);
	                   map.put("totalpage", totalpage);
	                   map.put("startPage", startPage);
	                   map.put("endPage", endPage);
				   */
				   this.curpage=response.data.curpage
				   this.totalpage=response.data.totalpage
				   this.startpage=response.data.startpage
				   this.endpage=response.data.endpage
			   })
			   
			   //가입 멤버 
			   
			 
		   },
		   range(start,end){
			   let arr=[]
			   let leng=end-start;
			   for(let i=0;i<=leng;i++)
			   {
				   arr[i]=start;
				   start++;
			   }
			   return arr
		   },
		   prev(){
			   this.curpage=this.startpage-1
			   this.dataRecv()
		   },
		   next(){
			   this.curpage=this.endpage+1
			   this.dataRecv()
		   },
		   pageChange(page){
			   this.curpage=page
			   this.dataRecv()
		   }
	   }
   }).mount('#listApp')
  </script>
</body>
</html>