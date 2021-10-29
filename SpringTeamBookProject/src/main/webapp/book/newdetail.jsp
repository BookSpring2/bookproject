<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../book/css/book.css">
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>대제목</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <a href="#">대분류</a>
                            <span>중분류</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src=" ${vo.image}" alt="">
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3> ${vo.title}</h3>
                        
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 개의 리뷰)</span>
                        </div>
                        <div class="product__details__price"> ${vo.price}</div>
                        <div class="bookdetail_pricedata_group"> 
                        <p class="bookdetail_textdata_title"> 적립금 </p>
                        <p class="bookdetail_textdata"> ${point}원(5%) + 멤버십(1~3%) </p>
                        </div>
                        <div class="bookdetail_textdata_group">                        
                        <p class="bookdetail_textdata_title"> 저자 </p>
                        <p class="bookdetail_textdata"> ${vo.writer} </p>
                        <p class="bookdetail_textdata_title"> 출간일 </p>
                        <p class="bookdetail_textdata"> ${vo.pubdate} </p>
                        <p class="bookdetail_textdata_title"> 출판사 </p>
                        <p class="bookdetail_textdata"> ${vo.publisher} </p>
                        <p class="bookdetail_textdata_title"> 카테고리 </p>
                        <p class="bookdetail_textdata"> ${vo.genre} </p>
                        </div>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        
                        
                        <a href="#" class="primary-btn">주문하기</a>
                        <a href="#" class="primary-btn">장바구니</a>
                        <a href="#" class="primary-btn">위시리스트</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <!--  Book_DATA 테이블에 재고를 관리하는 컬럼이 없음.
                            <li><b>판매정보</b> <span>판매중</span></li>-->
                            <li><b>배송정보</b> <span>텍스트 <samp>텍스트</samp></span></li>
                            <li><b>포인트</b> <span>텍스트</span></li>
                            <li><b>공유하기</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">책소개</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">목차</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">리뷰 <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>책소개</h6>
                                    <p>${vo.introduce}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>목차</h6>
                                    <p> ${vo.contents}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>리뷰</h6>
                                    <p> 리뷰 데이터가 들어가는 장소입니다. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 도서</h2> <!-- 관련 도서는 장르가 같은 책들을 랜덤으로 추천 -->
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="vo" items="${list }">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="">
                            <a href="../book/newdetail.do?bno=${vo.bno }"><img src="${vo.image}"></a>
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="../book/newdetail.do?bno=${vo.bno }">${vo.title}</a></h6>
                            <h5>${vo.price}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
</body>
</html>