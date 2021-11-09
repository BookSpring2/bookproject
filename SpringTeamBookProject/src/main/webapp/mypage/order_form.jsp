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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	$("#allCheck").click(function () {
		   let chk = $("#allCheck").prop("checked");
		   if (chk) {
		   	   $(".chkbox").prop("checked", true);
		       itemSum();
		   } else {
		       $(".chkbox").prop("checked", false);
		        itemSum();
		    }
		 });
		
		function itemSum() {
			let str = "";
			let sum = 0;
			let count = $(".chkbox").length;
			for (let i = 0; i < count; i++) {
				if ($(".chkbox")[i].checked == true) {
			    	sum += parseInt($(".chkbox")[i].value);
			   	}
			}
			$("#total_sum").html(sum + " 원");
			$("#amount").val(sum);
		}
		
	$(".paymentBtn").click(function(){
		
	})
})
// https://mypsj12-16.tistory.com/41?category=825223
</script>
<style type="text/css">
.pay{
text-aglin:center;
margin-right:50%
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
  <div style="height:50px"></div>
  <form method="post" action="order_insert_ok" enctype="multipart/form-data">
  <div class="row">
    <h3>상품 확인</h3>
    
    <table class="table">
      <tr>
        <th><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
        <th colspan="2" class="text-center">상품명</th>
        <th class="text-center">수량</th>
        <th class="text-center">상품금액</th>
        <th class="text-center">총금액</th>
        <th class="text-center">배송정보</th>
      </tr>
	      <c:forEach var="vo" items="${list }">
	      <tr>
	      <td class="product-close">
           <input type="checkbox" onClick="itemSum()"
                   class="chkbox" value="${vo.price * vo.cart_qty}"
                   data-cartNum="${vo.cartId}">
            </td>
	        <td>
	          <img src="${vo.image }" style="width:110px;height:150px;">
	        </td>
	        <td>${vo.title }</td>
	        <td class="text-center">${vo.cart_qty }</td>
	        <td class="text-center"><fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
	        <td class="text-center" id="price">${vo.cart_qty*price }원</td>
	        <td class="text-center">${vo.regday }</td>
	      </tr>
	      </c:forEach>
    </table>
  </div>
  <ul>
    <li>
      상품변경을 원하시면&nbsp;<a href="../mypage/cart_list.do"><span style="color:green">카트로 가기</span></a>
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
        <td><span id="total_sum"></span></td>
      </tr>
    </table>
  </div>
  <div style="height:50px"></div>
  <div class="row">
    <table class="table">
      <c:forEach var="mvo" items="${mlist }">
      <tr>
        <th>아이디</th>
        <td><input type="text" value="${mvo.user_id }" size=10 readonly></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" value="${mvo.name }" size=10></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" value="${mvo.addr1 }" size=40></td>
      </tr>
      <tr>
        <th>상세주소</th>
        <td><input type="text" value="${mvo.addr2 }" size=40></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" value="${mvo.email }" size=30></td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td><input type="text" value="${mvo.tel }" size=15></td>
      </tr>
      <tr>
        <th>배송메세지</th>
        <td><input type="text" size=40></td>
      </tr>
      </c:forEach>
      <tr>
      
      </tr>
     </table>
    </div>
  </form>
    <div class="pay">
        <button type="button" class="primary-btn paymentBtn" value="${sessionScope.id }">결제하기</button>
    </div>
</div>
</body>
</html>