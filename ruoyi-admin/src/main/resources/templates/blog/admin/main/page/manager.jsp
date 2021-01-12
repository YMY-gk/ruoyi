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
			<h4 class="box-title">七牛云配置</h4>
			&nbsp;<a href="https://www.qiniu.com/" target="_blank">[七牛云官网]</a>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="form-group">
				<label>URL</label> <input type="text" class="form-control input-sm"
					placeholder="七牛云访问域名"> <label>AccessKey</label> <input
					type="text" class="form-control input-sm"
					placeholder="七牛云AccessKey密钥"> <label>SecretKey</label> <input
					type="text" class="form-control input-sm"
					placeholder="七牛云SecretKey密钥"> <label>BucketName</label> <input
					type="text" class="form-control input-sm" placeholder="七牛云空间名称">
			</div>
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
				<label>HOST</label> <input type="text" class="form-control input-sm"
					placeholder="HOST"> <label>PORT</label> <input type="text"
					class="form-control input-sm" placeholder="PORT"> <label>USER</label>
				<input type="text" class="form-control input-sm" placeholder="USER">
				<label>PASSWORD</label> <input type="text"
					class="form-control input-sm" placeholder="PASSWORD">
			</div>
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
				<label>APIKEY</label> <input type="text"
					class="form-control input-sm" placeholder="图灵机器人APIKEY"> <label>SECRET</label>
				<input type="text" class="form-control input-sm"
					placeholder="图灵机器人SECRET">
			</div>
		</div>
		<!-- /.box-body -->
	</div>
</div>

