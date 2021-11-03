<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container1{
	margin:0px auto;
	width:1000px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$('#del').click(function(){
	  var pop = window.open("../noticeboard/delete.jsp","width=300,height=300");
})



</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="container1">
   <div class="row">
     <table class="table" style="margin:auto;margin-top:50px;">
      <tr>
        <th width=20% class="success text-center">번호</th>
        <td width=30% class="text-center">${vo.no }</td> 
        <th width=20% class="success text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td> 
      </tr>
      <tr>
        <th width=20% class="success text-center">이름</th>
        <td width=30% class="text-center">${vo.name }</td> 
        <th width=20% class="success text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td> 
      </tr>
      <tr>
        <th width=20% class="success text-center">제목</th>
        <td colspan="3" class="text-left">${vo.subject }</td> 
      </tr>
      <c:if test="${vo.imagecount>0 }">
	      <tr>
	        <th width=20% class="success text-center">첨부이미지</th>
	        <td colspan="3" class="text-left">
	          <ul>

	     		 <c:forEach var="fn" items="${fList }" varStatus="s">
	        
	            <li><a href="download.do?fn=${fn }">${fn }</a>&nbsp;(${sList[s.index]}Bytes)</li>
	           </c:forEach>
	          </ul>
	        </td>
	      </tr>
      </c:if>
      <tr>
        <td colspan="4" valign="top" height="200">
         <pre style="white-space: pre-wrap;border:none;background-color: white">${vo.content }</pre>
        </td>
      </tr>
      <tr>
      	<td>
      		<img src="${vo.imagename }" style="width:30px;height:30px;">
      	</td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
         <a href="../noticeboard/update.do?no=${vo.no }&page=${curpage}" class="btn btn-xs btn-danger">수정</a>
         <a href="../noticeboard/delete.do?no=${vo.no }&page=${curpage}" class="btn btn-xs btn-primary" id="del">삭제</a>
          
          <!-- <input type=button class="btn btn-xs btn-primary" value="삭제" id="del"> -->
          <a href="../noticeboard/list.do?page=${curpage }" class="btn btn-xs btn-info">목록</a>
        </td>
      </tr>
     </table>
   </div>
   <div class="row">
   
   </div>
  </div>
</body>
</html>