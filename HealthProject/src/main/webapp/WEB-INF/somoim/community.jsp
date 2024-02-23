<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<div style="width: 600px;">
<div class="row" style="width: 600px;margin-left: 100px;">
    <table>
        <tr>
            <td>
                <div class="bi-pic">
                    <img src="${cvo.poster}" style="width:600px;height: 600px;">
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 20px;"></td>
        </tr>
        
        
        <tr>
            <td style="display: flex; align-items: center;">
                <img src="${cvo.writerposter}" style="border-radius: 50%; height: 50px; width: 50px; margin-right: 10px;">
                <span style="display: inline-block;">작성자 <span style="font-weight: bold;">${cvo.writer}</span></span>
                <a href="../somoim/list.do" style="margin-left: auto;">
                    <button class="btn-sm btn-info">목록</button>
                </a>
            </td>
        </tr>
        <tr>
            <td style="height: 20px;"></td>
        </tr>
        <tr>
            <td>
                <div class="content">
			                                <c:set var="lines" value="${fn:split(cvo.content, '
			')}" />
											<c:forEach items="${lines}" var="line">
											    <p>${line}</p>
											</c:forEach>
						</div>
            </td>
        </tr>
        <tr>
	        <td>
	        	<div class="content">
	        		${cvo.dbday }
	        	</div>
	        	
	        </td>
        </tr>
        <tr>
            <td style="height: 20px;"></td>
        </tr>
    </table>
</div>
<div class="container" id="SomoimreplyApp">
   <div class="row" style="width: 600px;margin-left: 64px;">
     <table class="table">
       <tr>
        <td>
          <table class="table" v-for="(vo, index) in reply_list">
           <tr>
            <td class="text-left"><img :src="vo.writerposter" style="border-radius: 50%; height: 50px; width: 50px; margin-right: 10px;">{{vo.nickname}}({{vo.dbday}})</td>
            <td class="text-right">
              <span v-if="vo.id===sessionId">
                <input type=button value="수정" class="btn-xs btn-success updates" style="margin-left: 3px" :id="'up'+vo.rno" @click="replyUpdateForm(vo.rno)">
                <input type=button value="삭제" class="btn-xs btn-info" @click="replyDelete(vo.rno)">
              </span>
            </td>
           </tr>
           <tr>
             <td colspan="2" style="width: 600px;">
              <pre style="white-space: pre-wrap;background-color: white;border:none;">{{vo.msg}}</pre>
             </td>
           </tr>
           
           <tr :id="'u'+vo.rno" class="ups" style="display:none">
            <td colspan="2">
             <textarea rows="5" cols="90" style="float: left" :id="'msg'+vo.rno">{{vo.msg}}</textarea>
             <input type=button value="댓글수정" style="float: left;height: 96px" class="btn-danger" @click="replyUpdate(vo.rno)">
           </td>
          </tr>
           
          </table>
        </td>
       </tr>
     </table>
     <table class="table" v-show="sessionId!=''">
       <tr>
         <td class="text-left">
          <textarea rows="5" cols="70" style="float: left" v-model="msg" ref="msg"></textarea>
          <input type=button value="댓글쓰기" style="float: left;height: 96px" class="btn-danger" @click="replyInsert()">
         </td>
       </tr>
     </table>
   </div>
  </div>
  </div>
  <script>
  let replyApp=Vue.createApp({
	  data(){
		return {
			scno:${scno},
			sessionId:'${userId}',
			reply_list:[],
			rno:0,
			bCheck:true,
			sno:${sno},
	        msg: ''
	            
		}  
	  },
	  mounted(){
		  // 시작과 동시에 댓글 읽기 
		  axios.get('../reply/list_vue.do',{
			  params:{
				  scno:this.scno
			  }
		  }).then(response=>{
			  this.reply_list=response.data.reply_list;
			  console.log(response.data)
			  
		  })
	  },
	  methods:{
		  // 수정 
		  replyUpdateForm(rno){
			  console.log('업데이트의 rno:', rno); // rno 값 확인
			 $('.ups').hide();
			 $('.updates').attr("value","수정")
			 if(this.bCheck===true)
			 {
				$('#u'+rno).show();
				$('#up'+rno).attr("value","취소")
				this.bCheck=false
			 }
			 else
			 {
				 $('#u'+rno).hide();
				 $('#up'+rno).text("수정")
				 this.bCheck=true
			 }
			  
		  },
		  replyUpdate(rno){
			let msg=$('#msg'+rno).val();
			axios.get('../reply/update_vue.do',{
				params:{
					rno:rno,
					scno:this.scno,
					msg:msg
					
				}
			}).then(response=>{
				// 상태 관리 => 데이터 변경 
				this.reply_list=response.data.reply_list;
				$('#u'+rno).hide()
				$('#up'+rno).attr("value","수정")
			})
		  },
		  
		  // 삭제 
		  replyDelete(rno) {
			  console.log('rno:', rno); // rno 값 확인
			    axios.get("../reply/delete_vue.do", {
			        params: {
			            rno:rno,
			            scno:this.scno
			        }
			    })
			    .then(response => {
			        this.reply_list = response.data.reply_list;
			    })
			    .catch(error => {
			        console.error('Error deleting reply:', error);
			    });
			},
		  
		  // 추가
		  replyInsert(){
			  if(this.msg==="")
			  {
				  this.$refs.msg.focus()
				  return
			  }
			  
			  axios.get('../reply/insert_vue.do',{
				  params:{
					  scno:this.scno,
					  msg:this.msg,
					  sno:this.sno
				  }
			  }).then(response=>{
				  this.reply_list=response.data.reply_list;
				  this.msg=""
			  })
		  }
	  }
  }).mount('#SomoimreplyApp')
  </script>
</body>
</html>