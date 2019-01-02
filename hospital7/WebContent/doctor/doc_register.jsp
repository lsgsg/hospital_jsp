<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KIC 의사가입</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src ="../js/script.js"></script>
<script>
$(function(){
	
	var fileTarget = $('.fileli .upload-hidden');

	fileTarget.on('change', function(){ // 값이 변경되면
	  if(window.FileReader){ // modern browser
	    var filename = $(this)[0].files[0].name;
	  }
	  else { // old IE
	    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	  }

	  // 추출한 파일명 삽입
	  $(this).siblings('.upload-name').val(filename);
	});
});
</script>
<script>
window.onload = function(){
	docregform.id.focus();
	document.getElementById("btnZip").onclick = zipCheck2;
	document.getElementById("btnId").onclick = docidCheck;
}

</script>
</head>
<body>

	<div class="docregister">
		<div class="registerarea">
			<h2>의사 가입 승인 요청</h2>
			<form name="docregform" method="post" action="doc_registerproc.jsp" class="docregiform">
				<ul>
					<li>
						<input type="text" placeholder="아이디를 입력해주세요" name="id" required>
						<input type="button" value="ID중복확인" id="btnId"  required>
					</li>
					<li>
						<input type="password" placeholder="비밀번호를 입력해주세요" name="passwd" required>
					</li>
					<li>
						<input type="password" placeholder="비밀번호를  확인해주세요" name="repasswd" required>
					</li>
					<li>
						<input type="text" placeholder="부여받은 의사번호를 입력해주세요" name="dept_no" required>
					</li>
					<li>
						<input type="text" name="name" placeholder="이름을 입력해주세요" required>
					</li>
					<li>
						<input type="text" name="email" placeholder="이메일을 입력해주세요" required>
					</li>
					<li class="radioli">
							<input type="radio" name="gen" value="남" id="gen1" class="radiocalss" required> 
							<label for = "gen1"  class="radiocalss" id="gen1lbl">남자</label> 
							
    						<input type="radio" name="gen" value="여" id="gen2"  class="radiocalss" required>
    						<label for = "gen2"  class="radiocalss">여자</label>
    				</li>
    				<li id="selBirth">
    					<input type="text" name="birth" placeholder="생년월일6자리를 입력해주세요    ex)860505" required>
    				</li>
    				<li>
    					<input type="text" name="phone" placeholder="전화번호를 입력해주세요" required>
    				</li>
    				<li class="zipcodeli">
    					<input type="text" name="zipcode" required>
    					<input type="button" value="우편번호찾기" id="btnZip" required>
    				</li>
    				<li>
    					<input type="text" name="address" placeholder="상세주소를 입력해주세요" required>
    				</li>
    				<li class="fileli">
    					<input class="upload-name" value="파일선택" disabled="disabled" name="image" required>
						<label for="ex_filename"  name="image" >업로드</label>
       					<input type="file" id="ex_filename" class="upload-hidden"  name="image" required>
    				</li>
    				<li>
    					<input type="submit" value="승인등록" class="btn btn1">
						<input type="reset" value="새로입력"  class="btn btn2">
    				</li>
				</ul>
				
				
			</form>
		</div>
	</div>
</body>
</html>