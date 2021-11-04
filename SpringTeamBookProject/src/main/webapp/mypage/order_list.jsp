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
    <div class="col-md-3">
      <ul>카트>사은품>결제>완료</ul>
    </div>
  </div>
  <div class="row">
    <h3>상품 확인</h3>
    <table class="table">
      <tr>
        <th colspan="2" class="text-center">상품명</th>
        <th class="text-center">수량</th>
        <th class="text-center">상품금액</th>
        <th class="text-center">배송정보</th>
        <th class="text-center">주문</th>
      </tr>
      <tr>
        <td>
          <img src="${vo.image }">
        </td>
        <td class="text-center">${vo.title }</td>
        <td class="text-center">
          <select id="sel">
            <c:forEach var="i" begin="1" end="10">
              <option value ="${i }">${i}개</option>
            </c:forEach>
          </select>
        </td>
        <td class="text-center">${vo.price }</td>
        <td class="text-center">${vo.orderdate }+1</td>
        <td class="text-center">주문옵션</td>
      </tr>
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
      <thead>
      <tr>
        <th scope="col">${vo.price }</th>
        <th scope="col">${vo.price }</th>
        <th scope="col">총 할인금액</th>
      </tr>
      </thead>
      <tfoot>
        <tr>
          <td>정가에서 할인</td>
        </tr>
      </tfoot>
    </table>
  </div>
  <div class="row">
    <table cellpadding="0" cellspacing="0" class="table">
      <tbody>
        <tr>
          <th>배송방법</th>
          <td>
            <div>
              <span>
                <label>
                  <input type="radio" name="delivery" value="normal" checked="checked">일반택배
                </label>
              </span>
              <span>
                <label>
                  <input type="radio" name="delivery" value="Foreign">해외배송
                </label>
              </span>
              <span>
                <label>
                  <input type="radio" name="delivery" value="SafeDelivery">안심택배
                </label>
              </span>
            </div>
          </td>
        </tr>
      </tbody>
      <tbody>
        <tr>
          <th>배송지</th>
          <td>
            <div>
              <span>
                <label>
                  <input type="radio" name="address" value="LAST" checked="checked">최근배송지
                </label>
              </span>
              <span>
                <label>
                  <input type="radio" name="address" value="NEW">새로입력
                </label>
              </span>
            </div>
          </td>
        </tr>
      </tbody>
      <tbody>
        <tr>
          <th>이름</th>
          <td>
            <input id="" type="text" value="">
          </td>
        </tr>
      </tbody>
      <tbody>
        <tr>
          <th>배송주소</th>
          <td>
            <input type="text">
          </td>
        </tr>
      </tbody>
      <tbody>
        <tr>
          <th>전화</th>
          <td style="height:22px">
            <select style="width:50px;margin-bottom: 1px;vertical-align: bottom" value="010">
              <option value>선택</option>
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="018">018</option>
            </select>
            -
            <input type="text" maxlength="4">
            -
            <input type="text" maxlength="4">
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>