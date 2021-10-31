<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>Admin Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>관리자 메뉴</h4>
                            <ul>
                                <li><a href="admin/orderlist.do">주문 현황</a></li>
                                <li><a href="admin/memberList.do">회원 관리</a></li>
                                <li><a href="admin/insert.do">상품 등록</a></li>
								<li><a href="admin/productList.do">상품 조회</a></li>
					            <li><a href="admin/update.do">상품 정보 수정</a></li>
								<li><a href="admin/delete.do">상품 삭제</a></li>
                            </ul>
                        </div>
                     </div>
                 </div>
              </div>
                <div class="col-lg-9 col-md-7">
		        <div class="container">
		          <div class="row">
		            <div class="col-lg-4">
                      <div class="product__discount">
                        <table>
                            <thead>
                                   <h2>회원리스트</h2>
                                <tr>
                                    <th>회원ID</th>
                                    <th>이름</th>
                                    <th>Email</th>
                                    <th>전화번호</th>
                                    <th>주소</th>
                                    <th>생일</th>
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="vo" items="${list }">
                                <tr>
                                    <td class="text-center">
                                        ${vo.user_id }
                                    </td>
                                    <td class="text-center">
                                        ${vo.name}
                                    </td>
                                    <td class="text-center">
                                        ${vo.email}
                                    </td>
                                    <td class="text-center">
                                        ${vo.tel}
                                    </td>
                                    <td class="text-center">
                                        ${vo.addr1}
                                    </td>
                                    <td class="text-center">
                                        ${vo.birthday}
                                    </td>
                                </tr>
                              </c:forEach>
                            </tbody>
                        </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
     </section>
</body>
</html>