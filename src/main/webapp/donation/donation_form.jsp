<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>청소년행복재단과 함께합니다</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const regularButton = document.getElementById('regularButton');
		const oneTimeButton = document.getElementById('oneTimeButton');

		function toggleButton(buttonToActivate, buttonToDeactivate) {
			buttonToActivate.classList.add('bg-[#262728]', 'text-white');
			buttonToActivate.classList.remove('bg-white', 'text-black');
			buttonToDeactivate.classList.add('bg-white', 'text-black');
			buttonToDeactivate.classList.remove('bg-[#262728]', 'text-white');
		}

		regularButton.addEventListener('click', function() {
			toggleButton(regularButton, oneTimeButton);
		});

		oneTimeButton.addEventListener('click', function() {
			toggleButton(oneTimeButton, regularButton);
		});
	});
</script>
<style>
.selected-bg {
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
<body class="bg-gray-100 font-normal">
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

	<!-- 후원하기 폼 -->
	<div class="container mx-auto mt-24 mb-4 max-w-7xl">
		<div class="bg-white shadow-lg rounded-lg p-16"
			style="width: 60%; margin: auto;">
			<div class="border-b border-gray-800 mb-8">
				<h2 class="text-3xl mb-8 text-center">후원하기</h2>
			</div>

			<!-- 후원하기 회원가입 폼 -->
			<form>
				<div class="border-b border-gray-800 mb-8">
					<h3 class="text-xl font-bold mb-8">
						<span class="text-red-500">*&nbsp;</span>후원정보(필수)
					</h3>
					<div class="mb-4">
						<label class="block mb-2">후원항목</label> <select
							class="w-full py-2 px-4 border border-gray-300">
							<option>위기청소년 지원</option>
						</select>
					</div>
					<div class="mb-8">
						<label class="block mb-2">후원금액</label>
						<div class="grid grid-rows-2">
							<div class="grid grid-flow-col justify-around p-2">
								<button type="button"
									class="py-2 w-48 border border-gray-300 focus:outline-none">1만원</button>
								<button type="button" 
									class="py-2 w-48 border border-gray-300 focus:outline-none">2만원</button>
								<button type="button" 
									class="py-2 w-48 border border-gray-300 focus:outline-none">3만원</button>
							</div>
							<div class="grid grid-flow-col justify-around p-2">
								<button type="button" 
									class="py-2 w-48 border border-gray-300 focus:outline-none">5만원</button>
								<button type="button" 
									class="py-2 w-48 border border-gray-300 focus:outline-none">10만원</button>
								<button type="button" 
									class="py-2 w-48 border border-gray-300 focus:outline-none">직접입력</button>
							</div>
						</div>
					</div>
				</div>

				<div class="border-b border-gray-800 mb-8">
					<h3 class="text-xl font-bold mb-8">
						<span class="text-red-500">*&nbsp;</span>납부방법(필수)
					</h3>
					<div class="mb-4">
						<label class="block mb-2">은행</label> <select
							class="w-full py-2 px-4 border border-gray-300">
							<option>은행명을 선택하세요</option>
							<option>국민</option>
							<option>신한</option>
							<option>우리</option>
							<option>하나</option>
							<option>농협</option>
						</select>
					</div>
					<div class="mb-4">
						<label class="block mb-2">계좌번호</label> <input type="text"
							class="w-full py-2 px-4 border border-gray-300"
							placeholder="계좌번호를 입력하세요">
					</div>
					<div class="mb-8">
						<label class="block mb-2">출금일</label>
						<div class="grid grid-flow-col justify-around p-2">
							<button type="button" 
								class="py-2 w-48 border border-gray-300 focus:outline-none">매월
								5일</button>
							<button type="button" 
								class="py-2 w-48 border border-gray-300 focus:outline-none">매월
								15일</button>
							<button type="button" 
								class="py-2 w-48 border border-gray-300 focus:outline-none">매월
								25일</button>
						</div>
					</div>
				</div>

				<div class="mb-16">
					<h3 class="text-xl font-bold mb-8">
						<span class="text-red-500">*&nbsp;</span>이용약관 동의(필수)
					</h3>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">이용약관에 모두 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">(필수) 이용약관에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">(필수) 개인정보 수집・이용에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">(필수) 개인정보 제3자 제공에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">(필수) 고유식별정보 처리에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-8">
						<input type="checkbox" class="mr-2 w-6 h-6"> <label
							class="font-light text-base">(선택) 캠페인 및 행사안내를 위한 정보 수집 및
							이용에 동의합니다.</label>
					</div>
				</div>

				<div class="text-center">
					<button type="submit"
						class="bg-black text-xl text-white py-5 px-24 rounded-sm">후원하기</button>
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