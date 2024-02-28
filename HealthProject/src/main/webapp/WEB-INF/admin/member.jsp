<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
a.alink:hover{
   cursor: pointer;
}
</style>
</head>
<body>
	<div class="list" id="AdminApp">
                <div class="row">
                        <div class="member_manager_table" style="margin-left: -10px;">
                            <table class="member_manager" style="border-collapse: collapse; width: 970px;">
							    <h3 style="text-align: left;font-weight: bold;">회원관리</h3>
							    <tr>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">번호</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">이름</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">아이디</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">닉네임</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">성별</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">연락처</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">마지막 로그인</th>
							        <th class="text-center" colspan="2" style="border: 1px solid black; padding: 8px;">권한</th>
							        <th class="text-center" style="border: 1px solid black; padding: 8px;">회원상세보기</th>
							    </tr>
							    <tr v-for="(mvo,index) in member_list">
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{ index + 1 }}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.userName}}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.userId}}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.nickname}}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.sex}}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.phone}}</td>
							        <td style="border: 1px solid black; padding: 8px;" class="text-center">{{mvo.reg_dbday}}</td>
							        <td style="border: 1px solid black; padding: 8px;">
							            <select class="input-sm" v-model="mvo.authority" style="width: 100%;">
							                <option :selected="mvo.authority === 'ROLE_ADMIN' ? true : false" value="ROLE_ADMIN">ROLE_ADMIN</option>
							                <option :selected="mvo.authority === 'ROLE_USER' ? true : false" value="ROLE_USER">ROLE_USER</option>
							            </select>
							        </td>
							        <td style="border: 1px solid black; padding: 8px;">
							            <div class="btn-sm btn-success" style="width: 100%; text-align: center;" @click="applyAuthorityChange(mvo.userId)">적용</div>
							        </td>
							        <td style="border: 1px solid black; padding: 8px;">
							            <div class="btn-sm btn-info text-center" style="width: 100%;" @click="detail(mvo.userId)">상세보기</div>
							        </td>
							    </tr>
							</table>
                        </div>
                    </div>
                    
                     <!-- Blog Section End -->
				    <div rowspan="2">
				      <div class="text-center">
				        <ul class="pagination">
						  <li v-if="startpage>1"><a class="alink" @click="prev()">&laquo;</a></li>
						  <li v-for="i in range(startpage,endpage)" :class="i===curpage?'active':''"><a class="alink" @click="pageChange(i)">{{i}}</a></li>
						  <li v-if="endpage<totalpage"><a class="alink" @click="next()">&raquo;</a></li>
						</ul>
				      </div>
                	</div>
    <div id="dialog" title="회원 상세 보기" v-show="isShow">
        <detail_dialog  v-bind:member_detail="member_detail"></detail_dialog>
      </div>
	</div>
	
 <script>
  const detailComponent={
	  props:['member_detail'],
	  template:`<h3 class="text-center">회원 상세보기</h3>
	            <table class="table">
		            <tr>
		              <td width=30% class="text-center" rowspan="12">
		                <img :src="member_detail.poster" style="width:100%">
		              </td>
		              <td colspan="2">
		                <h3>{{member_detail.userName}}&nbsp;<span style="color:orange">{{member_detail.score}}</span></h3>
		              </td>
		            </tr>
		            <tr>
		              <th width="20%">아이디</th>
		              <td width="50%">{{member_detail.userId}}</td>
		            </tr>
		            <tr>
		              <th width="20%">이름</th>
		              <td width="50%">{{member_detail.userName}}</td>
		            </tr>
		            <tr>
		              <th width="20%">닉네임</th>
		              <td width="50%">{{member_detail.nickname}}</td>
		            </tr>
		            <tr>
		              <th width="20%">성별</th>
		              <td width="50%">{{member_detail.sex}}</td>
		            </tr>
		            <tr>
		              <th width="20%">생년월일</th>
		              <td width="50%">{{member_detail.birthday}}</td>
		            </tr>
		            <tr>
		              <th width="20%">주소</th>
		              <td width="50%">({{member_detail.post}}){{member_detail.addr1}}{{member_detail.addr2}}</td>
		            </tr>
		            <tr>
		              <th width="20%">전화번호</th>
		              <td width="50%">{{member_detail.phone}}</td>
		            </tr>
		            <tr>
		              <th width="20%">가입일</th>
		              <td width="50%">{{member_detail.reg_dbday}}</td>
		            </tr>
		            <tr>
		              <th width="20%">최종수정일</th>
		              <td width="50%">{{member_detail.mod_dbday}}</td>
		            </tr>
		            <tr>
		              <th width="20%">마지막 로그인</th>
		              <td width="50%">{{member_detail.last_dbday}}</td>
		            </tr>
		            <tr>
		              <th width="20%">가입한 소모임</th>
		              <td width="50%">[{{member_detail.typee}}]&nbsp;{{member_detail.title}}</td>
		            </tr>
	            </table>
	           `
  }
  let memberApp=Vue.createApp({
	  data(){
		return {
			member_list:[],
			member_detail:{},
			page_list:{},
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			isShow:false,
			userid:'',
			changeMSG:''
			
		}  
	  },
	  mounted(){
		  this.dataRecv()
		  console.log('Vue 인스턴스가 마운트되었습니다.');
	  },
	  updated(){
		  
	  },
	  methods: {
		    dataRecv() {
		        axios.get('../admin/member_vue.do', {
		            params: {
		                page: this.curpage
		            }
		        }).then(response => {
		            console.log(response)
		            this.member_list = response.data
		        })

		        axios.get('../admin/page_vue.do', {
		            params: {
		                page: this.curpage
		            }
		        }).then(response => {
		            console.log(response.data)
		            this.page_list = response.data

		            this.curpage = response.data.curpage
		            this.totalpage = response.data.totalpage
		            this.startpage = response.data.startpage
		            this.endpage = response.data.endpage
		        })
		    },
		    range(start, end) {
		        let arr = []
		        let leng = end - start
		        for (let i = 0; i <= leng; i++) {
		            arr[i] = start
		            start++;
		        }
		        return arr
		    },
		    prev() {
		        this.curpage = this.startpage - 1
		        this.dataRecv()
		    },
		    next() {
		        this.curpage = this.endpage + 1
		        this.dataRecv()
		    },
		    pageChange(page) {
		        this.curpage = page
		        this.dataRecv()
		    },
		    find() {
		        this.curpage = 1
		        this.dataRecv()
		    },
		    detail(userid) {
		        this.isShow = true

		        axios.get('../admin/detail_vue.do', {
		            params: {
		                userid: userid
		            }
		        }).then(response => {
		            console.log(response.data)
		            this.member_detail = response.data

		            $('#dialog').dialog({
		                autoOpen: false,
		                modal: true,
		                width: 700,
		                height: 600
		            }).dialog("open")
		        })
		    },
		    applyAuthorityChange(userId) {
		        // 해당 userId를 가진 mvo를 찾아서 처리
		        const mvo = this.member_list.find(item => item.userId === userId);
		        if (!mvo) {
		            console.error('해당 userId에 대한 mvo를 찾을 수 없습니다.');
		            return;
		        }

		        const selectedAuthority = mvo.authority;
		        console.log('선택된 권한 값:', selectedAuthority);
		        axios.get('../admin/authoritychange_vue.do', {
		            params: {
		                userId: userId,
		                changeMSG: selectedAuthority
		            }
		        }).then(response => {
		            console.log(response.data);
		            if (response.data === 'YES') {
		                alert("해당 회원 권한이 변경되었습니다");
		                location.href = '../admin/member.do';
		            } else {
		                alert("오류::해당 회원 권한이 변경되지 못했습니다");
		                location.href = '../admin/member.do';
		            }
		        }).catch(error => {
		            console.error(error);
		        });
		    }
	  },
	  components:{
		  // 상세보기 => dialog
		  'detail_dialog':detailComponent
	  }
  }).mount('#AdminApp')
</script>
</body>
</html>