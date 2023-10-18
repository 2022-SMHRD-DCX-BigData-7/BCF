<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
   <head>
      <title>Insert title here</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${cPath}/resources/css/index.css">
      <style type="text/css">
         body {
                 margin: 0;
                 padding: 0;
                 background-color: #fff;
                 background-size: cover;
                 background-repeat: no-repeat;
                 
             }
             .logo {
                 width: 200px;
                 transition: width 0.5s; /* 확대/축소 애니메이션을 위한 트랜지션 설정 */
                 margin-left: 793px;
             }
             .menu {
                 position: fixed;
                 left: 0;
                 top: 0;
                 height: 100%;
                 
                 padding: 0;
                 margin: 0;
                 list-style-type: none;
                 display: flex;
                 flex-direction: column;
                 align-items: flex-start;
             }
      
             .menu li {
                 padding: 20px;
                 width: 100px;
                 text-align: left;
             }
      
             .menu a {
                 text-decoration: none;
                 color: #fff;
                 font-weight: bold;
                 font-size: 24px;
             }
      
             .menu a:hover {
                 background: #555;
             }
             
             .logout-button {
               position: absolute;
               top: 20px;
               right: 20px;
               text-decoration: none;
               color: white;
               font-weight: bold;
               font-size: 24px;
               }
            
             .home-button {
               position: absolute;
               top: 20px;
               right: 150px; /* 로그아웃 버튼과의 간격 조절 */
               text-decoration: none;
               color: white;
               font-weight: bold;
               font-size: 24px;
                }
              
            .column1 {
             left: 514px;
            }
         
            .column2 {
            left: 602px;
            }
            
            .column3 {
            left: 746px;
            }
            
            .column4 {
            left: 912px;
            }
            .column5 {
             left: 514px;
            }
         
            .column6 {
            left: 602px;
            }
            
            .column7 {
            left: 746px;
            }
            
            .column8 {
            left: 912px;
            }
            .column1,
            .column2,
            .column3,
            .column4,
            .column5,
            .column6,
            .column7,
            .column8 {
               top: 119px;
               text-align: center; /* 텍스트를 중앙 정렬하거나 필요에 따라 조절하세요 */
            } 
            
            #alarm{
               position: relative;
             left: -16px;
             top: 95px;
            }
            .top-navbar {
              position: fixed;
              top: 0;
              left: 0;
              width: 100%;
              /* background-color: rgba(0, 0, 0, 0.5); */
              display: flex;
              justify-content: space-around;
              align-items: center;
              height: 60px; /* 메뉴의 높이를 조절합니다 */
            }

          .top-navbar a {
              text-decoration: none;
              color: black;
              font-weight: bold;
              font-size: 25px;
              padding: 10px 25px; /* 각 메뉴의 내부 여백을 조절합니다 */
          }
      
          .top-navbar a:hover {
              /* background-color: #555; */
          }
          
          th, td {
                font-size: 17px;
             text-align: center;
             padding: 0px;
             position: relative;
             right: 64px;
             bottom: -195px;
             overflow-y: overlay;
        
          }     
          
          #table1 {
             max-height: 375px;
             overflow-y: scroll;
             margin: 1px -13px;
             width: 140%;
             position: relative;
             top: -7px;
             left: -9%;
             margin-bottom: -233px;
             max-width: 340px;
         }
         #paging{
         	position: relative;
         	bottom:1000%;
         	left:50%;
         }  
      </style>

      <script type="text/javascript">
         var pageNum=1;
         var pageAll=0;
         $(document).ready(function() {
            alarmList(pageNum);
         });
         function alarmList(pageNum) {
            $.ajax({
               url : "${cPath}/userallalarm",
               type : "get",
               dataType : "json",
               success : function(data){
            	   pageAll=Object.keys(data).length;
                   var bList = "<table>";
                     bList += "<tr>";
                     bList += "<td class='column1'>번호</td>";
                     bList += "<td class='column2'>카메라 번호</td>";
                     bList += "<td class='column3'>날짜</td>";
                     bList += "<td class='column4'>내용</td>";
                     bList += "</tr>";
                 $.each(data,function(index, obj) {
            		if(index>=(pageNum-1)*10&&index<10*pageNum){
            			console.log((index>=(pageNum-1)*10)&&index<10*pageNum)
	                    bList += "<tr>";
	                    bList += "<td class='column1'>"+obj.alarm_idx+"</td>";
	                    bList += "<td class='column2'>"+obj.camera_idx+"</td>";
	                    bList += "<td class='column3'>"+obj.alarm_date+"</td>";
	                    bList += "<td class='column4'>"+obj.alarm_content+"</td>";
	                    bList += "</tr>";
            		}
                 });
                 bList += "</table>";
                 $('#table1').html(bList);
                 var cList="";
                 for (var i=1;i<pageAll/10+1;i++){
                 	cList += "<button value='"+i+"' onclick='alarmList(this.value)'>"+i+"</button>"
                 }
                 $('#paging').html(cList);
               },
               error : function() {
                  alert("ajax 통신 실패1");
               }
            });
         }
      </script>
   </head>
   <body>
      <div class="top-navbar">
       <a class="home-button" href="${cPath}/home.do" style="margin: -12px 0;">홈</a>
       <a class="logout-button" href="${cPath}/logout.do" style="margin: -12px 0;">로그아웃</a>
       <a href="${cPath}/home.do">
           <img src="${cPath}/resources/logo3.png" alt="로고 설명" style="width: 235px; position: relative; top: 37px;">
       </a>
     </div>
       
       <!-- 테이블 레이아웃 및 데이터 -->
      <h2 id="alarm" style="color: black; text-align: center;">실시간 알람 내역</h2>
       <div class="table" id="table1">
           
       </div>
       <div id="paging">
       		
       </div>
   </body>
</html>
