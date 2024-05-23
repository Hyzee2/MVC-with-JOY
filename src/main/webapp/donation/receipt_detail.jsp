<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="net.donation.db.*"%>
<%
DonationBean donation = (DonationBean) request.getAttribute("donationdata");
DonationBean before = (DonationBean) request.getAttribute("donationBefore");
String email = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>기부금영수증 상세보기</title>
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

.title {
	font-size: 20px;
	font-weight: bold;
}

.content {
	font-size: 16px;
}

.previous-title {
	font-size: 14px;
}

.previous-title:hover {
	font-size: 14px;
	background-color: #F7F7F7;
	padding: 8px;
	transition: background-color 0.3s, color 0.3s;
}

.button {
	width: 120px;
	height: 35px;
	background-color: #FFD700;
	color: black;
	font-size: 14px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
}

.button:hover {
	background-color: #1d5ea4;
	color: white;
	transition: background-color 0.3s, color 0.3s;
}
</style>
</head>
<body class="bg-gray-100 font-normal">
	<%
	if (email == null) {
	%>
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "./ReceiptLogin.do";
	</script>
	<%
	} else {
	%>

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

	<div class="container mx-auto mt-10 mb-28 max-w-7xl">
		<div class="bg-white">
			<div class="p-8">
				<h2 class="text-5xl font-bold mb-10">기부금영수증</h2>

				<h1 class="text-2xl font-light title mb-4"><%=donation.getItem()%>&nbsp;기부금 영수증 상세내역</h1>
				<div class="text-sm font-light mb-6 text-gray-500">
					기부금영수증&nbsp;&nbsp;
				</div>
				<div class="border-b border-gray-300 mb-6"></div>
				<div class="content font-light mb-6 text-lg">
					후원 신청일자:&nbsp;&nbsp; <%=donation.getStart_date()%>
				</div>
				<div class="content font-light mb-6 text-lg">
					후원 출금일:&nbsp;&nbsp; <%=donation.getPayment_date()%>
				</div>
				<div class="content font-light mb-6 text-lg">
					후원 금액:&nbsp;&nbsp; <%=donation.getAmount()%> 원
				</div>
				<div class="content font-light mb-6 text-lg">
					출금 은행:&nbsp;&nbsp; <%=donation.getBank_name()%>
				</div>
				<div class="content font-light mb-6 text-lg">
					출금 계좌:&nbsp;&nbsp; <%=donation.getAccount_number()%>
				</div>

				<!-- 이전 공지사항 -->
				<%
				if (before != null) {
				%>
				<a
					href="./DonationDetailAction.do?&num=<%=before.getDonation_id()%>"
					class="font-light text-base">
					<div class="previous-title p-2">
						<span class="text-gray-400 font-light text-lg">∨</span>&nbsp;&nbsp;&nbsp;
						<span class="font-light text-lg"><%=before.getItem()%></span>&nbsp;&nbsp;&nbsp;
						<span class="font-light text-lg"><%=before.getStart_date()%></span>
					</div>
				</a>
				<%
				}
				%>
				<div class="border-b border-gray-300 mb-3"></div>
				<div class="flex items-center justify-between">
					<!-- 목록 버튼 -->
					<a href="./ReceiptList.do?email="<%=email %> class="button">
						목록 </a>
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
	<%
	}
	%>

</body>
</html>