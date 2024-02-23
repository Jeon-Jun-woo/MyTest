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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@3"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
    .heart-button {
        background-color: transparent;
        border: none;
        padding: 0;
    }
</style>
</head>
<body>

    <div id="jjimApp" class="row" style="width: 600px;margin-left: 100px;">
        <table>
            <tr>
                <td>
                    <div class="bi-pic">
                        <img src="${vo.poster}" style="width:600px;height: 350px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
            <tr>
                <td>
                    <span style="font-weight: bold; font-size: 25px;">${vo.title}</span>
                </td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
            <tr>
                <td style="display: flex; align-items: center;">
                    <img src="${vo.hostposter}" style="border-radius: 50%; height: 50px; width: 50px; margin-right: 10px;">
                    <span style="display: inline-block;">호스트 <span style="font-weight: bold;">${vo.hostname}</span></span>
                    <button v-if="!isLiked" @click="like" class="ml-4 flex items-center justify-center heart-button">
                <i class="fas fa-heart" style="color: gray; font-size: 24px;"></i>
                <span class="sr-only">찜</span>
            </button>
            <button v-else @click="unlike" class="ml-4 flex items-center justify-center heart-button">
                <i class="fas fa-heart" style="color: red; font-size: 24px;"></i>
                <span class="sr-only">찜</span>
            </button>
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
			                                <c:set var="lines" value="${fn:split(vo.content, '
			')}" />
											<c:forEach items="${lines}" var="line">
											    <p>${line}</p>
											</c:forEach>
						</div>

                </td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
        </table>
    </div>

    <script>
    let jjimApp = Vue.createApp({
        data() {
            return {
            	sno:${sno},
                isLiked: false // 찜하기 상태를 나타내는 변수
            };
        },
        mounted(){
            this.checkJjimStatus();
        },
        methods: {
            checkJjimStatus() {
                axios.get('../somoim/jjim_check_vue.do', {
                    params: {
                    	sno: this.sno
                    }
                }).then(response => {
                    this.isLiked = response.data > 0;
                }).catch(error => {
                    console.error(error);
                });
            },
            like() {
                console.log('인서트의 sno:', ${sno}); // sno 값 출력
                axios.post('../somoim/jjim_insert_vue.do',null, {
                	params:{
                		sno: this.sno
                	}
                }).then(response => {
                	console.log(response.data)
                    if (response.data === 'yes') 
                    {
                    	alert("찜 목록에 추가되었습니다")
                        this.isLiked = true;
                    }
                    else
                    {
                    	alert("오류::찜 목록에 추가되지 못하였습니다")
                    }
                }).catch(error => {
                    console.error(error);
                });
            },
            unlike() {
                console.log('삭제하는 sno:', ${sno}); // sno 값 출력
                axios.post('../somoim/jjim_delete_vue.do',null, {
                	params:{
                		sno: this.sno
                	}
                }).then(response => {
                    if (response.data === 'yes') 
                    {
                    	alert("찜 목록에서 삭제되었습니다")
                        this.isLiked = false;
                    }
                    else
                    {
                    	alert("오류::찜 목록에서 삭제되지 못했습니다")
                    }
                }).catch(error => {
                    console.error(error);
                });
            }
        },
    }).mount('#jjimApp');
</script>
</body>
</html>
