<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/font.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container">
   <div class="reserveOK" style="width: 70%;margin:80px auto;">
   <div class="text-center">
   <p style="font-size: 20px;color:black; text-decoration: underline;"><strong>📣방문 상담 예약이 완료되었습니다📣</strong></p>
         <table style="width:100%;height:45px;border: 1px solid;border-radius: 5px; overflow:hidden;background-color: #ffb524;color:white;margin-bottom: 10px;">
            <tr>
            <br>
              <td style="padding-left: 10px;">방문 예약 확인 문자는 가입 시 입력한 번호로 5분 이내 발송됩니다</td>
            </tr> 
         </table>
              <br>
             <a href="../yp/yp_list.do">목록으로 돌아가기</a>
         </div>
      </div>
   </div>			
</body>
</html>