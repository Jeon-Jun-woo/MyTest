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
	<div class="list" id="adminApp" style="margin-left: -30px;">
		<div class="row">
			<div class="col-lg-6 col-sm-6">
				<table class="member_manager" style="border: 1px;padding: 1px;width: 1000px;">
					<h3 style="text-align: left;font-weight: bold;">헬스장 예약 현황</h3>
					<tr>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;">번호</th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;"></th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;">아이디</th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;">업체명</th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;">예약일</th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;">예약시간</th>
         				<th class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; border-top: 1px solid lightgray;"></th>
        			</tr>
					<tr v-for="vo in reserve_list">
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">{{vo.rno}}</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">
           					<img :src="vo.gvo.poster" style="width: 30px;height: 30px">
          				</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">{{vo.userId}}</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">{{vo.gvo.title}}</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">{{vo.rdate}}</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">{{vo.rtime}}</td>
          				<td class="text-center" style="border-bottom: 1px solid lightgray; padding: 8px; ">
            				<span class="btn btn-xs btn-danger" v-if="vo.reserve_ok==0" @click="ok(vo.rno)">승인대기</span>
            				<span class="btn btn-xs btn-default" v-else>승인완료</span>
          				</td>
        			</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- ############################################################### -->
	<!-- <div class="container" id="adminApp">
		<div class="banner-section spad">
	        <div class="container-fluid">
	        	<h2 class="sectiontitle">예약 현황</h2>
	        	<table class="table">
        			<tr>
         				<th>번호</th>
         				<th></th>
         				<th>아이디</th>
         				<th>업체명</th>
         				<th>예약일</th>
         				<th>예약시간</th>
         				<th></th>
        			</tr>
        			<tr v-for="vo in reserve_list">
          				<td>{{vo.rno}}</td>
          				<td>
           					<img :src="vo.gvo.poster" style="width: 30px;height: 30px">
          				</td>
          				<td>{{vo.userId}}</td>
          				<td>{{vo.gvo.title}}</td>
          				<td>{{vo.rdate}}</td>
          				<td>{{vo.rtime}}</td>
          				<td>
            				<span class="btn btn-xs btn-danger" v-if="vo.reserve_ok==0" @click="ok(vo.rno)">승인대기</span>
            				<span class="btn btn-xs btn-default" v-else>승인완료</span>
          				</td>
        			</tr>
      			</table>
	        </div>
	    </div>
	</div> -->
	<script>
  /*
       data() => useState()
       mounted() => useEffect()
       methods => function 
  */
  let adminApp=Vue.createApp({
	  data(){
		  return {
			  reserve_list:[]
		  }
	  },
	  mounted(){
		  axios.get('../reserve/reserve_admin_vue.do')
		  .then(response=>{
			  console.log(response.data)
			  this.reserve_list=response.data
		  })
	  },
	  methods:{
		  // 승인 버튼 => UPDATE , Mail
		  ok(rno){
			  axios.get('../reserve/reserve_ok_vue.do',{
				  params:{
					  rno:rno
				  }
			  }).then(response=>{
				  if(response.data=='yes')
				  {
					  axios.get('../reserve/reserve_admin_vue.do')
					  .then(response=>{
						  console.log(response.data)
						  this.reserve_list=response.data
					  })
				  }
				  else
				  {
					  alert(response.data)
				  }
			  })
		  }
	  }
  }).mount("#adminApp")
</script>
</body>
</html>