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
<style type="text/css">
a.link:hover{
   cursor: pointer;
}
</style>
</head>
<body>
   <div class="wrapper row3">
     <main class="container clear"> 
       <!-- main body -->
       <h2 class="sectiontitle">음식 칼로리</h2>
       <div class="content" id="foodApp"> 
         <table class="table">
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">음식명</th>
	      <th scope="col">단위</th>
	      <th scope="col">칼로리</th>
	    </tr>
	  </thead>
	  <tbody v-for="vo in food_list">
	    <tr>
	      <td>{{vo.fno}}</td>
	      <td><a :href="'../food/food_list_detail.do?fno='+vo.fno">{{vo.name}}</a></td>
	      <td>{{vo.unit}}</td>
	      <td>{{vo.cal}}</td>
	    </tr>
	  </tbody>
	</table>
         <ul class="pagination">
             <li v-if="startPage>1"><a @click="prev()" class="link">&laquo; Previous</a></li>
             <li v-for="i in range(startPage, endPage)" :class="i==curpage?'active':''"><a @click="pageChange(i)" class="link">{{i}}</a></li>    
             <li v-if="endPage<totalpage"><a @click="next()" class="link">Next &raquo;</a></li>
         </ul>
       </div>
       <!-- / main body -->
       <div class="clear"></div>
     </main>
   </div>
   <script>
      let foodApp=Vue.createApp({
         // 데이터 관리 => 멤버변수 => this.
         data(){
            return{
               food_list:[],
               curpage:1,
               totalpage:0,
               startPage:0,
               endPage:0
            }
         },
         mounted(){
            // 브라우저 화면에 HTML이 실행된 경우에 처리 => 자동 호출 함수
            /*
               자동 호출 함수 => Vue 생명주기
               beforeCreate()
               created()
               --------------- Vue 객체 생성
               beforeMount() => mount: 가상 메모리에 HTML을 올리는 경우
               ***mounted() => window.onload, $(function(){})
            */
            this.dataRecv()
         },
         updated(){
            
         },
         methods:{
            // 공통으로 사용되는 함수 => 반복제거
            dataRecv(){
               axios.get('../food/food_list_vue.do', {
                  params:{
                     page:this.curpage
                  }
               }).then(response=>{
                  console.log(response.data)
                  this.food_list=response.data
               })
               
               // 페이지
               axios.get('../food/food_page_vue.do', {
                  params:{
                     page:this.curpage
                  }
               }).then(response=>{
                  console.log(response.data) // this.이 붙으면 출력 안됨 주의!!!!
                  this.curpage=response.data.curpage
                  this.totalpage=response.data.totalpage
                  this.startPage=response.data.startPage
                  this.endPage=response.data.endPage
               })
            },
            range(start, end){
               let arr=[]
               let leng=end-start
               for(let i=0;i<=leng;i++)
               {
                  arr[i]=start
                  start++
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
            }
         }
      }).mount('#foodApp')
   </script>
</body>
</html>