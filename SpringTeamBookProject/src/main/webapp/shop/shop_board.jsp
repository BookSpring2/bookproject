<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height:30px"></div>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>서점 찾기</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>주변 매장 검색</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<div class="container">
<div class="content">
						<h3 class="h_title">전체매장</h3>
						<!-- board list s -->
						<div class="board_list_wrapper">
							<div class="content">
								<p class="board_total">총<strong id="pageCount">473</strong>개 매장이 있습니다.</p>

								<form id="searchFrm" method="GET" name="searchFrm">
									<input id="page" name="page" type="hidden" value="1">
									<div class="cont_right">
										<!-- select -->
										<div class="form_select" style="width:196px;">
											<select id="rgn1Nm" name="rgn1Nm">
												<option value="">시/도</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="충청남도">충청남도</option>
												<option value="경상남도">경상남도</option>
												<option value="울산광역시">울산광역시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="제주특별자치도">제주특별자치도</option>
												<option value="전라북도">전라북도</option>
												<option value="충청북도">충청북도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라남도">전라남도</option>
												<option value="경상북도">경상북도</option>
											</select>
										</div>
										<!--// select -->
										<!-- select -->
										<div class="form_select" style="width:196px;">
											<select id="rgn2Nm" name="rgn2Nm">
												<option value="">시/군/구</option>
												
											</select>
										</div>
										<!--// select -->
										<!-- select -->
										<!-- <div class="form_select" style="width:196px;">
											<select  name="dong" id="dong">
												<option value="">동</option>
												<option th:each="rs, status : ${location3}" th:value="${rs.dong}" th:text="${rs.dong}" th:selected="${rs.dong eq search.dong}"></option>
											</select>
										</div> -->
										<!--// select -->
									</div>
								</form>

								<table>
									<caption>전체매장 목록 테이블</caption>
									<colgroup>
										<col width="100px">
										<col width="185px">
										<col width="*">
										<col width="250px"><!-- 20180208 -->
										<col width="170px">
										<col width="55px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">매장명</th>
											<th scope="col">매장주소</th>
											<th scope="col">영업시간</th>
											<th scope="col">연락처</th>
											<th class="hide" scope="col">자세히보기</th>
										</tr>
									</thead>
									<tbody>

										<tr v-for="(vo,index) in shop_data" :key="index">
											<td><div class="num">473</div></td>
											<td><a href="/storeDetail?franchiseNo=500">{{vo.name}}</a></td>
											<td>
											
											<div class="title"><a href="/storeDetail?franchiseNo=500">{{vo.address}}</a></div>
											</td>
											<td>
												<div class="service">
													<span class="on">아침메뉴</span><!-- 해당서비스 on클래스 추가 -->
													<span>24시간</span><!-- 해당서비스 on클래스 추가 -->
													<span style="display:none;">딜리버리</span><!-- 해당서비스 on클래스 추가 -->
													<!--<span th:class="${shop.pkYn == 'Y'} ? 'on':''">주차가능</span>--><!-- 해당서비스 on클래스 추가 -->
												</div>
											</td>
											
												
													<td><div class="coming">{{vo.tel}}</div></td>
												
												
											

											<td><a target="_blank" href="#"><img alt="자세히보기" src=""></a></td><!-- 20180307 -->

										</tr>
									</tbody>
								</table>
							</div>

							<!-- board 페이지 -->
							<div>
	<div class="pagination">
			
			
			<a class="arr prev" href="javascript:void(0);"></a>

			
				<a class="active" href="#">1</a>
			

			
				<a href="#" onclick="paging.page(2);return false;">2</a>
			

			
				<a href="#" onclick="paging.page(3);return false;">3</a>
			

			
				<a href="#" onclick="paging.page(4);return false;">4</a>
			

			
				<a href="#" onclick="paging.page(5);return false;">5</a>
			

			
				<a href="#" onclick="paging.page(6);return false;">6</a>
			

			
				<a href="#" onclick="paging.page(7);return false;">7</a>
			

			
				<a href="#" onclick="paging.page(8);return false;">8</a>
			

			
				<a href="#" onclick="paging.page(9);return false;">9</a>
			

			
				<a href="#" onclick="paging.page(10);return false;">10</a>
			

			
			
			<a class="arr next" href="javascript:void(0);" onclick="paging.next(48);return false;"></a>
			
	</div>
</div>
							<!--// board 페이지 -->
						</div>
						<!-- board list e -->
					</div>
</div>
</body>
</html>