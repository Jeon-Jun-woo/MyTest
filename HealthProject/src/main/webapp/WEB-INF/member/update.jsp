<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
  <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Join</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <div class="wrapper row3" id="updateApp">
    <main class="container clear">
      <h2 class="sectiontitle">회원정보수정</h2>
      <table class="table">
       <tr>
        <th width=15% class="text-center">ID</th>
        <td width=85% class="inline">
          <input type=text ref=userId size=15 class="input-sm" v-model="userId"
            readonly="isReadOnly" name="userId"
          >
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">이름</th>
        <td width=85% class="inline">
          <input type=text ref=userName size=15 class="input-sm" v-model="userName"
           name="userName"
          >
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">성별</th>
        <td width=85% class="inline">
          <%-- radio => group name --%>
          <input type="radio" ref="sex" value="남자" checked v-model="sex" name="sex">남자
          <input type="radio" ref="sex" value="여자" v-model="sex" name="sex">여자
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">생년월일</th>
        <td width=85% class="inline">
          <input type=date ref="birthday" size=25 v-model="birthday" name="birthday">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">이메일</th>
        <td width=85% class="inline">
          <input type=text ref=email size=50 class="input-sm" v-model="email" name="email">
          <p></p>
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">우편번호</th>
        <td width=85% class="inline">
          <input type=text ref=post size=15 readonly class="input-sm" v-model="post" name="post">
          <input type=button value="우편번호검색" class="btn-sm btn-primary" @click="postFind()">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">주소</th>
        <td width=85% class="inline">
          <input type=text ref=addr1 size=50 readonly class="input-sm" v-model="addr1" name="addr1">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">상세주소</th>
        <td width=85% class="inline">
          <input type=text ref=addr2 size=50 class="input-sm" v-model="addr2" name="addr2">
        </td>
       </tr>
       <tr>
        <th width=15% class="text-center">소개</th>
        <td width=85% class="inline">
          <textarea rows="3" cols="52" ref="content" v-model="content" name="content"></textarea>
        </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline">
           <input type=button value="수정" class="btn-sm btn-success" @click="update()">&nbsp;
           <input type=button value="취소" class="btn-sm btn-info" @click="goback()">&nbsp;
           <input type=button value="회원탈퇴" class="btn-xs btn-danger" @click="mDelete()">
         </td>
       </tr>
      </table>
    </main>
</div>
  <script>
   let memberApp=Vue.createApp({
	   data(){
		   return{
			   user_info:{},
		   	   userId:'${userId}',
		   	   userName:'',
		   	   sex:'',
		   	   birthday:'',
		   	   email:'',
		   	   post:'',
		   	   addr1:'',
		   	   addr2:'',
		   	   content:'' 
		   }
	   },
	   mounted(){
		   axios.get('../member/update_vue.do',{
			   params:{
				   userId:this.userId
			   }
		   })
		   .then(response=>{
			   console.log(response.data)
			   this.user_info=response.data
			   this.userName=response.data.userName
			   this.sex=response.data.sex
			   this.birthday=response.data.birthday
			   this.email=response.data.email
			   this.post=response.data.post
			   this.addr1=response.data.addr1
			   this.addr2=response.data.addr2
			   this.content=response.data.content
		   })
	   },
	   methods:{
		   goback(){
			   window.history.back()
		   },
		   update(){
			   
			   
	
			   
			   axios.post('../member/update_ok_vue.do',null,{
				   params:{
					   userId:this.userId,
					   userName:this.userName,
				   	   sex:this.sex,
				   	   birthday:this.birthday,
				   	   email:this.email,
				   	   post:this.post,
				   	   addr1:this.addr1,
				   	   addr2:this.addr2,
				   	   content:this.content 
				   }
			   }).then(response=>{
				   if(response.data==="yes")
				   {
					   
					   location.href="../main/main.do";
				   }
				   else
				   {
					   alert("비밀번호가 틀립니다!!")
				   }
			   }).catch(error => {
				   alert("에러가 발생했습니다: " + error.message);
				   });
		   },
		   mDelete(){
			   // delete_vue.do?no=1&pwd=1234
			   axios.get('../delete_vue.do',{
				   params:{
					   userId:this.userId
				   }
			   }).then(response=>{
				   if(response.data==="yes")
				   {
					   alert("회원탈퇴 되셨습니다!!")
					   location.href="../main/main.do";
				   }
				   else
				   {

				   }
			   })
		   }
	   }
   }).mount("#updateApp")
  </script>
</body>
</html>















