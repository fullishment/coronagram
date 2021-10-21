<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <style>
			#imgAtt{
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
						$("#preView").html("<img src=\"resources/images/edit_profile/"+imgAdr+"\" id=\"prevImg"+"\">");
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
<form action="adminUser" id="backForm" method="post">
      <input type="hidden" name="no" value="${param.no}" />
</form>
<div class="card">
<form id="imgForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="imgAtt" id="imgAtt" >
</form>
  <form action="#" id="actionForm" method="post">
    <div class="input_area">
      <!-- <label for="photo-upload" class="custom-file-upload fas">
        <div class="img-wrap img-upload">
          <img for="photo-upload" src="https://github.com/OlgaKoplik/CodePen/blob/master/profile.jpg?raw=true"/>
        </div>
      </label> -->
      
    <div class="qnaImg">
	<input type="hidden"  name="imgFile" id="imgFile" >	
	<div id="preView" class="img-wrap">
		<img name="image" id="image" src="resources/images/edit_profile/${fn:replace(fn:replace(data.IMG_ADR, '[', '%5B'), ']', '%5D')}" onerror="this.style.display='none'" />
	</div>
		<input type="button" class="fileBtn" id="imgBtn" value="사진 변경"/>
	</div>
	
		   <input type="hidden" name="searchGbn" value="${param.searchGbn }" />
		   <input type="hidden" name="searchTxt"  value="${param.searchTxt}" />
		   <input type="hidden" name="page" value="${param.page}"  />
		   <input type="hidden" name="no" value="${param.no}" />
	  
	  
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
      백신 접종 여부 <label><input type="radio" id="vec" name="vec" value="y" checked> 예</label>
      <label><input type="radio" id="vec" name="vec" value="n"> 아니오</label><br>
      <p>주소</p>
      <input type="text" id="cm_postcode" name="cm_postcode" class="post_num" value="${data.POST_NO}">
      <button type="button" class="find_btn" onclick="cm_execDaumPostcode()">찾기</button><br>
      <input type="text" id="cm_address" name="cm_address" value="${data.ADR}"><br>
      <input type="text" id="cm_detailAddress" name="cm_detailAddress" value="${data.DTL_ADR}"><br>
<!-- 회원등급 -->
	  <p>회원등급</p>
      <input type="text" id=acct_no name="acct_no" value="${data.ACCT_TYPE_NO}"><br>
     <!--  <span class="title_Name">회원등급</span><br>
      <select class="user_tier" name="user_tier" >
        <option value="Bronze">Bronze</option>
        <option value="Sliver">Sliver</option>
        <option value="Gold ">Gold </option>
        <option value="Platinum ">Platinum </option>
        <option value="Diamond ">Diamond </option>
      </select>
      <br> -->
<!-- 포인트 -->
      <span>포인트</span> <br>
      <input type="text" class="point_con" id="point" name="point" value="${data.POINT}">P<br>
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
