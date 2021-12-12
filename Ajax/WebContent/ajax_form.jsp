<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<script type="text/javascript">
		$(document).ready(function() {
			$("#send").on("click", function() {
				var id = $("#id").val();
				var pwd = $("#pwd").val();
				$.ajax({
					type : "post",
					url : "ajax_test.jsp",
					data : $("#good").serialize(),
					success : function(data) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
						// 응답코드 > 0000
						alert(data);
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
						alert("통신 실패.")
					}
				});
			});
		});
</script>

<form id="good" action="ajax_test.jsp" method="post">
		<label for="id">id</label>
		<input class="id" type="text" name="id"><br>
		<label for="pwd">pwd</label> 
		<input class="pwd" type="text" name="pwd"><br>
		<button id="send">전송</button>
	</form>
</body>
</html>