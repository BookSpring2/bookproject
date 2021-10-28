<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>공지사항</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th style="width=10%;text-align:center;font-size:20px">번호</th>
        <th style="width=45%;text-align:center;font-size:20px">제목</th>
        <th style="width=25%;text-align:center;font-size:20px">작성일</th>
        <th style="width=10%;text-align:center;font-size:20px">글쓴이</th>
        <th style="width=10%;text-align:center;font-size:20px">조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td style="width=10%;text-align:center;">${vo.no }</td>
        <td style="width=45%;">${vo.subject }</td>
        <td style="width=25%;text-align:center;">${vo.dbday }</td>
        <td style="width=10%;text-align:center;">${vo.name }</td>
        <td style="width=10%;text-align:center;">${vo.hit }</td>
      </tr>
    </c:forEach>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>