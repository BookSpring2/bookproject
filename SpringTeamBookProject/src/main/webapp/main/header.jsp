<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li>1권만 주문해도 무료배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                          <div class="header__top__right__auth">
                            <c:if test="${sessionScope.id!=null }">
                            	<a href="../member/logout.do" id="login"><i class="fa fa-user"></i>로그아웃</a>
                            	<a href="../member/join_update.do" id="login"><i class=""></i>회원정보 수정</a>			
                            </c:if>
                            <c:if test="${sessionScope.id==null }">
                            	<a href="../member/login.do" id="login"><i class="fa fa-user"></i>로그인</a>	
                            	<a href="../member/join.do"><i class=""></i>회원가입</a>	
                            </c:if>

                            <c:if test="${sessionScope.id!=null && sessionScope.id=='admin'}">
								<a href="../admin/main.do"><i class=""></i>관리자페이지</a>
							</c:if>
                            <c:if test="${sessionScope.id!=null && sessionScope.id!='admin' }">
                            	<a href="../mypage/mypage.do"><i class=""></i>마이페이지</a>
                            </c:if>
                            <a href="#"><i class=""></i>고객센터</a>    
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="../main/main.do"><img src="../img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu">
                        <ul>
                        	<li><a href="#">빠른분야찾기</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="#">국내도서</a></li>
                                    <li><a href="#">외국도서</a></li>
                                    <li><a href="#">eBook</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="../main/main.do">홈</a></li>
                            <li><a href="../book/list.do">베스트셀러</a></li>
                            <li><a href="../book/newlist.do">신간도서</a></li>
                            <li><a href="../blog/list.do">블로그</a></li>
                            <li><a href="#">게시판</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../freeboard/list.do">자유게시판</a></li>
                                    <li><a href="../noticeboard/list.do">공지사항</a></li>
                                    <li><a href="../shop/shop_main.do">서점 찾기</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="../mypage/cart_list.do"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="hero__search">
                        <div class="hero__search__form" style="left:26%">
                            <form method="get" action="../search/search.do">
                                <div class="hero__search__categories">
                                    통합검색
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type=text name=ss size=25 class="input-sm" value="${ss }">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
           			    </div>	
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>02-XXXX-XXXX</h5>
                                <span>고객센터: 9:00-18:00</span>
                            </div>
                        </div>
                    </div>
            <div style="height:15px"></div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
</body>
</html>