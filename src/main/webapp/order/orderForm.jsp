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
        crossorigin="anonymous">
    </script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
     
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
        <title>주문서창</title>
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
      
      /*메뉴 스타일*/
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
      
      .container {
        width: 1200px;
        height: 700px;
      }
      
      .content {
        position: relative;
        width: 600px;
        height: 600px;
        left: 30px;
      }
      
      .customeritem {
        border: 1px solid lightblue;
        width: 400px;
        height: 600px;
      }
      
      .content1 {
        position: relative;
        width: 600px;
        height: 600px;
        left: 630px;
        bottom: 600px;
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
      
        </style>  
</head>

<body>
    <header>
        <div class="row justify-content">
            <div class="col-4">
                <img src="images/project_logo.PNG" class="d-block w-100" id="main-logo">
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

    <!--구분선-->
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
    <!--주문서 영역-->
    
    <div class="container">
        <div style="margin-left: 30px;">
            <h2>주문서</h2>
        </div>
        <div class="content" style="border: 1px solid lightgrey; margin-left:-38px;">
                <div class="customeritem">
                
                      
                <div style="text-align: center;">
                  주문상품코드<input id="productCode" name="productName" value="${orderInfoDTO.productCode}">
                  
                </div>
                
         
                

                
                <div>
                    <strong>배송 정보</strong><br>
                    <div>멤버 테이블에 저장된 회원정보</div>
                
                 <p>회원이름<input id="name" type="text" value="${orderInfoDTO.name}"></p>
                 <p>회원연락처 <input id="phone" type="text" value="${orderInfoDTO.phone}"></p>
                 <p>회원우편번호 <input id="post" type="text" value="${orderInfoDTO.post}"></p>
                 <p>회원주소 <input id="roadAddress" type="text" value="${orderInfoDTO.roadAddress}"></p>
                 <p>회원상세주소<input id="detailAddress" type="text" value="${orderInfoDTO.detailAddress}"></p>
                    
                 
                 
                 
                    
                    <button type="button" id="infoBtn">기존 정보로 주문하기</button>
                    
                    <div>수취인 이름</div>
                    <input id="orderName" type="text" name="orderName" placeholder="수취인이름"><br>
                    <div>전화번호</div>
                    <input id="orderPhone" name="orderPhone" type="text" style="width: 380px; height: 35px;">
                    <div>받는분 주소</div>
                    
                    <input type="text" id="orderPost" placeholder="우편번호" style="width: 190px;">
                    
                    <button type="button"  id="address_kakao" class="btn btn-secondary" style="height: 35px; width: 190px; margin-bottom: 5px;">우편번호찾기</button>
                    
                    <input type="text"  id="orderRoadAddress" placeholder="도로명주소" style="width: 380px;">
                    <input type="text"  id="orderDetailAddress" placeholder="상세주소" style="width: 380px; margin-top: 5px;">
                    
                    <br>
                    <div>배송 메시지</div>
                    <input type="text" id="postMsg"  placeholder="배송 메시지" style="width: 380px; margin-top: 5px;"><br>
                    <div>주문 메시지</div>
                    <input type="text" id="orderMsg"  placeholder="주문 메시지" style="width: 380px; margin-top: 5px;"><br>
                    
                      
                    
                
                  </div>
          
                  <div>

                  </div>
            </div>
        </div>
      
        <div class="content1" style="border: 1px solid lightgrey; margin-left: -35px;">
          
            <div class="customeritem">
                <br>
                
                <div>
                    <strong>결제 정보</strong><br>
                    <div>결제 금액</div>
                    <input type="text" id="totalPay" value="${orderInfoDTO.price}" placeholder="100"><br>
                    <div>결제하실분 이름</div>
                    <input type="text" id="namePay" placeholder="이보리"><br>
                    <div>결제하실분 이메일</div>
                    <input type="text" id="emailPay" placeholder="bori@gmail.com"><br>
                    <div>결제하실분 전화번호</div>
                    <input type="text" id="phonePay" placeholder="01012345678"><br>
                    <div>결제하실분 주소</div>
                    <input type="text" id="addressPay" placeholder="예)서울기 강남구 삼성동"><br>
                    <div>결제하실분 상세주소</div>
                    <input type="text" id="detailAddressPay" placeholder="예)123-456"><br>
                   
                </div>

                      
                 
                <div style="text-align: center;"><strong>배송을 시작할까요?</strong></div>
                <br>
                <button type="button" class="btn btn-secondary" style="margin-left: 110px;">취소하기</button>
                <button  id="check_module" type="button"  class="btn btn-success">결제하기</button>
            </div>
            
        </div>
    </div>



    <!--구분선-->
    <hr class="divider">
    <div class="row justify-content-around">
        <!--풋터 영역-->
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
    

       <script>
           const infoBtn = document.querySelector('#infoBtn');
           
           const name = document.querySelector('#name');
           
           const orderName = document.querySelector('#orderName');
           
           const phone = document.querySelector('#phone');
           const orderPhone = document.querySelector('#orderPhone');

           const post = document.querySelector('#post');
           const orderPost = document.querySelector('#orderPost');

           const roadAddress = document.querySelector('#roadAddress');
           const orderRoadAddress = document.querySelector('#orderRoadAddress');
           
           const detailAddress = document.querySelector('#detailAddress');
           const orderDetailAddress = document.querySelector('#orderDetailAddress');

           const orderMsg = document.querySelector('#orderMsg');
           const postMsg = document.querySelector('postMsg');
           
           infoBtn.addEventListener('click', () => { // 회원 가입 정보를 주문 정보로 대채 
            const nameValue = name.value;
            orderName.value =nameValue;
          
            const phoneValue = phone.value;
            orderPhone.value =phoneValue;

            const postValue = post.value;
            orderPost.value =postValue;

            const roadAddressValue = roadAddress.value;
            orderRoadAddress.value =roadAddressValue;

            const detailAddressValue = detailAddress.value;
            orderDetailAddress.value =detailAddressValue;


           })
  


           window.onload = function () { // 주소 api 
  document
    .getElementById("address_kakao")
    .addEventListener("click", function () {
      //주소입력칸을 클릭하면
      //카카오 지도 발생
      new daum.Postcode({
        oncomplete: function (data) {
          //선택시 입력값 세팅
          document.getElementById("orderRoadAddress").value = data.address; // 주소 넣기
          document.getElementById("orderPost").value = data.zonecode;
          
          document.getElementById("orderDetailAddress").focus(); //상세입력 포커싱
        },
      }).open();
    });

    
};


//결제정보 ============================================================================
  

$("#check_module").click(function () { // 결제 api      
  const nameProduct = document.querySelector("#productCode");    //결제 정보 미기입시 리턴 
  if(nameProduct.value===""){
    console.log(nameProduct.value)
    alert("상품명이 누락 되었습니다")
    return
  }


  const totalPay = document.querySelector("#totalPay");   
  if(totalPay.value===""){
    alert("금액을 입력하세요.")
    return
  }
  const namePay = document.querySelector("#namePay");
  if(namePay.value===""){
    alert("결제하시는분의 이름이 필요합니다.")
    return
  }
  const emailPay = document.querySelector("#emailPay");
  if(emailPay.value===""){
    alert("결제하시는분의 이메일이 필요합니다.")
    return
  }
  const phonePay = document.querySelector("#phonePay");
  if(phonePay.value===""){
    alert("결제하시는분의 전화번호가 필요합니다.")
    return
  }
  const addressPay = document.querySelector("#addressPay");
  if(addressPay.value===""){
    alert("결제하시는분의 주소가 필요합니다.")
    return
  }
  const detailddressPay = document.querySelector("#detailAddressPay");
  if(detailddressPay.value===""){
    alert("결제하시는분의 상세주소가 필요합니다.")
    return
  }

   

  var IMP = window.IMP; //
  IMP.init("imp38719670");
  IMP.request_pay(
    { 
      
      pg: "inicis",
      pay_method: "card",
      merchant_uid: "merchant_" + new Date().getTime(),
      name: nameProduct.value,
      amount: totalPay.value,
      buyer_email: emailPay.value,
      buyer_name: namePay.value,
      buyer_tel: phonePay.value,
      buyer_addr: addressPay.value,
      buyer_postcode: detailddressPay.value,
      m_redirect_url: "http://127.0.0.1:5500/src/main/webapp/order/test.html",
    },

      function (rsp) {    //결제 성공시 결제 정보 전송 
      console.log(rsp);
     
       


      if (rsp.success) {
        //결제완료정보
        var payAlert ="결제가 완료 되었습니다."
        const paySuccess = "입금완료 ";
        const payId = "고유ID :"+ rsp.imp_uid;;
        const payTradeId = "상점 거래ID :" + rsp.merchant_uid;
        const payAmount =  rsp.paid_amount;
        const payApproval = "카드 승인번호 :  " + rsp.apply_num;; 
      
        const orderName = $('#orderName').val();
        const orderPhone = $('#orderPhone').val();
        const orderPost = $('#orderPost').val();
        const orderRoadAddress = $('#orderRoadAddress').val();
        const orderDetailAddress = $('#orderDetailAddress').val();
        const orderMsg =  $('#orderMsg').val();
        const postMsg   =$('#postMsg').val();  
       
        
        $.ajax({
            url:"/insert.order",
            method:"post",
            dataType:"json",
            
            data: {
                    "paySuccess" : paySuccess,
                    "payId" : payId,
                    "payTradeId" : payTradeId,
                    "payAmount" : payAmount,
                    "payApproval" : payApproval,
                    "orderName" : orderName,
                    "orderPhone" : orderPhone,
                    "orderPost" : orderPost,
                    "orderRoadAddress" : orderRoadAddress,
                    "orderDetailAddress" : orderDetailAddress,
                    "orderMsg" : orderMsg,
                    "postMsg" : postMsg,
                  }
                  
        })
        alert(payAlert);
        location.href = "/complete.order" ;

              
        
      } else {       //결제 실패시 정보 전송 
        
        var payInfomation = "결제에 실패했습니다.";
    
        payInfomation += "에러내용 : " + rsp.error_msg;
        $.ajax({
            url:"/failInsert.payment",
            method:"post",
             dataType:"json",
              data: {
                    "payInfomation" : payInfomation,
                  }
        })
        
        alert(payInfomation);
        
        
      }
      
    }
  );
});


       </script>
</body>
</html>