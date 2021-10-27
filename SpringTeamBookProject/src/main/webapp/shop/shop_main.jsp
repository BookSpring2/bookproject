<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
	<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>게시판</h2>
                        <div class="breadcrumb__option">
                            <a href="#">Home</a>
                            <span>서점</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="blog spad">
    	<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="#">
								<input type="text" placeholder="Search...">
								<button type="submit">
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__item">
							<h4>카테고리</h4>
							<ul>
								<li><a href="#">전체</a></li>
								<li><a href="#">위치별 찾기
								<ul>
									<li><a href="#" v-on:click="shopListData('서울')">서울</a></li>
									<li><a href="#" v-on:click="shopListData('경기')">경기</a></li>
									<li><a href="#" v-on:click="shopListData('기타')">그 외</a></li>
								</ul>
								</a></li>
								<li><a href="#">종류별 찾기</a></li>
							</ul>
						</div>
						<div class="blog__sidebar__item">
							<h4>최신 글</h4>
							<div class="blog__sidebar__recent">
								<a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-1.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											09 Kinds Of Vegetables<br> Protect The Liver
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-2.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											Tips You To Balance<br> Nutrition Meal Day
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>
											4 Principles Help You Lose <br>Weight With Vegetables
										</h6>
										<span>MAR 05, 2019</span>
									</div>
								</a>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<h4>키워드</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#">카페</a> <a href="#">주차</a> <a href="#">독서모임</a> <a
									href="#">강연</a> <a href="#">화장실 남녀구분</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7"> 
					<div class="row">
						<div style="width:100%; height:500px">카카오맵</div>
						<!-- 지도 들어갈 자리 -->
					</div>
					<div class="row bookstore">
						<table class="table">
							<tr>
								<th style:"width=20%">서점명</th>
								<td style:"width=80%"></td>
							</tr>
							<tr>
								<th style:"width=20%">영업시간</th>
								<td style:"width=80%"></td>
							</tr>
							<tr>
								<th style:"width=20%">휴무일</th>
								<td style:"width=80%"></td>
							</tr>
							<tr>
								<th style:"width=20%">상세주소</th>
								<td style:"width=80%"></td>
							</tr>
							<tr>
								<th style:"width=20%">전화번호</th>
								<td style:"width=80%"></td>
							</tr>
							<tr>
								<th style:"width=20%">가게 소개</th>
								<td style:"width=80%"><pre></pre></td>
							</tr>
							<tr>
								
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>
    </section>
</body>
<script>
	new Vue({
		el:.blog spad
		data:{
			ss='서울',
			shop_data:[],
			shop_detail:{}
		},
		mounted:function(){
			// default 출력
			this.commonFunc();
		},
		// 사용자 정의 함수=> 이벤트 처리
		methods:{
			movieData:function(ss){
				this.ss=no;
				this.title=title;
				this.commonFunc(); 
			},
			commonFunc:function(){
				axios.get("http://localhost:8080/web/board/shop_main.do",{
					params:{
						no:this.no
					}
				}).then(res=>{
					console.log(res.data);
					this.movie_data=res.data;
				})
			},
			mouseData:function(rank){
				console.log("rank="+rank);
				this.movie_detail=this.movie_data[rank-1];
				
			}
		}

	})
</script>
</html>