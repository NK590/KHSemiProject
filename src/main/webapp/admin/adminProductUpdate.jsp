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
<title>상품 수정/삭제</title>
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
                <h3>상품 수정 / 삭제</h3>
            </div>
            <br>
            <div class="row content">
            <table class="table">
                <thead>
                    <tr>
                    </tr>
                  </thead>
                <tbody>
                <form action="/productUpdateProc.admin" method="post" entype="multipart/form-data" id="product-update">
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
                  
                  <tr>
                    <th scope="row">삭제할 상품코드</th>
                    <td ><input type=text name="productCodeDelete" id="productDelete" placeholder="상품 삭제시 입력"></td>
                  </tr>
                  
                </tbody>
              </table>
            <div class="col-12 btnInsert">
            <button type="button" class="btn btn-warning" id="btnUpdate">수정</button>
             <button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
            </div>
            </div>
        <script>
            $("#btnDelete").on("click",function(){ // 삭제 버튼을 눌렀을 때 상품전체 목록으로 이동
            	let result = confirm($("#productDelete").val()+"상품을 정말 삭제하시겠습니까");
            	if(result){
            		
            		let productCodeDelete = $("#productDelete").val();
            		
            		$.ajax({
            			url:"/productDelete.admin?productCodeDelete="+productCodeDelete
            			,type:"get"
            			,dataType : "text"
            			,success : function(data){
            				console.log(data);
            				if(data=="ok"){
            					alert("해당 상품이 삭제되었습니다.");
            					$("#productDelete").val("");
            				}else{
            					alert("해당 상품은 존재하지않습니다.");
            					$("#productDelete").val("");
            				}
            			}
            			,error : function(e){
            				console.log(e);
            			}
            		})
            		
            		
            	}
            	else{
            		location.href="/productUpdate.admin";
            	}
				
            	
            	
            })
            
            
            
            
            
            
            $("#btnUpdate").on("click", function(){ // 수정 버튼을 눌렀을 때 
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
            	
            	$("#product-update").submit();
            	
            	
            	console.log("${productInsert}");
            	
            	
            	
            })
            
        </script>
</body>
</html>












