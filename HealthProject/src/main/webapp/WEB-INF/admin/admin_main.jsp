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
  <div class="wrapper row3" id="adminApp" style="margin-left: -40px;">
    <main class="container clear"> 
      <h3 class="sectiontitle" style="text-align: left;font-weight: bold;">약국 예약 현황</h3>
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
            <span class="btn btn-xs btn-danger" v-if="vo.reserve_ok==0" @click="ok(vo.rno)">승인대기</span>
            <span class="btn btn-xs btn-default" v-else>승인완료</span>
          </td>
        </tr>
      </table>
    </main>
  </div>
</body>
<script>
  /*			리액트
      data() => useState()
      mounted() => useEffect()
      methods => function()
  */
  let adminApp=Vue.createApp({
	  data(){
		  return {
			  reserve_list:[]
		  }
	  },
	  mounted(){
		  axios.get('../reserve_y/reserve_admin_vue.do')
		  .then(response=>{
			  console.log(response.data)
			  this.reserve_list=response.data
		  })
	  },
	  methods:{
		  // 승인 버튼 => UPDATE , Mail
		  ok(rno){
			  axios.get('../reserve_y/reserve_ok_vue.do',{
				  params:{
					  rno:rno
				  }
			  }).then(response=>{
				  if(response.data=="yes")
				  {
					  axios.get('../reserve_y/reserve_admin_vue.do')
					  .then(response=>{
						  console.log(response.data)
						  this.reserve_list=response.data
					  })
				  }
				  else
				  {
					  alert("예약 승인에 실패하셨습니다!!")
				  }
					 
			  })
		  }
	  }
  }).mount('#adminApp')
</script>
</html>