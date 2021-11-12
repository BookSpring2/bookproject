<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
	border-radius:0px;
	background-color:black;
	color:white;
	font-size:14px; 
}
</style>
<script type="text/javascript">
$(function(){
	$('#updateBtn').click(function(){
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		let no=$('#no').val();
		let page=$('#page').val();
		let writer=$('#writer').val();
		
		let sendData={"no":no,"page":page,"writer":writer,"subject":subject,"content":content};
		
		$.ajax({
			type:'POST',
			url:"../freeboard/update_ok.do",
			data:sendData,
			success:function(res)
			{
				location.href="../freeboard/detail.do?no="+no+"&page="+page;
			}
		})
	})
})
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
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
                   <!-- <form method="post" action="../freeboard/update_ok.do"> -->
                          	<input type=hidden name=no value="${vo.no }" id="no">
        					<input type=hidden name=page value="${page }" id="page">
                            <div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<p>작성자<span>*</span></p>
										<input type=text name="writer" id="writer" value="${vo.writer }" readonly>
									</div>
								</div>
							</div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type=text name="subject" id="subject" value="${vo.subject }">
                                    </div>
                                </div>
                            </div>					
							<div class="checkout__input">
                                <p>내용<span>*</span></p>
                                <textarea class="form-control" rows="10" id="content" name="content">${vo.content }</textarea>
                            </div>        
                            <button class="btn" id="updateBtn" style="margin-right:10px;">수정하기</button>
                            <button type="button" class="btn" onclick="javascript:history.back()">취소</button>
                        <!--  </form>  -->
                        </div>
	                 </div>           
            </div>
        </div>
</section>
</body>
</html>