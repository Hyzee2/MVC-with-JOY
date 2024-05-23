<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String email = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>청소년행복재단과 함께합니다</title>
<link rel="icon" type="image/png" href="./main/tab-logo.png">
<script src="https://cdn.tailwindcss.com"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		const allAgreeCheckbox = document.getElementById('allAgree');
	    const individualCheckboxes = document.querySelectorAll('.individual-agree'); // 배열로 받는다

        allAgreeCheckbox.addEventListener('change', function () { // 체크박스 상태 변경 이벤트리스너 
            individualCheckboxes.forEach(checkbox => { // 각 체크박스 요소에 대한 콜백함수. 배열의 각 요소에 대해 forEach 내부함수를 한 번씩 실행한다 
                checkbox.checked = allAgreeCheckbox.checked; // '모두동의' 체크박스의 상태와 동일하게 '개별동의' 상태를 설정한다 
            });
        });

        individualCheckboxes.forEach(checkbox => { // 각 체크박스 요소에 대한 콜백함수 
            checkbox.addEventListener('change', function () {
                if (!checkbox.checked) {
                    allAgreeCheckbox.checked = false;
                } else {
                    const allChecked = Array.from(individualCheckboxes).every(cb => cb.checked);
                    allAgreeCheckbox.checked = allChecked;
                }
            });
        });
        
        const amountLabels = document.querySelectorAll('label[for^="amount_"]'); // 태그: 라벨
        
        amountLabels.forEach(label => {
            label.addEventListener('click', function () { // 배열로 참조된 라벨 태그들을 하나씩 꺼내기 
                amountLabels.forEach(lbl => lbl.classList.remove('checked-amount')); // 스타일 적용되기 전에 전체 라벨 태그 요소를 돌면서 스타일 지우기 
                label.classList.add('checked-amount'); // 클릭한 라벨의 스타일 추가하기 
            });
        });
        
        const dateLabels = document.querySelectorAll('label[for^="date_"]'); // 태그: 라벨
        
        dateLabels.forEach(label => {
            label.addEventListener('click', function () { // 배열로 참조된 라벨 태그들을 하나씩 꺼내기 
            	dateLabels.forEach(lbl => lbl.classList.remove('checked-amount')); // 스타일 적용되기 전에 전체 라벨 태그 요소를 돌면서 스타일 지우기 
                label.classList.add('checked-amount'); // 클릭한 라벨의 스타일 추가하기 
            });
        });
        
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
<body class="bg-gray-100 font-normal">
<%
if(email == null){
	%>
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="./Main.lo";
	</script>
	<%
	
}else{ %>

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
			<form action="./DonationAction.do" method="post">
				<input type="text" name="email" value="<%=email %>" class="hidden" />
				<div class="border-b border-gray-800 mb-8">
					<h3 class="text-xl font-bold mb-8">
						<span class="text-red-500">*&nbsp;</span>후원정보(필수)
					</h3>
					<div class="mb-4">
						<label class="block mb-2">후원항목</label> <select
							class="w-full py-2 px-4 border border-gray-300"
							name="item">
							<option>위기청소년 지원</option>
							<option>청소년 교육 지원</option>
							<option>청소년 환경 지원</option>
						</select>
					</div>
					<div class="mb-8">
						<label class="block mb-2">후원금액</label>
						<div class="grid grid-rows-2">
							<div class="grid grid-flow-col justify-around p-2">
								<input type="radio" name="amount" value="10000"
									id="amount_1" class="hidden"> <label for="amount_1"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">1만원</label>
								<input type="radio" name="amount" value="20000"
									id="amount_2" class="hidden"> <label for="amount_2"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">2만원</label>
								<input type="radio" name="amount" value="30000"
									id="amount_3" class="hidden"> <label for="amount_3"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">3만원</label>
							</div>
							<div class="grid grid-flow-col justify-around p-2">
								<input type="radio" name="amount" value="50000"
									id="amount_4" class="hidden"> <label for="amount_4"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">5만원</label>
								<input type="radio" name="amount" value="100000"
									id="amount_5" class="hidden"> <label for="amount_5"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">10만원</label>
								<input type="radio" name="amount" value="other"
									id="amount_6" class="hidden"> <label for="amount_6"
									class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">직접입력</label>
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
							class="w-full py-2 px-4 border border-gray-300" name="bank_name">
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
							placeholder="계좌번호를 입력하세요" name="account_number">
					</div>
					<div class="mb-8">
						<label class="block mb-2">출금일</label>
						<div class="grid grid-flow-col justify-around p-2">
							<input type="radio" name="payment_date" value="5일" id="date_1"
								class="hidden"> <label for="date_1"
								class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">매월
								5일</label> <input type="radio" name="payment_date" value="15일"
								id="date_2" class="hidden"> <label for="date_2"
								class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">매월
								15일</label> <input type="radio" name="payment_date" value="25일"
								id="date_3" class="hidden"> <label for="date_3"
								class="py-2 w-48 border border-gray-300 text-center cursor-pointer hover:bg-[#262728] hover:text-white">매월
								25일</label>
						</div>
					</div>
				</div>

				<div class="mb-16">
					<h3 class="text-xl font-bold mb-8">
						<span class="text-red-500">*&nbsp;</span>이용약관 동의(필수)
					</h3>
					<div class="flex items-center mb-4">
						<input type="checkbox" id="allAgree" class="mr-2 w-6 h-6">
						<label class="font-light text-base">이용약관에 모두 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="individual-agree mr-2 w-6 h-6">
						<label class="font-light text-base">(필수) 이용약관에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="individual-agree mr-2 w-6 h-6">
						<label class="font-light text-base">(필수) 개인정보 수집・이용에
							동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="individual-agree mr-2 w-6 h-6">
						<label class="font-light text-base">(필수) 개인정보 제3자 제공에
							동의합니다.</label>
					</div>
					<div class="flex items-center mb-4">
						<input type="checkbox" class="individual-agree mr-2 w-6 h-6">
						<label class="font-light text-base">(필수) 고유식별정보 처리에 동의합니다.</label>
					</div>
					<div class="flex items-center mb-8">
						<input type="checkbox" class="individual-agree mr-2 w-6 h-6">
						<label class="font-light text-base">(선택) 캠페인 및 행사안내를 위한 정보
							수집 및 이용에 동의합니다.</label>
					</div>
				</div>

				<div class="text-center">
					<button type="submit"
						class="bg-[#262728] text-xl text-white py-5 px-24 rounded-sm">후원하기</button>
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
	<%} %>
</body>
</html>