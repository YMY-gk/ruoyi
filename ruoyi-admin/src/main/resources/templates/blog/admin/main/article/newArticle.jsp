<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- general form elements -->
<div class="box no-border">
	<div class="box-header with-border">
		<h3 class="box-title">发布文章</h3>
	</div>
	<!-- /.box-header -->
	<!-- form start -->
	<form role="form">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">文章标题</label> <input type="text"
					class="form-control" id="title">
			</div>
			<div class="form-group">
				<label>文章标签</label> <input type="text" class="form-control"
					id="tokenfield" value="haojieli,Java" />
			</div>
			<div class="form-group">
				<label>文章分类</label> <select
					class="form-control select2" id="type" style="width: 100%;">
					<c:choose>
						<c:when test="${typeList==null}">
							<option>没有数据</option>
						</c:when>
						<c:otherwise>
							<c:forEach items="${typeList}" var="type" varStatus="i">
								<option value="${type.id }">${type.tName }</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</select>
			</div>
			<div class="form-group">
				<label>文章内容</label>
				<div id="test-editormd" style="z-index: 100000"></div>
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button id="saveBtn" type="button" class="btn btn-success btn-flat">保存</button>
			<button type="button" class="btn btn-warnning btn-flat">存稿</button>
		</div>
	</form>
</div>
<script src="<%=request.getContextPath()%>/assets/bootstrap-tokenfield/js/bootstrap-tokenfield.js"></script>

<script type="text/javascript">
	$(function() {
		/* loadAllNode(); */
		initMDEditor("### Hello World .");
		$('#tokenfield').tokenfield({
			beautify : true,
			showAutocompleteOnFocus : true
		})
	});

	/*editor func js */
	var testEditor;
	function initMDEditor(mdText) {
		testEditor = editormd(
				"test-editormd",
				{
					width : "100%",
					height : 500,
					path : "${pageContext.request.contextPath}/assets/editor.md-master/lib/",
					//theme : "dark",
					//previewTheme : "dark",
					//editorTheme : "pastel-on-dark",
					markdown : mdText,
					codeFold : true,
					//syncScrolling : false,
					saveHTMLToTextarea : true, // 保存 HTML 到 Textarea
					searchReplace : true,
					//watch : false,                // 关闭实时预览
					//htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启    
					//toolbar  : false,             //关闭工具栏
					//previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
					emoji : true,
					taskList : true,
					tocm : true, // Using [TOCM]
					tex : true, // 开启科学公式TeX语言支持，默认关闭
					flowChart : true, // 开启流程图支持，默认关闭
					sequenceDiagram : true, // 开启时序/序列图支持，默认关闭,
					//dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
					//dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
					//dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
					//dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
					//dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
					imageUpload : true,
					imageFormats : [ "jpg", "jpeg", "gif", "png", "bmp", "webp" ],
					imageUploadURL : "${pageContext.request.contextPath}/sys/article/pictureUpload"

				});
	}
	//保存按钮事件
	$("#saveBtn").click(function() {
		var title = $("#title").val();
		var tags = $("#tokenfield").val();
		var type = $("#type").val();
		var md = testEditor.getMarkdown();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/article/save",
			data : {
				title : title,
				tags : tags,
				type : type,
				md : md
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
</script>