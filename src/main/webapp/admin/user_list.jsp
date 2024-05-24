<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="net.user.db.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<Map.Entry<UserBean, String>> userlist = (List<Map.Entry<UserBean, String>>)request.getAttribute("userlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자페이지</title>
<link rel="icon" type="image/png" href="./main/tab-logo.png">
<script src="https://cdn.tailwindcss.com"></script>
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
<body>
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
					<h2 class="text-5xl font-bold mb-10">회원목록</h2>
					<table
						class="w-full text-left border-collapse font-light text-[#363636]">
						<thead class="text-lg">
							<tr>
								<th class="py-4 px-6 border-b border-t-2">회원번호</th>
								<th class="py-4 px-6 border-b border-t-2 text-center">회원메일</th>
								<th class="py-4 px-6 border-b border-t-2 text-center">회원이름</th>
								<th class="py-4 px-6 border-b border-t-2 text-center">총 후원금</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (userlist != null) {
								for (Map.Entry<UserBean, String> entry : userlist) {
									UserBean user = entry.getKey();
									String totalDonation = entry.getValue();
							%>
							<tr>
								<!--여기에서는 데이터 불러오기 -->
								<td class="py-4 px-6 border-b text-xl"><%=user.getUser_id()%></td>
								<td class="py-4 px-6 border-b text-xl text-center"><%=user.getEmail()%></td>
								<td class="py-4 px-6 border-b text-xl text-center"><%=user.getName()%></td>
								<td class="py-4 px-6 border-b text-xl text-center"><%=totalDonation%>원</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
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