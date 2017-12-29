<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/context/mytags.jsp"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">

<title><t:mutiLang langKey="jeect.platform" /></title>

<meta name="keywords" content="JEECG 企业级快速开发平台">
<meta name="description" content="JEECG 企业级快速开发平台，她采用强大代码生成，在线开发能力">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="phone/css/style.css">
<script type="text/javascript" src="phone/js/jquery.min.js"></script>
<script type="text/javascript" src="phone/js/idangerous.swiper.js"></script>
</head>
<body>
	<div class="page" style="margin: 0;">
		<!-- <div style="background-color: #ddd; height: 40">
			<a href="javascript:;" onClick="history.go(-1)">
				<h3 style="padding-top: 10">退出</h3>
			</a>
		</div> -->
		<div class="device">
			<a class="arrow-left" href="javascript:;"></a> <a class="arrow-right"
				href="javascript:;"></a>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<!-- 幻灯片 -->
					<a href="" class="swiper-slide"> <img
						src="phone/images/slide1.png" alt="">
					</a> <a href="" class="swiper-slide"> <img
						src="phone/images/slide2.png" alt="">
					</a>
				</div>
			</div>
			<div class="points">
				<span class="swiper-pagination-switch"></span>
			</div>
		</div>

		<div class="content"
			style="width: 100%; min-height: 350px; margin-top: -30px;">
			<div class="gun" style="width: 100%; height: 100px;">
				<div id="slides">
					<ul class="slides_container swiper-wrapper" id="ul1" style="">
						<c:forEach var="firstMenu" items="${firstMenu}" varStatus="status">
							<c:if test='${status.count%4 eq 1}'>
								<li class="swiper-slide swiper-slide-visible" style="">
							</c:if>
							<a href="javascript:;" target="_blank">
								<div class="tub">
									<img class="tub1" src="phone/images/icon1.png" alt="">
								</div>
								<div class="tet">
									<span>
										<h2>${firstMenu.functionName}</h2>
									</span>
								</div>
							</a>
							<c:if test='${status.count%4 eq 0 || status.last}'>
								</li>
							</c:if>

						</c:forEach>
					</ul>
					<a href="javascript:;" class="prev"> prev </a> <a
						href="javascript:;" class="next" id="soso"> next </a>
				</div>
			</div>
			<ul class="neir"
				style="width: 95%; margin-left: 2%; border: rgba(37, 195, 137, 0) 1px solid; overflow: hidden; min-height: 240px; padding-bottom: 80px;"
				id="ul2">
				<c:forEach var="firstMenu" items="${firstMenu}" varStatus="status1">
					<li class="pro">
						<div class="newTit clearfix"></div>
						<div class="row" style="min-height: 330px;">
							<c:forEach var="secondMenu" items="${secondMenu}"
								varStatus="status">
								<c:if
									test="${firstMenu.functionName eq secondMenu.TSFunction.functionName}">
									<a href="${secondMenu.functionUrl}" class="item_one" style="display: block;"
										data-type="all"> <img class="gntub"
										src="phone/images/tu1.png">
										<div class="tet2">
											<span><h2>${secondMenu.functionName}</h2></span>
										</div>
									</a>
								</c:if>
							</c:forEach>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="footer clearfix">
		<a href=""><i></i>电话</a> <a href=""><i></i>QQ</a>
	</div>
	<script>
		var mySwiper = new Swiper('.swiper-container', {
			pagination : '.points',
			loop : true,
			autoplay : 3000,
			grabCursor : true,
			paginationClickable : true
		});
		$('.arrow-left').on('click', function(e) {
			e.preventDefault();
			mySwiper.swipePrev()
		});
		$('.arrow-right').on('click', function(e) {
			e.preventDefault();
			mySwiper.swipeNext()
		});
		var mySwiper2 = new Swiper('#slides', {
			pagination : false,
			paginationClickable : true,
		});
		$('.prev').on('click', function(e) {
			e.preventDefault();
			mySwiper2.swipePrev()
		});
		$('.next').on('click', function(e) {
			e.preventDefault();
			mySwiper2.swipeNext()
		});
		//tab切换
		window.onload = function() {
			var a = $("#slides a");
			var b = $(".neir>li");
			var c = 'active';
			tab(a, b, c);
		};
		function tab(a, b, c) {
			var len = $(a);
			len.bind("click", function() {
				var index = 0;
				$(this).addClass(c).siblings().removeClass(c);
				index = len.index(this);
				$(b).eq(index).show().siblings().hide();
				return false;
			}).eq(0).trigger("click");
		}
		$(function() {
			$(".newTit .moreLink>a").click(function() {
				if ($(this).hasClass('on')) {
					$(this).removeClass('on').next().hide();
				} else {
					$(this).addClass('on').next().show();
				}
			});
			$(".fixedBar a.aClick").click(function() {
				$(".fixedBar .SubLinks").toggle();
				return false;
			});
		});
		$(".neir .row a[data-new=new]").show();//默认显示最新的项目
		function tagsFilter(obja, type) {//obja是当前的a标签，type是项目类型从0-6，all,new,all是所有项目，new是最新的
			var oText = obja.text();
			var newTit = $('.newTit h3').text(oText);
			$(".item_one").hide();
			if (typeof type === 'number') {
				$(".neir .row a[data-type=" + type + "]").show();
			} else if (type === 'all') {
				$(".item_one").show();
			} else if (type === 'new') {
				$(".neir .row a[data-new=new]").show();
			}
			$(".fixedBar .SubLinks").hide();
			$(".newTit .moreLink>a").removeClass('on').next().hide();
			$("html,body").stop().animate({
				scrollTop : $(".newTit").offset().top
			}, 1000);
		}
		//    function tagsFilter(obja,data){
		//        var oText=obja.text();
		//        var newTit=$('.newTit h3').text(oText);
		//        var tokenn='yicms';
		//        $.ajax({
		//            type:"post",
		//            url:"ajaxå°å",
		//            dataType:"json",
		//            data:{
		//                info:data
		//            },
		//            success:function(sta){
		//                // alert(sta);
		//                $(".row").html(sta)
		//                $(".fixedBar .SubLinks").hide();
		//                $(".newTit .moreLink>a").removeClass('on').next().hide();
		//                $("html,body").stop().animate({scrollTop:$(".newTit").offset().top},1000);
		//            }
		//        })
		//    }
		$(function() {
			var $this = $(".scrollNews");
			var t = null;
			$this.hover(function() {
				clearInterval(t);
			}, function() {
				t = setInterval(function() {
					scrollNews($this);
				}, 4000);
			}).trigger("mouseleave");
		});
		function scrollNews(obj) {
			var $self = obj.find(".yy");
			var lineHeight = $self.find(".tongzhi").eq(0).height();
			$self.animate({
				"marginTop" : -lineHeight + "px"
			}, 600, function() {
				$self.css({
					marginTop : 0
				}).find(".tongzhi").eq(0).appendTo($self);
			})
		}
	</script>

</body>
</html>