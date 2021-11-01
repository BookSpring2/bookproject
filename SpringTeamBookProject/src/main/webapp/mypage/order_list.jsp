<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
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
  <div style="height:50px"></div>
  <div class="row">
    <div class="col-md-3">
      <ul></ul>
    </div>
  </div>
  <div class="row">
    <h3>상품확인</h3>
    
    <table class="table">
      
      <tr>
        <th colspan="2" class="text-center">상품명</th>
        <th class="text-center">판매가</th>
        <th class="text-center">수량</th>
        <th class="text-center">합계</th>
        <th class="text-center">배송정보</th>
      </tr>
      <c:forEach var="vo" items="${list }">
      <tr>
        <td>
          <a href="../book/detail.do?no=${vo.book_no}">
          <img src="${vo.image }" style="width:70px;height:105px"></a>
        </td>
        <td>${vo.title }</td>
        <td class="text-center">${vo.price }</td>
        <td class="text-center">${vo.amount }</td>
        <td class="text-center">${vo.price}</td>
        <td class="text-center">${vo.deliver_date }</td>
      </tr>
    </c:forEach>
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
  <br>
  <div class="row">
    <h3>배송주소</h3>
    <table cellpadding="0" cellspacing="0" class="table">
      <c:forEach var="vo" items="${mList }">
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
            <select style="width:50px;height:22px; margin-bottom: 1px; vertical-align: bottom" value="010">
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
      <tbody>
        <tr>
        
        </tr>
      </tbody>
    </c:forEach>
    </table>
  </div>
  <div class="row">
    <h3>결제방법</h3>
      <table class="table">
        <tr>
          <td>
            <div>
              <span>
                <input type="radio" name="paying" value="organipaying">오가니페이
                <br>
                <input type="radio" name="paying" value="otherpaying" checked="checked">다른 결제 수단
                <br>
              </span>
              <span>
                <button class="btn btn-lg btn-danger">결제하기</button>
                <button class="btn btn-lg btn-success">취소</button>
              </span>
            </div>
          </td>
        </tr>
      </table>
      
      
      
  </div>
</div>
<!-- <script>
  new Vue({
	  el:'.container',
	  data:{
		  order_no:1,
		  order_data:[]
		  
	  },
	  mounted:function(){
		  
		  axios.get("http://localhost:8080/web/mypage/rest_order_list.do",{
				params:{
					order_no:this.order_no
				}
			}).then(response=>{
				console.log(response.data);
				this.order_data=response.data;
			})
	  },
	  methods:{
		  change:function(order_no){
			  axios.get("http://localhost:8080/web/mypage/rest_order_list.do",{
					params:{
						order_no:this.order_no
					}
				}).then(response=>{
					console.log(response.data);
					this.order_data=response.data;
				})
		  }
	  }
  
  })
</script> -->
</body>
</html>