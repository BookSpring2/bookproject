<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<section class="blog-details-hero set-bg" data-setbg="../img/blog/details/details-hero.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__details__hero__text">
						<h2>${vo.subject }</h2>
						<ul>
							<li>By ${vo.user_id }</li>
							<li><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></li>
							<li>8 Comments</li>
							<li>조회수 ${vo.hit }</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<table class="table">
					<c:if test="${vo.filecount>0 }">
						<tr>
							<th width=20% >첨부파일</th>
							<td colspan="3" class="text-left">
								<ul>
									<c:forEach var="fn" items="${fList }" varStatus="s">
										<li><a href="download.do?fn=${fn }">${fn }</a>&nbsp;(${sList[s.index]}Bytes)</li>
									</c:forEach>
								</ul>
							</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4" valign="top" height="200"><pre
								style="white-space: pre-wrap; border: none; background-color: white">${vo.content }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
						<a href="update.do?no=${vo.no }&page=${page}">
							<button class="btn" style="background-color:#83AD2E;color:white">수정</button>
						</a>
						<a href="delete.do?no=${vo.no }&page=${page}">
							<button class="btn" style="background-color:#83AD2E;color:white">삭제</button>
						</a>
						<a href="list.do?page=${page }">
							<button class="btn" style="background-color:#83AD2E;color:white">목록</button>
						</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>
</html>