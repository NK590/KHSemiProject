<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

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
    <title>메인-초안</title>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <header>
        <div class="row justify-content">
            <div class="col-4">
                <img src="images/project_logo.PNG" class="d-block w-100" id="main-logo">
            </div>
            <div class="col" id="nav-item">
                <nav class="nav">
                    <a class="nav-link" href="/product.pro">제품 보기</a>
<<<<<<< HEAD
                    <a class="nav-link" href="#">리뷰</a>
=======
                    <a class="nav-link" href="/review.bo?currentPage=1">리뷰</a>
>>>>>>> 1ddeba4c379d3d0ae61170930344163fc52988b8
                    <a class="nav-link" href="/inquiry.iq?currentPage=1">고객센터</a>
                    <a class="nav-link" href="#">로그인</a>
                    <a class="nav-link" href="#">회원가입</a>
                    <a class="nav-link" style="color: rgb(255, 94, 0);" href="/petInput.pet">구독하기</a>
                </nav>
            </div>
        </div>
    </header>
	
    <!--캐러셀로 공지사항 및 이벤트 안내-->
    <div class="row justify-content-center">
        <div class="col-4">
            <div id="banner-caption" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">사랑하는 나의 가족 친구를 위한 선택</strong></h1>
                                <h4>6월, 바우와우 뮤뮤와 함께한 후기를 들려주세요 상품이 기다리고 있습니다</h4>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">사랑하는 나의 가족 친구를 위한 선택</strong></h1>
                                <h4>6월, 바우와우 뮤뮤와 함께한 후기를 들려주세요 상품이 기다리고 있습니다</h4>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">사랑하는 나의 가족 친구를 위한 선택</strong></h1>
                                <h4>6월, 바우와우 뮤뮤와 함께한 후기를 들려주세요 상품이 기다리고 있습니다</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#banner-caption"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#banner-caption"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <!--메인영역-->
    <!--구분선-->
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
    <div class="container">
        <!--상품 이미지 영역입니다 해당 이미지를 클릭 시 상품 상세정보로 이동-->
        <div class="row justify-content-around">
            <div class="col" id="product-imgs" style="margin-left: 100px;">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-5">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-1">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-around">
            <div class="col" id="product-imgs" style="margin-left: 100px;">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-5">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-1">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
        </div>
    </div>
    <br>
    <br>
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
    <!--메인 속 상품 이미지 리뷰 이미지 구분선-->
    <div class="row justify-content-around">
        <!--리뷰 영역 리뷰 클릭 시 해당 리뷰 게시물로 이동-->
        <div class="col-4">
            <br>
            <br>
            <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
        </div>
        <div class="col-4">
            <br>
            <br>
            <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
        </div>
        <div class="row justify-content-around">
            <div class="col-4">
                <br>
                <br>
                <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
            </div>
            <div class="col-4">
                <br>
                <br>
                <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
            </div>
            <div class="footer">
                <ul class="ft-ul">
                    <li>BoriBob Inc. 사랑시 고백구 행복동</li>
                    <li>대표 : 보리밥형제들 사업자등록번호 : 780-86-01094</li>
                    <li>대표번호 : +82)-665-3430 팩스번호 : +82)-888-3430 홈페이지 : petvenience.store.com</li>
                    <li>CopyrightⓒBoriBob Inc. All Rights Reserved.</li>
                    <div class="facebookicon">
                        <img src="images/facebook_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="instagramicon">
                        <img src="images/instagram_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="youtubeicon">
                        <img src="images/youtube_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="ft-ul2">
                        <li><strong>고객센터</strong></li>
                        <li style="height: 8px;"></li>
                        <li>오전 10시부터 오후 6시까지</li>
                        <li>토요일, 일요일, 공휴일 휴무</li>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>