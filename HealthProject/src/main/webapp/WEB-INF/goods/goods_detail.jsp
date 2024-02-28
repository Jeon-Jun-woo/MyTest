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
<style type="text/css">
a.link:hover,img.img_click:hover{
  cursor: pointer;
}

.col{
            width: 50%; /* 각 컬럼이 화면의 절반을 차지하도록 설정 */
            float: left; /* 컬럼을 왼쪽으로 띄워 세로로 배치 */
            box-sizing: border-box; /* 컬럼의 경계를 포함하여 크기 설정 */
            padding: 20px; /* 내용과 경계 사이에 여백 설정 */
            border: 1px solid #ccc; /* 테두리 설정 */
}

.table1 td {
            padding: 10px; /* th 요소의 안쪽 여백 설정 */
            text-align: left; /* 텍스트를 왼쪽 정렬 */
}

ul.nav-tabs li a {
  padding: 10px 121.5px; /* 버튼의 위/아래 여백은 10px, 오른쪽/왼쪽 여백은 20px */
}

ul.nav-tabs li{
	background-color: #EEEEEE;
	color: black;
}
td.text-right h3{
	color: red;
	font-weight: bold;
}
table.table h3{
	color: red;
	font-weight: bold;
}
div.row ul.nav li{
	border: 1px solid #CCCCCC;
}
div.col h4{
	font-weight: bold;
}
div.col h5{
	font-weight: bold;
}
div.col h6{
	font-weight: bold;
	color:gray;
}
table.tabled td{
	background-color: gray;
}
</style>
</head>
<body>

 <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
<div class="wrapper row3" id="goodsApp">
  <main class="container clear">  
     <div class="row">
       <div class="col">
       	 <table class="table">
       	   <tr>
	         <td colspan="2" class="text-center">
	             <img :src="goods_detail.poster" style="height: 500px">
	         </td>
	       </tr>
	       
       	 </table>
       	 <table class="table">
	         <tr>
	           <th>총 리뷰수</th>
	           <td><h3>{{r_count}}</h3></td>
	           <th>찜수</th>
	           <td><h3>???</h3></td>
	         </tr>
	       </table>
       </div>
       <div class="col">
           <table class="table">
           <tr>
	         <td><h5>{{goods_detail.brand1}}</h5></td>
	       </tr>
       	   <tr>
	         <td><h4>{{goods_detail.kname}}</h4></td>
	       </tr>
	       <tr>
	         <td><h6>{{goods_detail.ename}}</h6></td>
	       </tr>
	       <tr>
	         <td class="text-right"><h3>{{goods_detail.price}}원</h3></td>
	       </tr>
       	 </table>
       	 <table class="table">
       	      <tr>
			      <td width="65%">
					  수량:<select id="sel">
						  <option value="1">1개</option>
						  <option value="2">2개</option>
						  <option value="3">3개</option>
						  <option value="4">4개</option>
						  <option value="5">5개</option>
					  </select>
				  </td>
			  </tr>
			  <tr>
			   <td width="65%" class="text-right">
			    총구매액:<span id="total">${vo.price }</span>원
			   </td>
			  </tr>
			  <tr>
			  	  <td>
			  	   <span :class="jjim_count==1?'btn btn-sm btn-danger':'btn btn-sm btn-default'" v-text="jjim_count==0?'찜등록':'찜해제'"></span>
			  	  </td>
				  <td width="65%" class="text-right">
				      <span class="btn btn-sm btn-danger">장바구니</span> 
				      <span class="btn btn-sm btn-success">바로구매</span> 
				      <span class="btn btn-sm btn-info" onclick="javascript:history.back()">목록</span> 
				  </td>
			  </tr>
       	 </table>
       </div>
      </div>
      <div class="row">
		  <ul class="nav nav-tabs">
		    <li class="active"><a href="#">상세 정보</a></li>
		    <li><a href="#">리뷰</a></li>
		    <li><a href="#">Q&A</a></li>
		    <li><a href="#">약국검색</a></li>
		  </ul>
      </div>
      <div class="row">
        <table class="table">
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">한글제품명</td>
           <td>{{goods_detail.kname}}</td>
          </tr>
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">영문제품명</td>
           <td>{{goods_detail.ename}}</td>
          </tr>
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">용량/수량</td>
           <td>{{goods_detail.eatSize}}</td>
          </tr>
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">제조사</td>
           <td>{{goods_detail.brand1}}</td>
          </tr>
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">섭취 방법</td>
           <td>{{goods_detail.eatUse}}</td>
          </tr>
          <tr>
           <td width="20%" style="color: gray;background-color: #ECECEC">주의 사항</td>
           <td>{{goods_detail.caution}}</td>
          </tr>
        </table>
      </div>
      <div class="row">
       <h1>상품 리뷰</h1>
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
	         <input type=button value="리뷰작성" class="btn-danger"
	          style="float: left;width: 80px;height: 86px" @click="replyInsert()">
	       </td>
	      </tr>
	    </table>
      </div>
      <div class="row">
       <h1>Q&A</h1>
      </div>
      <div class="row">
        <div id="map" style="width:700px;height:700px;"></div>
      </div>
    <div class="clear"></div>
    
  </main>
