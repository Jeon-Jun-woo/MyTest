<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
a.link:hover,img.img_click:hover{
  cursor: pointer;
}
.pagination {
  display: flex;
  justify-content: center;
}
</style>
</head>
<body>
   <div class="container" id="findApp">
      <div class="banner-section spad">
           <div class="container-fluid">
              <h2 class="sectiontitle"><strong>내 주변 요가/필라테스</h2>
              	<h5 class="sectiontitle">검색으로 편하게 찾아보세요:)</h5>
                <header class="heading inline">
                  <input type=text ref="fd" size=20 class="input-sm" v-model="fd" @keyup.enter="find()">
                  <input type=button value="검색" class="btn-sm btn-primary" @click="find()">
                </header>
                <div class="row">
                   <div class="col-md-3" v-for="(vo, index) in yp_list">
                      <a href="#">
                         <div class="thumbnail">
                            <img :src="vo.poster" style="width: 100%" @click="detail(vo.no)">
                            <div class="caption">
                               <p style="font-size: 15px">{{vo.title}}</p>
                            </div>
                         </div>
                      </a>
                   </div>
                </div>
             </div>
          <!-- <ul class="nospace clear">
            <li v-for="(vo,index) in gym_list" :class="index%4==0?'one_quarter first':'one_quarter'"><img class="img_click" :src="vo.poster" :title="vo.title" @click="detail(vo.no)"></li>
          </ul> -->


      <ul class="pagination text-center">
 		 <li v-if="startPage > 1"><a class="link" @click="prev()">&laquo; Previous</a></li>
  		 <li v-for="i in range(startPage, endPage)" :class="i === curpage ? 'active' : ''">
    	  <a class="link" @click="pageChange(i)">{{ i }}</a>
   	  </li>
  <li v-if="endPage < totalpage"><a class="link" @click="next()">Next &raquo;</a></li>
    </ul>
      <div id="dialog" title="상세 보기" v-show="isShow">
        <detail_dialog  v-bind:yp_detail="yp_detail"></detail_dialog>
      </div>
     </div>
    <div class="clear"></div>
  </main>
</div>
<%--
   class A
   {
       B b=new B() => 매개변수
                      => 태그의 속성 , 멤버변수  
   }
   class B
   {
      
   }
 --%>
<script>
  const detailComponent={
     props:['yp_detail'],
     template:`<h3 class="text-center"><strong>요가/필라테스 상세보기</strong></h3>
               <table class="table">
               <tr>
                 <td width=30% class="text-center" rowspan="9">
                   <img :src="yp_detail.poster" style="width:100%">
                 </td>
                 <td colspan="2">
                   <h3>{{yp_detail.title}}&nbsp;<span style="color:orange"></span></h3>
                 </td>
               </tr>
               <tr>
                 <th width="15%">주소</th>
                 <td width="55%">{{yp_detail.address}}</td>
               </tr>
               <tr>
                 <th width="15%">전화</th>
                 <td width="55%">{{yp_detail.phone}}</td>
               </tr>
               <tr>
                 <th width="15%">영업시간</th>
                 <td width="55%">{{yp_detail.time}}</td>
               </tr>
               </table>
              `
  }
  let findApp=Vue.createApp({
     data(){
      return {
    	  yp_list:[],
         fd:'송도',
         yp_detail:{},
         page_list:{},
         no:1,
         curpage:1,
         totalpage:0,
         startPage:0,
         endPage:0,
         isShow:false
      }  
     },
     mounted(){
        this.dataRecv()
     },
     updated(){
        
     },
     methods:{
        dataRecv(){
           axios.get('../yp/find_vue.do',{
              params:{
                 page:this.curpage,
                 fd:this.fd
              }
           }).then(response=>{
              console.log(response)
              this.yp_list=response.data
           })
           
           axios.get('../yp/page_vue.do',{
              params:{
                 page:this.curpage,
                 fd:this.fd
              }
           }).then(response=>{
              console.log(response.data)
              this.page_list=response.data
              
              this.curpage=response.data.curpage
              this.totalpage=response.data.totalpage
              this.startPage=response.data.startPage
              this.endPage=response.data.endPage
           })
        },
        range(start,end){
           let arr=[]
           let leng=end-start
           for(let i=0;i<=leng;i++)
           {
              arr[i]=start
              start++;
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
        },
        find(){
           this.curpage=1
           this.dataRecv()
        },
        detail(no){
           this.isShow=true
           // .do?fno=1
           /*
               axios.get() => 요청  
               then() => 응답(결과)
               catch() => 처리과정에서 오류 발생시 
           */
           axios.get('../yp/detail_vue.do',{
              params:{
                 no:no
              }
           }).then(response=>{
              console.log(response.data)
              this.yp_detail=response.data
              
              $('#dialog').dialog({
                 autoOpen:false,
                 modal:true,
                 width:700,
                 height:600
              }).dialog("open")
           })/* .catch(error=>{
              console.log(error.response) 
           }) */
           
        }
     },
     components:{
        // 상세보기 => dialog
        'detail_dialog':detailComponent
     }
  }).mount('#findApp')
</script>
</body>
</html>