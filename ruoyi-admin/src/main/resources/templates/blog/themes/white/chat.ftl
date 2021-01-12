
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>陌聊 | 跟陌生人聊聊？</title>
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${values.webroot}/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${values.webroot}/assets/AdminLTE/dist/css/AdminLTE.min.css">
<style>
.direct-chat-text {
	margin: 5px 10px 10px 15px !important;
}
</style>
</head>
<body>
	<div class="row" style="max-width:700px !important; margin:0 auto;">
		<div class="col-md-12" >
			<!-- DIRECT CHAT SUCCESS -->
			<div class="box box-success direct-chat direct-chat-success">
				<div class="box-header with-border ">
					<h3 class="box-title">当前系统分配给你的用户为：${timestamp}</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body" id="msg" style="background-color:#eeeeee">
					
				</div>
				<!-- /.box-body -->
				<div class="box-footer navbar-fixed-bottom" style="max-width:690px !important; margin:0 auto;">
					<form action="#" method="post">
						<div class="input-group">
							<input type="text" id="message" data-timestamp="${timestamp}" placeholder="消息 ..." class="form-control">
							<span class="input-group-btn">
								<input type="button" onclick="sendMessage()" class="btn btn-success btn-flat"  value="发送">
							</span>
						</div>
					</form>
				</div>
				<!-- /.box-footer-->
			</div>
			<!--/.direct-chat -->
		</div>
		<!-- /.col -->
	</div>
	<script src="http://www.w3school.com.cn/jquery/jquery-1.11.1.min.js"></script>
	<script src="${values.webroot}/assets/js/sockjs.js" "text/javascript"></script>
<!-- 	<script src="${values.webroot}/assets/js/chat.websocket.js?v=1.1.1" "text/javascript"></script> -->

	<script>
		$(function(){
			var topHeight = $(".box-header").height();
			var bottomHeight = $(".box-footer").height();
			var bodyHeight = $(document.body).height()-topHeight-bottomHeight-40;
			/* alert(topHeight+":"+bottomHeight+":"+bodyHeight+":"+$(document.body).height()); */
			$(".box-body").height(bodyHeight);
		});
		
		var timestamp=Date.parse(new Date());
		
		
		
		 var wsServer = null;
	    var ws = null;
	  wsServer = "ws://127.0.0.1:8080/OschinaSvnJavaBlog/chatserver/" +document.getElementById("message").getAttribute("data-timestamp"); 
	    ws = new WebSocket(wsServer); //创建WebSocket对象
	    ws.onopen = function (evt) {
	        /* $("#msg").html("已连接"); */
	    };
	    ws.onmessage = function (evt) {
	    	$("#msg").append(evt.data+"<br/>");  //解析后台传回的消息,并予以展示
	    	$('#msg').scrollTop( $('#msg')[0].scrollHeight );
	    };
	    ws.onerror = function (evt) {
	        /* alert("产生异常"+JSON.stringify(evt)); */
	    };
	    ws.onclose = function (evt) {
	      /*   alert("已经关闭连接"+JSON.stringify(evt)); */
	    };
		
		 function sendMessage() {
			 if(ws == null){
		           alert("连接未开启!");
		            return;
		        }
		        var message = $("#message").val();
		        var to = "";
		        if(message == null || message == ""){
		            alert("请不要惜字如金!");
		            return;
		        }
		     
		        ws.send(message);
		     
	    }
		  function appendZero(s){return ("00"+ s).substr((s+"").length);}  //补0函数
		 function getDateFull(){
		        var date = new Date();
		        var currentdate = date.getFullYear() + "-" + appendZero(date.getMonth() + 1) + "-" + appendZero(date.getDate()) + " " + appendZero(date.getHours()) + ":" + appendZero(date.getMinutes()) + ":" + appendZero(date.getSeconds());
		        return currentdate;
		    }
	</script>
</body>