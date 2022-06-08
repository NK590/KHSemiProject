$("#testBtn").click(function () {
  // 결제 api

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

    function (rsp) {
      //결제 성공시 결제 정보 전송
      console.log(rsp);

      if (rsp.success) {
        //결제완료정보
        var payAlert = "결제가 완료 되었습니다.";
        const paySuccess = "입금완료 ";
        const payId = "고유ID :" + rsp.imp_uid;
        const payTradeId = "상점 거래ID :" + rsp.merchant_uid;
        const payAmount = rsp.paid_amount;
        const payApproval = "카드 승인번호 :  " + rsp.apply_num;

        $.ajax({
          url: "/insert.order",
          method: "post",
          dataType: "json",

          data: {
            paySuccess: paySuccess,
            payId: payId,
            payTradeId: payTradeId,
            payAmount: payAmount,
            payApproval: payApproval,
            orderName: orderName,
            orderPhone: orderPhone,
            orderPost: orderPost,
            orderRoadAddress: orderRoadAddress,
            orderDetailAddress: orderDetailAddress,
            orderMsg: orderMsg,
            postMsg: postMsg,
          },
        });
        alert(payAlert);
        location.href = "/complete.order";
      } else {
        //결제 실패시 정보 전송

        var payInfomation = "결제에 실패했습니다.";

        payInfomation += "에러내용 : " + rsp.error_msg;
        $.ajax({
          url: "/failInsert.payment",
          method: "post",
          dataType: "json",
          data: {
            payInfomation: payInfomation,
          },
        });

        alert(payInfomation);
      }
    }
  );
});
