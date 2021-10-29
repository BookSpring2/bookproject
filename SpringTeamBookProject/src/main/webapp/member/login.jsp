<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	
	// 로그인버튼 클릭
	$('#logBtn').click(function(){
		let id=$('#id').val();
		let pwd=$('#pwd').val();
		
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		// ajax
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(res)
			{
				let result=res;
				if(result=='NOID')
				{
					alert("아이디가 존재하지 않습니다");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
		
	})
	
})

</script>
<style>
.col-lg-8, .col-md-6{
	float: none;
	margin:0 auto;"
}

 input{
	margin:0 auto;
	padding-left:15% !important;
} 

button{
	border-radius:4px;
}

.icon{
	position:relative;
	width:100%;
	height:80px;
	font-size:25px;
	color:#7fad39;
}
.icon span{
   position:absolute;
   top:18%;
   left:4%;
}

ul.link {
	margin:30px auto;
	text-align:center;
}

ul.link li{
	position:relative;
	list-style:none;
	display:inline-block;
	font-size:15px;
}

/* ul li::before{
    content: '';
    position: absolute !important;
    top: 3px !important;
    left: 12px !important;
    width: 1px !important;
    height: 13px !important;
    border-radius: 0.5px;
    background-color: #dadada;
} */

ul.link li+li::before{
	content: "";
    display: inline-block;
    position: relative;
    margin:0 8px;
    top: 0px;
    left: 0;
    width:1px;
    height:12px;
    background: #e0e0e0;
}


</style>
</head>
<body>
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>로그인</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>로그인</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Contact Form Begin -->
    
    <div class="contact-form spad" style="margin:20px auto;">
        <div class="container">          
            
            <form action="#">
                <div class="row">
	                	<div class="col-lg-8 col-md-6">
	                	
 	                            <div class="col-lg-8">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-user"></span>
		                                    <input type="text" placeholder="아이디" id="id" class="btnId">
 	                            		</div>

	                            </div>
	                            
 	                            <div class="col-lg-8">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-lock"></span>
		                                    <input type="password" placeholder="비밀번호" id="pwd" class="btnId">
 	                            		</div>

	                            </div>

	                            <div class="col-lg-8">
		                       			<button type="submit" class="site-btn" style="width:100%;" id="logBtn">로그인</button>
	                            </div> 
	                            
	                            <div class="col-lg-8" style="text-center;">
		                       		<ul class="link">
		                       			<li><a href="join.do">회원가입</a></li>
		                       			<li><a href="#">아이디 찾기</a></li>
		                       			<li><a href="#">비밀번호 찾기</a></li>
		                       		</ul>
	                            </div> 
		                    
	                	</div>

                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
    
</body>
</html>