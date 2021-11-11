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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0; // update
let r=0; // reply

$(function(){
	$('#delBtn').click(function(){
		let no=$('#no').val();
		let page=$('#page').val();
		let writer=$('#writer').val();
		if(confirm('게시물을 삭제하시겠습니까?'))
		{
			$.ajax({
				type:'get', 
				url:'../freeboard/delete.do',
				data:{"no":no},
			    success:function(res){
			    	location.href="../freeboard/list.do?page="+page; 
			    }
			});
		}
		else
		{
			return false;
		}		
		
	 $('.updates').click(function(){
		 $('.up').hide();
		 $('.reply').hide();
		 
		 let no=$(this).attr("data-no");
		 if(u==0)
		 {
			 $(this).text("취소");
			 $('#u'+no).show();
			 u=1;
		 }
		 else
		 {
			 $('#u'+no).hide();
			 $(this).text("수정");
			 u=0;
		 }
	 })
	})
	
	$('.replys').click(function(){
		$('.up').hide();
		$('.reply').hide();
		
		let no=$(this).attr("data-no");
		if(r==0)
		{
			$(this).text("취소");
			$('#r'+no).show();
			r=1;
		}
		else
		{
			$('#r'+no).hide();
			$(this).text("댓글");
			r=0;
		}
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
						<h2>${vo.subject }</h2>
						<ul>
							<li>By ${vo.writer }</li>
							<li>8 Comments</li>
						</ul>
							<input type=hidden name=no value="${vo.no }" id="no">
 							<input type=hidden name=page value="${page }" id="page">
 							<input type="hidden" value="${vo.writer }" id="writer">
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<table class="table">
					<tr>
						<th width="20%" class="text-center">제목</th>
						<td colspan="3" width="80%">${vo.subject }</td>
					</tr>
					<tr>
						<th width=20% class="text-center">번호</th>
						<td width=30% class="text-center">${vo.no }</td>
						<th width=20% class="text-center">작성일</th>
						<td width=30% class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>			
					</tr>
					<tr>
						<th width=20% class="text-center">이름</th>
						<td width=30% class="text-center">${vo.writer }</td>
						<th width=20% class="text-center">조회수</th>
						<td width=30% class="text-center">${vo.hit }</td>
					</tr>
					<c:if test="${vo.filecount>0 }">
						<tr>
							<th width=20% class="text-center">첨부파일</th>
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
						<td colspan="4" valign="top" height="200">
							<pre style="white-space: pre-wrap; border: none; background-color: white">${vo.content }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
						<c:if test="${sessionScope.id!=null }">
						<c:if test="${sessionScope.id==vo.writer }">
						<a href="update.do?no=${vo.no }&page=${page}">
							<button class="btn" style="background-color:#83AD2E;color:white">수정</button>
						</a>			
							<button class="btn" style="background-color:#83AD2E;color:white" id="delBtn">삭제</button>
						</c:if>
						</c:if>	
						<a href="list.do?page=${page }">
							<button class="btn" style="background-color:#83AD2E;color:white">목록</button>
						</a>
						</td>
					</tr>
				</table>
			</div>
			<!-- 댓글 목록 -->
			<div class="row">
			 <table class="table">
			  <tr>
			   <td>
			    <c:forEach var="rvo" items="${list }">
			     <table class="table">
			      <tr>
			       <td class="text-left">
			        <c:if test="${rvo.group_tab>0 }">
			         <c:forEach var="i" begin="1" end="${rvo.group_tab }">
			         	&nbsp;&nbsp;
			         </c:forEach>
			          ↳
			        </c:if>
			        	＠${rvo.reply_id }(<span>${rvo.dbday }</span>)
			       </td>
			       <td class="text-right">
			        <c:if test="${sessionScope.id!=null }">
			         <c:if test="${sessionScope.id==rvo.reply_id }">
			        	<span class="btn updates" data-no="${rvo.no }">수정</span> <!-- data-no는 임시로 만든 속성, 데이터전송을 위해만듬 -->
			        	<a href="../freeboard/reply_delete.do?no=${rvo.no }&bno=${vo.no}&page=${page}" class="btn">삭제</a>       	
			         </c:if>
			         <span class="btn replys" data-no="${rvo.no }">댓글</span>
			        </c:if>
			       </td>
			      </tr>
			      <tr>
			       <td colspan="2" valign="top">
			        <pre style="white-space: pre-wrap; background-color: white; border: none">${rvo.msg }</pre>
			       </td>
			      </tr>
			     </table>
			     <!-- 댓글 수정폼 up -->
			     <table class="table up" style="display:none" id="u${rvo.no }">
		  		  <tr>
		     		<td class="inline">
		     		 <form method="post" action="../freeboard/reply_update.do">
		        	  <input type="hidden" name="no" value="${rvo.no }">
		        	  <input type="hidden" name="bno" value="${vo.no }"><%-- 게시물 번호 --%>
		        	  <input type="hidden" name="page" value="${page }">
		        	  <textarea rows="4" cols="90" name=msg style="float: left">${rvo.msg }</textarea>
		        	  <input type=submit value="댓글수정" class="btn btn-danger" style="height: 80px;float:left">
		       		 </form>
		      		</td>
		    	   </tr>
		   		</table>
			     <!-- 댓글 작성폼 reply-->
			     <table class="table reply" style="display:none" id="r${rvo.no }">
			      <tr>
			       <td class="inline">
			        <form method="post" action="../freeboard/reply_transaction_insert.do">
			         <input type="hidden" name="pno" value="${rvo.no }"> <!-- 댓글 번호 -->
			         <input type="hidden" name="bno" value="${vo.no }"><!-- 게시물 번호 -->
			         <input type="hidden" name="page" value="${page }">
			         <textarea rows="4" cols="90" name="msg" style="float:left"></textarea>
			         <input type="submit" value="댓글쓰기" class="btn" style="height: 80px;float:left">
			        </form>
			       </td>
			      </tr>
			     </table>
			    </c:forEach>
			   </td>
			  </tr>
			 </table>
			</div>
			<!-- 댓글 -->
			<c:if test="${sessionScope.id!=null }">
				<div class="row">
				 <table class="table">
				  <tr>
				   <td class="inline">
				    <form method="post" action="../freeboard/reply_insert.do">
				     <input type="hidden" name="bno" value="${vo.no }"><!-- 게시물 번호 -->
			         <input type="hidden" name="page" value="${page }">
			         <textarea rows="4" cols="90" name="msg" style="float:left"></textarea>
			         <input type="submit" value="댓글쓰기" class="btn" style="height: 80px;float:left">
				    </form>
				   </td>
				  </tr>
				 </table>
				</div>
			</c:if>
		</div>
	</section>
</body>
</html>