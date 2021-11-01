<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top:30px;
}
.row{
	margin:0px auto;
	width:1300px;
}
h1{
	text-align:center;
}
</style>
</head>
<body>
	<div class="container">
	<div class="row">

    <form method="post" action="insert_ok.do" enctype="multipart/form-data">
    <table class="table">
      <tr>
        <th width="25%" class="text-right">이름</th>
        <td width="80%">
          <input type=text name=name size=20 class="input-sm">
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">공지제목</th>
        <td width="80%">
          <input type=text name=subject size=60 class="input-sm">
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">공지내용</th>
        <td width="80%">
          <textarea rows="10" cols="60" name=content></textarea>
        </td>
      </tr>
      <tr>
        <th width="20%" class="text-right">첨부 이미지</th>
        <td width="80%">
        <table class="table">
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
          <input type=submit value="등록" class="btn btn-sm btn-danger">
          <input type=button value="취소" class="btn btn-sm btn-success"
            onclick="javascript:history.back()"
          >
        </td>
      </tr>
    </table>
    </form>
    </div>
    </div>
</body>
</html>