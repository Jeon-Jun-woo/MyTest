<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략 가능
IMP.init("imp68206770"); // 예: imp00000000
function requestPay() {
	console.log('clicked');
  // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    
	        /*
	            'kakao':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	            'nice':나이스,
	            'jtnet':jtnet,
	            'uplus':LG유플러스
	        */
	    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $('#title').text(),
	    amount : $('#price').attr("data-price"),
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        let price=$('#price').attr("data-price");
			let count=$('#sel').val()
			let no=$('#cart').attr("data-no")
			let type=$('#cart').attr("data-type")
			$.ajax({
	    	type:'post',
	    	url:'../goods/cart_buy.do',
	    	data:{"no":no,"count":count,"price":price,"type":type},
	    	success:function(result)
	    	{
	    		// 마이페이지 이동 
	    		if(result=='yes')
	    		{
	    			location.href="../mypage/mypage_buy.do"
	    		}
	    		else
	    		{
	    			alert("구매 실패하셨습니다")
	    		}
	    		
	    	}
	    })
	    }
	});
}
$(function(){
	$('#sel').change(function(){
		let price=$('#price').attr("data-price");
		let count=$(this).val()
		let total=Number(price)*Number(count);
		$('#total').text(total)
	})
	$('#cart').click(function(){
		let price=$('#price').attr("data-price");
		let count=$('#sel').val()
		let no=$(this).attr("data-no")
		let type=$(this).attr("data-type")
		/*let msg="가격:"+price+"\n"
		       +"수량:"+count+"\n"
		       +"상품번호:"+no+"\n"
		       +"테이블번호:"+type
	    alert(msg)*/
	    $.ajax({
	    	type:'post',
	    	url:'../goods/cart_insert.do',
	    	data:{"no":no,"count":count,"price":price,"type":type},
	    	success:function(result)
	    	{
	    		// 마이페이지 이동 
	    		if(result=='yes')
	    		{
	    			location.href="../mypage/mypage_cart.do"
	    		}
	    		else
	    		{
	    			alert("장바구니에 데이터 추가가 안됩니다!!")
	    		}
	    		
	    	}
	    })
	})
	$('#buy').click(function(){
		requestPay()
	})
})
</script>
</head>
<body>
  <div class="container">
  <div class="row">
		  <table class="table">
			  <tr>
				  <td width="35%" align="center" rowspan="9">
					  <img src="${vo.goods_poster }" id="image">
				  </td>
				  <td width="65%" align="center">
					  <span id="title">
					   ${vo.goods_name }
					  </span>
				  </td>
			  </tr>
			  <tr>				  <td width="65%">
					  <span id="sub">${vo.goods_sub }</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="percent">${vo.goods_discount }%</span>&nbsp;
					  <span id="price" data-price="${vo.price }">${vo.goods_price }</span>
					  <p>
						  <del id="psub">17,900원</del>
					  </p>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="label">첫구매할인가</span>
					  <span id="price2">${vo.goods_first_price }</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <span id="star">★★★★★</span>&nbsp;
					  <span id="bold">4.5</span>
					  <span id="count">(299)</span>
				  </td>
			  </tr>
			  <tr>
				  <td width="65%">
					  <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png">
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <span id="delevery">${vo.goods_delivery }</span>
				  </td>
			  </tr>			  
			  <tr>
			      <td width="65%">
					  수량:<select id="sel">
						  <option value="1">1개</option>
						  <option value="2">2개</option>
						  <option value="3">3개</option>
						  <option value="4">4개</option>
						  <option value="5">5개</option>
					  </select>
				  </td>
			  </tr>
			  <tr>
			   <td width="65%" class="text-right">
			    총구매액:<span id="total">${vo.price }</span>원
			   </td>
			  </tr>
			  <tr>
				  <td width="65%">
				    <c:if test="${sessionScope.id!=null }">
					  <input type="button" value="장바구니" id="cart" data-no="${vo.no }" data-type="${ type}">
					  <input type="button" value="바로구매" id="buy">
					</c:if>
					  <input type="button" value="목록" id="cart"
					   onclick="javascript:history.back()"
					  >
				  </td>
			  </tr>
		  </table>
	  </div>
    </div>
</body>
</html>