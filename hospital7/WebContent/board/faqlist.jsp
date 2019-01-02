<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>kic의료센터</title>
	<link href ="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="faqlist_body">
<%@ include file="../patient/patient_top.jsp" %>

<div class="session">

	

	
	



<!-- boardTypeTbl -->
<div class="boardTypeTbl">
			<h2> FAQ 게시판</h2>
		<form action="" class="searchform">
		
		<div class="searchdiv1">
			<button type="submit" class="searchbtnsel">
				<span></span>
			</button>
			<input type="text" name="content" placeholder="검색어를 입력해주세요">
		</div>
		<div class="searchdiv2">
			<select name="search">
				<option value="name">제목</option>
				<option value="name">내용</option>
				<option value="name">제목 + 내용</option>
			</select>
		</div>
	</form>
	<table>
		<thead>
			<tr>
				<th scope="col">번호</th>
				
					<th scope="col">분류</th>
				
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				
			</tr>
		</thead>
		<tbody>
			
				<tr>
					<td>8</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">1,2차 진료기관의 진료의뢰서 필요합니까? 지참하지 않을 경우 진료비에 대한 여부는 어떻게 되나요?</a></td>
					<td>2017-08-24</td>
					<td>428</td>
			
				</tr>
			
				<tr>
					<td>7</td>
					
						<td>기타</td>
					
					<td class="alignL"><a href="#">산정특례, 중증 등록이나 암등록은 어떻게 하나요?</a></td>
					<td>2017-08-24</td>
					<td>349</td>
		
				</tr>
			
				<tr>
					<td>6</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">각종 진단서 비용은 얼마입니까?</a></td>
					<td>2017-08-24</td>
					<td>588</td>
				
				</tr>
			
				<tr>
					<td>5</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">출생증명서 발급받아 출생시간을 알고자 하는데 어떤 방법이 있나요?</a></td>
					<td>2017-08-24</td>
					<td>421</td>
				
				</tr>
			
				<tr>
					<td>4</td>
					
						<td>기타</td>
					
					<td class="alignL"><a href="#">1588-5700 왜 전화가 안 되나요?</a></td>
					<td>2017-08-18</td>
					<td>306</td>
				
				</tr>
			
				<tr>
					<td>3</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">소득공제용 장애인증명서가 홈페이지에서 발급되지 않습니다.</a></td>
					<td>2017-08-18</td>
					<td>810</td>
					
				</tr>
			
				<tr>
					<td>2</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">소득공제용(연말정산) 장애인증명서 발급서비스란?</a></td>
					<td>2017-08-18</td>
					<td>617</td>
					
				</tr>
			
				<tr>
					<td>1</td>
					
						<td>외래</td>
					
					<td class="alignL"><a href="#">가족관계증명서 병원에서 발급할 수 있나요?</a></td>
					<td>2017-08-18</td>
					<td>509</td>
					
				</tr>
			
		</tbody>
	</table>
</div>
<!-- //boardTypeTbl-->

</div>


	
	
<%@ include file="../patient/patient_bottom.jsp"%>
</body>
</html>