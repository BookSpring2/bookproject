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
    <h3>상품 확인</h3>
    <table class="table">
      <tr>
        <th colspan="2" class="text-center">상품명</th>
        <th class="text-center">수량</th>
        <th class="text-center">상품금액</th>
        <th class="text-center">총금액</th>
        <th class="text-center">배송정보</th>
      </tr>
      <c:forEach var="vo" items="${list }">
      <tr>
        <td>
          <img src="${vo.image }" style="width:110px;height:150px;">
        </td>
        <td>${vo.title }</td>
        <td class="text-center">${vo.cart_qty }</td>
        <td class="text-center"><fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
        <td class="text-center" id="price">${vo.cart_qty*price }원</td>
        <td class="text-center">${vo.orderday }</td>
      </tr>
      </c:forEach>
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
        <tr>
          <th>배송방법</th>
          <td>
            <div>
                <label>
                  <input type="radio" name="delivery" value="normal" checked="checked">일반택배
                </label>
                &nbsp;
                <label>
                  <input type="radio" name="delivery" value="Foreign">해외배송
                </label>
                &nbsp;
                <label>
                  <input type="radio" name="delivery" value="SafeDelivery">안심택배
                </label>
            </div>
          </td>
        </tr>
        <tr>
          <th>배송지</th>
          <td>
                <label>
                  <input type="radio" name="address" value="LAST" checked="checked">최근배송지
                </label>
                &nbsp;
                <label>
                  <input type="radio" name="address" value="NEW">새로입력
                </label>
          </td>
        </tr>
        <tr>
          <th>이름</th>
          <td>
            <input id="" type="text" value="">
          </td>
        </tr>
        <tr>
          <th>배송주소</th>
          <td>
            <input type="text">
          </td>
        </tr>
        <tr>
          <th>전화</th>
          <td>
            <input type="text" maxlength="11">
          </td>
        </tr>
    </table>
  </div>
</div>
</body>
</html>