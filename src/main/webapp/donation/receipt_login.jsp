<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>기부금영수증</title>
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

	<div class="flex items-center justify-center min-h-[520px]">
		<div class="w-full max-w-lg mx-auto">
			<form action="./ReceiptAction.do" method="post"
				class="bg-white p-8">
				<div class="mb-6">
					<input type="email" name="email" placeholder="이메일을 입력하세요."
						class="w-full py-3 px-4 border-b border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-600 placeholder-gray-400"
						required>
				</div>
				<div class="mb-6">
					<input type="password" name="password" placeholder="비밀번호를 입력하세요."
						class="w-full py-3 px-4 border-b border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-600 placeholder-gray-400"
						required>
				</div>
				<div class="mb-6 mt-12">
					<button type="submit"
						class="w-full py-4 bg-[#262728] text-white font-bold rounded">로그인</button>
				</div>
				<div class="text-center text-gray-500">
					<div class="flex justify-between">
						<a href="#" class="text-sm">회원가입</a>
						<div>
							<a href="#" class="text-sm">아이디찾기</a> | <a
								href="#" class="text-sm">비밀번호찾기</a>
						</div>
					</div>
				</div>
			</form>
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