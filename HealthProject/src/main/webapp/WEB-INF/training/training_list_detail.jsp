<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.iframe-wrapper {
    position: relative;
    padding-bottom: 56.25%; /* 16:9 비율을 유지하기 위한 값 */
    height: 0;
    overflow: hidden;
}

.iframe-wrapper iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.txt {
    padding: 20px;
}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal"/>
</sec:authorize>
  <div class="txt" id="trainApp">
   <div class="iframe-wrapper">
    <iframe :src="training_detail.uri" frameborder="0" allowfullscreen></iframe>
   </div>
   <table class="table">
       <tbody>
        <tr>
          <th width="15%">프로그램 소개</th>
          <td width="55%">{{ training_detail.explain }}</td>
        </tr>
        <tr>
          <th width="15%">칼로리</th>
          <td width="55%">{{ training_detail.kcal }}</td>
        </tr>
        <tr>
          <th width="15%">운동 이미지</th>
          <td width="55%" id="type"><img :src="training_detail.img"></td>
        </tr>
        <tr>
          <td colspan="3" class="text-right inline">
            <input type="button" class="btn-xs btn-warning" value="목록" @click="goback()">
          </td>
        </tr>
        </tbody>
   </table>
  </div>
  <div style="height: 10px"></div>
    <table class="table">
     <tr>
      <td>
        <table class="table" v-for="rvo in reply_list">
         <tr>
          <td class="text-left">◑{{rvo.userName}}({{rvo.dbday}})</td>
          <td class="text-right">
           <span class="inline" v-if="rvo.userId===sessionId">
            <input type=button class="btn-xs btn-danger" value="수정" @click="updateForm(rvo.no)" :id="'up'+rvo.no">&nbsp;
            <input type=button class="btn-xs btn-info" value="삭제" @click="replyDelete(rvo.no)">
           </span>
          </td>
         </tr>
         <tr>
           <td colspan="2" class="text-left" valign="top">
            <pre style="white-space: pre-wrap;background-color: white;border:none">{{rvo.msg}}</pre>
           </td>
         </tr>
         <tr style="display:none" :id="'u'+rvo.no" class="ups">
	       <td colspan="2">
	         <textarea rows="4" cols="85" :id="'u_msg'+rvo.no" style="float: left">{{rvo.msg}}</textarea>
	         <input type=button value="댓글수정" class="btn-danger"
	          style="float: left;width: 80px;height: 86px" @click="replyUpdate(rvo.no)">
	       </td>
	      </tr>
        </table>
      </td>
     </tr>
    </table>
    <table class="table" v-if="sessionId">
      <tr>
       <td>
         <textarea rows="4" cols="85" ref="msg" style="float: left" v-model="msg"></textarea>
         <input type=button value="댓글쓰기" class="btn-danger"
          style="float: left;width: 80px;height: 86px" @click="replyInsert()">
       </td>
      </tr>
    </table>
</body>
<script>
let trainApp = Vue.createApp({
	  data() {
	    return {
	      training_detail: {},
	      reply_list:[],
	      sessionId:'${principal.username}',
	      msg:'',
	      u:0
	    }
	  },
	  mounted() {
	    axios.get('../training/detail_vue.do', {
	      params: {
	        tno: ${tno}
	      }
	    }).then(response => {
	      console.log(response.data);
	      this.training_detail = response.data;
	      this.reply_list=response.data.reply_list
	    });
	  },
	  methods: {
		  replyUpdate(no){
	    		 let msg=$('#u_msg'+no).val()
	    		 //alert(msg)
	    		 axios.post('../training/reply_update_vue.do',null,{
	    			 params:{
	    				 no:no,
	    				 rno:this.no,
	    				 msg:msg
	    			 }
	    		 }).then(response=>{
	    			 this.reply_list=response.data
	    			 $('#u'+no).hide("slow")
	    			 $('#up'+no).val('수정')
	    		 })
	    	 },
	    	 updateForm(no){
	    		$('.ups').hide();
	    		$('#up'+no).val('수정')
	    		if(this.u==0)
	    		{
	    		    this.u=1;
	    		    $('#u'+no).show();
	    		    $('#up'+no).val('취소')
	    		    
	    		}
	    		else
	    		{
	    			this.u=0;
	    			$('#u'+no).hide();
	    		    $('#up'+no).val('수정')
	    		}
	    	 },
	    	 replyDelete(no){
	    		axios.get('../training/reply_delete_vue.do',{
	    		  params:
	    			  {
	    			      no:no,
	    			      rno:this.no
	    			  }
	    			
	    		}).then(response=>{
	    			this.reply_list=response.data
	    		}) 
	    	 },
	    	 replyInsert(){
	    		if(this.msg==="")
	    		{
	    			this.$refs.msg.focus()
	    			return
	    		}
	    		
	    		axios.post('../training/reply_insert_vue.do',null,{
	    			params:{
	    				rno:this.no,
	    				msg:this.msg
	    			}
	    		}).then(response=>{
	    			this.reply_list=response.data
	    			this.msg=''
	    		})
	    	 },
	    goback() {
	      location.href = "../training/training_list.do";
	    }
	  }
	}).mount("#trainApp");
</script>
</html>