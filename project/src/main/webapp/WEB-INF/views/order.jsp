<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/ordercss.css">
<link rel="stylesheet" href="checkout.css">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
        window.onload = function(){
            document.getElementById("address_kakao").addEventListener("click", function(){ //우편번호 클릭시 API 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                    	document.getElementById("postcode").value = data.zonecode; // 주소 넣기
                        document.getElementById("address").value = data.address; // 주소 넣기
                        document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
        </script>

<script src="resources/js/orderjs.js" defer></script>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

</head>

<body>

    <section>
    <div class="marking">
        <span class="mark_shoppingbag">01 SHOPPINGBAG</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_order">02 ORDER</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="mark_confirmed">03 ORDER CONFIRMED</span>
    </div>
    
    <div class="container">
        <div class="order">
            <div class="orderinfo">
                <div id="orderinfo">
                    <div id="orderinfo_content">
                        <span id="title">배송정보</span>
                        <span id="required"><span id="indicate">*</span>표시는 필수입력 항목</span>
                    </div>
                </div>
                    
    
                <div id="order_content">
                    <table class="table_content">
                        <tr>
                            <th>수령인&nbsp;<span id="indicate">*</span></th>
                            <td><input type="text" class="user_name" name="user_name"></td>
                        </tr>
                        <tr>
                            <th>배송지&nbsp;<span id="indicate">*</span></th>
                            <td>
                                <input type="text" class="postcode" id="postcode" name="postcode" placeholder=" 우편번호" readonly/>
                                
                            </td>
                            <td id="td1">
                                <input type="button" class="address_kakao" id="address_kakao" name="address_kakao" value="우편번호 검색">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" class="address" id="address" name="address" placeholder=" 주소" readonly/></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" class="address_detail" placeholder=" 상세주소" name="address_detail" /></td>
                        </tr>
                        <tr>
                            <th>연락처1&nbsp;<span id="indicate">*</span></th>
                            <td><input type="tel" class="phone1" name="phone1"/></td>
                        </tr>
                        <tr>
                            <th>연락처2&nbsp;<span id="indicate2">*</span></th>
                            <td><input type="tel" class="phone2" name="phone2"/></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <select class="request" name="request">
                                    <option value="배송시 요청사항을 선택해 주세요.">배송시 요청사항을 선택해 주세요.</option>
                                    <option value="부재시 문앞에 놓아주세요.">부재시 문앞에 놓아주세요.</option>
                                    <option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
                                    <option value="부재시 전화 또는 문자 주세요.">부재시 전화 또는 문자 주세요.</option>
                                    <option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
                                    <option value="파손 위험상품입니다. 배송시 주의해주세요.">파손 위험상품입니다. 배송시 주의해주세요.</option>
                                    <option value="배송전에 연락주세요.">배송전에 연락주세요.</option>
                                    <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
              
        </div>
    </div>
    
    <div class="container2">    
            
        <div class="mileage">
            <div>
                <div id="mileageinfo">
                    <span id="title">마일리지</span>&nbsp;<span class="span_mg">보유 마일리지</span>
                    <span id="span_totalmg">1000<span id="span_totalmg1">원</span></span>
                </div>
            </div>
    
            <table class="mileage_content">
                <tr>
                    <th>마일리지</th>
                    <td><input type="text" class="mileage_table" onkeyup='printName()'
                        id="mileage_table" name="mileage_table" placeholder="0"></td>
                    <td><input type="button" class="mileagebt" name="meileagebt" value="모두 사용"></td>
                </tr>
            </table>
            
        </div>
    </div>
    </section>
    
    <section>
        <div class="section">
            <div class="product_info">
                <span id="product_info"> 주문상품 정보 / 총  개</span>
            </div>
    
            <div class="info_line"></div>
    
            <div class="product">
                    <div class="product_img">
                        <img src="resources/image/perfume2.jpg" class="order_img" alt="My Image">
                    </div>
                    <div class="paroduct_name">
                        <br><p class="order_brand_name">PRADA</p>
                        <br><p class="order_product_name">RAPAM O D PERFUMEee</p>
                        <br><p class="order_option">옵션&nbsp;&nbsp;<span class="oreder_option_1">300ml</span></p>
                        <p class="order_amount">수량&nbsp;&nbsp;<span class="oreder_option_2">1</span></p>
                    </div>
            </div>
    
            <div class="info_line2"></div>
    
            <div class="product_content">
                <span class="product_price1">총 상품 금액</span>
                <span class="product_price2"><span></span>원</span>
            </div>
            <div class="product_content">
                <span class="product_mileage">마일리지 사용</span>
                <span class="product_mileage2">- <span id="mileageoutput"></span>P</span>
            </div>
            <div class="product_content">
                <span class="product_discount">할인율</span>
                <span class="product_discount2">- <span id="mileageoutput"></span>%</span>
            </div>
            <div class="product_content">
                <span class="product_fee">배송비</span>
                <span class="product_fee2">+ <span></span>원</span>
            </div>
            <div class="product_content">
                <span class="product_total">총 결제금액</span>
                <span class="product_total2"><span class="product_total3" id="product_total3">180,000</span> 원</span>
            </div>
    
            <div class="notice1">
                <span>개인정보 제 3자 제공사항에 대해 확인하였으며 결제에 동의합니다.</span>
            </div>

            <div class="wrap">
                <a href="#pop_info_1" class="notice2">개인정보 제 3자 제공동의 보기</a><br>
              
              
                <div id="pop_info_1" class="pop_wrap" style="display:none;">
                  <div class="pop_inner">
                    <div class="popup">
                    <h2 class="dsc">개인정보 제3자 제공 동의</h2><br>
                    <p>
                        (주)3조는 거래 당사자간의 원활한 의사소통 및 배송, 상담 등의 거래이행을 위해
                        최소한의 범위내에서 개인정보를 입점 업체 판매자 및 배송 업체에 아래와 같이 <br>제공합니다.<br><br>
                        "   개인정보 제3자 제공 동의   " 를 체크하시면 아래와같은 내용에 동의하는 것으로 간주합니다.
                    </p>
                    <br>
                    <ul>
                        <li>개인정보를 제공 받는자 : 스테디 에브리웨어, 토마스모어, 나이키, 에스로우</li>
                    </ul>
                    <ul>
                        <li>제공되는 개인정보 항목</li>
                        <p id="p">- 구매자 정보: 성명, ID, 전화번호, 메일주소, 상품 구매정보</p>
                        <p id="p">- 수령자 정보: 성명, 전화번호, 배송지 주소</p>
                    </ul>
                    <ul>
                        <li>개인정보를 제공받는 자의 이용 목적 : 판매자와 구매자 간 원활한 거래의 진행, <br>고객 상담 및 불만처리, 
                            상품과 경품 배송을 위한 배송지 확인 및 배송처리
                        </li>
                    </ul>
                    <ul>
                        <li>개인정보를 제공받는 자의 정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.</li>
                    </ul>
                    <ul>
                        <li>동의 거부 시 불이익 : 동의를 거부할 수 있으며 개인정보 제공에 동의하지 않는 <br>경우 거래가 제한됩니다.</li>
                    </ul>
                    </div>
                    <button type="button" class="btn_close"><img id="exit" src="resources/image/exit.png"></button>
                  </div>
                </div>
              
            </div>
    
    
        </div>
    </section>
    
    <section>
        <div class="submit">
         <input type="submit" id="submitbt" name="submitbt" value="CHECK OUT">
        </div>
    </section>
    
    </body>


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <script>
        $("#submitbt").click(function () {
            var IMP = window.IMP;
            IMP.init('imp80318325'); // "가맹점 식별코드" (import - 어드민페이지 - 내 정보 - 시스템 설정)
    
            IMP.request_pay({
                pg: 'kakao',
                /*
                    'kakao' - 카카오페이
                    'payco' - 페이코
                    'html5_inicis - 이니시스(웹표준)'
    
                */
              
                pay_method: 'card',
                /* 
                    'samsung':삼성페이, 
                    'card':신용카드, 
                    'trans':실시간계좌이체,
                    'vbank':가상계좌,
                    'phone':휴대폰소액결제 
                */
                merchant_uid: 'merchant_' + new Date().getTime(),
                /* 
                    
                    https://docs.iamport.kr/implementation/payment
                    url -> (주문번호) 넣을 수 있는 방법
                    
                    
                 */
    
                name: '주문명: 테스트', //결제창에서 보일 이름
                amount: '3', //제품 가격
            
                buyer_email: 'ysch0902@naver.com',
                buyer_name: '최윤석',
                buyer_tel: '010-2567-3855',
                buyer_addr: '서울특별시 강남구 삼성동',
                buyer_postcode: '123-456',
                m_redirect_url: 'https://www.naver.com'
                /*  
                    모바일 결제시,
                    결제가 끝나고 랜딩되는 URL을 지정 
                    (카카오페이, 페이코, 다날의 경우는 필요 x / callback함수로 결과 떨어짐) 
                    */
                    
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
            
        });
    </script>
        </body>

</html>