<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <title>상품상세-초안</title>
    <style>
        /*메인 로고 스타일*/
        #main-logo {
            margin-left: 123px;
            width: 350px;
            height: 200px;
        }

        body {
            background-color: rgb(255, 252, 221);
        }

        /*메뉴 폰트 스타일*/
        *.nav-link {
            color: rgb(44, 44, 44);
            font-size: large;
        }

        *.nav-link:hover {
            background-color: blanchedalmond;
            background-size: 3px;
        }

        /*메뉴 위치*/
        #nav-item {
            margin-top: 150px;
            margin-left: 325px;
        }


        #pro-explain {
            position: relative;
            border: 1px solid rgb(218, 218, 218);
            height: 600px;
            bottom: 100px;
            width: 1200px;
            text-align: center;
            margin-top: 200px;
            margin-left: 130px;
        }


        /*대략적인 구조를 직관적으로 확인하시라고 임의로 설정해 둔 테두리입니다!*/
        img {
            border: 1px solid rgb(218, 218, 218);
        }

        /*footer*/
        .footer {
            height: 150px;
            overflow: visible;
            background-color: rgb(255, 216, 131);
            z-index: 1;
            margin-top: 40px;
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

        .ft-ul li {
            height: 25px;
        }

        .facebookicon {
            position: relative;
            bottom: 40px;
            margin-left: 1000px;
            z-index: 2;
        }

        .instagramicon {
            position: relative;
            bottom: 90px;
            margin-left: 1100px;
            z-index: 2;
        }

        .youtubeicon {
            position: relative;
            bottom: 140px;
            margin-left: 1200px;
            z-index: 2;
        }

        .ft-ul2 {
            position: relative;
            bottom: 250px;
            margin-left: 1100px;
            z-index: 2;
            font-size: 10px;
        }

        .ft-ul2 li {
            height: 17px;
        }

 		/* 상품상세 페이지 바디 부분 */
 		
        .container {
            margin-top: 20px;

        }
        ul {
            margin-top: 30px;
            margin-bottom: 30px;
            display: block;
            list-style: none;
            height:150px;
        }

        li {
            float: left;
            height: 75px;
            line-height: 75px;
        }

        li:not(:first-child) {
            margin-left: 35px;
        }

        li>p {
            margin: 0%;
        }

        li>p>img {
            width: 100%;
            height: 60px;
        }
        .txt{
            margin-top: 50px;
            margin-bottom: 20px;
        }
        .txt>span{
            font-size:18px;
            font-weight: 700;
        }
        .btn{
            width: fit-content;
        }
        .product-img img {
            padding: 50px;
        }
        .product-info{
            vertical-align: middle;
            padding: 30px;
        }
        .btn-subscribe>button{
            width: 200px;
            height: 45px;
            font-size: 20px;
        }
        .btn-subscribe{
            text-align: center;
        }
        .product-info h2{
            margin-top: 30px;
            font-weight: 650;
        }
    </style>
</head>

<body>
    <header>
        <div class="row justify-content">
            <div class="col-4">
                <img src="../images/project_logo.PNG" class="d-block w-100" id="main-logo">
            </div>
            <div class="col" id="nav-item">
                <nav class="nav">
                    <a class="nav-link" href="#">제품 보기</a>
                    <a class="nav-link" href="#">리뷰</a>
                    <a class="nav-link" href="#">고객센터</a>	
                    <a class="nav-link" href="#">로그인</a>
                    <a class="nav-link" href="#">회원가입</a>
                    <a class="nav-link" style="color: rgb(255, 94, 0);" href="#">구독하기</a>
                </nav>
            </div>
        </div>
        </div>
    </header>
    <!--메인영역-->

    <!--헤더와 메인의 구분선-->
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
        <!--상품 이미지 영역입니다 해당 이미지를 클릭 시 상품 상세정보로 이동-->
        <!-- 상품 상세 페이지 -->
    <div class="container product-detail-info">
        <div class="row">
            <div class="col-sm-12">
                <h1><span>${product.productName}</span></h1>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-lg-6 product-img">
                <div>
                    <img src="${product.productImg}" class="card-img-top" alt="...">
                </div>
            </div>
            <div class="col-lg-6 product-info">
                <div>
                    <h2><span>${product.productName}</span><span>는</span> <br>
                    <span>이런 특징을 가지고 있어요!</span></h2>
                </div>
                <br>
                <ul class="d-none d-lg-block">
                    <li>
                        <p class="img"><img src="/semi_project/images/영양/고단백.png"></p>
                        <span>고단백</span>
                    </li>
                    <li>
                        <p class="img"><img src="/semi_project/images/영양/기호증강.png"></p>
                        <span>기호증강</span>
                    </li>
                    <li>
                        <p class="img"><img src="/semi_project/images/영양/성장기 도움.png"></p>
                        <span>성장기도움</span>
                    </li>
                    <li>
                        <p class="img"><img src="/semi_project/images/영양/영양보충.png"></p>
                        <span>영양보충</span>
                    </li>
                </ul>
                <div class="txt">
                    <span>${product.productContent}</span>
                </div> <br>
                <div class="btn-subscribe">
                    <button type="button" class="btn btn-dark" id="btnSubscribe">구독하기</button>
                </div>
            </div>
        </div>
        <br>
    </div>
    <div class="container product-detail-nutrient">
        <div class="row">
            <p>필수 영양소들이 포함된 재로로 만들어졌어요!</p>
        </div>
        <div class="row">
            <ul>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/소고기.png"></p>
                    <span>소고기</span>
                </li>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/보리.png"></p>
                    <span>보리</span>
                </li>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/블루베리.png"></p>
                    <span>블루베리</span>
                </li>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/비트.png"></p>
                    <span>비트</span>
                </li>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/두부.png"></p>
                    <span>두부</span>
                </li>
                <li>
                    <p class="img"><img src="/semi_project/images/식재료/감자.png"></p>
                    <span>감자</span>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-6"><h1>영양소 설명</h1></div>
            <div class="col-6"><h1>영양 정보표</h1></div>
        </div>
    </div>    <!--풋터영역-->
    <div class="row justify-content-around">
        <div class="footer">
            <ul class="ft-ul">
                <li>BoriBob Inc. 사랑시 고백구 행복동</li>
                <li>대표 : 보리밥형제들 사업자등록번호 : 780-86-01094</li>
                <li>대표번호 : +82)-665-3430 팩스번호 : +82)-888-3430 홈페이지 : petvenience.store.com</li>
                <li>CopyrightⓒBoriBob Inc. All Rights Reserved.</li>
                <div class="facebookicon">
                    <img src="../images/facebook_icon.png" style="border-color: lightblue;">
                </div>
                <div class="instagramicon">
                    <img src="../images/instagram_icon.png" style="border-color: lightblue;">
                </div>
                <div class="youtubeicon">
                    <img src="../images/youtube_icon.png" style="border-color: lightblue;">
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
    <script>
    	$("#btnSubscribe").on("click",function(){
    		
    		location.href="/pet.pet";
    	})
    	
	</script>    
</body>
</html>