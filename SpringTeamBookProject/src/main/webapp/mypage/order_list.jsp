<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
	margin-top:30px;
}
.row{
	margin:0px auto;
	width:1200px;
}
h1{
	text-align:center;
}
</style>
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
        <td class="text-center">책표지</td>
        <td class="text-center">책제목</td>
        <td class="text-center">수량</td>
        <td class="text-center">상품금액</td>
        <td class="text-center">배송정보</td>
        <td class="text-center">주문옵션</td>
      </tr>
    </table>
  </div>
  <div class="row">
    <h3>배송일 안내</h3>
    <table class="table">
      
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
        <th scope="col">총 상품금액</th>
        <th scope="col">총 추가금액</th>
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
</div>
</body>
</html>