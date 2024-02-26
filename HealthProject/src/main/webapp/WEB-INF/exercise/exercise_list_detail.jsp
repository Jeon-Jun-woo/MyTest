<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 상세 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="wrapper row3" id="exeApp">
  <main class="container clear"> 
    <h2 class="sectiontitle">칼로리 상세 보기</h2>
    <div class="content two_third first"> 
      <table class="table">
       <tbody>
        <tr>
          <th width="15%">운동명</th>
          <td width="55%">{{ exercise_detail.name }}</td>
        </tr>
        <tr>
          <th width="15%">시간</th>
          <td width="55%">{{ exercise_detail.time }}분</td>
        </tr>
        <tr>
          <th width="15%">칼로리</th>
          <td width="55%" id="type">{{ exercise_detail.cal }}</td>
        </tr>
        <tr>
          <td colspan="3" class="text-right inline">
            <input type="button" class="btn-xs btn-warning" value="목록" @click="goback()">
          </td>
        </tr>
        </tbody>
        </table>
        <h4>효과 및 참고사항</h4>
        <ul>
          <li style="white-space: pre-wrap;">{{ exercise_detail.effects }}</li>
        </ul>
        
      
    </div>
  </main>
</div>
<script>
let fApp = Vue.createApp({
	  data() {
	    return {
	      exercise_detail: {}
	    }
	  },
	  mounted() {
	    axios.get('../exercise/detail_vue.do', {
	      params: {
	        eno: ${eno}
	      }
	    }).then(response => {
	      console.log(response.data);
	      this.exercise_detail = response.data;
	    });
	  },
	  methods: {
	    goback() {
	      location.href = "../exercise/exercise_list.do";
	    }
	  }
	}).mount("#exeApp");
</script>
</body>
</html>