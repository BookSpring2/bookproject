<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>자유게시판</h2>
                        <div class="breadcrumb__option">
                            <a href="list.do">자유게시판</a>
                            <span>수정하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
 <section class="checkout spad">
        <div class="container">
           	<div class="checkout__form">
                <h4>글쓰기</h4>   
                    <div class="row">
                        <div class="col-lg-12 col-md-12">           
                        <form method="post" action="update_ok.do">
                        	<input type=hidden name=no value="${vo.no }" id="no">
        					<input type=hidden name=page value="${page }" id="page">
                            <div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<p>작성자<span>*</span></p>
										<input type=text name="writer" value="${vo.writer }" readonly>
									</div>
								</div>
							</div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type=text name="subject" value="${vo.subject }">
                                    </div>
                                </div>
                            </div>					
							<div class="checkout__input">
                                <p>내용<span>*</span></p>
                                <textarea class="form-control" rows="10" id="comment" name="content">${vo.content }</textarea>
                            </div>        
                            <button class="site-btn">수정하기</button>
                            <button type="button" class="site-btn" onclick="javascript:history.back()">취소</button>
                        </form>                 
                        </div>
	                 </div>           
            </div>
        </div>
</section>
</body>
</html>