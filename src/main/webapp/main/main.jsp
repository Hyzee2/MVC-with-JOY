<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String email = (String) session.getAttribute("email");
Boolean isAdmin = (Boolean) session.getAttribute("admin");
boolean admin = isAdmin != null && isAdmin;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>청소년행복재단</title>
<link rel="icon" type="image/png" href="./main/tab-logo.png">
<script src="https://cdn.tailwindcss.com"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
      let currentSlide = 0;
      const slides = document.querySelectorAll('.slide');
      const navButtons = document.querySelectorAll('.nav-button');
      const totalSlides = slides.length;

      function showSlide(index) {
        slides.forEach((slide, i) => {
          slide.classList.remove('slide-active');
          navButtons[i].classList.remove('bg-white');
          navButtons[i].classList.add('bg-transparent');
          if (i === index) {
            slide.classList.add('slide-active');
            navButtons[i].classList.remove('bg-transparent');
            navButtons[i].classList.add('bg-white');
          }
        });
      }

      function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
      }

      function goToSlide(index) {
        currentSlide = index;
        showSlide(index);
      }

      setInterval(nextSlide, 5000); // 5초마다 슬라이드 변경

      navButtons.forEach((button, index) => {
        button.addEventListener('click', () => {
          goToSlide(index);
        });
      });

      const section = document.getElementById('animated-section');
      const vennDiagram = document.getElementById('venn-diagram');
      const textBox = document.getElementById('text-box');

      const observerOptions = {
        threshold: 0.5
      };

      const observer = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            section.classList.remove('opacity-0');
            section.classList.add('opacity-100');
            vennDiagram.classList.remove('translate-x-[-100%]');
            vennDiagram.classList.add('translate-x-0');
            textBox.classList.remove('translate-x-[100%]');
            textBox.classList.add('translate-x-0');
          }
        });
      }, observerOptions);

      observer.observe(section);

      const statBoxes = document.querySelectorAll('.stat-box');

      const statObserver = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.remove('translate-y-16');
            entry.target.classList.add('translate-y-0');
            statObserver.unobserve(entry.target);
          }
        });
      }, observerOptions);

      statBoxes.forEach(box => {
        statObserver.observe(box);
      });
	
      // 로그인 모달 
      const openLoginModal = document.getElementById('openLoginModal');
      const modal = document.getElementById('loginModal');
      const closeBtn = document.getElementById('closeModal');

      openLoginModal.onclick = function () {
        modal.style.display = 'flex';
        modal.style.zIndex = '1000';  // 모달이 열릴 때 z-index 값을 높게 설정
      }

      closeBtn.onclick = function () {
        modal.style.display = 'none';
        modal.style.zIndex = '1';  // 모달이 닫힐 때 z-index 값을 낮게 설정
      }

      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = 'none';
          modal.style.zIndex = '1';  // 모달이 닫힐 때 z-index 값을 낮게 설정
        }
      }

      // 회원가입 모달 
      const openSignupModal = document.getElementById('openSignupModal');
      const signupModal = document.getElementById('signupModal');
      const closeSignupModal = document.getElementById('closeSignupModal');

      openSignupModal.onclick = function () {
        signupModal.style.display = 'flex';
        signupModal.style.zIndex = '1000';
      }

      closeSignupModal.onclick = function () {
        signupModal.style.display = 'none';
        signupModal.style.zIndex = '1';
      }

      window.onclick = function (event) {
        if (event.target == signupModal) {
          signupModal.style.display = 'none';
          signupModal.style.zIndex = '1';
        }
      }
      
   	  // 로그인 모달에서 '회원가입' 클릭 시 로그인 모달 닫기 및 회원가입 모달 열기
      const switchToSignupLink = document.getElementById('switchToSignup');
      switchToSignupLink.addEventListener('click', function (e) {
          e.preventDefault();
          modal.style.display = 'none';
          signupModal.style.display = 'flex';
          signupModal.style.zIndex = '1000';
      });
      
   	  // 회원가입 시 비밀번호 유효성 검사 추가
      const signupForm = document.getElementById('signupForm');
      const password = document.getElementById('password');
      const confirmPassword = document.getElementById('confirmPassword');

      signupForm.addEventListener('submit', function(event) {
          if (password.value !== confirmPassword.value) {
              alert('비밀번호가 일치하지 않습니다.');
              event.preventDefault(); // 폼 제출 중지
          }
      });
      
      // 로그인 시 유효성 검사 추가 
      const loginForm = document.getElementById('loginForm');
      const lgpassword = document.getElementById('lgpassword');
      const lgemail = document.getElementById('lgemail');

      loginForm.addEventListener('submit', function(event) {
    	  if(!lgemail.value){
				alert("이메일을 입력하세요!");
				event.preventDefault(); // 폼 제출 중지
				return false;
			}
			if(lgpassword.value == ''){
				alert("비밀번호를 입력하세요!");
				event.preventDefault(); // 폼 제출 중지
				return false;
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

body {
	background-color: #f9f7f4;
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

.login-button, .signup-button {
	background-color: #ffcb05;
	color: black;
	transition: background-color 0.3s, color 0.3s;
}

.login-button:hover, .signup-button:hover {
	background-color: #1d5ea4;
	color: white;
}

.donation-btn {
	transition: background-color 0.3s, color 0.3s;
}

.donation-btn:hover {
	background-color: #1d5ea4;
	color: white;
}

.modal {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	width: 400px;
	text-align: center;
	position: relative;
}

.close {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body class="font-normal">
	<!-- 상단 바 -->
	<div
		class="font-light bg-gray-100 h-11 relative flex justify-end items-center pr-10 space-x-4 sticky-top">
		<button class="main-color text-white w-32 h-11 text-sm"
			onclick="window.open('./ReceiptLogin.do', '_blank');">기부금영수증</button>
		<%
		if (email == null) {
		%>
		<button id="openLoginModal" class="text-gray-600 text-sm">로그인</button>
		<%
		} else {
		%>
		<button id="logoutBtn" class="text-gray-600 text-sm"
			onclick="location.href='./LogoutAction.lo'">로그아웃</button>
		<%
		}
		%>
		<div class="text-gray-300">|</div>
		<button id="openSignupModal" class="text-gray-600 text-sm">회원가입</button>
	</div>

	<!-- 로그인 모달 -->
	<div id="loginModal" class="modal flex" style="display: none;">
		<div class="modal-content">
			<span id="closeModal" class="close text-gray-300">&times;</span>
			<h2 class="text-2xl font-bold pb-8 pt-5">로그인</h2>
			<form action="./LoginAction.lo" method="post" id="loginForm">
				<div>
					<input type="email" name="email" id="lgemail"
						class="w-full p-2 border border-gray-300 font-light"
						placeholder="이메일">
				</div>
				<div class="mb-4">
					<input type="password" name="password" id="lgpassword"
						class="w-full p-2 border border-gray-300 font-light"
						placeholder="비밀번호">
				</div>
				<div class="mb-4 flex items-center">
					<input type="checkbox" class="mr-2"> <label
						for="remember-me" class="font-light text-lg">로그인 상태유지</label>
				</div>
				<button type="submit" id="loginBtn"
					class="login-button w-full py-2 rounded font-normal">로그인</button>
			</form>
			<div class="mt-4 mb-5 flex justify-between">
				<a href="#" id="switchToSignup" class="text-gray-700 font-light">회원가입</a>
				<a href="#" class="text-gray-700 font-light">아이디・비밀번호 찾기</a>
			</div>
		</div>
	</div>

	<!-- 회원가입 모달 -->
	<div id="signupModal" class="modal flex" style="display: none;">
		<div class="modal-content">
			<span id="closeSignupModal" class="close text-gray-300">&times;</span>
			<h2 class="text-2xl font-bold pb-5 pt-5">회원가입</h2>
			<form id="signupForm" method="post" action="./Signup.lo">
				<div class="mb-5">
					<div class="flex justify-center">
						<div class="relative">
							<img src="https://withjoy.or.kr/common/img/default_profile.png"
								alt="프로필 이미지" class="w-24 h-24 rounded-full">
						</div>
					</div>
				</div>
				<div>
					<input type="email" name="email"
						class="w-full p-2 border border-gray-300 font-light"
						placeholder="이메일"> <input type="password" name="password"
						id="password" class="w-full p-2 border border-gray-300 font-light"
						placeholder="비밀번호"> <input type="password"
						id="confirmPassword"
						class="w-full p-2 border border-gray-300 font-light mb-8"
						placeholder="비밀번호 확인">
					<p class="font-normal mb-4 text-left text-gray-700">이름</p>
					<input type="text" name="name"
						class="w-full p-2 border border-gray-300 font-light mb-8"
						placeholder="이름">
				</div>
				<button type="submit" id="signupBtn"
					class="signup-button w-full py-2 rounded font-normal">가입하기</button>
			</form>
		</div>
	</div>

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
						href="./NewsList.ne?data-target=pressRelease">언론보도</a> <a
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
			<%if(admin){ %>
			<div class="dropdown relative">
				<span class="hover:text-blue-600 cursor-pointer px-8 font-medium">관리자</span>
				<div
					class="font-normal dropdown-content text-base rounded drop-shadow transition duration-300">
					<a href="./DonationView.do">후원금 현황</a> <a href="#">회원관리</a>
				</div>
			</div>
			<%} %>
		</div>
		<!-- 후원하기 버튼 -->
		<div class="flex items-center">
			<button
				onclick="location.href='./DonationList.do?data-target=donation';"
				class="donation-btn bg-yellow-400 text-2xl font-bold h-full w-80 pl-0 mr-0">후원하기</button>
		</div>
	</div>

	<!-- 메인 배너 -->
	<div class="relative overflow-hidden" style="height: 750px;">
		<div class="slide slide-active">
			<img class="w-full h-full object-cover"
				src="https://cdn.imweb.me/thumbnail/20240513/ff6a80fa825cb.png"
				alt="슬라이드 이미지 1">
			<div class="absolute inset-0 flex items-center justify-start ml-52">
				<div class="text-white text-left z-10">
					<h2 class="text-2xl font-bold">청소년 지원 캠페인</h2>
					<br> <br>
					<h1 class="text-5xl font-bold leading-tight">
						지하철 택배기사 남규에게<br> <span
							class="main-color text-blue-200 px-2 py-0.5">여름 여행</span>을
						선물해주세요.
					</h1>
					<br> <a
						href="https://happybean.naver.com/donations/H000000195255?p=p&s=ns"
						target="_blank"
						class="mt-4 bg-yellow-400 text-black text-xl font-bold w-52 h-14 flex items-center justify-center rounded">응원하기</a>
				</div>
			</div>
		</div>
		<div class="slide">
			<img class="w-full h-full object-cover"
				src="https://cdn.imweb.me/thumbnail/20240513/e20052c93b1fa.jpg"
				alt="슬라이드 이미지 2">
			<div class="absolute inset-0 flex items-center justify-end mr-52">
				<div class="text-white text-right z-10">
					<h2 class="text-2xl font-bold">청소년 지원 캠페인</h2>
					<br> <br>
					<h1 class="text-5xl font-bold leading-tight">
						나보다 이웃을 먼저 생각하는<br> <span class="px-2 py-0.5"
							style="background-color: rgb(225, 117, 0);">자립준비청년</span> 찬민이와 동우
					</h1>
					<br>
					<div class="flex justify-end">
						<a
							href="https://happybean.naver.com/donations/H000000194895?p=p&s=ns"
							target="_blank"
							class="mt-4 bg-yellow-400 text-black text-xl font-bold w-52 h-14 flex items-center justify-center rounded">응원하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="slide">
			<img class="w-full h-full object-cover"
				src="https://cdn.imweb.me/thumbnail/20240308/6e41acace329f.jpg"
				alt="슬라이드 이미지 3">
			<div class="absolute inset-0 flex items-center justify-start ml-52">
				<div class="text-white text-left z-10">
					<h2 class="text-2xl font-bold">청소년 지원 캠페인</h2>
					<br> <br>
					<h1 class="text-5xl font-bold leading-tight">
						대한민국 최고의 <span class="px-2 py-0.5"
							style="background-color: rgb(229, 229, 229); color: rgb(150, 44, 44);">성악가</span>를<br>꿈꾸는
						우혁이를 응원해주세요.
					</h1>
					<br> <a
						href="https://happybean.naver.com/donations/H000000194337"
						target="_blank"
						class="mt-4 bg-yellow-400 text-black text-xl font-bold w-52 h-14 flex items-center justify-center rounded">응원하기</a>
				</div>
			</div>
		</div>
		<div class="slide">
			<img class="w-full h-full object-cover"
				src="https://cdn.imweb.me/thumbnail/20240426/abfb0a0a2676e.jpg"
				alt="슬라이드 이미지 4">
			<div
				class="absolute inset-0 flex items-center justify-end mr-52 mt-52">
				<div class="text-white text-right z-10">
					<h1 class="text-5xl font-bold leading-tight">
						<span class="main-color px-2 py-0.5">어려움에 처한 청소년들이<br>스스로
							행복한 삶을 살아갈 수 있도록<br>끝까지 함께합니다.
						</span>
					</h1>
					<br>
					<div class="flex justify-end">
						<a href="#"
							class="mt-4 bg-yellow-400 text-black text-xl font-bold w-52 h-14 flex items-center justify-center rounded">응원하기</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 네비게이션 버튼 -->
		<div
			class="absolute bottom-0 w-full flex justify-center space-x-4 pb-10">
			<button
				class="nav-button w-3 h-3 bg-white border border-white rounded-full"
				onclick="goToSlide(0)"></button>
			<button
				class="nav-button w-3 h-3 bg-transparent border border-white rounded-full"
				onclick="goToSlide(1)"></button>
			<button
				class="nav-button w-3 h-3 bg-transparent border border-white rounded-full"
				onclick="goToSlide(2)"></button>
			<button
				class="nav-button w-3 h-3 bg-transparent border border-white rounded-full"
				onclick="goToSlide(3)"></button>
		</div>
	</div>

	<!-- 메인 콘텐츠 -->
	<div class="p-10 mx-56 my-10">
		<div class="mt-5 grid grid-cols-4 gap-10">
			<h2 class="font-normal text-3xl">JOY스토리</h2>
			<a href="./JoyStoryList.jo?data-target=joyStory"
				class="font-light text-grey-600 text-right">더보기</a>
			<h2 class="font-normal text-3xl">언론보도</h2>
			<a href="./NewsList.ne?data-target=pressRelease"
				class="font-light text-grey-600 text-right">더보기</a>
		</div>
		<div class="mt-5 grid grid-cols-2 gap-10">
			<div class="bg-white rounded pb-5">
				<img class="w-full h-auto rounded-t-md"
					src="https://cdn.imweb.me/thumbnail/20240518/80baeb89042a9.jpg"
					alt="JOY스토리 이미지">
				<div class="flex flex-col">
					<p class="mt-5 ml-8 text-gray-600 text-xl">청소년과 함께하는 꽃 심기 행사 진행</p>
					<p class="mt-2 ml-8 py-3 text-gray-400 text-sm">1일전</p>
				</div>
			</div>
			<div class="bg-white rounded">
				<img class="w-full rounded-t-md" style="height: 670px;"
					src="https://cdn.imweb.me/thumbnail/20240220/f0c61317b39f9.jpg"
					alt="언론보도 이미지">
				<div class="flex flex-col">
					<p class="mt-5 ml-8 text-gray-600 text-xl">서울가정법원과 청소년행복재단이
						함께하는 '안녕(安寧)! 가족학교' 운영</p>
					<p class="mt-2 ml-8 py-3 text-gray-400 text-sm">2024-02-20</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 배경 이미지 섹션 -->
	<div id="animated-section"
		class="relative h-[694px] bg-cover bg-center opacity-0 transition-opacity duration-700 mt-20"
		style="background-image: url('https://cdn.imweb.me/thumbnail/20230131/971437e665849.jpg');">
		<div class="absolute inset-0 flex items-center justify-center">
			<div class="flex items-center space-x-28">
				<!-- 벤 다이어그램 이미지 -->
				<div id="venn-diagram"
					class="w-[500px] transform translate-x-[-100%] transition-transform duration-700">
					<img
						src="https://cdn.imweb.me/upload/S202210292f0566e82db02/21af83c0ca794.png"
						alt="벤 다이어그램" class="w-full h-auto">
				</div>
				<!-- 텍스트 박스 -->
				<div id="text-box"
					class="text-white max-w-lg transform translate-x-[100%] transition-transform duration-700">
					<p class="text-lg font-light">
						위기 청소년은 대부분 가정 문제로부터 시작하고,<br>다양한 사회문제가 얽히고설켜 심화됩니다.<br>(가족
						갈등 및 해체, 가정폭력, 방임 등)<br>청소년들은 결국 비행과 범죄에 노출되고<br>그 어디에서도
						돌보고 책임지기를 꺼리는 존재가 됩니다.
					</p>
					<p class="mt-4 text-lg font-light">
						청소년행복재단은<br>보호의 사각지대에서 어려움에 처한<br>청소년들과 함께하고 있습니다.
					</p>
					<button
						class="mt-6 bg-yellow-400 text-black text-lg font-bold py-3 px-8">사업안내</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 투명하고 믿을 수 있는 청소년행복재단 섹션 -->
	<div id="trust-section" class="bg-gray-100 py-16 mt-20">
		<div class="container mx-auto text-center">
			<h2 class="text-5xl font-normal mb-8" style="color: #363636;">투명하고
				믿을 수 있는 청소년행복재단</h2>
			<div class="flex justify-center space-x-4">
				<!-- 첫 번째 박스 -->
				<div
					class="stat-box bg-[#ffcb05] rounded-lg pt-8 pb-5 text-center transform translate-y-16 transition-transform duration-700 w-1/5">
					<img
						src="https://cdn.imweb.me/upload/S202210292f0566e82db02/2809e66b78404.png"
						alt="청소년 지원" class="mx-auto mb-4">
					<div class="flex justify-center items-end mb-3">
						<h3 class="text-6xl font-bold">395</h3>
						<p class="font-normal text-xl ml-2">명</p>
					</div>
					<p class="mt-7">
					<div class="bg-white p-3 mx-3 rounded-lg text-xl font-light">
						청소년 지원<br>(안정적 자립 지원)
					</div>
					</p>
				</div>
				<!-- 두 번째 박스 -->
				<div
					class="stat-box bg-[#5cc09c] rounded-lg pt-8 text-center transform translate-y-16 transition-transform duration-700 w-1/5">
					<img
						src="https://cdn.imweb.me/upload/S202210292f0566e82db02/3c299bbf96ae1.png"
						alt="거리청소년 무료도시락" class="mx-auto mb-4">
					<div class="flex justify-center items-end mb-3">
						<h3 class="text-6xl font-bold">4,380</h3>
						<p class="font-normal text-xl ml-2">끼</p>
					</div>
					<p class="mt-7">
					<div class="bg-white p-3 mx-3 rounded-lg text-xl font-light">
						거리청소년 무료도시락<br>(청소년행복편의점)
					</div>
					</p>
				</div>
				<!-- 세 번째 박스 -->
				<div
					class="stat-box bg-[#ee6b8d] rounded-lg pt-8 text-center transform translate-y-16 transition-transform duration-700 w-1/5">
					<img
						src="https://cdn.imweb.me/upload/S202210292f0566e82db02/a51c261d50115.png"
						alt="주거지원 환산금액" class="mx-auto mb-4">
					<div class="flex justify-center items-end mb-3">
						<h3 class="text-6xl font-bold">38,726</h3>
						<p class="font-normal text-xl ml-2">만원</p>
					</div>
					<p class="mt-7">
					<div class="bg-white p-3 mx-3 rounded-lg text-xl font-light">
						주거지원 환산금액<br>(행복하우스/행복홈)
					</div>
					</p>
				</div>
				<!-- 네 번째 박스 -->
				<div
					class="stat-box bg-[#006dc0] rounded-lg pt-8 text-center transform translate-y-16 transition-transform duration-700 w-1/5">
					<img
						src="https://cdn.imweb.me/upload/S202210292f0566e82db02/5ece8d351148a.png"
						alt="재단 사업비" class="mx-auto mb-4">
					<div class="flex justify-center items-end mb-3">
						<h3 class="text-6xl font-extrabold">42,996</h3>
						<p class="font-normal text-xl ml-2">만원</p>
					</div>
					<p class="mt-7">
					<div class="bg-white p-3 mx-3 rounded-lg text-xl font-light">
						재단 사업비<br>(지원금)
					</div>
					</p>
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