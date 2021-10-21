<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css"><!-- css-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"> <!-- font-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> <!-- jquery-->
    <link rel="stylesheet" href="resources/css/p_coronagram/common.css?after">
    <link rel="stylesheet" href="resources/css/p_coronagram/style.css">
    <script src="resources/script/coronagram_main/coronagram_main.js?after"></script>
    <script>
	    $(document).ready(function(){
	    	reloadList();
	    });
    
	    function slide(){
	    	$('.slider').each(function(){
	            var $this = $(this);
	            var $group = $(this).find('.slide-group');
	            var $slides = $(this).find('.slide');
	            var buttonArray = [];
	            var currentIndex = 0;

	            var $nav = $(this).children('.slide-nav').find('div');
	        
	             $nav.on('click', function (event) {
	                event.preventDefault();
	                console.log($(this));
	                if ($(this).hasClass('next')) {
	                    if (currentIndex === $slides.length -1) {
	                        move(0);
	                    }
	                    move(currentIndex + 1);
	                } else {
	                    if (currentIndex === 0) {
	                        move($slides.length -1);
	                    }
	                    move(currentIndex - 1);
	                }
	            });

	        function move(newIndex) {
	            var animateLeft, slideLeft;

	            if ($group.is(':animated') || currentIndex === newIndex) {
	                return;
	            }

	            buttonArray[currentIndex].removeClass('active');
	            buttonArray[newIndex].addClass('active');

	            if (newIndex > currentIndex) {
	                slideLeft = '100%';
	                animateLeft = '-100%';
	            } else {
	                slideLeft = '-100%';
	                animateLeft = '100%';
	            }

	            $slides.eq(newIndex).css({
	                left: slideLeft,
	                display: 'block'
	            });

	            $group.animate({left: animateLeft}, function() {
	                $slides.eq(currentIndex).css({display: 'none'});
	                $slides.eq(newIndex).css({left: 0});
	                $group.css({left: 0});
	                currentIndex = newIndex;
	            });
	        }

	        $.each($slides, function(index) {
	            var $button = $('<button type="button" class="slide-btn">&bull;</button>');
	            if (index === currentIndex) {
	                $button.addClass('active');
	            }
	            $button.on('click', function(){
	                move(index);
	            }).appendTo($(this).children('.slide-buttons'));
	            buttonArray.push($button);
	        });
	        })
	    }
	function reloadList(){
		var params=$("#postForm").serialize();	
		$.ajax({ 
			url:"crngPost",
			type:"post",
			dataType:"json",
			data: params,
			success : function(res){
				crngPost(res.post);			
				timeForToday();
				slide();
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
	}
    function crngPost(list){
		var html ="";	
		
	    
		for(data of list){

		html  +="	<article class=\"contents postNo\" wtno=\""+data.WRITING_NO+"\">                                                                                     ";  
	    html  +="      <header class=\"top\">                                                                                        ";    
	    html  +="          <div class=\"user_container\">                                                                            ";    
	    html  +="              <div class=\"profile_img\">                                                                           ";    
	    html  +=" 				   <img src=\""+data.IMG_ADR+"\" alt=\"none\" onerror=\"this.src='resources/images/userpage/replace.png'\" /> 	 ";    
	    html  +="              </div>                                                                                              ";    
	    html  +="              <div class=\"user_name\">                                                                             ";    
	    html  +="                  <div class=\"nick_name m_text\">"+data.NICK_NM+"</div>                                                   ";    
	    html  +="                  <div class=\"country s_text\">"+timeForToday(data.DT)+"</div>                                            ";    
	    html  +="              </div>                                                                                              ";    
	    html  +="          </div>                                                                                                  ";    
	    html  +="          <div class=\"sprite_more_icon\" data-name=\"more\">                                                         ";    
	    html  +="              <ul class=\"toggle_box\">                                                                             ";    
	    if(data.M_NO == ${sMNo} ){
	    	 html+="			   <i class=\"fas fa-ellipsis-h postMore\"></i>													 ";
	    }	    
	    html  +="              </ul>                                                                                               ";    
	    html  +="          </div>                                                                                                  ";    
	    html  +="      </header>                                                                                                   ";     
	    html  +="      <div class=\"img_section\">                                                                                   ";    
	    html  +="          <div class=\"trans_inner\">                                                                               ";    
	    html  +="              <div class=\"slider\">                                                                                ";    
	    html  +="                  <div class=\"slide-viewer\">                                                                      ";    
	    html  +="                    <div id=\"slide-group\" class=\"slide-group\">                                                                     ";
	    var j=1;	    
	    var fileAdr=data.FILE_ADRS;
        var fileAdrSplit = fileAdr.split(',');
        for ( var i = 0; i < fileAdrSplit.length; i++) {
        	html+=" <div class=\"slide slide-"+j+"\">                                       ";
            html+=" <img src=\""+fileAdrSplit[i]+"\" alt=\"\" />	   						";
           	html+=" </div>                                                                  ";
           	j++;        	
        }	
	    html  +="                    </div>                                                                     ";
	    html  +="                  </div>                                                                                          ";    
	    html  +="                  <div class=\"slide-nav\">                                                                         ";    
	    html  +="                      <div class=\"prev\"></div>                                                                    ";    
	    html  +="                      <div class=\"next\"></div>                                                                    ";    
	    html  +="                    </div>                                                                                        ";    
	    html  +="                  <div class=\"slide-buttons\"></div>                                                               ";    
	    html  +="              </div>                                                                                              ";    
	    html  +="      </div>                                                                                                      ";    
	    html  +="      <div class=\"bottom_icons\">                                                                                  ";    
	    html  +="          <div class=\"left_icons\">                                                                                ";    
	    html  +="              <div class=\"heart_btn\">                                                                             ";    
	    html  +="                  <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\">                         ";    
	    html+="                                     <input type=\"checkbox\" name=\"checkbox\" id=\"checkbox\" >                ";
	     html+="                                     <label for=\"checkbox\">                                                    ";
	     html+="                                       <svg id=\"heart-svg\" viewBox=\"467 392 58 57\" xmlns=\"http://www.w3.org/2000/svg\"> ";
	     html+="                                         <g id=\"Group\" fill=\"none\" fill-rule=\"evenodd\" transform=\"translate(467 392)\">";
	     html+="                                           <path d=\"M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z\" id=\"heart\" stroke=\"#000000\" stroke-width=\"3\"></path>";
	     html+="                                           <circle id=\"main-circ\" fill=\"#E2264D\" opacity=\"0\" cx=\"29.5\" cy=\"29.5\" r=\"1.5\"></circle>     ";
	     html+="                                           <g id=\"grp7\" opacity=\"0\" transform=\"translate(7 6)\">                                              ";
	     html+="                                             <circle id=\"oval1\" fill=\"#9CD8C3\" cx=\"2\" cy=\"6\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval2\" fill=\"#8CE8C3\" cx=\"5\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                                                                                                                                   ";
	     html+="                                           <g id=\"grp6\" opacity=\"0\" transform=\"translate(0 28)\">                                             ";
	     html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"3\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                                                                                                                                   ";
	     html+="                                           <g id=\"grp3\" opacity=\"0\" transform=\"translate(52 28)\">                                            ";
	     html+="                                             <circle id=\"oval2\" fill=\"#9CD8C3\" cx=\"2\" cy=\"7\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval1\" fill=\"#8CE8C3\" cx=\"4\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                                                                                                                                   ";
	     html+="                                           <g id=\"grp2\" opacity=\"0\" transform=\"translate(44 6)\">                                             ";
	     html+="                                             <circle id=\"oval2\" fill=\"#CC8EF5\" cx=\"5\" cy=\"6\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval1\" fill=\"#CC8EF5\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                           <g id=\"grp5\" opacity=\"0\" transform=\"translate(14 50)\">                                            ";
	     html+="                                             <circle id=\"oval1\" fill=\"#91D2FA\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval2\" fill=\"#91D2FA\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                           <g id=\"grp4\" opacity=\"0\" transform=\"translate(35 50)\">                                            ";
	     html+="                                             <circle id=\"oval1\" fill=\"#F48EA7\" cx=\"6\" cy=\"5\" r=\"2\"></circle>                             ";
	     html+="                                             <circle id=\"oval2\" fill=\"#F48EA7\" cx=\"2\" cy=\"2\" r=\"2\"></circle>                             ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                           <g id=\"grp1\" opacity=\"0\" transform=\"translate(24)\">                                               ";
	     html+="                                             <circle id=\"oval1\" fill=\"#9FC7FA\" cx=\"2.5\" cy=\"3\" r=\"2\"></circle>                           ";
	     html+="                                             <circle id=\"oval2\" fill=\"#9FC7FA\" cx=\"7.5\" cy=\"2\" r=\"2\"></circle>                           ";
	     html+="                                           </g>                                                                                                    ";
	     html+="                                         </g>                                                                                                      ";
	     html+="                                       </svg>                                                                                                      ";
	     html+="                                     </label>                                                                                                      ";
	    html  +="                  </div>                                                                                            ";
	    html  +="              </div>                                                                                                ";
	    html+="                       <div class=\"sprite_bubble_icon\">                                                                                          ";
	     html+="                           <i class=\"far fa-comment f_size\"></i>                                                                                 ";
	     html+="                       </div>                                                                                                                      ";
	     html+="                       <div class=\"sprite_share_icon\" data-name=\"share\">                                                                       ";
	     html+="                           <i class=\"far fa-paper-plane f_size\"></i>                                                                             ";
	     html+="                       </div>                                                                                                                      ";
	    html  +="          </div>                                                                                                    ";
	    html  +="          <div class=\"right_icon\">                                                                                  ";
	    html  +="              <div class=\"sprite_bookmark_outline\" data-name=\"bookmark\"></div>                                      ";
	    html  +="          </div>                                                                                                    ";
	    html  +="      </div>                                                                                                        ";
	    html  +="      <div class=\"likes m_text\">                                                                                    ";
	    html  +="      </div>                                                                                                        ";
	    html  +="      <div class=\"comment_container\">                                                                               ";
	    html  +="      </div>                                                                                                        ";
	    html  +="      <div class=\"comment_field\" id=\"add-comment-post37\">                                                           ";
	    html  +="          <input type=\"text\" placeholder=\"댓글달기...\">                                                             ";
	    html  +="          <div class=\"upload_btn m_text\" data-name=\"comment\">게시</div>                                             ";
	    html  +="      </div>                                                                                                        ";
	    html  +="  </article>                                                                                                        ";
	    
		}
		
		$("#contents_box").html(html);
	}
    
    
    function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return betweenTime+'분전';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'시간전';
        }

        const betweenTimeDay = Math.floor(betweenTimeHour / 24);
        if (betweenTimeDay < 7) {
            return betweenTimeDay+'일전';
        }
        const betweenTimeWeek = Math.floor(betweenTimeDay / 7);
        if (betweenTimeWeek	< 5) {
            return betweenTimeWeek+'주전';
        }
        const betweenTimeMonth = Math.floor(betweenTimeDay / 30);
        if (betweenTimeMonth < 12) {
            return betweenTimeDay+'개월';
        }
        return Math.floor(betweenTimeDay / 365)+'년전';
 	}	
    </script>
</head>

<body>


    <section id="container">

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
                            <a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
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
        <div class="hidden_menu">
            <div class="scroll_inner">
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>

                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>
                <div class="user">
                    <div class="thumb_img"><img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진"></div>
                    <div class="id">kindtigerrr</div>
                </div>

            </div>
        </div>


        <section id="main_container">
            <div class="inner">
                <div id="contents_box" class="contents_box">               
                </div>
                
                <input type="hidden" id="page" value="1">
                
                <div class="side_box">
                    <div class="user_profile">
                        <div class="profile_thumb">
                            <img src="resources/css/p_coronagram/imgs/thumb.jpeg" alt="프로필사진">
                        </div>
                        <div class="detail">
                            <div class="id m_text">KindTiger</div>
                            <div class="ko_name">심선범</div>
                        </div>
                    </div>

                    <article class="story">
                        <header class="story_header">
                            <div>스토리</div>
                            <div class="more">모두 보기</div>
                        </header>

                        <div class="scroll_inner">
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                            <div class="thumb_user">
                                <div class="profile_thumb">
                                    <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                                </div>
                                <div class="detail">
                                    <div class="id">kind_tigerrrr</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="recommend">
                        <header class="reco_header">
                            <div>회원님을 위한 추천</div>
                            <div class="more">모두 보기</div>
                        </header>

                        <div class="thumb_user">
                            <div class="profile_thumb">
                                <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id">kind_tigerrrr</div>
                                <div class="time">1시간 전</div>
                            </div>
                        </div>
                        <div class="thumb_user">
                            <div class="profile_thumb">
                                <img src="resources/css/p_coronagram/imgs/thumb02.jpg" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id">kind_tigerrrr</div>
                                <div class="time">1시간 전</div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>
    </section>
			<form action="#" id="postForm" method="post">
           	  <input type="hidden" name="m_no" value="${sMNo}"/> 
		   </form>
    <script src="resources/script/menu_bar/menu_bar.js"></script> <!-- script-->
</body>

</html>