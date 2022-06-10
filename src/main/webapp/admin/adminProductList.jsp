<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 전체상품</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</head>
<style>
        body {
            box-sizing: border-box;
        }

        nav {
            height: 80px;
        }

        .nav-item {
            padding-right: 50px;
        }

        .header {
            position: relative;
            padding: 60px;
        }

        .title {
            border-bottom: 1px solid black;

        }

        .body-title {
            background-color: lightgray;
        }

        .content {
            border-bottom: 1px solid darkgray;
        }
    </style>
<body>
	<div class="wrapper">
        <div class="row header">
            <div class="col">
                <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark justify-content-center">
                    <div class="container">
                        <a class="navbar-brand" href="#"></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav text-center">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        회원
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">조회</a></li>
                                        <li><a class="dropdown-item" href="#">블랙리스트</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        통계
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">상품별매출/전체매출</a></li>
                                        <li><a class="dropdown-item" href="#">재고</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        상품
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="/productList.admin">전체 조회</a></li>
                                        <li><a class="dropdown-item" href="/productUpdate.admin">수정/삭제</a></li>
                                        <li><a class="dropdown-item" href="/productInsert.admin">추가</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">주문 조회/상세보기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">배송 조회/수정</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        문의
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">조회/삭제</a></li>
                                        <li><a class="dropdown-item" href="#">답변 추가</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">리뷰 조회/삭제</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">login</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container">
            <div class="row title py-3">
                <h3>전체 상품</h3>
            </div>
            <br>
            <div class="row">
                <div class="col-2">
                    <button type="button" class="btn btnDog btn-warning" value="dog">강아지</button>
                </div>
                <div class="col-2">
                    <button type="button" class="btn btnCat btn-info" value="cat">고양이</button>
                </div>
            </div>
        </div>

        <br>
        <div class="container product-body">
            <div class="row row-product-body">
                <!--상품 이미지 영역입니다 해당 이미지를 클릭 시 상품 상세정보로 이동-->
                <div class="container product-body">
                    <div class="row row-product-body">
                        <c:forEach items="${productList}" var="dto">
                            <div class="col-lg-3 col-md-6">
                                <div class="card">
                                    <a href="/productDetail.pro?productCode=${dto.productCode}"><img
                                            src="${dto.productImg}" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <p class="card-text">상품명 : ${dto.productName}</p>
                                        <p class="card-text">상품코드 : ${dto.productCode}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <script>
            // 강아지버튼을 눌렀을 때 강아지상품만 비동기로 띄워주기 
            $(".btnDog").on("click", function () {

                $.ajax({
                    url: "/productDog.pro"
                    , type: "get"
                    , dataType: "json"
                    , success: function (dogList) {
                        $(".row-product-body").empty();
                        if (dogList.length !== 0) { 			// 강아지 상품이 있다면! 
                            for (let productDog of dogList) {
                                let col = $("<div>").addClass("col-lg-3 col-md-6");
                                let card = $("<div>").addClass("card");
                                let anchor = $("<a>").attr("href", "/productDetail.pro?productCode=" + productDog.productCode);
                                let img = $("<img>").addClass("card-img-top").attr("src", productDog.productImg);
                                let cardBody = $("<div>").addClass("card-body");
                                let p = $("<p>").addClass("card-text").html(productDog.productName);

                                let anchorImg = anchor.append(img);
                                let cardBodyP = cardBody.append(p);
                                let card1 = card.append(anchorImg, cardBodyP);
                                let col1 = col.append(card1);

                                $(".row-product-body").append(col1);
                                $(".btnDog").focus();
                            }

                        }
                    }
                    , error: function (e) {
                        console.log(e);
                    }
                });

            })

            // 고양잉버튼을 눌렀을 때 고양이상품만 비동기로 띄워주기 
            $(".btnCat").on("click", function () {

                $.ajax({
                    url: "/productCat.pro"
                    , type: "get"
                    , dataType: "json"
                    , success: function (catList) {
                        $(".row-product-body").empty();
                        if (catList.length !== 0) { 			// 고양이 상품이 있다면!
                            for (let productCat of catList) {
                                let col = $("<div>").addClass("col-lg-3 col-md-6");
                                let card = $("<div>").addClass("card");
                                let anchor = $("<a>").attr("href", "/productDetail.pro?productCode=" + productCat.productCode);
                                let img = $("<img>").addClass("card-img-top").attr("src", productCat.productImg);
                                let cardBody = $("<div>").addClass("card-body");
                                let p = $("<p>").addClass("card-text").html(productCat.productName);

                                let anchorImg = anchor.append(img);
                                let cardBodyP = cardBody.append(p);
                                let card1 = card.append(anchorImg, cardBodyP);
                                let col1 = col.append(card1);

                                $(".row-product-body").append(col1);
                                $(".btnCat").focus();
                            }

                        }
                    }
                    , error: function (e) {
                        console.log(e);
                    }
                });

            })

        </script>
</body>
</html>