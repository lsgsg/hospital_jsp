/**
 * 별도 파일 작성
 */

var now = new Date();
var year = now.getFullYear();
var month = now.getMonth();
var day = now.getDate();
var str = "결과";

function func(){
	//해당월의 1일 요일 구하기
	var setDate = new Date(year, month, 1);
	var firstDay = setDate.getDate();
	
	var yoil = setDate.getDay();	//일요일(0) ~ 토요일(6)
	
	var nalsu = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	//윤년 확인
	if(year % 4 === 0 && year % 100 !== 0 || year % 400 === 0){
		nalsu[1] = 29;
	}
	makeCal(yoil, nalsu[month], year, month+1, day);
}

function func2(y,m){
	//해당월의 1일 요일 구하기
	var setDate = new Date(y, m, 1);
	var firstDay = setDate.getDate();
	
	var yoil = setDate.getDay();	//일요일(0) ~ 토요일(6)
	
	var nalsu = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	//윤년 확인
	if(y % 4 === 0 && y % 100 !== 0 || y % 400 === 0){
		nalsu[1] = 29;
	}
	makeCal(yoil, nalsu[m], y, m+1, day);
}

function funcNow(){
	document.getElementById("etc").style.display="";	
	
	func();
}

function funcNmonth(){
	month += 1;
	if(month > 11){
		month = 0;
		year += 1;
	} 	
	
	func();
}

function funcPmonth(){
	month -= 1;
	if(month < 0){
		month = 11;
		year -= 1;
	} 
	
	func();	 
}

function funcNyear(){
	year += 1;
	
	func();
}

function funcPyear(){
	year -= 1;
	
	func();
}

function makeCal(yoil, nalsu, year, month, day){
	str = "<div class='calheader'><div class='day'>" + year + " 년 " + month + " 월</div></div>";
	str += "<table class='makeCal'>";
	
	var weeks = new Array("일","월","화","수","목","금","토");
	for(var i = 0; i < weeks.length; i++){
		str += "<th width='200px'>" + weeks[i] + "</th>";
	}
	str += "</tr>";
	
	
	var no = 1;
	var currentCell = 0;
	var ju = Math.ceil((nalsu + yoil + 1) / 7);
	for(var r = 0; r < ju; r++){	//주(행)
		str += "<tr style='text-align:center'>";
		for(var col = 0; col < 7; col++){	//일(열)
			if(currentCell < yoil || no > nalsu){
				str += "<td>&nbsp;</td>";
				currentCell++;
			} else {
				if(no === day && month === (now.getMonth() + 1) && year === now.getFullYear()){
					str += "<td><a href='#' onclick='getlist("+(year+","+month+","+no)+")' style='color:red'>"+no + "</a></td>";
				} else {
					str += "<td><a href='#' onclick='getlist("+(year+","+month+","+no)+")'>" + no + "</a></td>";					
				}
				no++;
			}
		}
		str += "</tr>";
	}
	str += "</table>";
	
	document.getElementById("disp").innerHTML = str;
}