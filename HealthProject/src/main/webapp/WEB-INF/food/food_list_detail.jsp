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
<div class="wrapper row3" id="foodApp">
  <main class="container clear"> 
    <h2 class="sectiontitle">칼로리 상세 보기</h2>
    <div class="content two_third first"> 
      <table class="table">
        <tr>
          <th width="15%">음식명</th>
          <td width="55%">{{ food_detail.name }}</td>
        </tr>
        <tr>
          <th width="15%">단위</th>
          <td width="55%">{{ food_detail.unit }}</td>
        </tr>
        <tr>
          <th width="15%">칼로리</th>
          <td width="55%" id="type">{{ food_detail.cal }}</td>
        </tr>
        <tr>
          <th width="15%">영양성분</th>
          <td width="55%">{{ food_detail.nut }}</td>
        </tr>
        <tr>
          <th width="15%">운동</th>
          <td width="55%">{{ food_detail.exer }}</td>
        </tr>
        <tr>
          <td colspan="3" class="text-right inline">
            <input type="button" class="btn-xs btn-warning" value="목록" @click="goback()">
          </td>
        </tr>
      </table>
    </div>
  </main>
</div>
<script>
let fApp = Vue.createApp({
	  data() {
	    return {
	      food_detail: {}
	    }
	  },
	  mounted() {
	    axios.get('../food/detail_vue.do', {
	      params: {
	        fno: ${fno}
	      }
	    }).then(response => {
	      console.log(response.data);
	      this.food_detail = response.data;
	    });
	  },
	  methods: {
	    goback() {
	      location.href = "../food/food_list.do";
	    }
	  }
	}).mount("#foodApp");
</script>
</body>
</html>