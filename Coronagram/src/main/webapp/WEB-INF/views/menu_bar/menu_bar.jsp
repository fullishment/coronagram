<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</head>
<body>
    <header>
	    <div class="cm_menuBar" id="cm_menuBar">
	      	<div class="cm_menu__toggler"><span></span></div>
	      	<a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
	      	<a href="#" class="cm_home" id="cm_home">Home</a>
	      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
	      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
	      	<div class="cm_dropdown">
	        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
	        	<ul class="cm_dropdown-content">
		          	<li>
		            	<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
		          	</li>
		          	<li>
		            	<a href="coronagram/${sMNick}" class="cm_userinfo">개인정보수정</a>
		          	</li>
	          	</ul>
	        </div>
	      	<div class="cm_user_name">
				<c:if test="${!empty sMNo}">
					${sMNm}님 어서오세요.
				</c:if>
			</div>
	    </div>
	    <div class="cm_menu" id="cm_menu">
	      <a href="#" class="cm_mLogo">Coronagram</a>
	      <a href="#" class="cm_mTitle" id="cm_mTitle">
	        <div class="cm_map"></div> Corona Map
	        <ul class="cm_mcon" id="cm_mcon">
	          <a href="#">국내</a><br>
	          <a href="#">해외</a>
	        </ul>
	      </a>
	      <a href="#" class="cm_mTitle" id="cm_mTitle">
	        <div class="cm_info"></div>Corona Info
	        <ul class="cm_mcon" id="cm_mcon">
	          <a href="coinfo_infolist">관련 정보</a><br>
	          <a href="coinfo_step">거리두기</a><br>
	          <a href="coinfo_news">News</a>
	        </ul>
	      </a>
	      <a href="coronagram" class="cm_sTitle">
	        <div class="cm_cam"></div>Coronagram
	      </a>
	      <a href="#" class="cm_mTitle" id="cm_mTitle">
	        <div class="cm_user"></div>My Page
	        <ul class="cm_mcon" id="cm_mcon">
	          <a href="coronagram/${sMNick}">개인 페이지</a><br>
	          <a href="calendar">출석 체크</a><br>
	          <a href="#">Zoom</a>
	        </ul>
	      </a>
	      <a href="#" class="cm_mTitle" id="cm_mTitle">
	        <div class="cm_qna"></div>Service Center
	        <ul class="cm_mcon" id="cm_mcon">
	          <a href="qna">Q&A</a><br>
	        </ul>
	      </a>
	    </div>
	</header>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>  
</html>