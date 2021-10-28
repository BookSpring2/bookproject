<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
    <div class="contact-form spad" style="margin:80px auto;">
        <div class="container">          
            
            <form action="#">
                <div class="row">
	                	<div class="col-lg-8 col-md-6">
	                	
 	                            <div class="col-lg-8">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-user"></span>
		                                    <input type="text" placeholder="아이디" name=name id="name" class="btnId">
 	                            		</div>

	                            </div>
	                            
 	                            <div class="col-lg-8">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-lock"></span>
		                                    <input type="text" placeholder="비밀번호" name=name id="name" class="btnId">
 	                            		</div>

	                            </div>

	                            <div class="col-lg-8">
		                       			<button type="submit" class="site-btn" style="width:100%;">로그인</button>
	                            </div> 
		                    
	                	</div>

                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
    
</body>
</html>