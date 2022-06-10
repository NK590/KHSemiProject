<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <title>문의게시판</title>
    <style>
        body {
            box-sizing: border-box;
        }

        .header {
            padding: 20px;
            position: relative;
        }

        .footer > * {
            padding: 20px;
            position: relative;
        }
        
        .ft-ul {
            list-style: none;
            text-align: center;
            height: 100%;
            padding-top: 28px;
            color: black;
            font-size: 12px;
            z-index: 1;
        }
        .ft-images {
            text-align: center;
        }
        .pagination > li > a{
        background-color: white;
        color: #7e60b0;
        }
        .container>.row{
            border-bottom: 1px solid black;
        }
        .container>.row:first-child{
            height: 60px;
        }
        .content{
            height: 40px;
        }
        .paging{
            margin-top: 20px;
        }
        .buttonBox{
            margin-right: 300px;
            margin-top: 20px;
        }
        .container>.row:first-child{
            border-bottom: 1px solid black;
        }
        textarea{
            resize: none;
            margin-bottom: 30px;
            background-color:#FFF !important;
        }
        .inquiryTitle{
          	background-color:#FFF !important;
        }
        .listAll>.row:nth-child(2){
            border-bottom: 1px solid lightgray;
        }
        .listAll>.row:nth-child(3){
            border-bottom: 1px solid lightgray;
        }
        .buttonBox2>button{
        	display:none;
        }
    </style>
