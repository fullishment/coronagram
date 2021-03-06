<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css?after">
    <link rel="stylesheet" href="resources/css/admin_coinfo/admin_coinfo.css?after">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css'>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src = "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});

	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});
	
	$("#addForm").on("keypress","input",function(event){
		if(event.keyCode==13){
			return false;
		}
	});
	
	$("#imgBtn").on("click",function(){
		$("#imgAtt").click();
	});

	$("#imgAtt").on("change",function(){
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+1));
		var imgForm = $("#imgForm");
		imgForm.ajaxForm({
				success:function(res){
				if(res.result=="SUCCESS"){
					if(res.fileName.length > 0){
						$("#imgFile").val(res.fileName[0]);
						var imgRep = res.fileName[0].replace('[', '%5B').replace(']', '%5D');

						$("#preView").html("<img src=\"resources/upload/"+imgRep+"\" id=\"prevImg"+"\">");
					}
				}else{
					alert("?????? ???????????? ?????????????????????.");
				}
			},
			error:function(req,status,error){
				console.log(error);
				alert("?????? ???????????? ????????? ?????????????????????.");
			}
		});					
		imgForm.submit();
	});

	
	
	$("#addBtn").on("click",function(){	
 		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if(checkVal("#info_title")){
			alert("????????? ????????? ?????????");
			$("#info_title").focus();
		}else if(checkVal("#info_subhd")){
			alert("???????????? ????????? ?????????");
			$("#info_subhd").focus();
		}else if(checkVal("#con")){
			alert("????????? ????????? ?????????");
			$("#con").focus();
		}else{
			var params = $("#addForm").serialize();
			$.ajax({
				url:"coinfoAddAjax",
				type:"post",
				dataType:"json",
				data:params,
				success:function(res){
					if(res.result=="success"){
						location.href="admin_coinfo_list";
					}
					else if(res.result=="failed"){
						alert("????????? ?????????????????????.");
					}else{
						alert("????????? ????????? ??????????????????.");
					}
				},
				error:function(request,status,error){
					console.log(error);
				}
			});
		}
	});
});

function checkVal(sel){
	if($.trim($(sel).val())==""){
		return true;
	}
	else{
		return false;
	}
}
	
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




	<main>
        <div class="sc">
            <div class="scHead">
                <div>
                    <h4><i class="fas fa-user"></i> ????????? ?????????</h4>
                </div>
                <div>
                    <h2><p>????????? ?????? ?????????</p></h2>
                </div>
            </div>
            <div>
                <div class="sc-html">
                    <input id="tab-2" type="radio" name="tab" class="scm2" checked>
                    <label for="tab-2" class="tab">????????? ?????? ??????</label>
                    <div class="sc-form">
                    
                        <div class="scm2-htm">
                            <label for="user" class="sclabel">
                                <p>????????? ?????? ?????? ??????</p>
                            </label>
                            <div class="group">
                            
                            	<form action="admin_coinfo_list" id="backForm" method="post">
									<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
									<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
									<input type="hidden" name="page" value="${param.page}" />
								</form>
								
                            <!-- ??????????????? -->
                            	<form id="imgForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
									<input type="file" name="imgAtt" id="imgAtt" accept="image/*" >
								</form>
								
                            	<form action="#" id="addForm" method="post">
                           		<input type="hidden" name="m_no" value="${sMNo}">
                               
                                <div class="qnaTitle">
                                   	<div class="qnaTitle0">
                                		<span>????????????</span>
										<select class="disp_yn" name="disp_yn">
													<option value="Y">??????</option>
													<option value="N">??????</option>
										</select>
                                	</div>                                
                                
                                    <div class="qnaTitle1">
                                        <span>??????</span><input type="text" class="border" id="info_title" name="info_title" placeholder="????????? ???????????????">
                                    </div>
                                    <div class="qnaTitle2">
                                        <span>?????????</span><input type="text" class="border" id="info_subhd" name="info_subhd" placeholder="????????? ???????????????">
                                    </div>
                               	 </div>
                               	 
                              	 <div class="qnaMain">
                                    <div class="qnaCon">
                                        <p>??????</p><textarea class="QCI" type="text" id="con" name="con" placeholder="????????? ???????????????"></textarea>
                                    </div>
                                    <div class="qnaImg">
										<span>???????????????</span><input type="button" value="file" class="fileBtn" id="imgBtn" />
										<span id="fileName"></span>		
										<input type="hidden" name="imgFile" id="imgFile">							
									    <div id="preView">
									       <img src="resources/upload/${fn:replace(fn:replace(data.REP_IMG, '[', '%5B'), ']', '%5D')}" onerror="this.style.display='none'" />
									    </div>
									</div>
                              	  </div>
                              	  
                               </form>
	                               
                                <div class="qnaBtn">
                                 	<input type="button" id="addBtn" class="addBtn" value="??????" />
                                 	<input type="button" id="cancelBtn" class="cancelBtn" value="??????" />
                                </div>
                                
                            </div>
                        </div>
                    </div><!-- sc-html -->
                </div> <!-- sc-form -->
            </div>
        </div>
        
    </main>

    <script src="resources/script/menu_bar/menu_bar.js"></script>
</body>

</html>