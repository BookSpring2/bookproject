<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container1{
	margin:0px auto;
	width:1000px;
}
.table1{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}
</style>
</head>
<body>

<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="container1">

    <form method="post" action="update_ok.do" enctype="multipart/form-data">
    <table class="table" style="margin:auto;margin-top:50px;">
      <tr>
        <th width="25%" class="text-right">이름</th>
        <td width="80%">
          <input type=text name=name size=20 class="input-sm" value="${vo.name }" id="name">
          <input type=hidden name=no value="${vo.no }">
          <input type=hidden name=page value="${page }">
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">공지제목</th>
        <td width="80%">
          <input type=text name=subject size=60 class="input-sm" value="${vo.subject }" id="subject">
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">공지내용</th>
        <td width="80%">
          <textarea rows="10" cols="60" name=content id="content">${vo.content }</textarea>
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">첨부 이미지</th>
        <td width="80%">
        <table class="table1">
        <tr>
          <td class="text-right">
          <input type=button value="추가" class="btn btn-xs btn-danger" id="add">
          <input type=button value="삭제" class="btn btn-xs btn-info" id="remove">
        </td>
      </tr>
      </table>
      <table class="table" id="imageView">
      
      </table>
      </td>
	</tr>
      <tr>
        <td class="text-center" colspan="2">
          <input type=submit value="수정" class="btn btn-sm btn-danger">
          <input type=button value="취소" class="btn btn-sm btn-success"
            onclick="javascript:history.back()"
          >
        </td>
      </tr>
    </table>
    </form>
    </div>
</body>
</html>