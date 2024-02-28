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
<%--
	Front : 유지보수(***jquery,ajax)
			vuejs , ***reactjs => nuxtjs, momentjs , nodejs
			=> typeScript
			
    Back : 유지보수 (***SpringFramework)
    		***spring-Boot , MSA
    		***MyBatis / JPA
    		MySQL / MariaDB
    ============================ > DevOps (CI/CD) => 도커 , 젠킨스 (***GIT)
 --%>
<body>
  <div class="wrapper row3" id="mypageApp">
    <main class="container clear"> 
      <h2 class="sectiontitle">약국 예약 목록</h2>
      <table class="table">
        <tr>
          <th>번호</th>
          <th>약국명</th>
          <th>전화번호</th>
          <th>예약일</th>
          <th>예약시간</th>
          <th>인원</th>
          <th></th>
        </tr>
        <tr v-for="vo in reserve_list">
          <td>{{vo.rno}}</td>
          <td>{{vo.yvo.subject}}</td>
          <td>{{vo.yvo.phone}}
          <td>{{vo.rdate}}</td>
          <td>{{vo.rtime}}</td>
          <td>{{vo.rinwon}}</td>
          <td>
            <span :class="vo.reserve_ok==1?'btn btn-xs btn-danger':'btn btn-xs btn-default'" v-text="vo.reserve_ok==0?'예약대기':'예약완료'"></span>
            &nbsp;<span class="btn btn-xs btn-primary" @click="reserveCancel(vo.rno)">취소</span>
          </td>
        </tr>
      </table>
    </main>
  </div>
  <script>
   let mypageApp=Vue.createApp({
	   data(){
		   return {
			  reserve_list:[]	   
		   }
	   },
	   mounted(){
		   axios.get('../goods/mypage_list_vue.do')
		   .then(response=>{
			   console.log(response.data)
			   this.reserve_list=response.data
		   })
		   
	   },
	   methods:{
		   reserveCancel(rno){
			   axios.get('../goods/reserve_cancel_vue.do',{
				   params:{
					   rno:rno
				   }
			   }).then(response=>{
				   if(response.data==='yes')
				   {
					   axios.get('../goods/mypage_list_vue.do')
					   .then(response=>{
						   console.log(response.data)
						   this.reserve_list=response.data
					   }) //그자리에서 데이터바꿀려고
				   }
				   else
				   {
					   alert("예약 취소가 실패하셨습니다\n 다시 취소바랍니다")
				   }
			   })
		   }
	   }
   }).mount('#mypageApp')
  </script>
</body>
</html>