</head>
<body>
	<div class="wrapper">
        <div class="row justify-content-center header">
            <div class="col-lg-4 col-12">
                <img src="/images/project_logo.PNG" class="d-block w-100" id="main-logo">
            </div>
            <div class="col-lg-8 col-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Boribob</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">제품 보기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">고객센터</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">회원 가입</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">리뷰</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/login.jsp">로그인</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">구독하기</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- 여기까지 헤더 -->
        <!-- 여기부터 바디 -->
        <div class= "container listAll">
            <div class="row text-center align-items-center">
                <div class="col-lg-1 col-2">번호</div>
                <div class="col-lg-5 col-10">제목</div>
                <div class="col-lg-3 d-none d-lg-block">작성자</div>
                <div class="col-lg-3 d-none d-lg-block">작성일</div>    
            </div>
            <c:choose>
				<c:when test="${list.size()==0}">
					<div class="row content text-center align-items-center">
						<div class="col">
							등록된 리뷰가 없습니다.
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
						<div class="row content text-center align-items-center" style="cursor: pointer;">
                			<div class="col-lg-1 col-2">${dto.seqReview}</div>
               		 		<div class="col-lg-5 col-10">${dto.reviewTitle}</div>
               	 			<div class="col-3 d-none d-lg-block">${dto.id}</div>
                			<div class="col-3 d-none d-lg-block">${dto.reviewDate}</div>    
           				</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>     
        </div>
        <script>
       		$(".content").on("click",function(e){
       			let seqReview = $(e.target).parent(".row").children().eq(0).html();
       			console.log(seqReview);
       			$.ajax({url:"/reviewListDetail.bo?seqReview="+seqReview
       				, type:"get"
       				, dataType:"json"
           			,success:function(rs){
           				console.log(rs);
           				makeInquiry(rs);
           			}, error: function(e){
        					console.log(e);
        			}
           		})
       				
       		});
       		
       		
       		$(".container").on("click",".modifyReview",function(e){//수정버튼
       			$(e.target).parent().children().css("display","none");
       			$(e.target).parent().next(".buttonBox2").children().css("display","block");
	       		$(".reviewTitle").attr("readonly",false);
	       		$(".reviewContent").attr("readonly",false);
	       		$(".reviewTitle").focus();
       		})
       		$(".container").on("click",".backBtn",function(){//뒤로가기버튼
    			location.href="/reviewList.bo"
    		})
    		$(".container").on("click",".deleteReview",function(e){//삭제버튼
    			let seqReview = $(e.target).val();
    			console.log(seqReview);
    			location.href="/reviewDelete.bo?seqReview="+seqReview;
    		})
    		$(".container").on("click",".cancelReview",function(e){//취소버튼
    			location.href="/ReviewList.bo"
    		})
       		$(".container").on("click",".submitReview",function(e){//수정완료버튼
       			let seqReview = $(e.target).val();
       			console.log(seqReview);
       			let reviewTitle = $(e.target).parent(".buttonBox2").parent(".container").find(".reviewTitle").val();
       			console.log(reviewTitle);
       			let reviewContent = $(e.target).parent(".buttonBox2").parent(".container").find("textarea").val();
       			console.log(reviewContent);
       			
       			$.ajax({
    				url : "/reviewUpdate.bo"
    				,type: "post"
    				, dataType:"json"
    				,data:{seqReview:seqReview,reviewTitle:reviewTitle,reviewContent:reviewContent}
    				,success:function(rs){
    					console.log(rs)
    					if(rs ==="fail"){
    						alert("수정에 실패했습니다.")
    					}else{
    						console.log(rs);
               				makeInquiry(rs);
    					}
    				}, error:function(e){
    					console.log(e)
    				}
    			})
    		})
    		function makeInquiry(rs){
       			$(".container").empty();
   				let container = $("<div class='container'>");
   				let row1 = $("<div class='row py-2'>")
   				let col1 = $("<div class='col-2 col-form-label'>").html("제목");
   				let col2 = $("<div class='col-10'>")
   				let text = $("<input type='text' readonly='readonly'>").addClass("form-control reviewTitle").val(rs.reviewTitle);
   				col2.append(text);
   				row1.append(col1,col2);
   					
   				let row2 = $("<div class='row py-2'>")
   				let col3 = $("<div class='col-lg-2 d-none d-lg-block col-form-label'>").html("작성자");
   				let col4 = $("<div class='col-lg-5 col-7'>").html(rs.id);
   				let col5 = $("<div class='col-lg-2 d-none d-lg-block col-form-label'>").html("작성일");
   				let col6 = $("<div class='col-lg-3 col-5'>").html(rs.reviewDate);
   				row2.append(col3,col4,col5,col6);
   					
   				let row3 = $("<div class='row py-2'>");
   				let col7 = $("<div class='col-2 form-label'>").html("내용");
   				let col8 = $("<div class='col-10'>");
   				let textarea = $("<textarea readonly class='reviewContent form-control' rows='20'>").val(rs.reviewContent);
   				col8.append(textarea);
   				row3.append(col7,col8);
   					
   				let buttonBox1 = $("<div class='buttonBox1 d-grid gap-3 d-flex justify-content-center'>")
   				let button1 = $("<button>").addClass("btn btn-outline-secondary modifyReview").html("수정").val(rs.seqReview);
   				let button2 = $("<button>").addClass("btn btn-outline-secondary deleteReview").html("삭제").val(rs.seqReview);
   				let button3 = $("<button>").addClass("btn btn-outline-secondary backBtn").html("뒤로가기")
   				let buttonBox2 = $("<div class='buttonBox2 d-grid gap-2 d-flex justify-content-center'>")
   				let button4 = $("<button>").addClass("btn btn-outline-secondary submitReview").html("완료").val(rs.seqReview);
   				let button5 = $("<button>").addClass("btn btn-outline-secondary cancelReview").html("취소").val(rs.seqReview);
   				buttonBox1.append(button1,button2,button3);
   				buttonBox2.append(button4,button5);
   				container.append(row1,row2,row3,buttonBox1,buttonBox2);
   				$(".container").append(container);
       		}
       		    		
        </script>
        <!-- 여기부터 풋터 -->
        <div class="row justify-content-center footer">
            <div class="col-lg-10 col-12">
                <ul class="ft-ul">
                    <li>BoriBob Inc. 사랑시 고백구 행복동</li>
                    <li>대표 : 보리밥형제들 사업자등록번호 : 780-86-01094</li>
                    <li>대표번호 : +82)-665-3430 팩스번호 : +82)-888-3430 홈페이지 : petvenience.store.com</li>
                    <li>CopyrightⓒBoriBob Inc. All Rights Reserved.</li>
                </ul>
            </div>
            <div class="col-lg-2 col-12">
                <ul class="ft-images">
                    <img src="/images/facebook_icon.png" style="border-color: lightblue;">
                    <img src="/images/instagram_icon.png" style="border-color: lightblue;">
                    <img src="/images/youtube_icon.png" style="border-color: lightblue;">
                </ul>
                <ul class="ft-ul">
                    <li><strong>고객센터</strong></li>
                    <li style="height: 8px;"></li>
                    <li>오전 10시부터 오후 6시까지</li>
                    <li>토요일, 일요일, 공휴일 휴무</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>