<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
	.scmL3T{
            width: 380px;
            height: 310px;
            border: 0px;
            border-radius: 10px;
            box-shadow: 0 1px 6px 0 rgb(32 33 36 / 28%);
            font-size: 11pt;
            margin-bottom: 10px;
            margin-top:10px;
            padding : 20px;
            overflow : auto;
        }
	.back_btn {
		    float: right;
	    	margin-top: 40px;
            display: inline-block;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
            width: 60px;
            height: 30px;
            border: none;
            border-radius: 7px;
            background: gray;
        }
        .back_btn:hover {
            opacity: .8;
        }
</style>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/qna/qna.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "myqna");
		$("#actionForm").submit();
	});
});
</script>
</head>
<body>
   <header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      	<a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      	<c:choose>
      		<c:when test="${acctNo eq 6}">
      			<a href="admin_main" class="cm_admin" id="cm_admin">AdminPage</a>
      		</c:when>
      		<c:otherwise>
      			
      		</c:otherwise>
      	</c:choose>
      	<a href="#" class="cm_home" id="cm_home">Home</a>
      	<a href="#" class="cm_msg" id="cm_shop">Shop</a>
      	<a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      	<div class="cm_dropdown">
        	<a class="cm_dropbtn cm_dot" id="cm_dot"></a>
        	<ul class="cm_dropdown-content">
	          	<li>
	            	<c:choose >
	          			<c:when test="${empty sMNo}">
	            			<a href="login" class="cm_logIn"><i class="cm_icon-logIn"></i> <span>로그인</span> </a>
	            		</c:when>
	            	<c:otherwise>
	            			<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
	            	</c:otherwise>
	            	
	            	</c:choose>
	          	</li>
	          	<li>
	          		<c:choose>
	          			<c:when test="${empty sMNo}">
	            		</c:when>
	            		<c:otherwise>
	            			<a href="coronagram/${sMNick}" class="cm_userinfo">마이페이지</a>
	            		</c:otherwise>
	            	</c:choose>
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
          <a href="http://localhost:3000">국내</a> <br>
          <a href="MapAPI">해외</a>
        </ul>
      </a>
      <a href="coinfo_main" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_info"></div>Corona Info
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coinfo_infolist">관련 정보</a> <br>
          <a href="coinfo_step">거리두기</a> <br>
          <a href="coinfo_news">News</a>
        </ul>
      </a>
      <a href="coronagram" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coronagram/${sMNick}">개인 페이지</a> <br>
          <a href="calendar">출석 체크</a> <br>
          <a href="https://coronagram-zoom.herokuapp.com/">Zoom</a>
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
    <main>
     	<form action="#" id="actionForm" method="post">
		   <input type="hidden" name="no" value="${param.no}" />
		</form>
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>고객 센터</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-3" type="radio" name="tab" class="scm3" checked><label for="tab-3" class="tab"><p>내 문의내역</p></label>
                    <div class="sc-form">
                        <div class="scm3-htm">
                            <label for="user" class="sclabel"></label>
                            <div class="group">
                                <div class="qnaList">
                                    <div>
                                        <div class="scmL2">
                                        	<div class = "title"><p>제목</p></div>
                                            <div class="scmL2T"><p>${data.TITLE}</p></div> <br>
                                            <div class = "con"><p>질문</p></div>
                                            <div cols="42" rows="13" class="scmL4"><p>${data.CON}</p></div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="scmL3">
                                        <div class="ans"><p>답변내용</p></div>
                                        <div cols="42" rows="16" class="scmL3T"><p>${data.ANS_CON}</p></div>                             
                                    </div>
                                    <div class="btn_area">
                                        <a href="javascript:window.history.back()"> <button type="button" class="back_btn">목록</button> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-form -->
        </div>
    </main>
      <script src="resources/script/menu_bar/menu_bar.js"></script>
      <script src="resources/script/qna/qna.js"></script>
    </body>
    
    </html>