<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>주문하기</h2>
          <div class="breadcrumb__option">
            <a href="../main/main.do">Home</a>
            <span>주문하기</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="container">
  <div style="height:50px"></div>
  <div class="row">
  <table class="table">
  <h4>주문내역/배송조회</h4>
    <tr>
    <td colspan="4" class="text-right">
      <a href="#" class="btn btn-sm btn-primary">주문/배송관련 FAQ</a>
    </td>
    </tr>
  
  </table>
  </div>
  <div class="row">
    <tr>
      <td class="btn btn-sm btn-primary">구매하신 책, 다 읽으셨다면 정가대비 최대 50% 지급받고 Organi에 판매하세요</td>
    </tr>
  </div>
  <div class="row">
    <table class="table">
      <tr>
        <td class="text-center">주문번호</td>
        <td class="text-center">주문일자</td>
        <td class="text-center">주문내역</td>
        <td class="text-center">주문금액/수량</td>
        <td class="text-center">주문상태</td>
        <td class="text-center">주문자</td>
      </tr>
      <c:forEach var="vo" items="${list }">
	      <tr>
	        <td class="text-center">${vo.order_no }</td>
	        <td class="text-center">${vo.orderdate }</td>
	        <td class="text-center">${vo.title }</td>
	        <td class="text-center">${vo.price }</td>
	        <td class="text-center">${vo.deliver_situ }</td>
	        <td class="text-center">${vo.name }</td>
	      </tr>
      </c:forEach>
    </table>
  </div>
</div>
</body>
</html>