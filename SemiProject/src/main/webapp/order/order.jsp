<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="/insert.order" method="post">
 	   <p> 주문정보를 입력해라<p>
 	  <input name="memberId" type="text" placeholder="회원아이디" />
      <input name="orderName" type="text" placeholder="수취인이름" />
      <input name="orderContect" type="text" placeholder="수취인연락처" />
      <input name="orderAddress" type="text" placeholder="수취인 주소" />
      <input name="orderMsg" type="text" placeholder="주문메시지" />
      <input name="postMsg" type="text" placeholder="배송메시지" />
      <input name="payNumber" type="text" placeholder="결제번호" />
      <input name="productCode" type="text" placeholder="상품번호" />
      <input name="totalPay" type="text" placeholder="결제금액" />
      <input name="card" type="text" placeholder="카드" />
      <button type="submit">전송</button>
    </form>



</body>
</html>