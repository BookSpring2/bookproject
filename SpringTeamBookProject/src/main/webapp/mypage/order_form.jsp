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
	
/*  	$(document).ready(function(text,reviver){
		// 결제 flag 설정
		var flag="Yes";
		
		// 결제
		var payment={
				init:function(){
					var _this=this;
					// 구매 버튼 누를시
					$("#btn_buy").on("click", function(){
						_this.getBuy(flag);
					});
					return this;
				},
				get Buy: function(flag){
					if(flag == "Yes"){
						if(confirm("구매하시겠습니까?")){
							// 구매할경우
							var data={
									goodsNum:$("#productId").val(),
									goodsName:$("#title").val(),
									goodsPrice:$("#price").val(),
									flag:flag
							};
						}else{
							return false;
						}
					}else if(flag=="No"){
						var data={
								flag:flag
						}
					}else{
						alert("잠시후 다시 시도해주세요.");
						return false;
					}
				}
			$.ajax({
				type:"POST",
				url:"/user/buy"
				dataType:"json"
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringfy(data)
			}).done(function(data){
				if(data.result==true){
					payment.getPaymentModule();
				}
			}).fail(function (jqXHR, textStatus, errorThrown){
				alert("관리자에게 문의해주세요.");
				console.log(jqXHR," "+textStatus+""+errorThrown+"");
			});
		},
		getPaymentModule:function(){
			var IMP=window.IMP; // 생략가능
			IMP.init('imp59253605');
			IMP.request_pay({
				pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			})
		}
	}) */ 
	
	$("#check_module").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp59253605');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'html5_inicis', // version 1.1.0부터 지원.
	
	pay_method: 'card',
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: '주문명:결제테스트',
	//결제창에서 보여질 이름
	amount: 1,
	//가격
	buyer_email: 'iamport@siot.do',
	buyer_name: '구매자이름',
	buyer_tel: '010-1234-5678',
	buyer_addr: '서울특별시 강남구 삼성동',
	buyer_postcode: '123-456',
	m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	location.href("../mypage/order_list.do");
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	});
})

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
  <form method="post" action="order_pay_insert_ok" enctype="multipart/form-data">
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
            <input type="hidden" id="productId" value="${vo.productId }">
            <input type="hidden" id="cartId" value="${vo.cartId }">
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
 <c:forEach var="mvo" items="${mlist }">
  <div class="row">
    <table class="table member">
      <tr>
        <th>아이디</th>
        <td><input type="text" value="${mvo.user_id }" size=10 readonly></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input type="text" value="${mvo.name }" size=10 id="name"></td>
      </tr>
      <tr>
        <th>우편번호</th>
        <td><input type="text" value="${mvo.post }" size=10 id="post"></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" value="${mvo.addr1 }" size=40 id="addr1"></td>
      </tr>
      <tr>
        <th>상세주소</th>
        <td><input type="text" value="${mvo.addr2 }" size=40 id="addr2"></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="text" value="${mvo.email }" size=30 id="email"></td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td><input type="text" value="${mvo.tel }" size=15 id="tel"></td>
      </tr>
      <tr>
        <th>배송메세지</th>
        <td><input type="text" size=40 id="msg"></td>
      </tr>
      <tr>
      
      </tr>
     </table>
    </div>
    <div class="pay">
        <button type="button" id="check_module" class="primary-btn paymentBtn" value="${mvo.memNum }">결제하기</button>
    </div>
  </c:forEach>
  </form>
</div>
</body>
</html>