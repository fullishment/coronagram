<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="resources/css/co_calendar/co_calendar.css">
  <link rel="stylesheet" href="resources/css/co_calendar/menubar.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header>
    <div class="cm_menuBar" id="cm_menuBar">
      <div class="cm_menu__toggler"><span></span></div>
      <a href="#" class="cm_logo" id="cm_logo">Coronagram</a>
      <a href="#" class="cm_home" id="cm_home">Home</a>
      <a href="#" class="cm_msg" id="cm_msg">Message</a>
      <a href="#" class="cm_cld" id="cm_cld">Calendar</a>
      <div class="cm_dropdown">
          <a class="cm_dropbtn cm_dot" id="cm_dot"></a>
          <ul class="cm_dropdown-content">
              <li>
                  <a href="#" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
              </li>
              <li>
                  <a href="#" class="cm_userinfo">개인정보수정</a>
              </li>
          </div>
      </div>
      
  </div>
<div class="cm_menu" id="cm_menu">
  <a href="#" class="cm_mLogo">Coronagram</a>
  <a href="#" class="cm_mTitle" id="cm_mTitle">
      <div class="cm_map"></div> Corona Map
      <ul class="cm_mcon" id="cm_mcon">
          <a href="#">국내</a> <br>
          <a href="#">해외</a>
      </ul>
  </a>
  <a href="#" class="cm_mTitle" id="cm_mTitle">
      <div class="cm_info"></div>Corona Info
      <ul class="cm_mcon" id="cm_mcon">
          <a href="#">관련 정보</a> <br>
          <a href="#">거리두기</a> <br>
          <a href="#">News</a>
      </ul>
  </a>
  <a href="#" class="cm_sTitle">
      <div class="cm_cam"></div>Coronagram
  </a>
  <a href="#" class="cm_mTitle" id="cm_mTitle">
      <div class="cm_user"></div>My Page
      <ul class="cm_mcon" id="cm_mcon">
          <a href="#">개인 페이지</a> <br>
          <a href="#">출석 체크</a> <br>
          <a href="#">Message</a>
      </ul>
  </a>
  <a href="#" class="cm_mTitle" id="cm_mTitle">
      <div class="cm_qna"></div>Service Center
      <ul class="cm_mcon" id="cm_mcon">
          <a href="#">FAQ</a> <br>
          <a href="#">Q&A</a>
      </ul>
  </a>
</div>
</header>

  <!-- calendar -->
  <div class="site-header autocomplete">
    <div class="input-wrapper">
      <input type="text" placeholder="Search" class="search-field">
      <span class="close">Cancel</span>
      <div class="focus-background"></div>
    </div>
    <div class="dialog">
    </div>

  </div>

  <div id='calendar'></div>

  <div id="calendar-popup">

    <form id="event-form">
      <div class='calander_popip_title'><i class="fa fa-calendar" aria-hidden="true"></i>
        Add Event</div>
      <ul>
        <li>
          <label for="event-start"><i class="fa fa-bell-o" aria-hidden="true"></i>

            From</label>
          <input id="event-start" class='form-control' type="datetime-local" name="start" />
        </li>
        <li>
          <label for="event-end"><i class="fa fa-bell-slash" aria-hidden="true"></i>

            To</label>
          <input id="event-end" class='form-control' type="datetime-local" name="end" />
        </li>
        <li>
          <label for="event-title"><i class="fa fa-calendar-minus-o" aria-hidden="true"></i>
            Event Name</label>
          <input id="event-title" class='form-control' type="text" name="title" />
        </li>
        <li>
          <label for="event-location"><i class="fa fa-map-marker" aria-hidden="true"></i>
            Location</label>
          <input id="event-location" class='form-control' type="text" name="location" />
        </li>
        <li>
          <label for="event-details"><i class="fa fa-info-circle" aria-hidden="true"></i>
            Description</label>
          <textarea id="event-details" class='form-control' name="details"></textarea>
        </li>
        <div class="button">
          <input type="submit" class='form-control submit_btn' />
        </div>
      </ul>
    </form>

    <div id="event">
      <ul>
        <li class="start-time">
          <p>
            Start at</p>
          <time></time>
        </li>
        <li class="end-time">
          <p>
            End</p>
          <time></time>
        </li>
        <li>
          <p>
            <i class="fa fa-map-marker" aria-hidden="true"></i>Location
          </p>
          <p class="location"></p>
        </li>
        <li>
          <p><i class="fa fa-info" aria-hidden="true"></i>
            Details:</p>
          <p class="details"></p>
        </li>
      </ul>

    </div>

    <div class="prong">
      <div class="bottom-prong-dk"></div>
      <div class="bottom-prong-lt"></div>
    </div>
  </div>


  <div class='modle' id='simplemodal'>
    <div class='modle-continer'>
      <form id="edit-form">

        <div class='modal-header'>
          <span class='close-btn' id='close-btnid'>&times</span>
          <h2>Edit Event</h2>
        </div>
        <div class='modal-body'>

          <lable for='eventname'>Event Name</lable>
          <input type='text' name='eventname' id='eventname' class='form-control'>
          <lable for='location'>Location</lable>
          <input type='text' name='location' id='location' class='form-control'>

          <label for="event-start">From</label><input id="eventstart" type="datetime-local" name="start"
            class='form-control' />

          <label for="event-end">To</label>
          <input id="eventend" type="datetime-local" name="end" class='form-control' />
          <label for="event-details">Details</label>
          <textarea id="eventdetails" type='text' name="details" class='form-control'></textarea>

        </div>
        <div class='modal-footer'>
          <button type='submit' class='btn btn-info'>save</button>
          <button class='btn btn-dafault'>cancel</button>

        </div>
      </form>
    </div>


  </div>
  <div id='search_result'>result</div>
  <script src="resources/script/menu_bar/menu_bar.js"></script>
  <script src="resources/script/co_calendar/co_calendar.js"></script>
</body>

</html>