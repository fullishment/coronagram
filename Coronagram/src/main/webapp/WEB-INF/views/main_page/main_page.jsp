<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>Coronagram</title>

  <!-- font -->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css'>
  <link rel="stylesheet" href="resources/css/main_page/main_page.css">
  <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.6.1/react-dom.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/classnames/2.2.5/index.min.js'></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/js/swiper.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


</head>

<body onload="InitializeStaticMenu();">

  <div id="STATICMENU">
    <aside>
      <a href="coronagram/${sMNick}"><img src="http://www.myiconfinder.com/uploads/iconsets/256-256-53e157058ac55ba046aa84778fca5e7e-user.png"></a>
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-5eea0c1930aab7916cc960e027d032db.png" id="cartIcon">
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-b8bd8c49060ab11be6d0ec4067506019.png" id="qnaIcon">
      <p></p>
      <img src="http://www.myiconfinder.com/uploads/iconsets/256-256-1946ae1aa4487a7b9fa115d13220714c-talk.png" id="zoomIcon">
    </aside>
  </div>
  <!-- ?????? ??? -->
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
	            			<a href="login" class="cm_logIn"><i class="cm_icon-logIn"></i> <span>?????????</span> </a>
	            		</c:when>
	            	<c:otherwise>
	            			<a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>????????????</span> </a>
	            	</c:otherwise>
	            	
	            	</c:choose>
	          	</li>
	          	<li>
	          		<c:choose>
	          			<c:when test="${empty sMNo}">
	            		</c:when>
	            		<c:otherwise>
	            			<a href="coronagram/${sMNick}" class="cm_userinfo">???????????????</a>
	            		</c:otherwise>
	            	</c:choose>
	          	</li>
          	</ul>
        </div>
      	<div class="cm_user_name">
			<c:if test="${!empty sMNo}">
				${sMNm}??? ???????????????.
			</c:if>
		</div>
    </div>
    <div class="cm_menu" id="cm_menu">
      <a href="#" class="cm_mLogo">Coronagram</a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_map"></div> Corona Map
        <ul class="cm_mcon" id="cm_mcon">
          <a href="http://localhost:3000">??????</a> <br>
          <a href="MapAPI">??????</a>
        </ul>
      </a>
      <a href="coinfo_main" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_info"></div>Corona Info
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coinfo_infolist">?????? ??????</a> <br>
          <a href="coinfo_step">????????????</a> <br>
          <a href="coinfo_news">News</a>
        </ul>
      </a>
      <a href="coronagram" class="cm_sTitle">
        <div class="cm_cam"></div>Coronagram
      </a>
      <a href="#" class="cm_mTitle" id="cm_mTitle">
        <div class="cm_user"></div>My Page
        <ul class="cm_mcon" id="cm_mcon">
          <a href="coronagram/${sMNick}">?????? ?????????</a> <br>
          <a href="calendar">?????? ??????</a> <br>
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
  <!-- ???????????? -->
  <main>
    <div class="slider-wrap con" data-slick-autoplay-status="Y">
      <div class="slider main-slider con">
        <div class="slide-item slide-item-1" data-dot-title="Coronagram">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt" style="color:black;">
              <h2 class="txt-tt">Coronagram</h2>
              <p class="txt-desc" style="font-weight: 500;">????????? ????????? ????????? ????????????</p>
              <div class="txt-btn">
                <a href="coronagram/${sMNick}" class="txt-btn-1" style="color:black;">?????? ?????????</a>
                <a href="calendar" class="txt-btn-2" style="color:black;">?????? ?????? ????????????</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="resources/images/main_page/insta_bg.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-2" data-dot-title="Corona Info">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">Corona Infomation</h2>
              <p class="txt-desc" style="font-weight: 500;">???????????? ?????? ????????? ??? ?????????</p>
              <div class="txt-btn">
                <a href="coinfo_main" class="txt-btn-1">??? ????????????</a>
                <a href="coinfo_step" class="txt-btn-2">???????????? ??????</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="resources/images/main_page/infomation.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-3" data-dot-title="Corona Map">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">Corona Map</h2>
              <p class="txt-desc" style="font-weight: 500;">????????? ????????? ????????? ????????? ???????????????</p>
              <div class="txt-btn">
                <a href="http://localhost:3000" class="txt-btn-2">????????? ????????????</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="resources/images/main_page/worldmap.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-4" data-dot-title="My Page">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt">
              <h2 class="txt-tt">My Page</h2>
              <p class="txt-desc" style="font-weight: 500;">??? ????????? ???????????? ????????? ??????</p>
              <div class="txt-btn">
                <a href="coronagram/${sMNick}" class="txt-btn-1">?????? ?????????</a>
                <a href="calendar" class="txt-btn-2">?????? ?????? ????????????</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="resources/images/main_page/mypage.jpg" alt="">
            </picture>
          </div>
        </div>
        <div class="slide-item slide-item-5" data-dot-title="Q & A">
          <div class="slide-con">
            <div class="slide-dummy"></div>
            <div class="slide-txt" >
              <h2 class="txt-tt" style="color:black;">Servi</h2><h2 class="txt-tt" style="color:white;">ce&nbsp;center</h2><br>
              <p class="txt-desc" style="display:inline-block; color:black; font-weight: 500;">???????????? ????????? ??????</p><p class="txt-desc" style="display:inline-block; color:white; font-weight: 500;">???</p>
              <div class="txt-btn">
                <a href="qna" class="txt-btn-1" style="color:black;">???????????? ?????? ??????</a>
                <a href="qna" class="txt-btn-2">?????? ??? ?????? ??????</a>
              </div>
            </div>
            <picture class="img-box">
              <img src="resources/images/main_page/qna.jpg" alt="">
            </picture>
          </div>
        </div>
      </div>
      <button class="s-autoplay-btn"></button>
    </div>
  </main>
  <article>
    <div class="wrapper">
      <div class="news-slider">
        <div class="news-slider__wrp swiper-wrapper">
          <div class="news-slider__item swiper-slide">
            <a href=http://news.kmib.co.kr/article/view.asp?arcid=0924216974&code=11121200&cp=nv" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                ????????????????????????? ?????????????????? ??????????? ???????????? ??????
              </div>

              <p class="news__txt">
                ????????? ???????????? 4???(????????????) 7???9????????? ?????? ????????? ???????????????. ???????????? ??? ???????????? ?????? 20??????(G20) ??????????????? ???26??? ???????????????????????? ???????????????(COP26) ????????????...
              </p>

              <div class="news__img">
                <img src="http://image.kmib.co.kr/online_image/2021/1105/2021110421221491108_1636028534_0924216974.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="http://news.kmib.co.kr/article/view.asp?arcid=0924216908&code=11132000&cp=nv" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                ????????? ?????? 10?????? ?????? ????????? ????????? ?????? 70??? ??????
              </div>

              <p class="news__txt">
                ?????????19 ?????? ???????????? 10?????? ?????? ???????????? ????????????. ???????????? ??? ?????? ????????????????????? ??????????????? ????????? ????????? ????????????. ?????? ???????????? ???????????????...
              </p>

              <div class="news__img">
                <img src="http://image.kmib.co.kr/online_image/2021/1105/2021110421140791091_1636028047_0924216908.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="https://news.sbs.co.kr/news/endPage.do?news_id=N1006523386&plink=ORI&cooper=NAVER" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                ??? ???????????? "5??? ????????? ??????, ?????? ?????? ?????? ???"
              </div>

              <p class="news__txt">
                 ???????????? 5???11??? ???????????? ????????? ??? ?????????19 ?????? ????????? ????????? ????????? 5??? ????????? ????????? ?????? ?????? ?????? ??? ????????? ?????? ???????????? ???????????????. ??? ???????????????..
              </p>

              <div class="news__img">
                <img src="https://img.sbs.co.kr/newimg/news/20210119/201512381_700.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="https://imnews.imbc.com/news/2021/world/article/6312397_34880.html" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                '?????? ?????????' ?????? ?????? ?????? 3???4??????????????? ??????
              </div>

              <p class="news__txt">
                ???????????? '?????? ?????????'??? ????????? ???????????? ?????????19??? ?????? ?????? ????????? ???????????? ?????? ????????? ??????????????????. ???????????? ????????? ?????????19 ?????? ???????????????...
              </p>

              <div class="news__img">
                <img src="https://image.imnews.imbc.com/news/2021/world/article/__icsFiles/afieldfile/2021/11/05/h_210609_0004.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="https://imnews.imbc.com/news/2021/world/article/6312396_34880.html" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                ??? ?????? ???????????? 27?????????????????? ?????? ??? ?????????
              </div>

              <p class="news__txt">
                ????????? ?????? ???????????? ?????? ????????? 4??? ?????? 30??? ??? ????????? ??????????????????.???????????? 4??? ??? ???????????? ?????? ??? ?????? ???????????? ?????? ????????? 26???9??? ?????????...
              </p>

              <div class="news__img">
                <img src="https://image.imnews.imbc.com/news/2021/world/article/__icsFiles/afieldfile/2021/11/05/H_210313_0028.jpg"
                  alt="news">
              </div>
            </a>
          </div>

          <div class="news-slider__item swiper-slide">
            <a href="https://news.kbs.co.kr/news/view.do?ncd=5317721&ref=A" class="news__item">
              <div class="news-date">
                <span class="news-date__title">5</span>
                <span class="news-date__txt">Nov</span>
              </div>
              <div class="news__title">
                ??? CDC ????????? ?????? ?????? 12??? ????????? 2????????? ?????? ????????????
              </div>

              <p class="news__txt">
                ?????? ????????????????????????, CDC??? 2??? ???????????? ???????????? ?????????19 ????????? ????????? 12?????? ?????? ?????? 2?????? ?????? ?????? ?????? ???????????? ???????????? ??????????????????. CDC??? ?????? ???????????? 3???...
              </p>

              <div class="news__img">
                <img src="https://news.kbs.co.kr/data/news/2021/11/05/20211105_H0egjF.jpg"
                  alt="news">
              </div>
            </a>
          </div>
        </div>

        <div class="news-slider__ctr">
          <div class="news-slider__arrows">
            <button class="news-slider__arrow news-slider-prev">
              <span class="icon-font">
                <svg class="icon_arrow icon-arrow-left">
                  <use xlink:href="#icon-arrow-left"></use>
                </svg>
              </span>
            </button>
            <button class="news-slider__arrow news-slider-next">
              <span class="icon-font">
                <svg class="icon_arrow icon-arrow-right">
                  <use xlink:href="#icon-arrow-right"></use>
                </svg>
              </span>
            </button>
          </div>
        </div>
      </div>
    </div>

    <svg hidden="hidden">
      <defs>
        <symbol id="icon-arrow-left" viewBox="0 0 32 32">
          <title>arrow-left</title>
          <path
            d="M0.704 17.696l9.856 9.856c0.896 0.896 2.432 0.896 3.328 0s0.896-2.432 0-3.328l-5.792-5.856h21.568c1.312 0 2.368-1.056 2.368-2.368s-1.056-2.368-2.368-2.368h-21.568l5.824-5.824c0.896-0.896 0.896-2.432 0-3.328-0.48-0.48-1.088-0.704-1.696-0.704s-1.216 0.224-1.696 0.704l-9.824 9.824c-0.448 0.448-0.704 1.056-0.704 1.696s0.224 1.248 0.704 1.696z">
          </path>
        </symbol>
        <symbol id="icon-arrow-right" viewBox="0 0 32 32">
          <title>arrow-right</title>
          <path
            d="M31.296 14.336l-9.888-9.888c-0.896-0.896-2.432-0.896-3.328 0s-0.896 2.432 0 3.328l5.824 5.856h-21.536c-1.312 0-2.368 1.056-2.368 2.368s1.056 2.368 2.368 2.368h21.568l-5.856 5.824c-0.896 0.896-0.896 2.432 0 3.328 0.48 0.48 1.088 0.704 1.696 0.704s1.216-0.224 1.696-0.704l9.824-9.824c0.448-0.448 0.704-1.056 0.704-1.696s-0.224-1.248-0.704-1.664z">
          </path>
        </symbol>
      </defs>
    </svg>
  </article>

  <article>
    <div id="app"></div>
  </article>

  <article class="chartbox">
    <div class="container">
      <div class="dashboard-container">
        <div class="card-1">
          <div class="single-chart">
            <div class="chart chart1" data-percent="70"></div>
          </div>
          <div class="card_con">
            <span class="heading">?????? ?????????</span>
            <span class="value"><span id="todayCnt"></span></span>
            <span class="new" id="tdCnt"></span>
          </div>
        </div>
        <div class="card-2">
          <div class="single-chart">
            <div class="chart chart1" data-percent="55"></div>
          </div>
          <div class="card_con">
            <span class="heading">?????? ??? ?????????</span>
            <span class="value"><span id="totalCnt"></span></span>
            <span class="new" id="accCnt"></span>
          </div>
        </div>
        <div class="card-3">
          <div class="single-chart">
            <div class="chart chart1" data-percent="90"></div>
          </div>
          <div class="card_con">
            <span class="heading">?????????</span>
            <span class="value"><span id="careCnt"></span></span>
            <span class="new" id="clCnt"></span>
          </div>
        </div>
        <div class="card-4">
          <div class="single-chart">
            <div class="chart chart1" data-percent="75"></div>
          </div>
          <div class="card_con">
            <span class="heading">?????????</span>
            <span class="value"><span id="deathCnt"></span></span>
            <span class="new" id="dtCnt"></span>
          </div>
        </div>
        <div class="card-5">
          <h4 class="chart-lbl">
            ?????? ?????? ??????
          </h4>
          <div class="divider">
          </div>
          <div class="content-center">
            <div class="doughnut-chart-container">
              <canvas class="doughnut-chart" id="doughnut">
              </canvas>
            </div>
          </div>
        </div>

        <div class="card-6">
          <h4 class="chart-lbl">
            ?????? ????????? ??????
          </h4>
          <div class="divider">
          </div>
          <div class="line-chart-container">
            <canvas class="line-chart" id="line">
            </canvas>
          </div>
        </div>
      </div>
    </div>
  </article>

  <article class="midbg">
    <div class="midtext">
      <!-- <h1>POINT SHOP</h1>
      <h4 style="color: white;">the healthy new collection</h4> -->
      <button><b class="btn_now">SHOP NOW</b></button>
    </div>
  </article>

  <article class="category">
    <div>
      <section>
        <img src="https://i.postimg.cc/Z5w9NYCh/1.jpg">
        <h4>?????? ?????? <br> ????????? ???<br>?????? ?????? </h4>
      </section>

      <section>
        <img src="https://i.postimg.cc/fyQksJgY/4.jpg">
        <h4>?????? ??????</h4>
      </section>

      <section>
        <img src="https://i.postimg.cc/Fsm1nkS4/5.jpg">
        <h4>?????? ?????? ???<br>
          ????????? </h4>
      </section>

      <section>
        <img src="https://i.postimg.cc/xTRqrjGb/6.jpg">
        <h4>?????? ?????? ??? <br>????????? ?????? </h4>
      </section>
    </div>
  </article>

  <footer>
    <div>
      <section>
        <b>??????????????????</b> <br><br>
        ??????????????? ????????? <br>
        ????????? ???????????????2??? 115 <br>
        ?????????????????????3??? 1109-1???<br><br>
        TEL 02-2108-5900 <br>
      </section>

      <section>
        <ul>
          <li>?????? ??????</li>
          <li>?????? ??????</li>
          <li>?????? ?????? ?????? ??????</li>
          <li>?????? ?????? ?????????</li>
        </ul>
      </section>

      <section>
        <ul>
          <li>1:1??????</li>
          <li>FAQ</li>
          <li>?????? ?????????</li>
          <li>?????????</li>
        </ul>
      </section>

      <section>
        <br>
        <img class="sns"
          src="http://www.myiconfinder.com/uploads/iconsets/256-256-fdb5c7de7e8cf55afcbe34def52a7f84.png">
        <img class="sns"
          src="http://www.myiconfinder.com/uploads/iconsets/256-256-732359f7dc388ab9720011bca82aee1b.png">
        <img class="sns"
          src="http://www.myiconfinder.com/uploads/iconsets/256-256-7799b777880e17be4bebb9837c11a342.png">
        </section>
    </div>
  </footer>
  <script src="resources/script/openAPI/CoronaCntApi.js"></script>
  <!-- <script src="resources/script/openAPI/CoronaWeekCntApi.js"></script> -->
  <script src="resources/script/main_page/main_page.js"></script>
  <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>
</html>