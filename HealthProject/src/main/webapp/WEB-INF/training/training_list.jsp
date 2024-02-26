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
 .video-thumbnail {
  position: relative; /* 변경된 부분: 상대 위치 지정 */
  width: 100%;
  height: auto;
}
</style>
</head>
<body>
  <div class="wrapper row3">
     <main class="container clear"> 
       <!-- main body -->
       <h2 class="sectiontitle">운동 목록</h2>
       <div class="row" id="trainApp"> 
         <div class="col-md-4" v-for="(vo, index) in training_list" :key="index">
             <div class="thumbnail">
                 <a :href="'../training/training_list_detail.do?tno='+vo.tno">
                     <div class="video-container">
                         <iframe class="video-thumbnail" :src="vo.uri" frameborder="0" allowfullscreen></iframe>
                     </div>
                     <div class="caption">
                         <p>{{ truncate(vo.explain) }}</p>
                     </div>
                 </a>
             </div>
         </div>
         <div class="col-md-12 text-center"> <!-- 변경된 부분: 페이지네이션을 가운데 정렬 -->
           <nav aria-label="Page navigation">
             <ul class="pagination">
               <li v-if="startPage>1"><a @click="prev()" class="link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
               <li v-for="i in range(startPage, endPage)" :class="i==curpage?'active':''"><a @click="pageChange(i)" class="link">{{i}}</a></li>    
               <li v-if="endPage<totalpage"><a @click="next()" class="link" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
             </ul>
           </nav>
         </div>
       </div>
       <!-- / main body -->
       <div class="clear"></div>
     </main>
   </div>
   <script>
   let trainApp=Vue.createApp({
        data() {
            return {
                training_list: [],
                curpage: 1,
                totalpage: 0,
                startPage: 0,
                endPage: 0
            }
        },
        mounted() {
            this.dataRecv();
        },
        methods: {
            dataRecv() {
                axios.get('training_list_vue.do', {
                        params: {
                            page: this.curpage
                        }
                    })
                    .then(response => {
                        this.training_list = response.data;
                    });

                axios.get('training_page_vue.do', {
                        params: {
                            page: this.curpage
                        }
                    })
                    .then(response => {
                        this.curpage = response.data.curpage;
                        this.totalpage = response.data.totalpage;
                        this.startPage = response.data.startPage;
                        this.endPage = response.data.endPage;
                    });
            },
            range(start, end) {
                let arr = [];
                let leng = end - start;
                for (let i = 0; i <= leng; i++) {
                    arr[i] = start;
                    start++;
                }
                return arr;
            },
            prev() {
                this.curpage = this.startPage - 1;
                this.dataRecv();
            },
            next() {
                this.curpage = this.endPage + 1;
                this.dataRecv();
            },
            pageChange(page) {
                this.curpage = page;
                this.dataRecv();
            },
            truncate(value) {
                if (!value) return ''; // 값이 없으면 빈 문자열 반환
                const length = 15;
                if (value.length <= length) {
                    return value;
                }
                return value.substring(0, length) + '...';
            }
        }
    }).mount('#trainApp');
   </script>
</body>
</html>