</div>
<script>
  let fApp=Vue.createApp({
	  data(){
		  return {
			  goods_detail:{},
			  gno:${gno},
			  isShow:false,
		      reply_list:[],
		      sessionId:'${sessionScope.userId}',
		      msg:'',
		      u:0,
		      r_count:0,
		      jjim_count:0
		  }
	  },
	  mounted(){
		  axios.get('../goods/goods_detail_vue.do',{
			  params:{
				  gno:this.gno
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.reply_list=response.data.reply_list
			  this.goods_detail=response.data.detail_data
			  this.r_count=response.data.rCount
			  if(window.kakao && window.kakao.maps)
			  {
				  this.initMap()
			  }
			  else
			  {
				  this.addScript()
			  }
		  })
	  },
	  methods:{
		  jjim(gno){
			  axios.post('../goods/jjim.do',null,{
				  params:{
					  gno:gno
				  }
			  }).then(response=>{
				  this.jjim_count=response.data.jjim_count
				  if(response.data=="yes")
				  {
					  //찜하고 화면 
					  alert("찜 성공")
					  axios.get('../goods/goods_detail_vue.do',{
						  params:{
							  gno:this.gno
						  }
					  }).then(response=>{
						  console.log(response.data)
						  this.reply_list=response.data.reply_list
						  this.goods_detail=response.data.detail_data
						  this.r_count=response.data.rCount
						  if(window.kakao && window.kakao.maps)
						  {
							  this.initMap()
						  }
						  else
						  {
							  this.addScript()
						  }
					  })
				  }
				  else
				  {
					  alert("예약 승인에 실패하셨습니다!!")
				  }
					 
			  })
		  },
		  replyUpdate(no){
	    		 let msg=$('#u_msg'+no).val()
	    		 //alert(msg)
	    		 axios.post('../recipe/reply_update_vue.do',null,{
	    			 params:{
	    				 no:no,
	    				 gno:this.gno,
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
	    		axios.get('../recipe/reply_delete_vue.do',{
	    		  params:
	    			  {
	    			      no:no,
	    			      gno:this.gno
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
	    		
	    		axios.post('../recipe/reply_insert_vue.do',null,{
	    			params:{
	    				gno:this.gno,
	    				msg:this.msg
	    			}
	    		}).then(response=>{
	    			this.reply_list=response.data
	    			this.msg=''
	    		})
	    	 },
		  addScript(){
			  const script=document.createElement("script")
			  
			  /*global kakao*/
			  script.onload=()=>kakao.maps.load(this.initMap)
			  script.src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=9965c727d3306713c47391be682e4be9&libraries=services"
			  document.head.appendChild(script)
		  },
		  initMap(){
			  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		    mapOption = {
    		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    		        level: 3 // 지도의 확대 레벨
    		    };  

    		// 지도를 생성합니다    
    		var map = new kakao.maps.Map(mapContainer, mapOption); 

    		// 주소-좌표 변환 객체를 생성합니다
    		var geocoder = new kakao.maps.services.Geocoder();

    		// 주소로 좌표를 검색합니다
    		geocoder.addressSearch(this.food_detail.address, function(result, status) {

    		    // 정상적으로 검색이 완료됐으면 
    		     if (status === kakao.maps.services.Status.OK) {

    		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    		        // 결과값으로 받은 위치를 마커로 표시합니다
    		        var marker = new kakao.maps.Marker({
    		            map: map,
    		            position: coords
    		        });

    		        // 인포윈도우로 장소에 대한 설명을 표시합니다
    		        var infowindow = new kakao.maps.InfoWindow({
    		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#name").text()+'</div>'
    		        });
    		        infowindow.open(map, marker);

    		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    		        map.setCenter(coords);
    		    } 
    		 });    
		  },
		  goback(){
			  location.href="../goods/goods_list.do"
		  }
	  }
  }).mount("#goodsApp")
  
</script>
</body>
</html>