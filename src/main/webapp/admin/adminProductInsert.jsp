<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<title>상품 등록</title>
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
        .content{
            justify-content: center;
        }

        .table {
            
            width: 800px;
        }
        textarea{
            width: 500px;
            height: 200px;
        }
        .btnInsert{
            text-align: center;
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
                <h3>상품 등록</h3>
            </div>
            <br>
            <div class="row content">
            <table class="table">
                <thead>
                    <tr>
                    </tr>
                  </thead>
                <tbody>
                <form action="/productInsertProc.admin" method="post" entype="multipart/form-data" id="product-insert">
                  <tr>
                    <th scope="row">상품코드</th>
                    <td><input type="text" name="productCode" id="productCode"></td>
                  </tr>
                  <tr>
                    <th scope="row">상품명</th>
                    <td>
                        <input type="text" name="productName" id="productName">
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">상품가격</th>
                    <td><input type="text" name="productPrice" id="productPrice"></td>
                  </tr>
                  <tr>
                    <th scope="row">상품내용</th>
                    <td><textarea name="productContent" style="resize: none;" id="productContent"></textarea></td>
                  </tr>
                  <tr>
                    <th scope="row">상품이미지</th>
                    <td ><input type=file name="productImg" id="productImg"></td>
                  </tr>
                  </form>
                </tbody>
              </table>
            <div class="col-12 btnInsert">
            <button type="button" class="btn btn-dark" id="btnList">목록</button>
              <button type="button" class="btn btn-primary" id="btnInsert">등록</button>
            </div>
            </div>
        <script>
            $("#btnList").on("click",function(){ // 목록 버튼을 눌렀을 때 상품전체 목록으로 이동
            	location.href="/productList.admin";
            })
            
            $("#btnInsert").on("click", function(){ // 등록 버튼을 눌렀을 때 
            	if($("#productCode").val()==""){
            		alert("상품코드를 입력해주세요"); 
            		$("#productCode").focus();
            		return;
            	}else if($("#productName").val()==""){
            		alert("상품명을 입력해주세요"); 
            		$("#productName").focus();
            		return;
            	}else if($("#productPrice").val()==""){
            		alert("상품가격을 입력해주세요"); 
            		$("#productPrice").focus();
            		return;
            	}else if($("#productContent").val()==""){
            		alert("상품내용을 입력해주세요"); 
            		$("#productContent").focus();
            		return;
            	}else if($("#productImg").val()==""){
            		alert("상품이미지를 첨부해주세요"); 
            		$("#productImg").focus();
            		return;
            	}
            	
            	$("#product-insert").submit();
            	
            	
            	console.log("${productInsert}");
            	
            	
            	
            })
            
        </script>
</body>
</html>












