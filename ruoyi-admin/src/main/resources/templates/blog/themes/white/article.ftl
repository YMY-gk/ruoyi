<#import "_layout.ftl" as defaultLayout> <#-- 调用布局指令 -->
<@defaultLayout.layout>
<link rel="stylesheet"
	href="${values.webroot}/assets/editor.md-master/css/editormd.preview.css" />
<style>
.editormd-html-preview {
	width: 90%;
	margin: 0 auto;
}

.reply {
	color: #333333;
}

.openReply {
	color: #333333;
}

.replys {
	display: none;
	color: #333333;
}

.panel-footer div {
	padding: 5px;
}
</style>

<div class="container">
	<div class="col-md-9" style="float: none; margin: 80px auto;">
		<h4 style="text-align: center; padding: 10px;">${article.aTitle}</h4>
		<p style="font-size: 12px; color: #5f5f5f; text-align: center;">发布于
			${article.aDatetime?string("yyyy-MM-dd")} / ${article.aTypeid} /
			1${article.aViewnum}浏览</p>

		<p
			style="text-align: center; height: auto; padding-bottom: 20px; border-bottom: 1px solid #eeeeee;">
			<#list tagList as tag> <#if tag_index==1> <span
				class="label label-success">#${tag}</span> <#elseif tag_index==2>
				<span class="label label-primary">#${tag}</span>
				<#elseif tag_index == 3>
				<span class="label label-success">#${tag}</span>
				<#elseif tag_index == 4>
				<span class="label label-info">#${tag}</span>
				<#elseif tag_index == 5>
				<span class="label label-warning">#${tag}</span>
				<#elseif tag_index == 6>
				<span class="label label-info">#${tag}</span>
				<#elseif tag_index == 7>
				<span class="label label-danger">#${tag}</span>
				<#elseif tag_index == 8>
				<span class="label label-default">#${tag}</span>
				<#elseif tag_index == 9>
				<span class="label label-info">#${tag}</span>
				<#elseif tag_index == 10>
				<span class="label label-success">#${tag}</span>
			<#else>
				<span class="label label-warning">#${tag}</span>
			</#if>
			</#list>
		</p>

		<div id="test-editormd-view">
			<textarea style="display: none;" id="mdtext"
				name="test-editormd-markdown-doc">${article.aContent}</textarea>
		</div>
		<div class="col-md-10" style="float: none; margin: 40px auto;">
			<span class="pull-right"><a href="javascript:void(0);"
				class="reply"><i class="fa fa-reply fa-2x"></i></a></span>
			<div class="clearfix"></div>
		</div>

		<!-- /.container -->
	</div>
	<div class="col-md-9" style="float: none; margin: 40px auto;">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">评论列表</h3>
			</div>
			<div class="box-body">
				<#if commentList?? && (commentList?size> 0)> <#list
					commentList as comment>
				<div class="panel" id="${comment.id}">
					<div class="panel-heading">
						<img alt="个人博客" width="20px" height="20px"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABLCAYAAAA4TnrqAAABcklEQVR4Xu3YoWpCYRyG8f9BvIUtmARBtiWzRZvJ4iVo9R6EXcLqktE7MJnEIl6BYLCLXeQIR8sGju9ZOLD5mAyP8vHzRThf9jKZ5+ErSSATK8mpiMRKtxILWIklFhEArf9ZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVliAQGQlrascbcRo3Y9qpWsON5qd4jhdA2Oek3f+28xaNWK96dzHp/LXXwstvh7fvMBsYCaWGIBAZC6LLGAAEhdllhAAKQuSywgAFKX9RewwBnvpg/zuCPWDwLfH6TFAlib/TFm6z026zSfovf67K1DipxXNClKt0Yssb4KeFMKFiGWWEAApC5LLCAAUpclFhAAqcsSCwg8WFraTel/cBUL/IpiiQUEQOqyxAICIHVZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVkA6wJwzDXVmeL5ZwAAAABJRU5ErkJggg==">
						<#if comment.cName=="博主"> <span>&nbsp;<a
							href="javascript:void(0);" style="color: red !important;">${comment.cName}</a>
							&nbsp; <#else> <span>&nbsp;<a
								href="javascript:void(0);" style="color: #3c8dbc">${comment.cName}(${comment.cEmail})</a>
								&nbsp; </#if>
						<!-- <span style="color: #3c8dbc">&nbsp;<a href="${comment.cUrl}">${comment.cName}</a> &nbsp; -->
						${comment.cTime?string("yyyy-MM-dd")} </span>
					</div>
					<div class="panel-body">
						${comment.cContent} <span class="pull-right"> <a
							href="javascript:void(0);" class="openReply"
							data-id="${comment.id}"><i class="fa fa-arrows-alt"></i></a></span> <span
							class="pull-right">&nbsp;&nbsp;</span> <span class="pull-right"><a
							href="javascript:void(0);" class="reply" data-id="${comment.id}"><i
								class="fa fa-reply"></i></a></span>
						<div class="clearfix"></div>
					</div>
					<div id="${comment.id}replys" class="panel-footer"
						style="background-color: white; border-top: none;"></div>
				</div>
				</#list> <#else> 沒有评论</#if>


			</div>
		</div>
		<!-- /.box -->
	</div>
