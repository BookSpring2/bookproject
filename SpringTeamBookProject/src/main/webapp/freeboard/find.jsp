<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row{
	margin: 0 auto;
}
a{
  color:black;
}

.freeboard .nice-select{
	height:42px;
	font-size:14px;
	line-height:43px;
}

.freeboard input{
	border-radius:0px;
}

.freeboard .checkout__input input{
	border-radius:0px;
	padding:0px;
	font-size:14px;
}

.freeboard .btn{
	font-size:14px;
	padding:10px 20px;
}

.btn{
	float:left;
	display:block;
}
</style>
</head>
<body>
<!-- Find -->
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
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
 <div class="row freeboard" style="width:80%; min-width:750px;">
 	<div class="col-lg-12" style="width:100%;">
		<form method="post" action="../freeboard/find.do" style="width:100%;">
			<div style="float:right; margin-top:50px;">
				<input type="hidden" name="page" value="${page }">
					 <select name="fs">
			            <option value="S">제목</option>
			            <option value="C">내용</option>
			            <option value="N">닉네임</option>
			         </select>
			         <div class="checkout__input" style="float:left;">
						<input type="text" name="ss" placeholder="검색어를 입력하세요." style="width:280px; height:42px; padding-left:15px;">
					 </div>
					<button type="submit" class="btn"style="background-color:black; color:white; height:42px; float:left; border-radius:0px;">검색</button>
			</div>
		</form>
	</div>	
</div>
</div>

<!-- 리스트 -->
<div class="container">         
<div class="row" style="margin-top:50px; width:950px;">
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
        <td><a href="detail.do?no=${vo.no }&page=${page}">${vo.subject }</a></td>
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