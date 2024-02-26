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
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
  <h2 class="sectiontitle">운동 칼로리 검색</h2>
  <div class="content" id="findApp"> 
      <div id="gallery">
        <figure>
          <header class="heading inline">
            <input type=text ref="fd" size=20 class="input-sm" v-model="ed" @keyup.enter="find()">
            <input type=button value="검색" class="btn-sm btn-primary" @click="find()">
          </header>
          <ul class="nospace clear">
            <li v-for="vo in exercise_list"><a :href="'../exercise/exercise_list_detail.do?eno='+vo.eno">{{vo.name}}</a></li>
          </ul>
        </figure>
      </div>
      <nav class="pagination">
        <ul class="pagination">
             <li v-if="startPage>1"><a @click="prev()" class="link">&laquo; Previous</a></li>
             <li v-for="i in range(startPage, endPage)" :class="i==curpage?'active':''"><a @click="pageChange(i)" class="link">{{i}}</a></li>    
             <li v-if="endPage<totalpage"><a @click="next()" class="link">Next &raquo;</a></li>
         </ul>
      </nav>
      <div id="dialog" title="맛집 상세 보기" v-show="isShow">
        <detail_dialog  v-bind:exercise_detail="exercise_detail"></detail_dialog>
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
	  props:['exercise_detail'],
	  template:`<h3 class="text-center">운동 상세보기</h3>
	            <table class="table">
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
	            </table>
	           `
  }
  let findApp=Vue.createApp({
	  data(){
		return {
			exercise_list:[],
			ed:'프레스',
			exercise_detail:{},
			page_list:{},
			eno:1,
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
			  axios.get('../exercise/find_vue.do',{
				  params:{
					  page:this.curpage,
					  ed:this.ed
				  }
			  }).then(response=>{
				  console.log(response)
				  this.exercise_list=response.data
			  })
			  
			  axios.get('../exercise/exercise_page_vue.do',{
				  params:{
					  page:this.curpage,
					  ed:this.ed
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
		  detail(eno){
			  this.isShow=true
			  // .do?fno=1
			  /*
			      axios.get() => 요청  
			      then() => 응답(결과)
			      catch() => 처리과정에서 오류 발생시 
			  */
			  axios.get('../exercise/detail_vue.do',{
				  params:{
					  eno:eno
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.exercise_detail=response.data
				  
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