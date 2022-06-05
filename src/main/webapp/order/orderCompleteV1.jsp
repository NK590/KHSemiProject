<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <title>레이아웃</title>
    <style>
      body {
        box-sizing: border-box;
        background-color: rgb(255, 252, 221);
      }

      .header {
        padding: 20px;
        position: relative;
      }

      .footer > * {
        background-color: rgb(255, 216, 131);
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
    </style>
  </head>
  <body>
    <div class="wrapper">
      <div class="row justify-content-center header">
        <div class="col-lg-4 col-12">
          <img
            src="images/project_logo.PNG"
            class="d-block w-100"
            id="main-logo"
          />
        </div>
        <div class="col-lg-8 col-12">
          <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Boribob</a>
              <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
              >
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
                    <a class="nav-link" href="#">로그인</a>
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

      <!-- 여기에 바디 코드 짜주셈 -->
      <div class="container">
        <div class="row">
          <div class="col">
            <p>주문해주셔서 감사합니다</p>
            <p>주문해 주문 하신 내역은</p>
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">주문자명</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">주문상품</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">결제금액</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">배송지</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">배송메시지</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
          <div class="input-group flex-nowrap">
            <span class="input-group-text" id="addon-wrapping">주문메시지</span>
            <input
              type="text"
              class="form-control"
              placeholder="Username"
              aria-label="Username"
              aria-describedby="addon-wrapping"
            />
          </div>
        </div>
        <button type="button" class="btn btn-secondary">
          메인페이지로이동
        </button>
        <button type="button" class="btn btn-secondary">
          상품페이지로이동
        </button>
      </div>
      <!-- 여기부터 풋터 -->
      <div class="row justify-content-center footer">
        <div class="col-lg-10 col-12">
          <ul class="ft-ul">
            <li>BoriBob Inc. 사랑시 고백구 행복동</li>
            <li>대표 : 보리밥형제들 사업자등록번호 : 780-86-01094</li>
            <li>
              대표번호 : +82)-665-3430 팩스번호 : +82)-888-3430 홈페이지 :
              petvenience.store.com
            </li>
            <li>CopyrightⓒBoriBob Inc. All Rights Reserved.</li>
          </ul>
        </div>
        <div class="col-lg-2 col-12">
          <ul class="ft-images">
            <img
              src="images/facebook_icon.png"
              style="border-color: lightblue"
            />
            <img
              src="images/instagram_icon.png"
              style="border-color: lightblue"
            />
            <img
              src="images/youtube_icon.png"
              style="border-color: lightblue"
            />
          </ul>
          <ul class="ft-ul">
            <li><strong>고객센터</strong></li>
            <li style="height: 8px"></li>
            <li>오전 10시부터 오후 6시까지</li>
            <li>토요일, 일요일, 공휴일 휴무</li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
