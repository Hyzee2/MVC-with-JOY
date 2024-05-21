<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="net.notice.db.*"%>
<%@ page import="net.joystory.db.*"%>
<%
List<NoticeBean> noticelist = (List<NoticeBean>) request.getAttribute("noticelist");
List<JoyStoryBean> joyStoryList = (List<JoyStoryBean>) request.getAttribute("joyStoryList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>청소년행복재단</title>
</head>
<script src="https://cdn.tailwindcss.com"></script>
<script>
        document.addEventListener('DOMContentLoaded', function () {
        	const tabs = document.querySelectorAll('.tab');
            const sections = document.querySelectorAll('.tab-content');

            const urlParams = new URLSearchParams(window.location.search);
            const target = urlParams.get('data-target') || 'joyStory'; // 기본값을 'joyStory'로 설정

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
					<a href="#">후원하기</a> <a href="#">후원기업/단체</a>
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
			<button
				class="donation-btn bg-yellow-400 text-2xl font-bold h-full w-80 pl-0 mr-0">후원하기</button>
		</div>
	</div>

	<!-- 재단소식 섹션 -->
	<div class="relative bg-gray-100 h-[353px]">
		<img src="https://cdn.imweb.me/thumbnail/20230214/e2422eb268bb6.png"
			alt="재단 소식 이미지" class="w-full h-full object-cover">
		<div class="absolute inset-0 flex items-center justify-center">
			<h1 class="text-6xl font-bold" style="color: #4c8caa;">재단소식</h1>
		</div>
	</div>

	<!-- 탭 메뉴 -->
	<div class="bg-white">
		<div class="container mx-auto flex justify-center items-center">
			<div class="flex justify-between items-center w-full max-w-7xl">
				<a href="./JoyStoryList.jo?data-target=joyStory"
					class="tab active-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="joyStory">JOY스토리</a> <a
					href="./NoticeList.no?data-target=pressRelease"
					class="tab inactive-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="pressRelease">언론보도</a> <a
					href="./NoticeList.no?data-target=notices"
					class="tab inactive-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="notices">공지사항</a> <a
					href="./NoticeList.no?data-target=transparency"
					class="tab inactive-tab block py-4 px-20 text-2xl font-medium text-center flex-1"
					data-target="transparency">투명경영</a>
			</div>
		</div>
	</div>


	<!-- 컨텐츠 섹션 -->
	<div class="container mx-auto mt-10 mb-28 max-w-7xl">
		<div id="joyStory" class="tab-content">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-10">JOY스토리</h2>
					<div class="grid grid-cols-3 gap-4">
					<%if(joyStoryList != null){ %>
						<c:forEach var="joyStory" items="${joyStoryList}">
							<div class="bg-white p-4">
								<a href="./JoyDetailAction.jo?data-target=joyStory&num=${joyStory.story_id}">
									<img src="${joyStory.image_url}" alt="${joyStory.title}"
										class="w-full h-96 object-cover mb-4">
									<p class="text-lg font-light">${joyStory.title}</p>
									<p class="text-gray-500 mt-4 font-light text-xs">${joyStory.post_date}</p>
								</a>
							</div>
						</c:forEach>
						<%} %>
					</div>
				</div>
			</div>
		</div>

		<div id="pressRelease" class="tab-content hidden">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-6">언론보도 목록</h2>
					<p>여기에 언론보도 컨텐츠가 표시됩니다.</p>
				</div>
			</div>
		</div>

		<div id="notices" class="tab-content hidden">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-10">공지사항</h2>
					<table
						class="w-full text-left border-collapse font-light text-[#363636]">
						<thead class="text-lg">
							<tr>
								<th class="py-4 px-6 border-b border-t-2">No</th>
								<th class="py-4 px-6 border-b border-t-2 text-center">제목</th>
								<th class="py-4 px-6 border-b border-t-2 text-right">조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
							if(noticelist != null){
								for (int i = noticelist.size() - 1; i >= 0; i--) {
									NoticeBean notice = (NoticeBean) noticelist.get(i);
							%>
							<tr>
								<!--여기에서는 데이터 불러오기 -->
								<td class="py-4 px-6 border-b text-xl"><%=notice.getNotice_id()%></td>
								<td class="py-4 px-6 border-b text-left text-xl"><a
									href="./NoticeDetailAction.no?data-target=notices&num=<%=notice.getNotice_id()%>">
										<%=notice.getTitle()%>
								</a></td>
								<td
									class="py-4 px-6 border-b text-right text-base text-gray-400"><%=notice.getRead_count()%></td>
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

		<div id="transparency" class="tab-content hidden">
			<div class="bg-white">
				<div class="p-8">
					<h2 class="text-5xl font-bold mb-6">투명경영</h2>
					<p>여기에 투명경영 컨텐츠가 표시됩니다.</p>
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