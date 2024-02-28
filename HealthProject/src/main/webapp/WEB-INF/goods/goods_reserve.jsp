<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#reserveApp {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
 .rounded {
      -moz-border-radius:20px 20px 20px 20px; 
      border-radius:20px 20px 20px 20px;
      border:solid 1px #ffffff;
      background-color:#2b6bd1;
      padding:10px;
      color:#ffffff;
    }
  td.link:hover,tr.tr_link:hover{
    cursor: pointer;
  }
</style>
</head>
<body>
<div class="wrapper row3" id="reserveApp">
  <main class="container clear"> 
   <h2 class="sectiontitle">상담 예약</h2>
   <table class="table">
     <tr>
       <td class="text-center" rowspan="4" width=40%>
         <table class="table">
           <caption><h3 class="text-center">지역별 병원</h3></caption>
           <tr>
             <td colspan="2" class="text-left inline">
              <input type="button" class="btn-xs btn-info" value="서울" @click="yakgookSelect('서울')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="경기" @click="yakgookSelect('경기')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="인천" @click="yakgookSelect('인천')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="전북" @click="yakgookSelect('전북')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="전남" @click="yakgookSelect('전라남')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="광주" @click="yakgookSelect('광주')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="울산" @click="yakgookSelect('울산')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="제주" @click="yakgookSelect('제주')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="세종" @click="yakgookSelect('세종')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="부산" @click="yakgookSelect('부산')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="충청" @click="yakgookSelect('충청')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="대전" @click="yakgookSelect('대전')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="강원" @click="yakgookSelect('강원')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="경북" @click="yakgookSelect('경상북도')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="경남" @click="yakgookSelect('경상남도')">&nbsp;
              <input type="button" class="btn-xs btn-info" value="대구" @click="yakgookSelect('대구')">
             </td>
           </tr>
         </table>
         <div style="overflow-y:auto;height: 700px">
           <table class="table">
             <tr v-for="vo in yakgook_list" class="tr_link" @click="yakgookNumber(vo.yno)">  
              <td class="text-left">{{vo.subject}}</td>
              <th class="text-right">전화번호: </th>
              <td class="text-left">{{vo.phone}}</td>
             </tr>
           </table>
         </div>
       </td>
       <td class="text-center" width="60%">
         <table class="table">
           <caption><h3 class="text-center">예약일 정보</h3></caption>
           <tr>
             <td>
                <div class="calendar">
				      <h2>
				        <a href="#" v-on:click="onClickPrev(currentMonth)">◀</a>
				        {{currentYear}}년 {{currentMonth}}월
				        <a href="#" v-on:click="onClickNext(currentMonth)">▶</a>
				      </h2>
				      <table class="table table-hover">
				          <thead>
				            <tr>
				              <td v-for="(weekName, index) in weekNames" v-bind:key="index">
				                {{weekName}}
				              </td>
				            </tr>
				          </thead>
				          <tbody>
				            <tr v-for="(row, index) in currentCalendarMatrix" :key="index">
				              <td v-for="(day, index2) in row" :key="index2" style="padding:20px;" :class="day>=realDay?'link':''">
				                <span v-if="day>=realDay" @click="change(day)" style="color:black">
					                <span v-if="day===currentDay" class="rounded">
					                  {{day}}
					                </span>
					                <span v-else>
					                  {{day}}
					                </span>
				                </span>
				                <span v-else style="color:gray">
				                   {{day}}
				                </span>
				              </td>
				            </tr>
				          </tbody>
				      </table>    
				  </div>
             </td>
           </tr>
         </table>
       </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
        <table class="table">
          <caption><h3 class="text-center">시간 정보</h3></caption>
          <tr v-show="tShow">
            <td class="text-center">
              <span class="btn btn-xs btn-success" v-for="time in time_list" style="margin-left: 2px" @click="timeSelect(time)">{{time}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
        <table class="table">
          <caption><h3 class="text-center">인원 정보</h3></caption>
          <tr v-show="iShow">
            <td class="text-center">
              <span class="btn btn-warning btn-xs" v-for="inwon in inwon_list" style="margin-left: 2px" @click="inwonSelect(inwon)">{{inwon}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr v-show="rShow">
       <td class="text-right" width=60% colspan="2">
         <input type=button class="btn-lg btn-primary" value="예약하기" @click="reserveOk()">
       </td>
     </tr>
   </table>
  </main>
</div>
<script>
let rApp=Vue.createApp({
	data(){
		return {
			weekNames: ["월요일", "화요일", "수요일","목요일", "금요일", "토요일", "일요일"],
		      rootYear: 1904,
		      rootDayOfWeekIndex: 4, // 2000년 1월 1일은 토요일
		      currentYear: new Date().getFullYear(),
		      currentMonth: new Date().getMonth()+1,
		      currentDay: new Date().getDate(),
		      currentMonthStartWeekIndex: null,
		      currentCalendarMatrix: [],
		      endOfDay: null,
		      memoDatas: [],
		      realDay:new Date().getDate(),
		      //food와관련된 내용
		      address:'서울',
		      yakgook_list:[],
		      yno:0, // -
		      time_list:['12:00','13:00','14:00','17:00','18:00','19:00','20:00','21:00'],
		      tShow:false,
		      time:'', // -
		      inwon_list:['2명','3명','4명','5명','6명','7명','8명','9명','10명','단체'],
		      iShow:false,
		      inwon:'', //-
		      rShow:false
		}
	},
	mounted(){ //시작하자마자 뿌려주는곳
		this.init()
		this.dataSend()
	},
	methods:{
		  reserveOk(){
			axios.post('../goods/reserve_ok.do',null,{
				params:{
					yno:this.yno,
					rDate:this.currentYear+"년도 "+this.currentMonth+"월 "+this.currentDay,
					rTime:this.time,
					rInwon:this.inwon //여기서 받는변수는 vo와 동일해야됨
				}
			}).then(response=>{
				if(response.data==='yes')
				{
					location.href="../mypage/mypage.do"	
				}
				else
				{
					alert("aa 예약에 실패했습니다")
				}
			})
		  },
		  inwonSelect(inwon)
		  {
			this.inwon=inwon
			this.rShow=true
		  },
		  timeSelect(time){
			this.time=time;
			this.iShow=true
		  },
		  yakgookNumber(yno){
			this.yno=yno;  
		  },
		  init(){
	        this.currentMonthStartWeekIndex = this.getStartWeek(this.currentYear, this.currentMonth);
	        this.endOfDay = this.getEndOfDay(this.currentYear, this.currentMonth);
	        this.initCalendar();
	      },
	      initCalendar(){
	        this.currentCalendarMatrix = [];
	        let day=1;
	        for(let i=0; i<6; i++){
	          let calendarRow = [];
	          for(let j=0; j<7; j++){
	            if(i==0 && j<this.currentMonthStartWeekIndex){
	              calendarRow.push("");
	            }
	            else if(day<=this.endOfDay){
	              calendarRow.push(day);
	              day++;
	            }
	            else{
	              calendarRow.push("");
	            }
	          }
	          this.currentCalendarMatrix.push(calendarRow);
	        }
	      },
	      getEndOfDay(year, month){
	          switch(month){
	              case 1:
	              case 3:
	              case 5:
	              case 7:
	              case 8:
	              case 10:
	              case 12:
	                return 31;
	                break;
	              case 4:
	              case 6:
	              case 9:
	              case 11:
	                return 30;
	                break;
	              case 2:
	                if( (year%4 == 0) && (year%100 != 0) || (year%400 == 0) ){
	                return 29;   
	                }
	                else{
	                    return 28;
	                }
	                break;
	              default:
	                console.log("unknown month " + month);
	                return 0;
	                break;
	          }
	      },
	      getStartWeek(targetYear, targetMonth){
	        let year = this.rootYear;
	        let month = 1;
	        let sumOfDay = this.rootDayOfWeekIndex;
	        while(true){
	          if(targetYear > year){
	            for(let i=0; i<12; i++){
	              sumOfDay += this.getEndOfDay(year, month+i);
	            }
	            year++;
	          }
	          else if(targetYear == year){
	            if(targetMonth > month){
	              sumOfDay += this.getEndOfDay(year, month);
	              month++;
	            }
	            else if(targetMonth == month){
	              return (sumOfDay)%7;
	            }
	          }
	        }
	      },
	      onClickPrev(month){
	        month--;
	        if(month<=0){
	          this.currentMonth = 12;
	          this.currentYear -= 1;
	        }
	        else{
	          this.currentMonth -= 1;
	        }
	        this.init();
	      },
	      onClickNext(month){
	        month++;
	        if(month>12){
	          this.currentMonth = 1;
	          this.currentYear += 1;
	        }
	        else{
	          this.currentMonth += 1;
	        }
	        this.init();
	      },
	      isToday: function(year, month, day){
	        let date = new Date();
	        return year == date.getFullYear() && month == date.getMonth()+1 && day == day; 
	      },
	      change(day){    //현재 선택한 날짜 가져올때
	    	 this.currentDay=day;
	         this.tShow=true
	    	 //this.isToday(this.currentYear,.this.currentMonth,this.currentDay)
	      },
	      //맛집
	      dataSend(){
	    	axios.get('../goods/yakgook_list_vue.do',{
	    		params:{
	    			address:this.address
	    		}
	    	}).then(response=>{
	    		console.log(response.data)
	    		this.yakgook_list=response.data
	    	})
	      },
	      yakgookSelect(address){
	    	  this.address=address;
	    	  this.dataSend()
	      }
	      //시간
	      //인원
	      //데이터 전송(예약처리) => 화면 변경 (마이페이지로 이동)
	  }
}).mount("#reserveApp")
</script>
</body>
</html>






