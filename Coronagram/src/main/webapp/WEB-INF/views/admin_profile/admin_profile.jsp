<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <style>
			#imgBtn{
				display:none;
			}
			#preView{
			width:200px;
			hegiht:200px;
			}
  </style>
  <title></title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
  <link rel="stylesheet" href="resources/css/menu_bar/menu_bar.css">
  <link rel="stylesheet" href="resources/css/admin_profile/admin_profile.css">
  <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
  <script type="text/javascript">
  function autoDtFormat(obj) {
	    if(event.keyCode != 8) {
	        if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
	            let number = obj.value.replace(/[^0-9]/g,"");
	            let ymd = "";
	            if(number.length < 4) {
	                return number;
	            } else if(number.length < 6){
	                ymd += number.substr(0, 4);
	                ymd += "-";
	                ymd += number.substr(4);
	            } else {
	                ymd += number.substr(0, 4);
	                ymd += "-";
	                ymd += number.substr(4, 2);
	                ymd += "-";
	                ymd += number.substr(6);
	            }
	            obj.value = ymd;
	        } else {
	            alert("숫자 이외의 값은 입력하실 수 없습니다.");
	            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
	            return false;
	        }
	    } else {
	        return false;
	    }
	}
	function checkValidDate(value) {
		var result = true;
		try {
		    var date = value.split("-");
		    var y = parseInt(date[0], 10),
		        m = parseInt(date[1], 10),
		        d = parseInt(date[2], 10);
		    
		    var dateRegex = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
		    result = dateRegex.test(d+'-'+m+'-'+y);
		} catch (err) {
			result = false;
		}    
	    return result;
	}
	function inputTelNumber(obj) {
	
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var tel = "";
	    var seoul = 0;
	    if(number.substring(0, 2).indexOf('02') == 0) {
	        seoul = 1;
	    }
	    if(event.keyCode != 8) {
	        if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
			    if(number.length < (4 - seoul)) {
			        return number;
			    } else if(number.length < (7 - seoul )) {
			        tel += number.substr(0, (3 - seoul));
			        tel += "-";
			        tel += number.substr(3 - seoul);
			    } else if(number.length < ( 11 - seoul)) {
			        tel += number.substr(0, (3 - seoul));
			        tel += "-";
			        tel += number.substr((3 - seoul), 3);
			        tel += "-";
			        tel += number.substr(6 - seoul);
			    } else{
			        tel += number.substr(0, (3 - seoul));
			        tel += "-";
			        tel += number.substr((3 - seoul), 4);
			        tel += "-";
			        tel += number.substr(7 - seoul);
			    }
	        }else {
	            alert("숫자 이외의 값은 입력하실 수 없습니다.");
	            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
	            return false;
	        }
	    }else {
	        return false;
	    }
	    obj.value = tel;
	}
$(document).ready(function(){
	$("#cancelBtn").on("click", function(){
	      $("#backForm").submit();
	   });
	$("#actionForm").on("keypress", "input", function(event){
	      if(event.keyCode == 13){
	         return false;
	      }
	   });
//이미지
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
						var imgAdr = res.fileName[0].replace('[', '%5B').replace(']', '%5D');
						//$("#preView").attr("src", "resources/upload/"+imgAdr);
						$("#preView").html("<img src=\"resources/upload/"+imgAdr+"\" id=\"prevImg"+"\">");
					}
				}else{
					alert("파일 업로드에 실패하였습니다.");
				}
			},
			error:function(req,status,error){
				console.log(error);
				alert("파일 업로드중 문제가 발생하였습니다.");
			}
		});					
		imgForm.submit();
	});
//수정
	$("#updateBtn").on("click", function(){
	      if(checkVal("#mId")) {
	         alert("ID를 입력해 주세요.");
	         $("#mId").focus();
	      }
	      else if(checkVal("#mNm")){
		         alert("이름을 입력하세요.");
		         $("#mNm").focus();
	      }
	      else if(checkVal("#nickNm")){
		         alert("닉네임을 입력하세요.");
		         $("#nickNm").focus();
	      }
	      else if(checkVal("#mPhone")){
	         alert("전화번호를 입력하세요.");
	         $("#mPhone").focus();
	         
	      }else if(checkVal("#email")){
	          alert("이메일을 입력하세요.");
	          $("#email").focus();
	         
	      }else {
	       		
	         var params = $("#actionForm").serialize();
	         
	         $.ajax({
	            url : "AProUps",
	            type : "post",
	            dataType : "json",
	            data : params,
	            success : function(res){
	               if(res.result == "success"){
	                  $("#backForm").submit();
	               } else if(res.result == "failed"){
	                  alert("수정에 실패하였습니다.");
	               } else {
	                  alert("수정중 문제가 발생했습니다.");
	               }
	            },
	            error : function(request, status, error){
	               console.log(error);
	            }
	        });
		}
	});
//삭제
	$("#deleteBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			$.ajax({
				url: "AProDels",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					if(res.result== "success"){
						location.href="adminUser";
					}
					else if(res.result== "failed"){
						alert("삭제에 실패하였습니다.");
					}else{
						alert("삭제중 문제가 발생했습니다.");
					}
				},
				error:function(request,status,error){
					console.log(error);
				}
			});
		}					
	});
});
//공백함수
function checkVal(sel){
      if($.trim($(sel).val())==""){
         return true;
      }
      else{
         return false;
      }
   }
