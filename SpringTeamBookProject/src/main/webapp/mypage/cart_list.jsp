<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="shoping-cart spad">
        <div class="container">
          
            <div class="row"> 
              <a href="#" class="primary-btn cart-btn">장바구니</a>
              <a href="#" class="primary-btn cart-btn">결제</a>
              <a href="#" class="primary-btn cart-btn">구매내역</a>
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                <th><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
                                <script>
                                    $("#allCheck").click(function () {
                                        var chk = $("#allCheck").prop("checked");
                                        if (chk) {
                                            $(".chkbox").prop("checked", true);
                                            itemSum();
                                        } else {
                                            $(".chkbox").prop("checked", false);
                                            itemSum();
                                        }
                                    });
                                </script>
                                    <th class="shoping__product">장바구니</th>
                                    <th>금액</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="vo" items="${list }">
                                <tr>
                                  <td class="product-close"><input type="checkbox" onClick="itemSum()"
                                      class="chkbox" value="${vo.price * vo.cart_qty}"
                                      data-cartNum="${vo.cartId}" /></td>
                                    <td class="shoping__cart__item">
                                        <img src="${vo.image }" style="width:110px;height:150px;">
                                        <h5>${vo.title }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${vo.price }원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="${vo.cart_qty }" id="count">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total" id="price">
                                    <fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="###,###,###"/>
                                       ${vo.cart_qty*price+5000 }원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="../main/main.do" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            새로고침</a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <script>
		            function itemSum() {
		                var str = "";
		                var sum = 0;
		                var count = $(".chkbox").length;
		                for (var i = 0; i < count; i++) {
		                    if ($(".chkbox")[i].checked == true) {
		                        sum += parseInt($(".chkbox")[i].value);
		                    }
		                }
		                $("#total_sum").html(sum + " 원");
		                $("#amount").val(sum);
		            }
        		</script>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>결제 예정 금액</h5>
                        <ul>
                            <li>총 가격<span id="total_sum"></span></li>
                            <li>쿠폰 적용 가격<span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
          
        </div>
    </section>
</body>
</html>