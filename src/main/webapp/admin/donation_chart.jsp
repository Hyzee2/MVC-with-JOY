<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자페이지</title>
<link rel="icon" type="image/png" href="./main/tab-logo.png">
<script src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글 차트 -->
<script src="https://cdn.tailwindcss.com"></script>
<script>
	document.addEventListener('DOMContentLoaded', function () {
		google.charts.load('current',{packages:['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawChart();
			pieChart();
		});
		
		
		function drawChart() {

			const data = google.visualization.arrayToDataTable([
				['후원 항목', '총 후원금'],
			  <% 
			  HashMap<String, Integer> dataMap = (HashMap<String, Integer>) request.getAttribute("dataMap");
			  if (dataMap != null && !dataMap.isEmpty()) {
	              for (Map.Entry<String, Integer> entry : dataMap.entrySet()) { // Map.Entry는 Map 인터페이스의 내부 인터페이스
	                  String item = entry.getKey();
	                  int sum = entry.getValue();
	                 
			  %>
			  ['<%= item %>', <%= sum %>],
			  <%
              		}
			  }
			  %>
			]);

			const options = {
			  title: '후원 항목별 총 후원금'
			  
			};

			const chart = new google.visualization.ColumnChart(document.getElementById('amountChart'));
			chart.draw(data, options);

		}
		
		function pieChart() {

			const data = google.visualization.arrayToDataTable([
				['후원 항목', '후원 회원수'],
				
			  <% 
			  HashMap<String, Integer> pieMap = (HashMap<String, Integer>) request.getAttribute("pieMap");
			  if (pieMap != null && !pieMap.isEmpty()) {
	              for (Map.Entry<String, Integer> entry : pieMap.entrySet()) { // Map.Entry는 Map 인터페이스의 내부 인터페이스
	                  String item = entry.getKey();
	                  int sum = entry.getValue();
	                 
			  %>
			  ['<%= item %>', <%= sum %>],
			  <%
              		}
			  }
			  %>
			]);

			const options = {
			  title: '후원 항목별 후원 회원 수'
			  
			};

			const chart = new google.visualization.PieChart(document.getElementById('userChart'));
			chart.draw(data, options);

		}
	});
</script>
<style>
.checked-amount {
	background-color: #262728;
	color: white;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON%20Lv1%20Gothic%20OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF Bold';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON%20Lv1%20Gothic%20OTF%20Bold.woff')
		format('woff');
	font-weight: bold;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.font-light {
	font-family: 'NEXON Lv1 Gothic OTF Light';
}

.font-normal {
	font-family: 'NEXON Lv1 Gothic OTF';
}

.font-bold {
	font-family: 'NEXON Lv1 Gothic OTF Bold';
}
</style>
</head>
<body class="font-normal">
	<!-- 헤더 -->
	<div class="bg-white h-24 flex justify-between pl-10 sticky-top z-50">
		<!-- 로고 -->
		<div class="flex items-center">
			<a href="./Main.lo"> <img class="w-60 h-auto"
				src="https://cdn.imweb.me/thumbnail/20230215/b291d00fc9114.png"
				alt="청소년행복재단 로고">
			</a>
		</div>
	</div>

	<!-- 컨텐츠 섹션 -->
	<div class="container mx-auto mt-10 mb-28 max-w-7xl min-h-[520px]">
		<div class="tab-content">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-10">후원금 현황</h2>
					<div id="amountChart" class="mb-20" style="max-width: 900px; height: 500px"></div>
					<h2 class="text-5xl font-bold mb-10">후원 회원 현황</h2>
					<div id="userChart" class="mb-20" style="max-width: 900px; height: 500px"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer 섹션 -->
	<footer class="bg-[#323a44] text-white mt-20">
		<div class="border-t border-gray-600 pt-8 max-w-7xl container mx-auto">
			<div class="container mx-auto py-10">
				<div class="flex justify-between items-center">
					<div class="flex flex-col items-start ml-8">
						<p class="mb-2">재단법인 청소년행복재단 / 고유번호 : 716-82-00227</p>
						<p class="mb-2">주소 : (06752) 서울특별시 서초구 강남대로 163 혜인빌딩 2층
							청소년행복재단</p>
						<p class="mb-2">대표자 : 민 일 영 / 대표전화 : 02-6284-0061 / 팩스 :
							02-6284-0068</p>
					</div>
					<div class="flex items-center mr-8">
						<a href="#" class="hover:text-yellow-400">이용약관</a> <span
							class="mx-2">|</span> <a href="#" class="hover:text-yellow-400">개인정보취급방침</a>
					</div>
				</div>
			</div>
		</div>

		<div
			class="border-t-4 border-gray-600 pt-8 max-w-7xl container mx-auto"></div>
	</footer>
</body>
</html>