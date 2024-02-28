<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    width: 80%;
    height: 80%;
}

.txt {
    padding: 20px;
}


</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/> <!-- 세션 -->
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
          <td width="55%" id="type">
            <div v-for="(imgUrl, index) in imgUrls" :key="index">
                <img :src="imgUrl" class="img-thumbnail" width="500" height="500">
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="3" class="text-right inline">
            <input type="button" class="btn-xs btn-warning" value="목록" @click="goback()">
          </td>
        </tr>
        </tbody>
   </table>
   <div style="height: 20px"></div>
        <table class="table">
            <tr>
                <td>
                    <table class="table" v-for="rvo in reply_list">
                        <tr>
                            <td class="text-left">◑{{rvo.userName}}({{rvo.dbday}})</td>
                            <td class="text-right">
                                <span class="inline" v-if="rvo.userId===sessionId"> <!-- v-if="rvo.userId===sessionId" -->
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
                        <tr style="display: none" :id="'u'+ rvo.no" class="ups">
                            <td colspan="2">
                                <textarea rows="4" cols="85" :id="'u_msg'+rvo.no" style="float: left">{{rvo.msg}}</textarea>
                                <input type="button" value="댓글수정" class="btn-danger" style="float: left;width: 80px;height: 86px" @click="replyUpdate(rvo.no)">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="table" v-if="sessionId"><!-- v-if="sessionId" -->
            <tr>
                <td>
                    <textarea rows="4" cols="85" class="msg" style="float: left" v-model="msg"></textarea>
                    <input type=button value="댓글쓰기" class="btn-danger" style="float: left;width: 80px;height: 86px" @click="replyInsert()">
                </td>
            </tr>
        </table>
  </div>
  
  <script>
      let trainApp=Vue.createApp({
          data(){
              return {
                  training_detail:{},
                  no:${tno},
                  reply_list:[],
                  sessionId:'${principal.username}', // 추가
                  msg:'', // 추가
                  u:0, // 추가
                  imgUrls: [] // 이미지 URL을 저장할 배열 추가
              }
          },
          mounted(){
              axios.get('../training/detail_vue.do',{
                  params:{
                      tno:this.no
                  }
              }).then(response=>{
                  console.log(response.data)
                  this.training_detail=response.data.detail_data // .detail_data를 추가함
                  this.reply_list=response.data.reply_list // 추가
                  // 이미지 URL을 배열에 저장
                  if (this.training_detail.img) {
                      this.imgUrls = this.training_detail.img.split('^');
                  }
              })
          },
          methods:{
              replyUpdate(no){
                  
                  let msg=$('#u_msg'+no).val()
                  axios.post('../training/reply_update_vue.do', null, {
                      params:{
                          no:no,
                          tno:this.no,
                          msg:msg
                      }
                  }).then(response=>{
                      this.reply_list=response.data
                      $('#u'+no).hide('slow')
                      $('#up'+no).val('수정')
                  })
              },
              updateForm(no){
                  $('.ups').hide()
                  $('#up' + no).val('수정')
                  if(this.u==0)
                  {
                      this.u=1
                      $('#u' + no).show()
                      $('#up' + no).val('취소')
                  }
                  else
                  {
                      this.u=0
                      $('#u' + no).hide()
                      $('#up' + no).val('수정')
                  }
              },
              replyDelete(no){
                  axios.get('../training/reply_delete_vue.do',{
                      params:{
                          no:no,
                          tno:this.no
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
                          tno:this.no,
                          msg:this.msg
                      }
                  }).then(response=>{
                      this.reply_list=response.data
                      this.msg=''
                  })
              },
              goback(){
                  // window.history.back() // 이 부분은 쿠키 저장하기 전으로 돌아감
                  location.href="../training/training_list.do" // 이렇게 해야 함
              }
          }
        }).mount("#trainApp")
      </script>
</body>
</html>