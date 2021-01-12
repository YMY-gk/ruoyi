<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	 <!-- dropzone.md.css -->
	  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/dropzone/dropzone.css" />
	<div class="box  no-border">
		<div class="box-header">
			<h3 class="box-title">文章上传</h3>
	
			
		</div>
		<div class="box-body table-responsive no-padding">
			<div class="dropzone" id="myDropzone">
				<div class="am-text-success dz-message" style="text-align:center;">
					<i class="fa fa-cloud-upload fa-5x" style="color:#3c8dbc"></i><br>拖拽要上传的文件或点击选择<br>
				</div>
			</div>
		</div>
	</div>
<!-- /.box -->
    <script src="<%=request.getContextPath()%>/assets/dropzone/min/dropzone.min.js"></script>
		

<script type="text/javascript">
	Dropzone.autoDiscover = false;
	var myDropzone = new Dropzone("#myDropzone", {
		url: "${pageContext.request.contextPath}/sys/upload/dropzone"
	});
</script>