$(function() {
    $("#imgFile").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImage').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
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
<form action="adminUser" id="backForm" method="post">
      <input type="hidden" name="no" value="${param.no}" />
</form>
<div class="card">
<form id="imgForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="imgAtt" id="imgAtt" >
</form>
  <form action="#" id="actionForm" method="post">
    <div class="input_area">
      <label for="imgBtn" class="custom-file-upload fas">
        <div class="img-wrap img-upload">
          <img for="photo-upload" src="https://as2.ftcdn.net/v2/jpg/02/17/34/67/500_F_217346782_7XpCTt8bLNJqvVAaDZJwvZjm0epQmj6j.jpg"/>
        </div>
      </label> 
      
    <div class="qnaImg">
	<input type="hidden"  name="imgFile" id="imgFile" value="${data.IMG_ADR}">
	<div id="preView" class="img-wrap">
		<img name="image" id="image" src="resources/upload/${fn:replace(fn:replace(data.IMG_ADR, '[', '%5B'), ']', '%5D')}" onerror="this.style.display='none'" />
	</div>
		<input type="button" class="fileBtn" id="imgBtn" value="사진 변경"/>
	</div>
	
		   <input type="hidden" name="searchGbn" value="${param.searchGbn }" />
		   <input type="hidden" name="searchTxt"  value="${param.searchTxt}" />
		   <input type="hidden" name="page" value="${param.page}"  />
		   <input type="hidden" name="no" value="${param.no}" />
		   <input type="hidden" id="no" name="no" value="${data.M_NO}">
		   <input type="hidden" id="smno" name="smno" value="${data.M_NO}">
	  
    <input type="file" id="photo-upload" class="img-wrap img-upload"><br>
    <input type="hidden" name="id">
      <p>ID</p>
      <input type="text" id="mId" name="mId" value="${data.M_ID}"><br>
      <p>이름</p>
      <input type="text" id="mNm" name="mNm" value="${data.M_NM}"><br>
      <p>닉네임</p>
      <input type="text" id="nickNm" name="nickNm" value="${data.NICK_NM}"><br>
       <p>전화번호</p>
      <input type="text" id="mPhone" name="mPhone" value="${data.PHONE}" onKeyup="inputTelNumber(this);" maxlength="13"><br>
      <p>이메일</p>
      <input type="text" id="email" name="email" value="${data.EMAIL}"><br>
      백신 접종 여부
      <c:choose>
		<c:when test="${data.VAC_YN eq 'y'}">
			<label><input type="radio" id="vec" name="vec" value="y" checked> 예</label>
      		<label><input type="radio" id="vec" name="vec" value="n"> 아니오</label><br>
		</c:when>
		<c:otherwise>
			<label><input type="radio" id="vec" name="vec" value="y" > 예</label>
      		<label><input type="radio" id="vec" name="vec" value="n" checked> 아니오</label><br>
		</c:otherwise>      
      </c:choose>
      좋아요 유형
      <c:choose>
		<c:when test="${data.SET1 == 0}">
			<label><input type="radio" id="like" name="like" value="0" checked> 간략</label>
      		<label><input type="radio" id="like" name="like" value="1"> 길게</label><br>
		</c:when>
		<c:otherwise>
			<label><input type="radio" id="like" name="like" value="0" > 간략</label>
      		<label><input type="radio" id="like" name="like" value="1" checked> 길게</label><br>
		</c:otherwise>      
      </c:choose>
      <p>주소</p>
      <input type="text" id="cm_postcode" name="cm_postcode" class="post_num" value="${data.POST_NO}">
      <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
      <input type="text" id="cm_address" name="cm_address" value="${data.ADR}"><br>
      <input type="text" id="cm_detailAddress" name="cm_detailAddress" value="${data.DTL_ADR}"><br>
<!-- 회원등급 -->
	       <p>회원등급</p>
      	<%-- <input type="text" id=acct_no name="acct_no" value="${data.ACCT_TYPE_NO}"><br> --%>
		<!--  <span class="title_Name">회원등급</span><br>-->
   <c:if test="${!empty testList}">
      <select class="user_tier" name="user_tier" >
       <c:forEach var="testList" items="${testList}" varStatus="i">
       <c:choose>
       <c:when test="${data.ACCT_TYPE_NO == testList.TYPE_NO }">
          <option value="${testList.TYPE_NO}" selected >${testList.TYPE_NM}</option>
       </c:when>
       <c:otherwise>
          <option value="${testList.TYPE_NO}" >${testList.TYPE_NM}</option>
       </c:otherwise>
         
         </c:choose>
      </c:forEach>
      </select>
      </c:if>
      <br>
<!-- 자기소개 -->
      <p>자기소개</p>
      <input type="text" id="intCon" name="intCon" value="${data.INTRO_CON}"><br>  
        <button type="button" id="updateBtn" class="edit_btn">수정</button>
        <button type="button" id="deleteBtn" class="del_btn">삭제</button>
        <button type="button" id="cancelBtn" class="cancel_btn">취소</button>
       </div>
    </form>
</div>
</main>
<script src="resources/script/menu_bar/menu_bar.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>
function cm_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("cm_detailAddress").value = extraAddr;
            
            } else {
                document.getElementById("cm_detailAddress").value = '';
            }

            document.getElementById('cm_postcode').value = data.zonecode;
            document.getElementById("cm_address").value = addr;
            document.getElementById("cm_detailAddress").focus();
        } 
    }).open();
}
</script>
</body>
</html>
