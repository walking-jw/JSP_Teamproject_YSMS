<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(user_id)님의 문의 목록 </title>
<style>

        #myinfoQna { border-collapse:collapse; width:800px}
        #myinfoQna th { background:#7CB8E2 url(header_bkg.png) repeat-x scroll center left; color:#fff; padding:7px 7px; text-align:center;}
        #myinfoQna td { background:#C7DDEE none repeat-x scroll center left; color:#000; padding:20px 15px; }
        #myinfoQna tr.odd td { background:#fff url(row_bkg.png) repeat-x scroll center left; cursor:pointer; }
/*         #myinfoQna div.arrow { background:transparent url(arrows.png) no-repeat scroll 0px -16px; display:block;} */
/*         #myinfoQna div.up { background-position:0px 0px;} */

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	    $("#myinfoQna tr:odd").addClass("odd");
	    $("#myinfoQna tr:not(.odd)").hide(); 
	    $("#myinfoQna tr:first-child").show(); //열머리글 보여주기
	
	    $("#myinfoQna tr.odd").click(function(){
	        $(this).next("tr").toggle();
	        $(this).find(".arrow").toggleClass("up");
	    });
	});
</script>
</head>
<script type="text/javascript">

	function modifyQna(window) {
		open(window, "confirm",
		"roolbar=no,location=no,menubar=no,scrollbars=no,resizable=no,width=450,height=230");
	}

	function openNewWindow(window) {
		open(window, "confirm",
		"roolbar=no,location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=150");
	}
/* 	function deleteQna(){
 		/* var qna_no = document.getElementById("qna_no").value; 
 		var qna_no = document.qna.qna_no.value;
 		alert(qna_no);
  		  var url = "deleteCheck_qna.four?qna_no=" + qna_no;
		open(url, "confirm",
				"roolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=150"); 
 	}
	
	function updateQna(){
 		var qna_no = document.getElementById("qna_no").value;
 		  var url = "update_qna.four?qna_no=" + qna_no;
		open(url, "confirm",
				"roolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=150");
 	} */
	
</script>
<body>
<%@ include file="header.jsp" %>


	<h3>나의 문의 목록</h3>
	<table id="myinfoQna">
		<tr>
			<th></th>
			<th>공간 이름</th>
			<th>문의 내용</th>
			<th>문의 일자</th>
			<th>호스트<br>답변 여부</th>
		</tr>
		
		<c:choose>
		<c:when test="${!empty myInfoQnaList }">
		<c:forEach items="${myInfoQnaList }" var="myInfoQnaDto">
		<tr>
			<td><div class="arrow"></div></td>
			<td align="center">${myInfoQnaDto.qnaPlaceName }</td>
			<td>${myInfoQnaDto.qnaContent }</td>
			<td align="center">${myInfoQnaDto.qnaQ_updateDate }</td>
			<td align="center">${myInfoQnaDto.qnaYesNo }</td>
		</tr>
		<tr>
			<!--Detail  -->
			<td></td>
			<td colspan = "2">
				문의내용 <br>
				${myInfoQnaDto.qnaContent }<br><br>
				
				호스트답변<br>
				${myInfoQnaDto.qnaAnswer }<br>
				${myInfoQnaDto.qnaA_updateDate}
			</td>
			<td colspan="2" valign="bottom" align="right">
			<a href="javascript:modifyQna('modify_qna.four?qna_no=${myInfoQnaDto.qnaNo }')">
			<input type="button" value="수정하기"></a>
			<a href="javascript:openNewWindow('deleteCheck_qna.four?qna_no=${myInfoQnaDto.qnaNo }')">
			<input type="button" value="삭제하기"></a>			
			</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5">등록하신 질문이 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="center">
				<!--Paging  -->
			<c:forEach items="${myinfoQnaPageList }" var="myinfoQnaPage">
				<a href="myinfo_qna.four?myinfoQnaPage=${myinfoQnaPage }">${myinfoQnaPage }</a>
			</c:forEach></td>
		</tr> 
	</table>

<%@ include file="footer.jsp" %>
</body>
</html>