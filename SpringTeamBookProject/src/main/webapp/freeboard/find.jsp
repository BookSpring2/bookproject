<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.row{
	margin: 0 auto;
}
</style>
</head>
<body>
<!-- Find -->
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>자유게시판</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>글 목록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<!-- 검색창 & 글쓰기 버튼 -->
<div class="container">
 <div class="row" style="margin:50px 0px 50px 370px; ;">
	<div class="blog__sidebar__search" style="margin:0px 50px;">
		<form method="post" action="../freeboard/find.do">
		 <select name="fs">
            <option value="S">제목</option>
            <option value="C">내용</option>
            <option value="N">닉네임</option>
        </select>
			<input type="text" name="ss" placeholder="검색어를 입력하세요." style="width:400px; margin-left:10px;">
			<button type="submit"><span class="icon_search"></span></button>
		</form>
	</div>
	<a href="insert.do"><button type="button" class="btn"style="background-color:#83AD2E; height:43px;">글쓰기</button></a>	 
	<div style="margin-left:10px;"></div>
	<a href="list.do?page=${startPage }"><button type="button" class="btn"style="background-color:#83AD2E; height:43px;">목록</button></a>
 </div>
</div>

<!-- 리스트 -->
<div class="container">         
<div class="row" style="margin-top:50px;">
   <table class="table table-hover">
    <thead>
      <tr>
        <th class="text-center" width=10%>번호</th>
        <th class="text-center" width=45%>제목</th>
        <th class="text-center">작성자</th>
        <th class="text-center" width=20%>작성일</th>
        <th class="text-center" width=10%>조회수</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${list }" var="vo">
      <tr>
        <td class="text-center">${vo.no }</td>	
        <td><a href="detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a></td>
        <td class="text-center">${vo.writer }</td>
        <td class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
        <td class="text-center">${vo.hit }</td>
      </tr>
      </c:forEach>    
    </tbody>
  </table>
</div>
</div>
<!-- 
<script>
 new Vue({
	 el:'.container',
	 data:{
		 find_data[]
	 },
	 mounted:function(){
		 axios.get("http://localhost:8080/web/freeboard/rest_find.do",{
			 params:{
				 
			 }
		 }).then(response =>{
			 console.log(response.data);
			 this.find_data=response.data;
		 })
	},
	method:{
		
	} 
 })
</script>
 -->
</body>
</html>