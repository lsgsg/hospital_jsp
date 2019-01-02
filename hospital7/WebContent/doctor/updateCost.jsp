<%@page import="hospital.yeyak.DocYeyakBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="yeyakMgr" class="hospital.yeyak.DocYeyakManager" scope="session"></jsp:useBean>
<% 
request.setCharacterEncoding("utf-8"); 
String yeyak_no=request.getParameter("yeyak_no");

DocYeyakBean bean=yeyakMgr.getYeyak(yeyak_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료비 입력</title>
<script>
window.onload = function() {
	document.getElementById("addM").addEventListener("click",
			functrAdd, false);
	document.getElementById("delM").addEventListener("click",
			functrDel, false);

}
var no = 1;
function functrAdd(){
	var trAdd = "<tr><td>"+ (no += 1) + "</td>"
	+"<td><select><option>머리아플때 먹는약</option>"
	+"<option>약 선택</option>"
	+"<option>마음아플때 먹는약</option><option>다리아플때 먹는약</option>"
	+"<option>팔 아플때 먹는약</option><option>배 아플때 먹는약</option>"
	+"<option>근육통이 올때 먹는약</option></select></td><td><input type='number' value='1'>"
	+"</td><td><input type='text'></td></tr>";
	document.getElementById("uptabletbl").innerHTML += trAdd
}

function functrDel(){
    var trDel = document.getElementById('uptabletbl');
    if (trDel.rows.length < 1) return;
    // trDel.deleteRow(0); // 상단부터 삭제
    trDel.deleteRow( trDel.rows.length-1 ); // 하단부터 삭제
    no -= 1;
}
</script>
</head>
<body>
<%@ include file="doc_top.jsp" %>
<form action="updateCostProc.jsp" method="post" class="updateCostform" name="upCostform">
	<div class="clear2"></div>
	<h2>
	<span>&nbsp;&nbsp;<%=bean.getDate() %>&nbsp;<%=bean.getPat_name() %>님&nbsp;&nbsp;</span>
	의 진료내역
	</h2>
	<ul class="updateCostul">
		<li>
			<span> 환자성명 </span>
			<input type="text" value="<%=bean.getPat_name() %>" name="pname" readonly>
			<span> 성별</span>
			<input type="text" value="<%=bean.getPat_gen() %>" name="gen" readonly>
		</li>
		<li>
			<span> 진료의사 </span>
			<input type="text" value="의사이름" name="docname" readonly>
			<span> 진료과</span>
			<input type="text" value="진료과" name="docdept" readonly>
		</li>
		<li>
			<span> 예약일 </span>
			<input type="date" name="yeyakDate" value="<%=bean.getDate() %>" readonly>
			<span> 예약시간 </span>
			<input type="text" name="yeyaktime" value="<%=bean.getTime()%>" readonly>
		</li>
		
		<li>
			<span>진료내용</span>
			<textarea name="content"><%=bean.getDetail() %></textarea>
		</li>
		<li>
			<span>처방내용</span>
			<div class="uptable">
				<table border="1" id="uptabletbl">
					<tr>
						<th width="5%">No</th><th>처방약</th><th width="10%">수량</th><th width="50%">기타사항</th>
					</tr>
					<tr>
						<td>1</td>
						<td>
							<select>
								<option>약 선택</option>
								<option>머리아플때 먹는약</option>
								<option>마음아플때 먹는약</option>
								<option>다리아플때 먹는약</option>
								<option>팔 아플때 먹는약</option>
								<option>배 아플때 먹는약</option>
								<option>근육통이 올때 먹는약</option>
							</select>
						</td>
						<td><input type="number" value="1"></td>
						<td><input type="text"></td>
					</tr>
				</table>
				
				<div class="jinupbtn">
					 
					
					<button type="button" class="deltf" id="delM">삭제</button>
					<button type="button" class="addf" id="addM">약추가</button>
					<span>일치 처방 &nbsp;&nbsp;</span>
					<input type="number">
					
				</div>
			</div>
			
		</li>

		<li>
			<span>진료비</span>	
			<input type="submit" value="입력"/>
			<input type="text" name="cost" value="<%=bean.getCost() %>"/>
			<input type="hidden" name="yeyak_no" value="<%=yeyak_no%>"/>
		    
		</li>
	</ul>
</form>
</body>
</html>