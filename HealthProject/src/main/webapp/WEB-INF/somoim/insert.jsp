<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  
<style>
    .heart-button {
        background-color: transparent;
        border: none;
        padding: 0;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/vue@3"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
    <div id="jjimApp" class="row" style="width: 600px;margin-left: 100px;">
        <div class="wrapper row3" id="newSomoimApp">
		    <main class="container clear"> 
		      <h2 class="sectiontitle">새로운 소모임 </h2>
		      <form method="post" action="../somoim/insert_ok.do" @submit="submitForm($event)" enctype="multipart/form-data">
		      <table class="table">
		      <tr>
				    <th width=15% class="text-center">소모임 대표 사진</th>
				    <td width=85% class="inline">
				        <!-- <input type="file" name="file" size="25"> -->
				        <div class="inputArea">
						 <label for="gdsImg">이미지</label>
						 <input type="file" id="gdsImg" name="file" />
						 <div class="select_img"><img src="" /></div>
						 
						 <%-- <%=request.getRealPath("/") %> --%>
						</div>
				        
				    </td>
				</tr>
		      <tr>
		        <th width=15% class="text-center">카테고리</th>
		        <td width=85% class="inline">
		         <select ref="typee" class="input-sm" v-model="typee" name="typee">
		            <option>축구</option>
		            <option>야구</option>
		            <option>풋살</option>
		            <option>스포츠관람</option>
		            <option>클라이밍</option>
		            <option>등산</option>
		            <option>러닝</option>
		            <option>요가</option>
		            <option>스키</option>
		            <option>보드</option>
		            <option>스케이트보드</option>
		            <option>서핑</option>
		            <option>수영</option>
		            <option>볼링</option>
		            <option>탁구</option>
		            <option>테니스</option>
		          </select>
		        </td>
		       </tr>
		       <tr>
		        <th width=15% class="text-center">소모임 이름</th>
		        <td width=85% class="inline">
		          <input type=text ref=title size=15 class="input-sm" v-model="title" v-bind:readonly="isReadOnly" name="title">
		          <input type=button value="소모임 이름 중복체크" class="btn-sm btn-danger" @click="titleCheck">
		          <p>{{titleOk}}</p>
		        </td>
		       </tr>
		       <tr>
		        <th width=15% class="text-center">닉네임</th>
		        <td width=85% class="inline">
		          <input type=text ref=hostname size=15 class="input-sm" v-model="hostname" name="hostname" readonly>
		        </td>
		       </tr>

		       <tr>
		        <th width=15% class="text-center">모집인원</th>
		        <td width=85% class="inline">
		          <input type=text ref=inwon size=50 class="input-sm" v-model="inwon" name="inwon">
		        </td>
		       </tr>
		       <tr>
		        <th width=15% class="text-center">활동지역</th>
		        <td width=85% class="inline">
				    <input type="text" id="sample5_address" size="50" placeholder="주소" name="loc" readonly>
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					<div class="row">
						<div id="map" style="width:600px;height:350px;">지도출력할위치</div>
					</div>
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
		           <input type="submit" value="만들기" class="btn-sm btn-success">
		           <input type=button value="취소" class="btn-sm btn-info"
		             onclick="javascript:history.back()">
		         </td>
		       </tr>
		      </table>
		      </form>
		    </main>
		</div>
    </div>

<script>
let memberApp=Vue.createApp({
	   data(){
			  return {
				  typee:'',
				  title:'',
				  hostname:'${nickName}',
				  inwon:'',
				  loc:'',
				  content:'',
				  titleOk:'',
				  isReadOnly:false
			  }
	   },
	   methods:{
		   submitForm(e) {
	            e.preventDefault(); // 기본 동작 방지
	            
	            if (this.typee && this.title && this.hostname && this.inwon && this.content && !this.titleOk) {
	                // form 데이터를 FormData 객체에 담습니다.
	                let formData = new FormData();
	                formData.append('typee', this.typee);
	                formData.append('title', this.title);
	                formData.append('hostname', this.hostname);
	                formData.append('inwon', this.inwon);
	                formData.append('loc', this.loc);
	                formData.append('content', this.content);
	                formData.append('file', document.querySelector('input[type="file"]').files[0]);
	                
	                // 서버로 데이터를 전송합니다.
	                axios.post('../somoim/insert_ok.do',formData,{
	    			header:{
	    				'Content-Type':'multipart/form-data'
	    			}
	                    }).then(response => {
	                        // 성공적인 응답을 받았을 때 원하는 동작을 수행합니다.
	                        if (response.data === 'yes') {
	                            location.href = '../somoim/list.do'; // 원하는 페이지로 이동합니다.
	                        } else {
	                            // 오류 처리
	                            console.error('오류가 발생했습니다.');
	                        }
	                    })
	                    .catch(error => {
	                        console.error('서버와의 통신 중 오류가 발생했습니다.');
	                        console.error(error);
	                    });
	            }
	        },
		   titleCheck(){
				  if(this.title==='')
				  {
					  this.$refs.title.focus()
					  return
				  }
				  axios.get('../somoim/titlecheck_vue.do',{
					  params:{
						  title:this.title
					  }
				  }).then(response=>{
					 if(response.data=="0")  
				     {
						 this.titleOk=''
						 this.isReadOnly=true
				     }
					 else
					 {
						 this.titleOk='이미 사용중인 제목입니다' 
					 }
				  })
		   }
	   }
}).mount("#newSomoimApp")
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=108c6864202da2d6b6bc3729fa6685c3&libraries=services"></script>
<script>


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    
    $("#gdsImg").change(function(){
 	   if(this.files && this.files[0]) {
 	    var reader = new FileReader;
 	    reader.onload = function(data) {
 	     $(".select_img img").attr("src", data.target.result).width(500);        
 	    }
 	    reader.readAsDataURL(this.files[0]);
 	   }
 	  });
</script>

    

</body>
</html>
