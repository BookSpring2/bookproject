<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
  <form method="post" action="order_insert_ok" enctype="multipart/form-data">
  <div class="row">
    <h3>상품 확인</h3>
    
    <table class="table">
      <tr>
        <th colspan="2" class="text-center">상품명</th>
        <th class="text-center">수량</th>
        <th class="text-center">상품금액</th>
        <th class="text-center">총금액</th>
        <th class="text-center">배송정보</th>
      </tr>
<%--        <c:if test="${olist.book_no==clist.product_id }">
	      <c:forEach var="ovo" items="${olist }">
	      <tr>
	        <td>
	          <img src="${ovo.image }" style="width:110px;height:150px;">
	        </td>
	        <td>${ovo.title }</td>
	        <td class="text-center">${ovo.amount }</td>
	        <td class="text-center"><fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
	        <td class="text-center" id="price">${vo.amount*price }원</td>
	        <td class="text-center">${vo.orderday }</td>
	      </tr>
	      </c:forEach>
      </c:if>
       <c:if test="${olist.book_no!=clist.product_id }"> --%>
	      <c:forEach var="ovo" items="${olist }">
	      <tr>
	        <td>
	          <img src="${ovo.image }" style="width:110px;height:150px;">
	        </td>
	        <td>${ovo.title }</td>
	        <td class="text-center">${ovo.amount }</td>
	        <td class="text-center"><fmt:parseNumber value="${ovo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
	        <td class="text-center" id="price">${ovo.amount*price }원</td>
	        <td class="text-center">${ovo.orderday }</td>
	      </tr>
	      </c:forEach>
	      <c:forEach var="cvo" items="${clist }">
	      <tr>
	        <td>
	          <img src="${cvo.image }" style="width:110px;height:150px;">
	        </td>
	        <td>${cvo.title }</td>
	        <td class="text-center">${cvo.cart_qty }</td>
	        <td class="text-center"><fmt:parseNumber value="${cvo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
	        <td class="text-center" id="price">${cvo.cart_qty*price }원</td>
	        <td class="text-center">${cvo.regdate }</td>
	      </tr>
	      </c:forEach>
      <%-- </c:if> --%>
    </table>
  </div>
  <ul>
    <li>
      상품변경을 원하시면&nbsp;<a href="../mypage/cart_list.do"><button class="btn btn-sm btn-success">카트로 가기</button></a>
    </li>
    <li>도서정가제 대상 도서는 최대 10% 할인 + 5% 적립 가능</li>
    <li>5만원 이상 구매시 2천원 추가 적립</li>
  </ul>
  <div class="row">
    <h3>주문정보 확인</h3>
    <h7>주문자 정보와 배송지가 다른 경우 직접 입력해주세요</h7>
    <table class="table">
      <tr>
        <th>총 상품금액</th>
        <th>총 추가금액</th>
        <th>총 할인금액</th>
        <th>최종 결제금액</th>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </table>
  </div>
  <div class="row">
    <table class="table">
      <%-- <c:forEach var="vo" items="${list }"> --%>
      <tr>
        <th>아이디</th>
        <td><input type="text" value="${vo.user_id }"></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" value="${vo.name }"></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" value="${vo.addr1 }"></td>
      </tr>
      <tr>
        <th>상세주소</th>
        <td><input type="text" value="${vo.addr2 }"></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" value="${vo.email }"></td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td><input type="text" value="${vo.tel }"></td>
      </tr>
      <tr>
        <th>배송메세지</th>
        <td><input type="text"></td>
      </tr>
      <%-- </c:forEach> --%>
      <tr>
        
      </tr>
    </table>
  </div>
  </form>
</div>
</body>
</html>