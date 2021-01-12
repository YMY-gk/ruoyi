<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
.themeColor{
	color:red;
}
</style>
<div class="box no-border">
	<div class="box-header">
		<h4 class="box-title">主题管理</h4>
	</div>
</div>
<div class="col-md-12">
	<c:forEach items="${themeList }" var="theme" varStatus="i">
		<div class="col-md-3" >
			<img class="img-responsive" alt="主题" src="${theme.picture }">
			<p>昵称：<span class="themeColor">${theme.name }</span></p>
			<p>作者：${theme.author }</p>
			<p>日期：${theme.date } <span class="pull-right">
			<c:choose>
					<c:when test="${theme.name == themeName }">
						<a href="<%=request.getContextPath()%>" target="_blank" class="btn btn-danger btn-flat btn-xs">正在使用</a>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-success btn-flat btn-xs">使用</button>
					</c:otherwise>		
			</c:choose>
			</span></p>
		</div>
	</c:forEach>
</div>

<div class="modal" id="showImg">
	<div class="modal-dialog"  style="width:80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">主题预览</h4>
			</div>
			<div class="modal-body">
				<img class="img-responsive" alt="查看" src="" id="imgShow">
			</div>
			
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
	$("img").click(function(){
		
		$("#imgShow").attr('src',$(this).attr('src'));
		$("#showImg").modal('show');
	});
	
	$(".btn-success").click(function(){
		var themeName = $(this).parent().parent().parent().find("p>span").html();
		/* alert(themeName); */
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/themes/change",
			data : {
				themeName:themeName
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				if(data.result=="success"){
					$.get("<%=request.getContextPath()%>/sys/themes",function(data){
						//alert(data);
						$("#mainBody").html(data); 
					});
				}
			}
		});
	});
	
	
</script>
