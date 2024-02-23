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
<style type="text/css">
.row{
	margin-left: 100px;
}
</style>
</head>
<body>

            <div class="row" style="width: 600px;">
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
				        <img src="${vo.writerimage}" style="border-radius: 50%; height: 50px; width: 50px; margin-right: 10px;">
				        <span style="display: inline-block;">작성자 <span style="font-weight: bold;">${vo.writer}</span></span>
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
</body>
</html>