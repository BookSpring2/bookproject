<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>자유게시판</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>글 목록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<div class="container">         
<div class="row">
  <table class="table" style="margin-top:50px">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
   <c:forEach items="${list }" var="vo">
     <tr>
        <td>${vo.no }</td>
        <td>${vo.subject }</td>
        <td>${vo.user_id }</td>
        <td>${vo.regdate }</td>
        <td>${vo.hit }</td>
      </tr>  
	</c:forEach>    
  </table>
</div>
</div>
<div class="container">	
<div class="row">
<a href="insert.do"><button type="button" class="btn"style="background-color:#83AD2E">작성</button></a>
</div>
</div>

</body>
</html>