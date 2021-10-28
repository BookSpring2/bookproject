<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0;
$(function(){
	$('#add').click(function(){
		$('#fileView').append(
			'<tr id=m'+(fileIndex)+'>'
			+'<td>파일'+(fileIndex+1)+'</td>'
			+'<td><input type=file name=files['+fileIndex+']></td>'
			+'</tr>'
		)
		fileIndex++;
	});
	$('#remove').click(function(){
		if(fileIndex)
		{
			$('#m'+(fileIndex-1)).remove();
			fileIndex--;
		}			
	})
});
</script>
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
                            <span>글쓰기</span>
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
                        <form method="post" action="insert_ok.do" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type=text name="subject">
                                    </div>
                                </div>
                            </div>
                                
                            <div class="checkout__input">
                                <p>내용<span>*</span></p>
                                <textarea class="form-control" rows="10" id="comment" name=content></textarea>
                            </div>        
                            <div class="checkout__input">
								<p>첨부파일</p>
									<button class="btn" style="background-color:#83AD2E;color:white" id="add">추가</button>
									<button class="btn"style="background-color:#83AD2E;color:white" id="remove">삭제</button>
								<table class="table" id="fileView">
								</table>
							</div>
                            <button class="site-btn">작성하기</button>
                            <button class="site-btn" onclick="javascript:history.back()">취소</button>
                        </form>
                        </div>
	                 </div>
              
            </div>
        </div>
    </section>
</body>
</html>