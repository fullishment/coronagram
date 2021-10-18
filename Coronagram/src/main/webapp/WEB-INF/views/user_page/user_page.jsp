<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/menu_bar/menu_bar.css">
    <link rel="stylesheet" href="../resources/css/user_page/user_page.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title><%= request.getAttribute("nicknm") %>님 개인 페이지</title>
    <style>
    	.img_size{
    		width:500px;
    		height:500px;
    	}
    	
    </style>
            <script>
        $(document).ready(function(){
        	reloadList();
        	$("#editBtn").on("click",function(){	   
  			  $("#editForm").attr("action","../edit_profile");
  			  $("#editForm").submit(); 
  		   });
        	
            $(document).on("click",".gallery-item",function(){
            	
            	$("#writingNo").val($(this).attr("wtno"));
            	modal.style.display="block";
            	mdDraw();   
            	slide();
            });
            var modal = document.getElementById('myModal');
            
            $(".close").on("click",function(){
            	modal.style.display="none";
            });

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            
        });
        function reloadList(){
			var params=$("#addrForm").serialize();
			
			$.ajax({ 
				url:"userpages",
				type:"POST",
				dataType:"json",
				data:params,
				success : function(res){	
					drawList(res.list);
					intro(res.intro);
					introNm(res.intro);
					profileCnt(res.follow,res.following);
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
		}
        function intro(intro){
        	var html ="";
        	html+="<h1 id=\"mId\" class=\"profile-user-name\">"+intro.NICK_NM+"</h1>    ";
        	$(".profile-user-setting").html(html);
        	
        }
        function introNm(intro){
        	var html ="";
        	html+="<span class=\"profile-real-name\">"+intro.M_NM+"</span>";
        	html+="<div class=\"intro_con\">"+intro.INTRO_CON+"</div>";
        	$(".profile-bio").html(html);
        }
        function profileCnt(follow,following){
			var html ="";
			html +="<li><span class=\"profile-stat-count\"></span> posts</li>";
		    html +="<li><span class=\"profile-stat-count\">"+follow.fi+"</span>followers</li>";
		    html +="<li><span class=\"profile-stat-count\">"+following.fo+"</span>following</li>";
	    	$("#profile-stat").html(html);
        }
	    function drawList(list){
			var html ="";
			
			for(var data of list){                                                                                    
				html+= "<div class=\"gallery-item\" tabindex=\"0\" wtno=\""+data.WRITING_NO+"\" no=\""+data.M_NO+"\">                                     "; 
				html+= "		<div class=\"gallery-item-type\">																";
				html+= "            <span class=\"visually-hidden\"></span><i class=\"fas fa-clone\" aria-hidden=\"true\"></i>		";
				html+= "        </div>																						";
			    html+= "    	<img src=\""+data.FILE_ADR+"\" class=\"gallery-image\" alt=\"\" />							 "; 
			    html+= "    	<div class=\"gallery-item-info\">                                                              "; 
			    html+= "        	<ul>                                                                                     "; 
			    html+= "            <li class=\"gallery-item-likes\"><span class=\"visually-hidden\">Likes:</span><i         "; 
			    html+= "                    class=\"fas fa-heart\" aria-hidden=\"true\"></i>"+data.LCNT+"</li>               "; 
			    html+= "            <li class=\"gallery-item-comments\"><span class=\"visually-hidden\">Comments:</span><i   "; 
			    html+= "                    class=\"fas fa-comment\" aria-hidden=\"true\"></i>"+data.CCNT+"</li>             "; 
			    html+= "        	</ul>                                                                                    ";
			    html+= "    	</div>                                                                                       "; 
		    	html+= "</div>                                                                                           "; 
			}
			
			$("#gallery").html(html);
		}
	    function mdDraw(){
	    	
	    	var params = $("#modalForm").serialize();
			$.ajax({
				url : "modalpages",
				type : "get",
				dataType : "json",
				data : params,
				success : function(res){	
					drawModal(res.modalM);
					drawModalImg(res.md);
					console.log(res.modalM);
					drawModalCmt(res.modalCmt);
					console.log(res.modalCmt);
					slide();
				},
				error : function(request, status, error){
					console.log("에러");
					console.log(error);
				}
			});
	    }
	    function drawModal(modalM){   
	    	var html ="";
	    		
				 html+="   	<div class=\"modal-content\">                                                                                ";
			     html+="       <div class=\"modal_img\">                                                                                 ";
			     html+="           <div class=\"slider\">                                                                                ";
			     html+="               <div class=\"slide-viewer\">                                                                      ";
			     html+="               <div id=\"slide-group\" class=\"slide-group\">                                                      ";	                                                                        
			     html+="               </div>                                                                                          ";
			     html+="               </div>                                                                                          ";
			     html+="               <div class=\"slide-nav\">                                                                         ";
			     html+="                   <div class=\"prev\"></div>                                                                    ";
			     html+="                   <div class=\"next\"></div>                                                                    ";
			     html+="               </div>                                                                                          ";
			     html+="               <div class=\"slide-buttons\"></div>                                                               ";
			     html+="           </div>                                                                                              ";
			     html+="       </div>                                                                                                  ";
			     html+="       <div class=\"modal_box\">                                                                                 ";
			     html+="           <div class=\"cmt_head\">                                                                              ";
			     html+="               <span id=\"close\" class=\"close\">&times;</span>                                                   ";
			     html+="               <div class=\"user_container\">                                                                    ";
			     html+="                   <div class=\"profile_img\">                                                                   ";
			     html+="                       <img src=\"resources/css/p_coronagram/imgs/thumb.jpeg\" alt=\"프로필이미지\">               ";
			     html+="                   </div>                                                                                      ";
			     html+="                   <div class=\"user_name\">                                                                     ";
			     html+="                       <div class=\"nick_name head_text\">"+modalM.NICK_NM+"</div>                                        ";
			     html+="                   </div>                                                                                      ";
			     html+="               </div>                                                                                          ";
			     html+="           </div>                                                                                              ";
			     html+="           <div class=\"cmt_sec1\">                                                                              ";
			     html+="                   <div class=\"user_container\">                                                                ";
			     html+="                       <div class=\"profile_img\">                                                               ";
			     html+="                           <img src=\"resources/css/p_coronagram/imgs/thumb.jpeg\" alt=\"프로필이미지\">           ";
			     html+="                       </div>                                                                                  ";
			     html+="                       <div class=\"user_name\">                                                                 ";
			     html+="                           <div class=\"nick_name head_text\">"+modalM.NICK_NM+"</div>                                    ";
			     html+="                       </div>                                                                                  ";
			     html+="                   </div>                                                                                      ";
			     html+="                   <div class=\"modal_con\">"+modalM.CON+"</div>                                                               ";
			     html+="                   <div class=\"modal_cmt\"></div> 																";
			     html+="           </div>                                                                                              ";
			     html+="           <div class=\"cmt_sec2\">                                                                              ";
			     html+="               <div class=\"bottom_icons\">                                                                      ";
			     html+="                   <div class=\"left_icons\">                                                                    ";
			     html+="                       <div class=\"heart_btn\">                                                                 ";
			     html+="                           <div class=\"sprite_heart_icon_outline\" name=\"39\" data-name=\"heartbeat\">             ";
			     											
			     html+="                                     <input type=\"checkbox\" id=\"checkbox\" >                                     ";
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
			     html+="                           </div>                                                                                                                  ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                       <div class=\"sprite_bubble_icon\">                                                                                          ";
			     html+="                           <i class=\"far fa-comment f_size\"></i>                                                                                 ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                       <div class=\"sprite_share_icon\" data-name=\"share\">                                                                       ";
			     html+="                           <i class=\"far fa-paper-plane f_size\"></i>                                                                             ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                   </div>                                                                                                                          ";
			     html+="                   <div class=\"right_icon\">                                                                                                      ";
			     html+="                       <div class=\"sprite_bookmark_outline\" data-name=\"bookmark\"></div>                                                        ";
			     html+="                   </div>                                                                                                                          ";
			     html+="               </div>                                                                                                                              ";
			     html+="               <div class=\"likes head_text\">                                                                                                     ";
			     html+="                   좋아요                                                                                                                          ";
			     html+="                   <span id=\"like-count-39\">"+modalM.LCNT+"</span>                                                                                 ";
			     html+="                   <span id=\"bookmark-count-39\"></span>                                                                                          ";
			     html+="                   개                                                                                                                              ";
			     html+="               </div>                                                                                                                              ";
			     html+="           </div>                                                                                                                                  ";
			     html+="           <div class=\"cmt_field\" id=\"cmt_field\">                                                                                              ";
			     html+="               <textarea class=\"cmt_con\" placeholder=\"댓글 달기...\"></textarea>                                                                ";
			     html+="               <div class=\"m_text head_text\" id=\"add_cmt\">게시</div>                                                                           ";
			     html+="           </div>                                                                                                                                  ";
			     html+="       </div>                                                                                                                          ";
			     html+="   </div>                                                                                                                              ";
	    	
		    	 $("#myModal").html(html);
	    }                        
	    function drawModalCmt(modalCmt){  
	    	var html ="";                                                                                                                                  
                                                                                                                                    
			for(var list of modalCmt){                                                                                                                              				
			     html+="               <div class=\"comment_container\">                                                                                                   ";
			     html+="                   <div class=\"comment\" id=\"comment-list-ajax-post37\">                                                                         ";
			     html+="                       <div class=\"comment-detail\">                                                                                              ";
			     html+="                           <div class=\"head_text\">"+list.NICK_NM+"</div>                                                                                ";
			     html+="                           <div>"+list.CMT_CON+"</div>                                                                                     ";
			     html+="                       </div>                                                                                                                      ";
			     html+="                   </div>                                                                                                                          ";
			     html+="               </div>                                                                                                                              ";
			     html+="               <div class=\"timer\">"+timeForToday(list.DT)+"</div>                                                                                                 ";
			}
			
			$(".modal_cmt").html(html);
	    };
	    function timeForToday(value) {
	        const today = new Date();
	        const timeValue = new Date(value);

	        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        if (betweenTime < 1) return '방금전';
	        if (betweenTime < 60) {
	            return `${betweenTime}분전`;
	        }

	        const betweenTimeHour = Math.floor(betweenTime / 60);
	        if (betweenTimeHour < 24) {
	            return `${betweenTimeHour}시간전`;
	        }

	        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeDay < 365) {
	            return `${betweenTimeDay}일전`;
	        }

	        return `${Math.floor(betweenTimeDay / 365)}년전`;
	 }
	    function drawModalImg(md){                                                                                                                         
			var html ="";                                                                                                                                  
			var i=1;                                                                                                                                       
			for(var list of md){                                                                                                                              
				
				html+=" <div class=\"slide slide-"+i+"\">                                       ";
                html+=" <img src=\""+list.FILE_ADR+"\" alt=\"\" />	   							    ";
	           	html+=" </div>                                                                  ";
				i++;	
			}
			
			$("#slide-group").html(html);
		}
	    function slide(){
	    	$('.slider').each(function(){
	            var $this = $(this);
	            var $group = $this.find('.slide-group');
	            var $slides = $this.find('.slide');
	            var buttonArray = [];
	            var currentIndex = 0;

	            var $nav = $('.slide-nav').find('div');
	        
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
	            }).appendTo('.slide-buttons');
	            buttonArray.push($button);
	        });
	        })
	    }
        </script>
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
                            <a href="logout" class="cm_logout"><i class="cm_icon-logout"></i> <span>로그아웃</span> </a>
                        </li>
                        <li>
                            <a href="#" class="cm_userinfo">개인정보수정</a>
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
    <main>
        <header>
            <div class="container">    
                <div class="profile">   
                    <div class="profile-image">
                            <img src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces"
                            alt="">    
                    </div>    
                    <div class="profile-user-settings">    
                        <div class="profile-user-setting">
                        </div>
                        <button id="editBtn" class="btn profile-edit-btn">Edit Profile</button>    
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog"
                                aria-hidden="true"></i></button>
                        <button id="follow_btn" class="follow_btn">follow</button>    
                    </div>  
                    <div class="profile-stats">  
                        <ul id="profile-stat">
                        
                        </ul>   
                    </div>   
                    <div class="profile-bio">    
                        
                        
                    </div>    
                </div>
                <!-- End of profile section -->
            </div>
            <!-- End of container -->
        </header>
        <div id="myModal" class="modal">
            
        </div>
        
        <div class="container">
            <div id="gallery" class="gallery">

            </div>
            <!-- End of gallery -->
            
        </div>
        <!-- End of container -->
    </main>
    		<form action="#" id="addrForm" method="post">
    			<input type="hidden" name="writingNo"/>
    			<input type="hidden" name="nickNm" value="<%= request.getAttribute("nicknm") %>"/>
    		</form>
           <form action="#" id="editForm" method="post">
               <input type="hidden" name="m_no" value="${sMNo}"/>  
           </form>
           <form action="#" id="modalForm" method="get">
    	   	  <input type="hidden" name="writingNo" id="writingNo"/>
    	   	  <input type="hidden" name="nickNm" value="<%= request.getAttribute("nicknm") %>"/>
		   </form>
    <script src="../resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>