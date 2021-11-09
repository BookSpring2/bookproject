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

    <!-- Hero Section End -->
	<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>블로그</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>블로그</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="#">전체</a></li>
                                <li><a href="#">도서리뷰</a></li>
                                <li><a href="#">일상</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>최신 글</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>키워드</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">키워드1</a>
                                <a href="#">키워드2</a>
                                <a href="#">키워드3</a>
                                <a href="#">키워드4</a>
                                <a href="#">키워드5</a>
                                <a href="#">키워드6</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                    	<c:forEach var="vo" items="${list }">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="../img/blog/blog-2.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> ${vo.dbday }</li>
                                        <li><i class="fa fa-comment-o"></i> 5</li>
                                    </ul>
                                    <h3>${vo.subject }</h3>
                                    <p style="margin-top:10px;">${vo.content } </p>
                                    <a href="../blog/detail.do?no=${vo.no}&page=${curpage}" class="blog__btn">더보기 <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <div class="col-lg-12">
                        <c:if test="${sessionScope.id!=null }">
  						<table class="table1">
     						<tr>		
     						<td>
     						<a href="insert.do" class="btn btn-sm btn-danger" style="font-size: 14px;
								color: #ffffff;font-weight: 800;width:120px;padding: 13px 30px 12px;background: #7fad39;
								border: none;">글쓰기</a>
     						</td>
     						</tr>
     						</table>
     						</c:if>
     					</div>
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination" align="center" style="margin-top:50px;">
           
             <c:if test="${startPage>1 }">
              <a href="../blog/list.do?page=${startPage-1 }">&lt;</a>
             </c:if>
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${curpage==i }">
                  <a href="../blog/list.do?page=${i }">${i }</a>
                </c:if>
                <c:if test="${curpage!=i }">
                  <a href="../blog/list.do?page=${i }">${i }</a>
                </c:if>
                
               </c:forEach>
             <c:if test="${endPage<totalpage }">
			  <a href="../blog/list.do?page=${endPage+1 }">
			  <i class="fa fa-long-arrow-right"></i></a>
			 </c:if>
		
       </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>