<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  
  <meta name="keywords" content="${values.keywords}"/>
    <meta name="description" content="${values.description}"/>

	<title>${values.title }</title>
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="${values.webroot}/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${values.webroot}/assets/AdminLTE/dist/css/AdminLTE.min.css">
	<link href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABLCAYAAAA4TnrqAAABcklEQVR4Xu3YoWpCYRyG8f9BvIUtmARBtiWzRZvJ4iVo9R6EXcLqktE7MJnEIl6BYLCLXeQIR8sGju9ZOLD5mAyP8vHzRThf9jKZ5+ErSSATK8mpiMRKtxILWIklFhEArf9ZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVliAQGQlrascbcRo3Y9qpWsON5qd4jhdA2Oek3f+28xaNWK96dzHp/LXXwstvh7fvMBsYCaWGIBAZC6LLGAAEhdllhAAKQuSywgAFKX9RewwBnvpg/zuCPWDwLfH6TFAlib/TFm6z026zSfovf67K1DipxXNClKt0Yssb4KeFMKFiGWWEAApC5LLCAAUpclFhAAqcsSCwg8WFraTel/cBUL/IpiiQUEQOqyxAICIHVZYgEBkLossYAASF2WWEAApC5LLCAAUpclFhAAqcsSCwiA1GWJBQRA6rLEAgIgdVkA6wJwzDXVmeL5ZwAAAABJRU5ErkJggg==" rel="shortcut icon" type="image/vnd.microsoft.icon" />
	<!-- jQuery 2.2.3 -->
<script src="${values.webroot}/assets/js/jquery-3.2.1.min.js"></script>
	 <style>
	.skin-blue .main-header .navbar{
		background-color:white !important;
	}
	.navbar-brand ,.navbar-toggle{
		color:#000000 !important;
	}
	.skin-blue .main-header .navbar .nav>li>a{
		color:#000000 !important;
	}
	
	.article-list{
		height:120px; padding:15px;
		
	}
	.article-list .list-body{
		height:100%;  background-color:white; font-weight:normal;
		-webkit-transition: -webkit-transform 0.5s;
	}
	.article-list .list-body .body-title{
		padding-top:20px; padding-left:20px; padding-right:20px;
		overflow: hidden;  /*溢出隐藏*/
		text-overflow: ellipsis; /*以省略号...显示*/
		white-space: nowrap;  /*强制不换行*/
	}
	.article-list .list-body .body-footer{
		padding:20px; font-size:12px;
	}
	.article-list .list-body .body-footer span > a{
		color:black;
		width: 100%;
		opacity: 1.0;
		transition: all linear 0.5s;
	}
	.article-list .list-body .body-footer span > a:hover{
		color:red;
	}
	
  </style>
  
  
  <style>
	.new-article p{
		padding-left:10px;
		overflow: hidden;  /*溢出隐藏*/
		text-overflow: ellipsis; /*以省略号...显示*/
		white-space: nowrap;  /*强制不换行*/
	}
	.new-article p>a{
		color:#767676;
		font-size:12px;
	}
	.new-article p>a:hover{
		color:red;
	}
	*{
		-webkit-border-radius: 0 !important;
		-moz-border-radius: 0 !important;
		border-radius: 0 !important;
	}
	.page li>a{
		color:#000000;
		background-color:white;
	}
	.page li>a:hover{
		color:red;
		background-color:white;
	}
	.page li>a:active{
		color:red;
		background-color:white;
	}
  </style>