</div>

<div id="replyDiv"
	style="background-color: #f7f7f7 !important; position: fixed; bottom: 0px; right: 0px; left: 0px; z-index: 20000;">
	<div class="container">
		<div class="col-md-9" style="float: none; margin: 40px auto;">
			<div class="box box-success">
				<div class="box-header with-border" id="commentArea"
					data-id="${article.id}">
					<h3 class="box-title">
						评论&nbsp;<span id="userTips" style="color: red; font-size: 12px;"></span>
					</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="userInfoDiv">
						<div class="form-group">
							<input type="text" class="form-control" id="name"
								placeholder="昵称(*) 例：Haojie Li">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="email"
								placeholder="邮箱(*) 例：2252487366@qq.com">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="url"
								placeholder="网址 例：http://www.hjieli.com">
						</div>
					</div>
					<div class="form-group" style="display: none;">
						<input type="text" class="form-control" id="pid" placeholder="pid">
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="3" id="content"
							placeholder="评论内容 例：Hello World."></textarea>
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">

					<button id="tijiao" type="button"
						class="btn btn-success btn-flat pull-right">提交</button>
					<button id="cancle" type="button"
						class="btn btn-danger btn-flat pull-right">取消</button>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!-- /.container -->

</div>

<script
	src="${values.webroot}/assets/editor.md-master/lib/marked.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/prettify.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/raphael.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/underscore.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/sequence-diagram.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/flowchart.min.js"></script>
<script
	src="${values.webroot}/assets/editor.md-master/lib/jquery.flowchart.min.js"></script>
