<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminChart</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">

    <link rel="stylesheet" href="resources/css/admin_chart/admin_chart.css" type="text/css">
    <link rel="stylesheet" href="resources/css/admin_chart/3.3.4bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.4/jquery-jvectormap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.3/jquery.slimscroll.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-pie-chart/2.1.6/jquery.easypiechart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.8.0/lodash.min.js"></script>
    <script src="https://jvectormap.com/js/jquery-jvectormap-2.0.5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.3/jquery-jvectormap.js"></script>
    <script src="https://jvectormap.com/js/jquery-jvectormap-world-mill.js"></script>
</head>
<body>
    <section>
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
    </section>
    <aside>

    </aside>
    
    <main>
        <div class="main_title">
            <h1>????????? ?????? ??????</h1>
        </div>

        <section>
            <div class="rad-body-wrapper rad-nav-min">
                <div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-xs-6">
							<div class="rad-info-box rad-txt-today_cornic">
								<i class="fa chart1" data-percent="70"></i> <span
									class="heading">?????? ?????????</span> <span class="value"><span
									id=todayCnt></span></span> <span class="new" id="tdCnt"></span>
							</div>
						</div>
						<div class="col-lg-3 col-xs-6">
							<div class="rad-info-box rad-txt-accum_cornic">
								<i class="fa chart1" data-percent="30"></i> <span
									class="heading">?????? ??? ?????????</span> <span class="value"><span
									id=totalCnt></span></span> <span class="new" id="accCnt"></span>
							</div>
						</div>
						<div class="col-lg-3 col-xs-6">
							<div class="rad-info-box rad-txt-fl_rec">
								<i class="fa chart1" data-percent="50"></i> <span
									class="heading">?????????</span> <span class="value"><span
									id=careCnt></span></span> <span class="new" id="clCnt"></span>
							</div>
						</div>
						<div class="col-lg-3 col-xs-6">
							<div class="rad-info-box rad-txt-dead">
								<i class="fa chart1" data-percent="40"></i> <span
									class="heading">?????????</span> <span class="value"><span
									id="deathCnt"></span></span> <span class="new" id="dtCnt"></span>
							</div>
						</div>
						<div id="createDtContainer">
							<div id="createDt">
								<span></span>
							</div>
						</div>
					</div>
					<!--                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">????????? ??????<ul class="rad-panel-action">
                                            <li><i class="fa fa-rotate-right"></i></li>

                                            </li>
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body rad-map-container">
                                    <div id="world-map" class="rad-map"></div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ????????? ??????<ul class="rad-panel-action">
 <!--                                            <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="areaChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="corona_condition">
                            <div class="condition">
                                <div class="coronic">
                                    <div class="coronics"></div>
                                    <span>?????? ?????????</span>
                                </div>
                                <div class="dead">
                                    <div class="deads"></div>
                                    <span>?????? ?????????</span>
                                </div>
                                <div class="fl_rec">
                                    <div class="fl_recs"></div>
                                    <span>?????? ?????????</span>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">
<!--                         <div class="main_title">
                            <h1>?????? ?????? ??????</h1>
                        </div> -->
                        <div class="col-lg-6 col-md-12 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">?????? ????????? ??????<ul class="rad-panel-action">
											<!-- <li><i class="fa fa-rotate-right"></i></li> -->
										</ul>
									</h3>
								</div>
								<div class="panel-body">
									<div id="lineChart" class="rad-chart"></div>
								</div>
                            <div class="condition">
                                <div class="coronic">
                                    <div class="coronics"></div>
                                    <span>?????????</span>
                                </div>
                                <div class="dead">
                                    <div class="deads"></div>
                                    <span>?????????</span>
                                </div>
                                <div class="fl_rec">
                                    <div class="fl_recs"></div>
                                    <span>?????????</span>
                                </div>
                            </div>
							</div>
						</div>
                        <div class="col-lg-3 col-md-8 col-xs-12 doughnut-chart">
                            <div class=" panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ?????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart" class="rad-chart"></div>
                                </div>
                                 <div class="vaccine">
                            <div class="vaccine_name">
                                <div class="az">
                                    <div class="azs"></div>
                                    <span>?????????????????????</span>
                                </div>
                                <div class="pfizer">
                                    <div class="pfizers"></div>
                                    <span>?????????</span>
                                </div>
                                <div class="moderna">
                                    <div class="modernas"></div>
                                    <span>?????????</span>
                                </div>
                                <div class="jansen">
                                    <div class="jansens"></div>
                                    <span>??????</span>
                                </div>
                            </div>
                        </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>????????? ?????? ??????</h1>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ????????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
								<div class="panel-body">
									<div id="barChart3" class="rad-chart"></div>
								</div>
								<div class="joinInfo">
									<div class="joinInfos">
										<div class="totalJoin">
											<div class="totalJoins"></div>
											<span>??? ?????????</span>
										</div>
										<div class="avgJoin">
											<div class="avgJoins"></div>
											<span>?????? ?????????</span>
										</div>
									</div>
								</div>
							</div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ????????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
								<div class="panel-body">
									<div id="barChart5" class="rad-chart"></div>
								</div>
								<div class="withdrawalInfo">
									<div class="withdrawalInfos">
										<div class="totalWithdrawal">
											<div class="totalWithdrawals"></div>
											<span>??? ?????????</span>
										</div>
										<div class="avgWithdrawal">
											<div class="avgWithdrawals"></div>
											<span>?????? ?????????</span>
										</div>
									</div>
								</div>
							</div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ????????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart2" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">????????? ????????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>?????? ?????? ??????</h1>
                        </div>
                        <div class="col-md-6 member_grade">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="donutChart6" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 member_grade">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ?????? ???<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="members">
                                        <table class="members_level">
                                            <th>??????</th>
                                            <th>??????</th>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ?????????
                                                        <div class="level_color man"></div>
                                                    </div>
                                                </td>
                                                <td id="admin">${data.ADMIN}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ???????????????
                                                        <div class="level_color dia"></div>
                                                    </div>
                                                </td>
                                                <td id="diamond">${data.DIAMOND}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ????????????
                                                        <div class="level_color pla"></div>
                                                    </div>
                                                </td>
                                                <td id="platinum">${data.PLATINUM}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ??????
                                                        <div class="level_color gol"></div>
                                                    </div>
                                                </td>
                                                <td id="gold">${data.GOLD}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ??????
                                                        <div class="level_color sil"></div>
                                                    </div>
                                                </td>
                                                <td id="silver">${data.SILVER}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        ?????????
                                                        <div class="level_color bron"></div>
                                                    </div>
                                                </td>
                                                <td id="bronze">${data.BRONZE}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="main_title">
                            <h1>?????? ?????? ??????</h1>
                        </div>
                        <div class="col-md-6 col-lg-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">?????? ?????? ????????? 10 ??????<ul class="rad-panel-action">
                                            <!-- <li><i class="fa fa-rotate-right"></i></li> -->
                                        </ul>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="barChart4" class="rad-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <script src="resources/script/openAPI/CoronaCntApi.js"></script>
    <!-- <script src="resources/script/openAPI/CoronaWeekCntApi.js"></script> -->
    <script src="resources/script/admin_chart/admin_chart.js"></script>
    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>