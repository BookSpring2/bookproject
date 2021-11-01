<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin:0px auto;
}
.table1{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}
</style>
</head>
<body>

<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="container">
   
  <p></p>          
  <table class="table table-hover" style="margin:auto;margin-top:50px;width:1000px;">
    <thead>
      <tr>
        <th width=10% style="text-align:center;font-size:20px">번호</th>
        <th width=50% style="text-align:center;font-size:20px">제목</th>
        <th width=15% style="text-align:center;font-size:20px">작성일</th>
        <th width=15% style="text-align:center;font-size:20px">글쓴이</th>
        <th width=10% style="text-align:center;font-size:20px">조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td style="text-align:center;">${vo.no }</td>
        <td style=""><a href="../noticeboard/detail.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
        	<c:if test="${today==vo.dbday }">
        		&nbsp;<sup style="color:red">new</sup>
        	</c:if>
        </td>
        <td style="text-align:center;">${vo.dbday }</td>
        <td style="text-align:center;">${vo.name}</td>
        <td style="text-align:center;">${vo.hit }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <table class="table1">
     	<tr>
     		<td>
     			<a href="insert.do" class="btn btn-sm btn-danger">공지등록</a>
     		</td>
     	</tr>
     </table>
  	<!-- 
  	<li><a href="#">1</a></li>
  	<li class="active"><a href="#">2</a></li>
  	<li><a href="#">3</a></li>
  	<li><a href="#">4</a></li>
  	<li><a href="#">5</a></li> -->
  	
  	<!-- 
  	<div class="product__pagination blog__pagination">
       <a href="#">1</a>
       <a href="#">2</a>
       <a href="#">3</a>
       <a href="#"><i class="fa fa-long-arrow-right"></i></a>
    </div>
  	 -->
	<div class="product__pagination blog__pagination" align="center" style="">
           <ul style="list-style:none;">
             <c:if test="${startPage>1 }">
              <li><a href="../noticeboard/list.do?page=${startPage-1 }">&lt;</a></li>
             </c:if>
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${curpage==i }">
                  
                </c:if>
                <c:if test="${curpage!=i }">
                  
                </c:if>
                <li><a href="../noticeboard/list.do?page=${i }">${i }</a></li>
               </c:forEach>
             <c:if test="${endPage<totalpage }">
			  <li><a href="../noticeboard/list.do?page=${endPage+1 }">
			  <i class="fa fa-long-arrow-right"></i></a></li>
			 </c:if>
			</ul>
       </div>
     
</div>

</body>
</html>