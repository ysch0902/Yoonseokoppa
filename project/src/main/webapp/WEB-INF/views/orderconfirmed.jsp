<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/orderconfirmed.css"/>
<title>ODRER CONFIRMED</title>
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
    </section>

    <section>
        <div class="confirm_box">
            <div class="confirm_text">
                <span>주문이 완료되었습니다.</span>
            <div class="confirm_box_line">
            </div>
            <section class="confirm_section2">
                <div class="confirm_order_num">
                    <span id="confirm_order_num1">주문번호</span>
                    <span id="confirm_order_num2">ORD************</span>
                </div>
                <div class="confirm_shopname">
                    <span id="confirm_shopname"><i>#TEAM3</i></span>
                </div>
            </section>
            </div>
        </div>
    </section>

    <section>
        <div class="confirm_info_box">
            <div class="confirm_info">
                <span id="info1">주문상품 정보 / </span><span  id="info2">1</span><span id="info3">개 상품</span> 
                <div class="info_box_line">
                    <container class="confirm_info_sort">
                        <div id="sort1">상품</div>
                        <div id="sort2">상품정보</div>
                        <div id="sort3">수량</div>
                        <div id="sort4">진행상태</div>
                    </container>
                    <container class="confirm_info_sort1">
                        <div id="sort1-1">
                            <img src="image/perfume2.jpg" id="sort_product_img" alt="My Image">
                        </div>
                        <div id="sort2-1">
                            <div id="sort_brand">Jo Malone</div>
                            <div id="sort_name">조말론 블랙베리 앤 베이&nbsp;<span id="sort_name_option">300ml</span></div>
                            <div id="sort_price">[가격]&nbsp;&nbsp;<span id="sort_price1">50000</span><span id="sort_price2">원</span></div>
                        </div>
                        <div id="sort3-1">
                            <div id="sort_amount"><span id="sort_amount1">1</span><span id="sort_amount2">개</span></div>
                        </div>
                        <div id="sort4-1">
                            <div id="sort_status"><span id="sort_status1">결제완료</span></div>
                        </div>
                    </container>
                </div>
            </div>
        </div>
    </section>

    <section>
        <div class="pay_info_box1">
            <div class="pay_info">
                <span id="pay_info_text">결제정보</span>
            </div>
        </div>
        <div class="pay_info_box2">
            <div class="pay_sheet">
                <div id="pay_sheet1"><span>결제방법</span></div>
                <div id="pay_sheet2"><span>국민은행</span></div>
            </div>
            <div class="pay_sheet">
                <div id="pay_sheet3"><span>주문접수 일시</span></div>
                <div id="pay_sheet4"><span>2022 - 02 - 10 - 16:40</span></div>
            </div>
            <!--<div class="pay_sheet">
                <div id="pay_sheet5"><span>결제완료 일시</span></div>
                <div id="pay_sheet6"><span>2022 - 02 - 10 - 16:41</span></div>
            </div>-->
            <div class="pay_sheet">
                <div id="pay_sheet7"><span>결제금액</span></div>
                <div id="pay_sheet8"><span>50000원</span></div>
            </div>
        </div>
    </section>

    <section>
        <div class="shipping_info_box1">
            <div class="shipping_info">
                <span id="shipping_info_text">배송정보</span>
            </div>
        </div>
        <div class="shipping_info_box2">
            <div class="shipping_sheet">
                <div id="shipping_sheet1"><span>받으시는 분</span></div>
                <div id="shipping_sheet2"><span>최윤석</span></div>
            </div>
            <div class="shipping_sheet">
                <div id="shipping_sheet3"><span>휴대전화 번호</span></div>
                <div id="shipping_sheet4"><span>01025673855</span></div>
            </div>
            <div class="shipping_sheet">
                <div id="shipping_sheet5"><span>주소</span></div>
                <div id="shipping_sheet6"><span>06164 서울시 강남구 영동대로 511</span></div>
            </div>
            <div class="shipping_sheet">
                <div id="shipping_sheet7"><span>배송요청사항</span></div>
                <div id="shipping_sheet8"><span>파손위험 상품입니다. 배송시 주의해주세요.</span></div>
            </div>
        </div>
    </section>

    <section>
        <div class="submit">
         <input type="submit" id="submitbt" name="submitbt" value="계속 쇼핑하기">
        </div>
    </section>
    
</body>
</html>