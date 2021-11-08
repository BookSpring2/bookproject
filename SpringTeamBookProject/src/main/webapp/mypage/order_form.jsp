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
<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp40924990');
var msg;

IMP.request_pay({
pg: 'kakao',

/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
https://docs.iamport.kr/implementation/payment
*/
name: 'Organi 도서 결제',
//결제창에서 보여질 이름
amount: 1000,
//가격
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
//m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
},function(rsp){
	if(rsp.success){
		
	jQuery.ajax({
		url:"/payments/complete",
		type:'POST',
		dataType:'json',
		data:{
			imp_uid:rsp.imp_uid
		}
	}).done(function(data){
		if(everythings_fine){
			msg='결제가 완료되었습니다.';
			msg+='\n고유ID:'+rsp.imp_uid;
			msg+='\n상점 거래ID:'+rsp.merchant_uid;
			msg+='\결제 금액:' +rsp.paid_amount;
			msg+='카드 승인번호:'+rsp.apply_num;
			
			alert(msg);
		}else{
			//
			//
		}
	});
	// 성공
	location.href='<%=request.getContextPath()%>/mypage/orderSuccess?msg='+msg;
	}else{
		msg='결제에 실패하였습니다.';
		msg+='에러내용:'+rsp.error_msg;
		//실패
		location.href='<%=request.getContextPath()%>/mypage/orderFail';
		alert(msg);
	}
});
});
</script>

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
      <c:forEach var="vo" items="${list }">
      <tr>
        <td>
          <img src="${vo.image }" style="width:110px;height:150px;">
        </td>
        <td>${vo.title }</td>
        <td class="text-center">${vo.amount }</td>
        <td class="text-center"><fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="000,000,000"/>${price }원</td>
        <td class="text-center" id="price">${vo.amount*price }원</td>
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
    <p>아임 서포트 결제 모듈 테스트 해보기</p>
        <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
        </p>
  </div>
  </form>
</div>
</body>
</html>