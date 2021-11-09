<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.buttona{
	font-size: 14px;
	color: #ffffff;
	width:90px;
	padding: 11px 26px 10px;
	background: #7fad39;
	border: none;
}
#del{
	font-size: 14px;
	color: #ffffff;
	width:90px;
	padding: 13px 32px 12px;
	background: #7fad39;
	border: none;"
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#del').click(function(){
		let no=$('#no').val();
		let page=$('#page').val();
		$.ajax({
			type:'get',
			url:'../blog/delete_ok.do',
			data:{"no":no},
			success:function(result1)
			{
				alert("삭제 완료");
				location.href="../blog/list.do?page="+page;
			}
		})
		
	})
})


</script>
</head>
<body>

<section class="blog-details-hero set-bg" data-setbg="../img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>블로그</h2>
                        <ul>
                            <li>${vo.user_id }</li>
                            <li>${vo.dbday }</li>
                            <li>댓글갯수</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
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
                                <li><a href="#">리뷰</a></li>
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
                                        <h6>제목<br /> Protect The Liver</h6>
                                        <span>작성자</span>
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
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <img src="../img/blog/details/details-pic.jpg" alt="">
                        <p>${vo.content }</p>
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="../img/blog/details/details-author.jpg" alt="">
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>${vo.user_id }</h6>
                                        <span>${vo.membership }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>카테고리 : </span>${vo.category }</li>
                                        <li><span>태그 : </span>${vo.tag }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                    <table class="text-right" style="margin-top:100px;float:right;">
                    <tr>
			        <td colspan="4" class="text-right">
			        <input type=hidden name=no id=no value="${vo.no }">
			        <input type=hidden name=name id=name value="${vo.user_id }">
			        <input type=hidden name=page id=page value="${curpage }">
			        <c:set var="user_id" value="${vo.user_id }" />
			        <c:if test="${sessionScope.name==user_id}">
			         <a href="../blog/update.do?no=${vo.no }&page=${curpage}" class="buttona">수정</a>
			         </c:if>
			         <c:if test="${sessionScope.name==user_id || sessionScope.admin=='y' }">
			         <input type="button" id="del" value="삭제">
			         </c:if>
			         
			        
			          <a href="../blog/list.do?page=${curpage }" class="buttona">목록</a>
			        </td>
			      </tr>
			     </table>
			     </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
    <!-- <section class="related-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>당신이 좋아할 게시글(키워드?태그?추천)</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i>작성날짜</li>
                                <li><i class="fa fa-comment-o"></i>댓글갯수</li>
                            </ul>
                            <h5><a href="#">제목</a></h5>
                            <p>글내용 일부 발췌</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
</body>
</html>