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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=887e79943135c942ddc000c57f528937"></script>


<style>
	.shop_bar{
		overflow:auto;
		height:300px;
	}
	.shop{
		position:relative;
	}
	.store_search_wrapper .store_search_layer {
    position: absolute;
    left: 20px;
    top: 180px;
    z-index: 3;
    width: 340px;
    height: 658px;
    padding: 0 29px;
    background-color: #fff;
    border: 1px solid #dddddd;
}
	.content{
		position: relative;
	}
</style>
</head>
<body>
<div class="content">
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
	<div class="store_search_wrapper">
	    <div id="map" style="width:100%; height:700px"></div>
	 	<div class="store_search_layer">
				<div class="blog__sidebar__search">
					<form action="#">
						<input type="text" placeholder="지역 또는 매장 찾기">
						<button type="submit">
							<span class="icon_search"></span>
						</button>
					</form>
				</div>
							
				<div class="blog__sidebar__item">
					<h4>매장목록</h4>
						<div class="blog__sidebar__recent shop_bar">
							<div v-for="(vo,index) in shop_data" :key="vo.id">
								 <a href="#" class="blog__sidebar__recent__item" v-on:click="clickData(index)">
									<div class="blog__sidebar__recent__item__text">
										<h6>{{vo.name}}</h6>
										<span>{{vo.addr}}<br></span>
									</div>
								</a>
							</div>
						</div>
				</div>
			</div>
					<div class="col-lg-8 col-md-7"> 
						<div class="row">
							
							<!-- 지도 들어갈 자리 -->
						</div>
						<div class="row bookstore">
							<table class="table">
								<tr>
									<th >서점명</th>
									<td>{{shop_detail.name}}</td>
								</tr>
								<tr>
									<th width=30%>영업시간</th>
									<td width=70%>{{shop_detail.open}} ~ {{shop_detail.close}}</td>
								</tr>
								<tr>
									<th width=30%>휴무일</th>
									<td>{{shop_detail.hday}}</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td>{{shop_detail.addr}}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>{{shop_detail.tel}}</td>
								</tr>
								<tr>
									<th width="20%">가게 소개</th>
									<td width="80%"><pre>{{shop_detail.optn}}</pre></td>
								</tr>							
							</table>
						</div>
					</div>
	    </div>
	   </div>
</body>
<script>
	new Vue({
		el:'.store_search_wrapper',
		data:{
			la:37.2758569,
			lo:127.1512767,
			shop_data:[],
			shop_detail:{}
		},
		mounted:function(){
			// default 출력
			this.commonFunc();
			this.kakaoMap(this.la,this.lo);
		},
		updated:function(){
			this.la=this.shop_detail.la,
			this.lo=this.shop_detail.lo
			this.kakaoMap(this.la,this.lo);
		},
		// 사용자 정의 함수=> 이벤트 처리
		methods:{
			
			commonFunc:function(){
				axios.get("http://localhost:8080/web/shop/shop_main.do",{
					params:{
					}
				}).then(res=>{
					console.log(res.data);
					this.shop_data=res.data;
				})
			},
			searchList:function(){
				axios.get("http://localhost:8080/web/shop/shop_search.do",{
					params:{
						
					}
				}).then(res=>{
					console.log(res.data);
					this.shop_data=res.data;
				})
			},
 			clickData:function(index){
 					
					this.shop_detail=this.shop_data[index];
					console.log(this.shop_detail);
					
			},
			kakaoMap:function(la,lo){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			    mapOption = { 
			        center: new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
					var markerPosition  = new kakao.maps.LatLng(la, lo); 

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
			}
 		}

	})
	
</script>
</html>