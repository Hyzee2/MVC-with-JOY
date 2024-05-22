<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>청소년행복재단</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
        document.addEventListener('DOMContentLoaded', function () {
        	const tabs = document.querySelectorAll('.tab');
            const sections = document.querySelectorAll('.tab-content');

            const urlParams = new URLSearchParams(window.location.search);
            const target = urlParams.get('data-target') || 'donation'; // 기본값을 'donation'로 설정

            // 초기 탭 및 컨텐츠 설정
            tabs.forEach(tab => {
                if (tab.getAttribute('data-target') === target) {
                    tab.classList.add('active-tab');
                    tab.classList.remove('inactive-tab');
                } else {
                    tab.classList.remove('active-tab');
                    tab.classList.add('inactive-tab');
                }
            });

            sections.forEach(section => {
                if (section.id === target) {
                    section.classList.remove('hidden');
                } else {
                    section.classList.add('hidden');
                }
            });
        });
    </script>
<style>
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

.sticky-top {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	z-index: 50;
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

/* 청소년행복재단 메인 색상 */
.main-color {
	background-color: #006dc0;
}

/* 드롭다운 메뉴 스타일 */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 180px;
	margin-left: 30px;
	/* 오른쪽으로 이동 */
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	border-radius: 0.25rem;
	/* 모서리를 둥글게 */
	transition: all 0.3s ease;
	/* 시간차 효과 */
	z-index: 1000;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	transition: background-color 0.3s ease;
	/* 시간차 효과 */
}

.dropdown-content a:hover {
	background-color: #006dc0;
	color: white;
}

.donation-btn {
	transition: background-color 0.3s, color 0.3s;
}

.donation-btn:hover {
	background-color: #1d5ea4;
	color: white;
	transition: background-color 0.3s, color 0.3s;
}

.inactive-tab {
	background-color: #006dc0;
	color: white;
}

.inactive-tab:hover {
	background-color: white;
	color: black;
	transition: background-color 0.3s, color 0.3s;
}

.active-tab {
	background-color: white;
	color: black;
}

