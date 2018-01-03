<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
<title>CT上传</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="jq-weui/dist/lib/weui.min.css">
<link rel="stylesheet" href="jq-weui/dist/css/jquery-weui.css">
<link rel="stylesheet" href="jq-weui/dist/demos/css/demos.css">

</head>
<body ontouchstart>

	<header class='demos-header'>
		<h1 class="demos-title">CT 上传</h1>
	</header>


	<div class="weui-cells weui-cells_form">
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<textarea class="weui-textarea" placeholder="填写CT描述" rows="2"></textarea>
				<div class="weui-textarea-counter">
					<span>0</span>/200
				</div>
		<div class="weui-uploader">
            <div class="weui-uploader__hd">
              <p class="weui-uploader__title">上传CT</p>
              <div class="weui-uploader__info">0/2</div>
            </div>
            <div class="weui-uploader__bd">
              <ul class="weui-uploader__files" id="uploaderFiles">
               <!--  <li class="weui-uploader__file" style="background-image:url(./images/pic_160.png)"></li>
                <li class="weui-uploader__file" style="background-image:url(./images/pic_160.png)"></li>
                <li class="weui-uploader__file" style="background-image:url(./images/pic_160.png)"></li> -->
                <li class="weui-uploader__file weui-uploader__file_status" style="background-image:url(./images/pic_160.png)">
                  <div class="weui-uploader__file-content">
                    <i class="weui-icon-warn"></i>
                  </div>
                </li>
                <li class="weui-uploader__file weui-uploader__file_status" style="background-image:url(./images/pic_160.png)">
                  <div class="weui-uploader__file-content">50%</div>
                </li>
              </ul>
              <div class="weui-uploader__input-box">
              <!-- <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple=""> -->
           <form action="${ctx}/fileManeger/uploadFile" method="post" enctype="multipart/form-data">
              <input class="weui-uploader__input"  type="file" name="uploadFile" id="3" ><br/> 
           </form>
              </div>
              
 
            </div>
          </div>
			</div>
		</div>
	</div>

	<div class="weui-btn-area">
		<a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">确定</a>
	</div>

	<script src="jq-weui/dist/lib/jquery-2.1.4.js"></script>
	<script src="jq-weui/dist/lib/fastclick.js"></script>
	<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>
	<script src="jq-weui/dist/js/jquery-weui.js"></script>


	<script>
      $("#showTooltips").click(function() {
       // var tel = $('#tel').val();
      //  var code = $('#code').val();
      //  if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入手机号');
      //  else if(!code || !/\d{6}/.test(code)) $.toptip('请输入六位手机验证码');
        //else 
        	$.toptip('提交成功', 'success');
      });
    </script>
</body>
</html>