<script src="${values.webroot}/assets/editor.md-master/editormd.js"></script>
<script src="https://cdn.bootcss.com/jquery.notification/1.0.2/jquery.notification.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#replyDiv").hide();
		var mdrkdown = $("#mdtext").val();
		testEditormdView = editormd.markdownToHTML("test-editormd-view", {
			markdown : mdrkdown,//+ "\r\n" + $("#append-test").text(),
			//htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
			htmlDecode : "style,script,iframe", // you can filter tags decode
			//toc             : false,
			tocm : true, // Using [TOCM]
			//tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
			//gfm             : false,
			//tocDropdown     : true,
			// markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
			emoji : true,
			taskList : true,
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析
		});
		if (getCookie('name') != '' && getCookie('email') != ''
				&& getCookie('url') != '') {
			$('#userInfoDiv').hide();
			$('#userTips').html(
					getCookie('name') + '(' + getCookie('email') + ')');
		} else {
			$('#userInfoDiv').show();
			$('#userTips').html('');
		}
	});

	$(".reply").click(function() {
		$("#replyDiv").show(500);
		$("#pid").val($(this).attr('data-id'));
	});

	$(document).on("click", ".replys", function() {//修改成这样的写法  
		$("#replyDiv").show(500);
		$("#pid").val($(this).attr('data-id'));
	});

	$(document).on("mouseover", ".panel-footer div", function() {//修改成这样的写法  
		if ($(this).find('.replys').css('display') == "none") {
			$(this).find('.replys').show();
			$(this).css('background-color', '#eeeeee');
		}
	});
	$(document).on("mouseleave", ".panel-footer div", function() {//修改成这样的写法  
		if ($(this).find('.replys').css('display') == "inline") {
			$(this).find('.replys').hide();
			$(this).css('background-color', 'white');
		}
	});
	$("#cancle").click(function() {
		$("#replyDiv").hide(500);
	});
	<!--评论-->
	$("#tijiao").click(
			function() {
				if (getCookie('name') != '' && getCookie('email') != ''
						&& getCookie('url') != '') {
					var aid = $("#commentArea").attr('data-id');
					if (aid == null || aid == "") {
						return;
					}
					var content = $("#content").val()
					if (content == null || content == "") {
						return;
					}
					var name = getCookie('name');

					var email = getCookie('email');

					var url = getCookie('url');

					var pid = $("#pid").val();
					$.ajax({
						type : "post",
						url : "${values.webroot}/api/article/reply",
						data : {
							aid : aid,
							name : name,
							email : email,
							url : url,
							content : content,
							pid : pid
						},
						dataType : "json",
						success : function(data) {//请求正确执行的方法（后台返回的结果）
							if (data.result.data == "success") {
								$("#content").val("");
								$("#replyDiv").hide(500);
								//设置cookie
								setCookie('name', '' + data.result.name); // 存储 cookie 
								setCookie('email', '' + data.result.email); // 存储 cookie 
								setCookie('url', '' + data.result.url); // 存储 cookie 
								//刷新页面
								sendEmail();
							}else{
								alert(data.result.data);
							}
							$("#pid").val("");
						}
					});
				} else {
					var aid = $("#commentArea").attr('data-id');
					if (aid == null || aid == "") {
						return;
					}
					var content = $("#content").val()
					if (content == null || content == "") {
						return;
					}
					var name = $("#name").val()
					if (name == null || name == "") {

						return;
					}
					var email = $("#email").val()
					if (email == null || email == "") {
						return;
					} else {
						if (chkEmail(email) == false) {
							alert('请填写正确的邮箱');
							return;
						}
					}

					var url = $("#url").val();
					if (url != "") {
						if (CheckUrl(url) == false) {
							alert('地址不正确');
							return;
						}
					}
					var pid = $("#pid").val();
					$.ajax({
						type : "post",
						url : "${values.webroot}/api/article/reply",
						data : {
							aid : aid,
							name : name,
							email : email,
							url : url,
							content : content,
							pid : pid
						},
						dataType : "json",
						success : function(data) {//请求正确执行的方法（后台返回的结果）
							if (data.result.data == "success") {
								$("#content").val("");
								$("#replyDiv").hide(500);
								//设置cookie
								setCookie('name', '' + data.result.name); // 存储name cookie 
								setCookie('email', '' + data.result.email); // 存储email cookie 
								setCookie('url', '' + data.result.url); // 存储url cookie 
								/* alert(getCookie('name')+":"+getCookie('email')+":"+getCookie('url')); */
								sendEmail();
							}else{
								alert(data.result.data);
							}
							$("#pid").val("");
						}
					});
				}

			});

	/* 展开回复 */
	$(".openReply").click(function() {
		var pid = $(this).attr('data-id');
		$.ajax({
			type : "post",
			url : "${values.webroot}/api/article/openReplys",
			data : {
				pid : pid
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				$("#" + pid + "replys").html(data.result);
			}
		});
	});

	function setCookie(c_name, value, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ((expiredays == null) ? "" : ";expires="
						+ exdate.toGMTString())
	}

	function getCookie(c_name) {
		if (document.cookie.length > 0) {
			c_start = document.cookie.indexOf(c_name + "=")
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1
				c_end = document.cookie.indexOf(";", c_start)
				if (c_end == -1)
					c_end = document.cookie.length
				return unescape(document.cookie.substring(c_start, c_end))
			}
		}
		return ""
	}

	function chkEmail(strEmail) {
		if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(strEmail)) {
			return false;
		} else {
			return true;
		}
	}

	function CheckUrl(url) {
		var reg = /^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
		if (!reg.test(url)) {
			return false;
		} else {
			return true;
		}
	}
	
	function sendEmail(){
		$.ajax({
			type : "post",
			url : "${values.webroot}/api/email/send",
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				if(data.result.state=="200"){
					var options = {
					    iconUrl: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABLCAYAAAA4TnrqAAABcklEQVR4Xu3YoWpCYRyG8f9BvIUtmARBtiWzRZvJ4iVo9R6EXcLqktE7MJnEIl6BYLCLXeQIR8sGju9ZOLD5mAyP8vHzRThf9jKZ5+ErSSATK8mpiMRKtxILWIklFhEArf9ZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVliAQGQlrascbcRo3Y9qpWsON5qd4jhdA2Oek3f+28xaNWK96dzHp/LXXwstvh7fvMBsYCaWGIBAZC6LLGAAEhdllhAAKQuSywgAFKX9RewwBnvpg/zuCPWDwLfH6TFAlib/TFm6z026zSfovf67K1DipxXNClKt0Yssb4KeFMKFiGWWEAApC5LLCAAUpclFhAAqcsSCwg8WFraTel/cBUL/IpiiQUEQOqyxAICIHVZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVkA6wJwzDXVmeL5ZwAAAABJRU5ErkJggg==',
					    title: 'Java Blog',
					    body: data.result.msg
					};
					$.notification(options);
				} else if(data.result.state=="400"){
					var options = {
					    iconUrl: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABLCAYAAAA4TnrqAAABcklEQVR4Xu3YoWpCYRyG8f9BvIUtmARBtiWzRZvJ4iVo9R6EXcLqktE7MJnEIl6BYLCLXeQIR8sGju9ZOLD5mAyP8vHzRThf9jKZ5+ErSSATK8mpiMRKtxILWIklFhEArf9ZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVliAQGQlrascbcRo3Y9qpWsON5qd4jhdA2Oek3f+28xaNWK96dzHp/LXXwstvh7fvMBsYCaWGIBAZC6LLGAAEhdllhAAKQuSywgAFKX9RewwBnvpg/zuCPWDwLfH6TFAlib/TFm6z026zSfovf67K1DipxXNClKt0Yssb4KeFMKFiGWWEAApC5LLCAAUpclFhAAqcsSCwg8WFraTel/cBUL/IpiiQUEQOqyxAICIHVZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVkA6wJwzDXVmeL5ZwAAAABJRU5ErkJggg==',
					    title: 'Java Blog',
					    body: data.result.msg
					};
					$.notification(options);
				} else{
					console.log("未知错误");
				}
				
			}
		});
	}
</script> </@defaultLayout.layout> 