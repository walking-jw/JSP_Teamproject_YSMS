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
<script type="text/javascript">
	
	function useThis(){
		opener.document.getElementById("inputIdForm").readOnly = true;
		opener.document.getElementById("idDupleChecked").value = "true";
		self.close();
	}
	
	function cancel(){
		opener.document.getElementById("inputIdForm").readOnly = false;
		sessionStorage.removeItem("duplicate_checked_id");
		self.close();
	}
</script>
<body>
	<c:set var="duplicate_checked_id" value="${duplicate_checked_id }" />
	<c:choose>
		<c:when test="${!empty duplicate_checked_id}">
			<h4>사용 가능한 ID입니다.</h4>
		</c:when>
		<c:otherwise>
			<h4>사용 불가능한 ID입니다.</h4>
		</c:otherwise>
	</c:choose>
	<br><br>
	<button type="button" onclick="cancel()">취소</button>
	<c:if test="${!empty duplicate_checked_id}" >
		<button type="button" onclick="useThis()">사용</button>
	</c:if>
</body>
</html>