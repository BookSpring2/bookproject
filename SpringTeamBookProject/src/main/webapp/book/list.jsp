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
<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>베스트셀러</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>분류</h4>
                            <ul>
                                <li><a href="#">소설/시/희곡</a></li>
                                <li><a href="#">장르소설</a></li>
                                <li><a href="#">에세이</a></li>
                                <li><a href="#">인문학</a></li>
                                <li><a href="#">사회과학</a></li>
                                <li><a href="#">역사</a></li>
                                <li><a href="#">과학</a></li>
                                <li><a href="#">예술/대중문화</a></li>
                                <li><a href="#">종교/역학</a></li>
                                <li><a href="#">경제경영</a></li>
                                <li><a href="#">자기계발</a></li>
                            </ul>
                        </div>
                        
                        
                       <!--  <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>신간 도서</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="../book/detail.do" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="../ogani-master/img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>판매중인 도서</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                              
                                <c:forEach var="svo" items="${saleslist }">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg" data-setbg="${svo.image}">
                                            <a href="../book/detail.do?bno=${svo.bno }"><img src="${svo.image}"></a>
                                        	<div class="product__discount__item__pic set-bg"></div>
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>${svo.writer}</span>
                                            <h5><a href="../book/newdetail.do?bno=${svo.bno }">${svo.title}</a></h5>
                                            <div class="product__item__price">${svo.saleprice}원<span>${svo.price}</span></div>
                                        </div>
                                    </div>                                    
                                </div>
                                </c:forEach>
                                 
                           
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                    <c:forEach var="vo" items="${list }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                        
                            <div class="product__item">
                            
                                <div class="product__item__pic set-bg" data-setbg="">
                               
                                <a href="detail.do?bno=${vo.bno }&page=${curpage}">
                                <img src="${vo.image}">
                                </a>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="../book/detail.do">${vo.title }</a></h6>
                                    <h5>${vo.price }</h5>
                                </div>
                            </div>
                        </div>                    
                        </c:forEach> 
                    </div>
                    <div class="product__pagination">
						<ul>
							<c:if test="${startPage>1 }">
								<li><a href="../book/list.do?page=${startPage-1 }">&laquo;
										Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i==curpage }">
									<li class="current"><a
										href="../book/list.do?page=${i }">${i }</a></li>
								</c:if>
								<c:if test="${i!=curpage }">
									<li><a href="../book/list.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${endPage<totalpage }">
								<li>
									<a href="../book/list.do?page=${endPage+1 }">
										<i class="fa fa-long-arrow-right"></i>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
                </div>
            </div>
        </div>
</section>
</body>
</html>