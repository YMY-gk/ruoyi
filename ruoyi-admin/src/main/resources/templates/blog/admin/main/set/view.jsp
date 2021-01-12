<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="box no-border">
	<div class="box-header with-border">
		<h4 class="box-title">页面管理</h4>
	</div>
</div>
<div class="col-md-6">
	<div class="box box-success">
		<div class="box-header with-border">
			<h4 class="box-title">基础配置</h4>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="form-group">
				<form id="webData">
					<label>网站昵称</label> 
					<input type="text" name="webname" class="form-control input-sm" value="${webValue.webname }" placeholder="网站昵称"> 
					<label>KEYWORDS</label> 
					<input type="text" name="keywords" class="form-control input-sm" value="${webValue.keywords }" placeholder="关键词"> 
					<label>DESCRIPTION</label> 
					<input type="text" name="description" class="form-control input-sm" value="${webValue.description }" placeholder="网站描述"> 
					<label>COPYRIGHT</label> 
					<input type="text" name="copyright" class="form-control input-sm" value="${webValue.copyright }" placeholder="网站声明">
				</form>
			</div>
			<button id="baseSaveBtn" class="btn btn-flat btn-success pull-right">保存</button>
		</div>
		<!-- /.box-body -->
	</div>
</div>
<div class="col-md-6">
	<div class="box box-success">
		<div class="box-header with-border">
			<h4 class="box-title">七牛云配置</h4>
			&nbsp;<a href="https://www.qiniu.com/" target="_blank">[七牛云官网]</a>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="form-group">
				<form id="qiniuData">
					<label>URL</label> 
					<input type="text" name="URL" class="form-control input-sm" value="${qiniuValue.url }" placeholder="七牛云访问域名"> 
					<label>AccessKey</label> 
					<input type="text" name="AK" class="form-control input-sm" value="${qiniuValue.ak }" placeholder="七牛云AccessKey密钥"> 
					<label>SecretKey</label> 
					<input type="text" name="SK" class="form-control input-sm" value="${qiniuValue.sk }" placeholder="七牛云SecretKey密钥"> 
					<label>BucketName</label> 
					<input type="text" name="BN" class="form-control input-sm" value="${qiniuValue.bn }" placeholder="七牛云空间名称">
				</form>
			</div>
			<button id="qiniuSaveBtn" class="btn btn-flat btn-success pull-right">保存</button>
		</div>
		<!-- /.box-body -->
	</div>
</div>

<div class="col-md-6">
	<div class="box box-success">
		<div class="box-header with-border">
			<h4 class="box-title">邮件配置</h4>
			&nbsp;<a href="http://www.tuling123.com/" target="_blank">[QQ邮箱]</a>
			| <a href="http://www.tuling123.com/" target="_blank">[新浪邮箱]</a>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="form-group">
				<form id="emailData">
					<label>AUTH</label> 
					<input type="text" name="auth" class="form-control input-sm" value="${emailValue.auth }" placeholder="HOST"> 
					<label>HOST</label> 
					<input type="text" name="host" class="form-control input-sm" value="${emailValue.host }" placeholder="HOST"> 
					<label>PORT</label> 
					<input type="text" name="port" class="form-control input-sm" value="${emailValue.port }" placeholder="PORT"> 
					<label>USER</label>
					<input type="text" name="user" class="form-control input-sm" value="${emailValue.user }" placeholder="USER">
					<label>PASSWORD</label> 
					<input type="text" name="password" class="form-control input-sm" value="${emailValue.password }" placeholder="PASSWORD">
				</form>
			</div>
			<button id="emailSaveBtn" class="btn btn-flat btn-success pull-right">保存</button>
		</div>
		<!-- /.box-body -->
	</div>
</div>

<div class="col-md-6">
	<div class="box box-success">
		<div class="box-header with-border">
			<h4 class="box-title">图灵机器人配置</h4>
			&nbsp;<a href="http://www.tuling123.com/" target="_blank">[图灵机器人官网]</a>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="form-group">
				<form id="turingData">
					<label>APIKEY</label> 
					<input type="text" class="form-control input-sm" value="${tulingValue.apikey }" placeholder="图灵机器人APIKEY"> 
					<label>SECRET</label>
					<input type="text" class="form-control input-sm" value="${tulingValue.secret }" placeholder="图灵机器人SECRET">
				</form>
			</div>
			<button id="turingSaveBtn" class="btn btn-flat btn-success pull-right">保存</button>
		</div>
		<!-- /.box-body -->
	</div>
</div>

<script>

	/* 基本配置修改 */
	$("#baseSaveBtn").click(function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/set/save/web",
			data : $("#webData").serialize(),
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
	
	/* 七牛云配置修改 */
	$("#qiniuSaveBtn").click(function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/set/save/qiniu",
			data : $("#qiniuData").serialize(),
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
	
	/* 邮件配置修改 */
	$("#emailSaveBtn").click(function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/set/save/email",
			data : $("#emailData").serialize(),
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
	
	/* 图灵配置修改 */
	$("#turingSaveBtn").click(function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/set/save/turing",
			data : $("#turingData").serialize(),
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
</script>
