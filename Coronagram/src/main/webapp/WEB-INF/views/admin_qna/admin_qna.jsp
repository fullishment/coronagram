<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/admin_qna/menu_bar.css">
    <link rel="stylesheet" href="../../resources/css/admin_qna/admin_qna.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <style>

    </style>
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
    <main>
        <div class="sc" id="sc">
            <div class="scHead" id="scHead">
                <div class="scName1" id="scName1">
                    <h4><p>관리자 페이지</p></h4>
                </div>
                <div class="scName2" id="scTitle2">
                    <h2><p>Q&A 게시판</p></h2>
                </div>
            </div>
            <div class="sc-wrap">
                <div class="sc-html">
                    <input id="tab-1" type="radio" name="tab" class="scm1" checked><label for="tab-1" class="tab"><p>FAQ 관리</p></label>
                    <input id="tab-2" type="radio" name="tab" class="scm2"><label for="tab-2" class="tab"><p>Q&A관리</p></label>
                    <div class="sc-form">
                        <div class="scm1-htm">
                            <label for="user" class="sclabel"><p>자주 묻는 질문 관리</p></label>
                            <div class="group">
                                <div class="qnaList">
                                    <table class="scmL" border="1">
                                        <thead class="scmLT">
                                            <tr>
                                                <th><p>번호</p></th>
                                                <th><p>제목</p></th>
                                                <th><p>등록일</p></th>
                                                <th><p>기능</p></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <!-- <table class="scmL" border="1">
                                        <tr class="scmLT">
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>등록일</th>
                                            <th>기능</th>
                                        </tr>
                                        <tr>
                                            <th>1</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="file:///C:/base/coronagram/view/admin_qna/admin_Qna_update.html"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>2</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="#"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>3</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="#"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>4</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="#"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>5</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="#"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>6</th>
                                            <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                            <td>2021-09-16</td>
                                            <td>
                                                <a href="#"> <button class="UpBtn" >수정</a>
                                                <button class="DelBtn">삭제
                                            </td>
                                        </tr>
                                    </table> -->
                                </div>
                            </div>
                        </div>
                        <div class="scm2-htm">
                            <label for="user" class="sclabel"><p>1:1 질문 관리</p></label>
                            <div class="group">
                               <div class="qnaList2">
                                <table class="scmL" border="1">
                                    <thead class="scmLT">
                                        <tr>
                                            <th><p>번호</p></th>
                                            <th><p>제목</p></th>
                                            <th><p>등록일</p></th>
                                            <th><p>기능</p></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                        <th>1</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <a href="file:///C:/base/coronagram/view/admin_qna/admin_Qna_answer.html"><button class="HaveA">답변하기</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>2</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <button class="OKA">답변완료
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>3</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <button class="OKA">답변완료
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>4</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <button class="OKA">답변완료
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>5</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <button class="OKA">답변완료
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>6</th>
                                        <td><a href="#">Q. 왜이리 어렵나요?</a></td>
                                        <td>2021-09-16</td>
                                        <td>
                                            <button class="OKA">답변완료
                                        </td>
                                    </tr> -->
                                </tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                     </div><!-- sc-form -->
                </div><!-- sc-html -->
            </div> <!-- sc-form -->
        </div>
    </main>
        <script src="../../resources/script/admin_qna/admin_Qna.js"></script>
        <script>
            //목록 그리기
      function drawList(list){
         var html ="";
         
         for(var data of list){
            html += "<tr no=\""+NO+"\">";
            html += "<td>"+TITLE+"</td>";
            html += "<td>"+DATE+"</td>";
            html += "<td>"+FUNC+"</td>";
         }
         
         $("tbody").html(html);
      }

        </script>
    </body>
    
    </html>