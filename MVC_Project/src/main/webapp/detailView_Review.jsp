<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/spaceDetailView_QnaReview.css" type="text/css">
<title>내가 쓴 리뷰</title>
</head>
<script type="text/javascript">
	function modifyReview() {
		document.reviewDetail.submit();
	}
	function deleteReview() {
		var url = "deleteCheck_review.four?rentalNo=" + ${rentalNo } ;
		location.href = url
	}
</script>
<body>
<%
	int rentalNo = Integer.parseInt(request.getParameter("rentalNo"));
	session.setAttribute("rentalNo", rentalNo);
%>
	<form name="reviewDetail" action="modify_review.four" method="post">
	<table border="1">
		<tr>
			<th><h3>내가 쓴 리뷰</h3></th>
			<th>
			<input type="hidden" name="rentalNo" value="${rentalNo }">
			<input type="hidden" name="reviewScore" value="${detailViewReview.reviewScore }">
			<input type="hidden" name="reviewFilePath" value="${detailViewReview.reviewFilePath }">
			<input type="button" value="수정하기" onclick="modifyReview();">
			<input type="button" value="삭제하기" onclick="deleteReview();">
			<input type="button" value="닫기" onclick="window.close();">
			</th>
		</tr>
		<tr>
			<td>${detailViewReview.reviewPlaceName }</td>
			<td>${detailViewReview.reviewScore }</td>
		</tr>
		<c:if test="${!empty detailViewReview.reviewFilePath }">
		<tr>
			<td colspan="2">
				<div class="review">
				<img class="reviewPhoto" src="reviewPhoto/${detailViewReview.reviewFilePath }">
				</div>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
			<textarea name="reviewContent" rows="15" cols="50" readonly="readonly" style="resize:none;">${detailViewReview.reviewContent }
			</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				${detailViewReview.reviewUpdateDate }
			</td>
		</tr>
	</table>
	</form>

</body>
</html>