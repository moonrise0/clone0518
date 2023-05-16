<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let item_get = {
        init:function(){
            $('#cart_btn').click(function(){
                let cust_id = '${logincust.id}';
                let item_id = ${gitem.id};
                let cnt = $('#cnt').val();
                $.ajax({
                    url:'/item/addcart',
                    data:{cust_id:cust_id, item_id:item_id, cnt:cnt},
                    success:function(){
                        $('#myModal').modal();
                    }
                })
                // $('#cart_form').attr({
                //     method:'get',
                //     action:'/item/addcart'
                // });
                // $('#cart_form').submit();
            });
        }
    };
    $(function(){
        item_get.init();
    });
</script>

<%--    Home / Product Details--%>
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="bread"><span><a href="/">Home</a></span> / <span>Product Details</span></p>
            </div>
        </div>
    </div>
</div>
<%--    Home / Product Details--%>
<div class="colorlib-product">
<%--<div class="col-sm-8 text-left">--%>
    <div class="container">
        <div class="row row-pb-lg product-detail-wrap">
            <div class="col-sm-8">
                <h3>Item Info</h3>
                <img src="/images/${gitem.imgname}"/>
                <h4>${gitem.id}</h4>
                <h4>${gitem.name}</h4>
                <h4>${gitem.price}</h4>
            </div>

            <div class="col-sm-4">
                <div class="size-wrap">
                    <div class="block-26 mb-2">
                        <h4>Size</h4>
                        <ul>
                            <li><a href="#">7</a></li>
                            <li><a href="#">7.5</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">8.5</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">9.5</a></li>
                            <li><a href="#">10</a></li>
                            <li><a href="#">10.5</a></li>
                            <li><a href="#">11</a></li>
                            <li><a href="#">11.5</a></li>
                            <li><a href="#">12</a></li>
                            <li><a href="#">12.5</a></li>
                            <li><a href="#">13</a></li>
                            <li><a href="#">13.5</a></li>
                            <li><a href="#">14</a></li>
                        </ul>
                    </div>
                    <div class="block-26 mb-4">
                        <h4>Width</h4>
                        <ul>
                            <li><a href="#">M</a></li>
                            <li><a href="#">W</a></li>
                        </ul>
                    </div>
                </div>
                <c:if test="${logincust != null}">
                    <form id="cart_form" class="form-inline well">
                        <input type="hidden" name="cust_id" value="${logincust.id}">
                        <input type="hidden" name="item_id" value="${gitem.id}">
                        <label class="control-label col-sm-2" for="cnt">Count:</label><br/>
                        <div class="row">
                            <div class="form-group">
                                <input type="number" name="cnt" id="cnt" placeholder="Enter Count" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <button id="cart_btn" type="button" class="btn btn-primary btn-addtocart"><i class="icon-shopping-cart"></i></i>Cart</button>
                            </div>
                        </div>
                    </form>
                </c:if>
        </div>
<%--        그냥des.신경쓰지말자--%>
            <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-md-12 pills">
                        <div class="bd-example bd-example-tabs">
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Manufacturer</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
                                </li>
                            </ul>

                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
                                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>
                                </div>

                                <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                </div>

                                <div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <h3 class="head">23 Reviews</h3>
                                            <div class="review">
                                                <div class="user-img" style="background-image: url(images/person1.jpg)"></div>
                                                <div class="desc">
                                                    <h4>
                                                        <span class="text-left">Jacob Webb</span>
                                                        <span class="text-right">14 March 2018</span>
                                                    </h4>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
                                                        <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                    </p>
                                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                </div>
                                            </div>
                                            <div class="review">
                                                <div class="user-img" style="background-image: url(images/person2.jpg)"></div>
                                                <div class="desc">
                                                    <h4>
                                                        <span class="text-left">Jacob Webb</span>
                                                        <span class="text-right">14 March 2018</span>
                                                    </h4>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
                                                        <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                    </p>
                                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                </div>
                                            </div>
                                            <div class="review">
                                                <div class="user-img" style="background-image: url(images/person3.jpg)"></div>
                                                <div class="desc">
                                                    <h4>
                                                        <span class="text-left">Jacob Webb</span>
                                                        <span class="text-right">14 March 2018</span>
                                                    </h4>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-half"></i>
										   					<i class="icon-star-empty"></i>
									   					</span>
                                                        <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                    </p>
                                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="rating-wrap">
                                                <h3 class="head">Give a Review</h3>
                                                <div class="wrap">
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					(98%)
									   					</span>
                                                        <span>20 Reviews</span>
                                                    </p>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-empty"></i>
										   					(85%)
									   					</span>
                                                        <span>10 Reviews</span>
                                                    </p>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					(70%)
									   					</span>
                                                        <span>5 Reviews</span>
                                                    </p>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					(10%)
									   					</span>
                                                        <span>0 Reviews</span>
                                                    </p>
                                                    <p class="star">
										   				<span>
										   					<i class="icon-star-full"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					<i class="icon-star-empty"></i>
										   					(0%)
									   					</span>
                                                        <span>0 Reviews</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%--        그냥des.신경쓰지말자--%>
    </div>
<%-- </div>--%>


</div>




<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4>상품이 장바구니에 담겼습니다.</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <a href="/item/cart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로 이동</a>
                <a href="/item/men" class="btn btn-info" role="button">계속 쇼핑하기</a>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
