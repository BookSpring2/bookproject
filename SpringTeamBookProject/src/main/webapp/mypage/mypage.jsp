<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>주문하기</h2>
          <div class="breadcrumb__option">
            <a href="../main/main.do">Home</a>
            <span>주문하기</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="container">
  <div class="row">
    <table class="table">
      <div class="col-sm-3">
        <table class="table">
          <!-- 회원등급 -->
          <!-- 4단계로 나뉘어서 해당 회원 등급 색 진하게 표시 -->
          <!-- @개월간 순수 주문금액이 @@만원 이상일 경우 다음달 1일 @@회원 등급이 됩니다 -->
          <!-- 등급 자세히보기 누르면 등급 상세설명 -->
        </table>
        <table class="table">
          <!-- 1. 주문내역
          		> 주문내역/ 배송조회
          		> 반품/ 교환 신청 및 조회
          		> 취소 주문내역
           -->
          <!-- 2. 계좌내역
          		> Organi포인트 (적립금 포함)
          		> 쿠폰
           -->
          <!-- 3. 나의정보
          		> 회원정보
          		> 회원탈퇴
           -->
          <!-- 4. 블로그
          		> 포스트/리뷰/메모
          		> 리스트
           -->
          <!-- 기타
          		> 나의 1:1 문의내역
          		> 나의 리뷰/한줄평
           -->
        </table>
      </div>
      <div class="col-sm-9">
      	<!-- 
      		최근 주문내역
      		주문일자 / 주문번호 / 주문내역 / 주문상태 / 배송
      	 -->
      </div>
    </table>
  </div>
</div>
</body>
</html>