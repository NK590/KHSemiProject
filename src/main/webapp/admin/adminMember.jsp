<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>ํ์์กฐํ</title>
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

.title-body {
	background-color: lightgray;
	
}

.content {
	border-bottom: 1px solid darkgray;
}

button {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row header">
			<div class="col">
				<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark justify-content-center">
					<div class="container">
						<a class="navbar-brand" href="#"></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNavDropdown">
							<ul class="navbar-nav text-center">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/admin/index.jsp">Home</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> ํ์ </a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="/member.admin">์กฐํ</a></li>
										<li><a class="dropdown-item" href="/blacklist.admin">๋ธ๋๋ฆฌ์คํธ</a></li>
									</ul></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> ์ํ </a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="/productList.admin">์?์ฒด ์กฐํ</a></li>
										<li><a class="dropdown-item" href="/productUpdate.admin">์์?/์ญ์?</a></li>
										<li><a class="dropdown-item" href="/productInsert.admin">์ถ๊ฐ</a></li>
									</ul></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/orderList.admin">์ฃผ๋ฌธ ์กฐํ/์์ธ๋ณด๊ธฐ</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/deliveryList.admin">๋ฐฐ์ก ์กฐํ/์์?</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> ๋ฌธ์ </a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item"
											href="/inquiry.admin?currentPage=1">์กฐํ/์ญ์?</a></li>
										<li><a class="dropdown-item"
											href="/inquiryAnswer.admin?currentPage=1">๋ต๋ณ ์ถ๊ฐ</a></li>
									</ul></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/review.admin?currentPage=1">๋ฆฌ๋ทฐ ์กฐํ/์ญ์?</a></li>
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/logout.admin">logout</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<div class="container">
				<div class="row">
					<div class="col-md-5 mx-auto">
						<div class="input-group">
							<input class="form-control border-end-0 border rounded-pill"
								type="search" placeholder="search ID" id="example-search-input">
							<span class="input-group-append">
								<button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill ms-n5 mt-0 searchBtn"type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="row title py-3 px-0">
					<h3>ํ์ ๋ชฉ๋ก</h3>
				</div>
				<div class="row title-body py-2  mt-4 text-center">
					<div class="col-2">
						<h6>์์ด๋</h6>
					</div>
					<div class="col-1">
						<h6>์ด๋ฆ</h6>
					</div>
					<div class="col-2">
						<h6>์ฐ๋ฝ์ฒ</h6>
					</div>
					<div class="col-2">
						<h6>์ฐํธ๋ฒํธ</h6>
					</div>
					<div class="col-3">
						<h6>์ฃผ์</h6>
					</div>
					<div class="col-2">
						<h6>์์ธ์ฃผ์</h6>
					</div>
				</div>
				<div class="listmem">
					<c:choose>
						<c:when test="${list.size()==0}">
							<div class="row content text-center align-items-center">
								<div class="col">๋ฑ๋ก๋ ํ์์ด ์์ต๋๋ค.</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto">
								<div class="row content py-2 text-center">
									<div class="col-2 p-0">${dto.id}</div>
									<div class="col-1 p-0">${dto.name}</div>
									<div class="col-2 p-0">${dto.phone}</div>
									<div class="col-2 p-0">${dto.post}</div>
									<div class="col-3 p-0">${dto.roadAddress}</div>
									<div class="col-2 p-0">${dto.detailAddress}</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class='buttonBox1 d-grid gap-3 d-flex justify-content-center'>
				<button type="button" class="btn btn-outline-secondary" id="all-btn">์?์ฒดํ์</button>
				<button type="button" class="btn btn-outline-secondary" id="sub-btn">๊ตฌ๋ํ์</button>
				<button type="button" class="btn btn-outline-secondary"
					id="notsub-btn">๋น๊ตฌ๋ํ์</button>
			</div>
			<script>
			$("#all-btn").on("click",function(){
				$.ajax({url:"/allMember.admin"
       					, type:"get"
       					, dataType:"json"
           				,success:function(rs){
           				console.log(rs);
           				makeMember(rs);
           				}, error: function(e){
        					console.log(e);
        				}
           			})
				})
			$("#sub-btn").on("click",function(){
				$.ajax({url:"/subMember.admin"
	       				, type:"get"
	       				, dataType:"json"
	           			,success:function(rs){
	           				console.log(rs);
	           				makeMember(rs);
	           			}, error: function(e){
	        					console.log(e);
	        			}
	           		})
			})
			$("#notsub-btn").on("click",function(){
				$.ajax({url:"/notSubMember.admin"
	       				, type:"get"
	       				, dataType:"json"
	           			,success:function(rs){
	           				console.log(rs);
	           				makeMember(rs);
	           			}, error: function(e){
	        					console.log(e);
	        			}
	           		})
			})
			$(".input-group").on("click",".searchBtn",function(e){
				let id = $(".searchBtn").parent().prevAll().val();
				console.log(id);
				$.ajax({url:"/findMember.admin"
	       				, type:"get"
	       				, dataType:"json"
	       				,data:{id:id}
	           			,success:function(rs){
	           				console.log(rs);
	           				makeMember(rs);
	           			}, error: function(e){
	        					console.log(e);
	        			}
	           		})
			})
			function makeMember(rs){
				let list = rs; // ํจ์์ ๋งค๊ฐ๋ณ์๋ก ๋ฐ์์จ json ํ์์ ๋ฌธ์์ด ์ค์? json ํ์์ผ๋ก ๋ณํ 
				console.log(list);
			
				$(".listmem").empty();
			
				if(list.length==0){
					let row = $("<div>").addClass("row content text-center align-items-center");
					let col =$("<div>").addClass("col").html("ํ์์ด ์กด์ฌํ์ง ์์ต๋๋ค.")
					row.append(col);
					$(".listmem").append(row);
				}else{
					for(let mem of list){
						let row1 = $("<div>").addClass("row content py-2 text-center");
						let col1 = $("<div>").addClass("col-2").html(mem.id);
						let col2 = $("<div>").addClass("col-1").html(mem.name);
						let col3 = $("<div>").addClass("col-2").html(mem.phone);
						let col4 = $("<div>").addClass("col-2").html(mem.post);
						let col5 = $("<div>").addClass("col-3").html(mem.roadAddress);
						let col6 = $("<div>").addClass("col-2").html(mem.detailAddress);
						
						row1.append(col1,col2,col3,col4,col5,col6);
						$(".listmem").append(row1);
					}	
				}
			}
		</script>
		</div>
	</div>
</body>
</html>