.slide {
	position: absolute;
	width: 100%;
	height: 750px;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.slide-active {
	opacity: 1;
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
		<!-- 메뉴 -->
		<div class="flex items-center space-x-1 text-2xl mx-auto relative">
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">재단소개</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="#">설립취지</a> <a href="#">미션·비전·핵심가치</a> <a href="#">조직도</a>
					<a href="#">업무협약기관</a> <a href="#">CI</a> <a href="#">오시는길</a>
				</div>
			</div>
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">재단소식</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="./JoyStoryList.jo?data-target=joyStory">JOY스토리</a> <a
						href="./NoticeList.no?data-target=pressRelease">언론보도</a> <a
						href="./NoticeList.no?data-target=notices">공지사항</a> <a
						href="./NoticeList.no?data-target=transparency">투명경영</a>
				</div>
			</div>
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">사업안내</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="#">내부사업</a> <a href="#">위수탁사업</a> <a href="#">공모사업</a>
				</div>
			</div>
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">후원하기</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="./DonationList.do?data-target=donation">후원하기</a> <a
						href="./DonationList.do?data-target=company">후원기업/단체</a>
				</div>
			</div>
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">캠페인</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="#">진행중인 캠페인</a> <a href="#">지난 캠페인</a>
				</div>
			</div>
		</div>
		<!-- 후원하기 버튼 -->
		<div class="flex items-center">
			<button onclick="location.href='./DonationList.do?data-target=donation';"
				class="donation-btn bg-yellow-400 text-2xl font-bold h-full w-80 pl-0 mr-0">후원하기</button>
		</div>
	</div>

	<!-- 후원하기 섹션 -->
	<div class="relative bg-gray-100 h-[353px]">
		<img src="https://cdn.imweb.me/thumbnail/20230214/585ab330ad747.png"
			alt="후원하기" class="w-full h-full object-cover">
		<div class="absolute inset-0 flex items-center justify-center">
			<h1 class="text-6xl font-bold" style="color: #4c8caa;">후원하기</h1>
		</div>
	</div>

	<!-- 탭 메뉴 -->
	<div class="bg-white">
		<div class="container mx-auto flex justify-center items-center">
			<div class="flex justify-between items-center w-full max-w-7xl">
				<a href="./DonationList.do?data-target=donation"
					class="tab active-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="donation">후원하기</a> <a
					href="./DonationList.do?data-target=company"
					class="tab inactive-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="company">후원기업/단체</a>
			</div>
		</div>
	</div>

	<!-- 컨텐츠 섹션 -->

	<div id="donation" class="tab-content">
		<div class="container mx-auto mt-10 mb-4 max-w-7xl">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-4">후원하기</h2>
					<div id="trust-section" class="py-16 mt-4">
						<div class="container mx-auto text-center">
							<h2 class="text-5xl font-normal mb-4" style="color: #363636;">
								어려움에 처한 청소년들이 스스로 행복을 찾아갈 수 있도록</h2>
							<h2 class="text-5xl font-normal mb-16" style="color: #363636;">
								함께하는 <span class="font-bold">청소년행복재단</span> 입니다.
							</h2>
							<div
								class="flex justify-center space-x-8 border border-[#d7d7d7]">
								<div class="w-full h-full">
									<img
										src="https://cdn.imweb.me/thumbnail/20230220/ca4d8b256d108.png"
										alt="후원하기" />
								</div>
								<div class="w-full h-full text-[#363636]">
									<h2 class="text-5xl font-normal my-12 mx-3 text-left">후원자님께
										약속 드립니다.</h2>
									<h4 class="text-xl mb-8 mx-3 text-left">
										청소년행복재단은 후원자님께서 보내주시는 후원금을 어려운 청소년들을 위해 단 한푼도 소중하게 잘 사용하겠습니다.<br>헛되이
										쓰이거나 낭비되지 않도록 각별히 노력하겠습니다.<br>더불어 후원자님께서 보내주신 후원금을 어떻게
										사용하고 있는지 상세한 내역을 알려드리도록 하겠습니다.
									</h4>
									<h4 class="text-xl mb-8 mx-3 text-left">
										후원문의: 02)6284-0061<br>후원계좌: 우리은행
										1006-101-528927(예금주:청소년행복재단)
									</h4>
									<div class="flex justify-center space-x-7">
										<a href="./DonationForm.do" target="_blank"
											class="mt-4 bg-[#ffcb05] text-black text-xl font-bold w-60 h-24 flex items-center justify-center rounded"> 후원신청하기 </a> 
										<a href="./ReceiptList.do" target="_blank"
											class="mt-4 bg-white text-black text-xl font-bold border border-black w-60 h-24 flex items-center justify-center rounded"> 기부금영수증 발급 </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 배경 이미지 섹션 -->
		<div class="h-[694px] mb-28"
			style="background-image: url('https://cdn.imweb.me/thumbnail/20230124/d2369a4e4e516.png');">
			<div class="flex items-center justify-center">
				<div class="mx-auto text-center p-16">
					<h2 class="text-5xl font-bold my-12 text-[#363636]">(재)청소년행복재단의
						후원자가 되시면</h2>
					<div class="flex justify-center space-x-[640px]">
						<!-- 첫 번째 박스 -->
						<div class="rounded-lg pt-8 text-center">
							<img
								src="https://cdn.imweb.me/upload/S202210292f0566e82db02/a3ae4e70a9423.png"
								alt="정기소식/각종행사 초청" class="mx-auto mb-4">
						</div>
						<!-- 두 번째 박스 -->
						<div class="rounded-lg pt-8 text-center">
							<img
								src="https://cdn.imweb.me/upload/S202210292f0566e82db02/d036022054d9e.png"
								alt="기부금영수증" class="mx-auto mb-4">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="company" class="tab-content hidden">
		<div class="container mx-auto mt-10 mb-4 max-w-7xl">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-6">후원기업/단체</h2>
					<h3 class="font-normal text-4xl text-blue-500">함께하는 후원기업</h3>
					<p>여기에 언론보도 컨텐츠가 표시됩니다.</p>
					<h3 class="font-normal text-4xl text-blue-500">법률/의료지원 등</h3>
					<p>여기에 언론보도 컨텐츠가 표시됩니다.</p>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer 섹션 -->
	<footer class="bg-[#323a44] text-white mt-20">
		<div class="container mx-auto max-w-7xl">
			<div class="container mx-auto text-center py-10">
				<div class="flex justify-between items-center px-8">
					<h2 class="text-2xl font-light">청소년행복재단의 다양한 미디어를 만나보세요</h2>
					<div class="flex space-x-32">
						<a href="https://www.facebook.com/withjoy.or.kr" target="_blank"><img
							src="https://cdn.imweb.me/thumbnail/20221112/6d60316f81d9d.png"
							alt="Facebook" class="w-12 h-12"></a> <a
							href="https://blog.naver.com/withjoy0191" target="_blank"><img
							src="https://cdn.imweb.me/thumbnail/20221112/480f360f445a6.png"
							alt="Naver Blog" class="w-12 h-12"></a> <a
							href="https://pf.kakao.com/_meRRxb" target="_blank"><img
							src="https://cdn.imweb.me/thumbnail/20230208/c69f295ef4d64.png"
							alt="Kakao Channel" class="w-12 h-12"></a>
					</div>
				</div>
			</div>
		</div>

		<div class="border-t border-gray-600 pt-8 max-w-7xl container mx-auto">
			<div class="container mx-auto text-center py-10">
				<div class="flex justify-between items-center mb-8 px-8 ml-10">
					<img
						src="https://cdn.imweb.me/thumbnail/20230124/7dc4ef8370ced.png"
						alt="청소년행복재단 로고" class="w-60">
					<div class="flex justify-center space-x-10 font-light">
						<a href="#" class="hover:text-yellow-400">재단소개</a> <a href="#"
							class="hover:text-yellow-400">재단소식</a> <a href="#"
							class="hover:text-yellow-400">사업안내</a> <a href="#"
							class="hover:text-yellow-400">후원하기</a> <a href="#"
							class="hover:text-yellow-400">캠페인</a>
					</div>
				</div>
			</div>
		</div>

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