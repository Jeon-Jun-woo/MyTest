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
</head>
<body>
	<div class="list" id="SomoimJjimApp">
                <div class="row">
                        <div class="somoimjjimtable" style="margin-left: -100px;">
                            <table class="member_manager" style="border-collapse: collapse; width: 960px;">
							    <h3 style="text-align:left;font-weight: bold;">찜 관리</h3>
							    <tr>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px; ">번호</th>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px;">카테고리</th>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px;"></th>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px;">모임 이름</th>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px;">호스트</th>
							        <th class="text-center" style="border-bottom: 1px solid black; padding: 8px;">가입멤버</th>
							    </tr>
							    <tr v-for="(sjvo,index) in somoimJjim_list">
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;">{{ index + 1 }}</td>
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;">{{sjvo.typee}}</td>
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;"><a :href="'../somoim/before_detail.do?sno='+sjvo.sno"><img :src="sjvo.poster" style="height: 120px; width: 120px;"></a></td>
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;"><a :href="'../somoim/before_detail.do?sno='+sjvo.sno">{{sjvo.title}}</a></td>
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;">{{sjvo.hostname}}</td>
							        <td class="text-center" style="border-bottom: 1px solid black; padding: 8px;">{{sjvo.inwon}}</td>
							    </tr>
							</table>
                            
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
  let memberApp=Vue.createApp({
	  data(){
		return {
			somoimJjim_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			isShow:false,
			userid:''
		}  
	  },
	  mounted(){
		  this.dataRecv()
	  },
	  updated(){
		  
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../mypage/somoimJjim_vue.do',{
				  params:{
					  page:this.curpage
				  }
			  }).then(response=>{
				  console.log(response)
				  this.somoimJjim_list=response.data
			  })
			  
			  axios.get('../mypage/somoimJjim_page_vue.do',{
				  params:{
					  page:this.curpage
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.page_list=response.data
				  
				  this.curpage=response.data.curpage
				  this.totalpage=response.data.totalpage
				  this.startpage=response.data.startpage
				  this.endpage=response.data.endpage
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
		  },
		  find(){
			  this.curpage=1
			  this.dataRecv()
		  }
	  } 
  }).mount('#SomoimJjimApp')
</script>
</body>
</html>