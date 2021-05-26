<%@page import="java.io.PrintWriter"%>
<%@page import="com.ysms.command.AuthEmailRequestCommand"%>
<%@page import="com.ysms.common.ShareVar_login"%>
<%@page import="com.ysms.dao.Dao_Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%! String email = ""; %>
<% email = request.getParameter("email"); %>

<script type="text/javascript">

	function cancel() {
		self.close();
	}

	function requestAuthEamil(){
		var url = "requestAuthEmail.four?email=" + "<%=email%>";
		open(url, "authEmailSend",
				"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
</script>
<body>
	<c:set var="emailDupleCheckResult" value="${emailDupleCheckResult }" />
	<c:choose>
		<c:when test="${emailDupleCheckResult == 'useable' }">
			<a>인증메일을 전송중입니다. 팝업창을 허용해주세요.</a>
			<script type="text/javascript">requestAuthEamil();</script>
		</c:when>
		<c:otherwise>
			<h4>${inputedEmail } : 사용 불가능한 email입니다.</h4>
		</c:otherwise>
	</c:choose>
	<br><br>
	<button type="button" onclick="cancel()">취소</button>
	


</body>
</html>