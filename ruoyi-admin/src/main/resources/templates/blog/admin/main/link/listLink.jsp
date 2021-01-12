<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="example-modal">
	<div class="modal" id="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加友链</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>网站昵称:</label>
						<div class="input-group">
							<div class="input-group-addon" style="background-color: #eeeeee;">
								<i class="fa fa-sitemap"></i>
							</div>
							<input type="text" id="linkName" class="form-control"
								placeholder="例子：李豪杰博客">
						</div>
						<!-- /.input group -->
					</div>

					<div class="form-group">
						<label>网站地址:</label>
						<div class="input-group">
							<div class="input-group-addon" style="background-color: #eeeeee;">
								<i class="fa fa-link"></i>
							</div>
							<input type="url" id="linkAddress" class="form-control"
								placeholder="例子：http://www.hjieli.com">
						</div>
						<!-- /.input group -->
					</div>

					<div class="form-group">
						<label>网站图标:</label>
						<div class="input-group">
							<div class="input-group-addon" style="background-color: #eeeeee;">
								<i class="fa fa-meh-o"></i>
							</div>
							<input type="url" id="linkIcon" class="form-control"
								placeholder="例子：http://www.hjieli.com">
						</div>
						<!-- /.input group -->
					</div>

					<div class="form-group">
						<label>网站排序:</label>
						<div class="input-group">
							<div class="input-group-addon" style="background-color: #eeeeee;">
								<i class="fa fa-sort"></i>
							</div>
							<input type="number" id="linkSort" class="form-control"
								placeholder="例子：1">
						</div>
						<!-- /.input group -->
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-flat pull-left"
						data-dismiss="modal">关闭</button>
					<button type="button" id="saveLinkInfo"
						class="btn btn-success btn-flat">新增</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
<!-- /.example-modal -->

<div class="box no-border">
	<div class="box-header">
		<h3 class="box-title">友链管理</h3>

		<div class="box-tools">
			<div class="input-group input-group-sm" style="width: 150px;">
				<input type="text" name="table_search"
					class="form-control pull-right" placeholder="Search">

				<div class="input-group-btn">
					<button type="submit" class="btn btn-default">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body table-responsive no-padding">

		<table class="table table-hover table-bordered text-center">
			<tr>
				<th>网站昵称</th>
				<th>网站地址</th>
				<th>图标地址</th>
				<th>点击次数</th>
				<th>排序</th>
				<th>操作</th>
			</tr>
			<tbody>
				<c:choose>
					<c:when test="${list==null}">
						<tr>
							<th colspan="5">没有数据</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="linkInfo" varStatus="i">
							<tr>
								<td>${linkInfo.lName }</td>
								<td>${linkInfo.lUrl }</td>
								<td>${linkInfo.lIconAdress }</td>
								<td>${linkInfo.lClickNum }</td>
								<td>${linkInfo.lSort }</td>
								<td>
									<div class="btn-group">
										<button type="button" class="btn btn-success btn-flat">修改</button>
										<button type="button" class="btn btn-danger btn-flat">删除</button>
										<button type="button" class="btn btn-warning btn-flat">查看</button>
									</div>
								</td>
							</tr>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>

		</table>
	</div>
	<!-- /.box-body -->
	<!-- /.box-body -->
	<div class="box-footer clearfix">

		<div class="btn-group pull-left">
			<button type="button" id="addBtn" class="btn btn-success btn-flat">新增</button>
		</div>
		<ul class="pagination pagination-sm no-margin pull-right">
			<li><a id="upPage" href="javascript:void(0);">上一页</a></li>
			<li><a id="nowPageNum" href="javascript:void(0);">1</a></li>
			<li><a href="javascript:void(0);">/</a></li>
			<li><a id="sumPageNum" href="javascript:void(0);">${sumPageNum+1 }</a></li>
			<li><a id="nextPage" href="javascript:void(0);">下一页</a></li>
		</ul>
	</div>
</div>
<!-- /.box -->

<script>
	$("#addBtn").click(function() {
		$("#modal").modal('show');
	});

	$("#saveLinkInfo").click(function() {
		var linkName = $("#linkName").val();
		var linkAddress = $("#linkAddress").val();
		var linkIcon = $("#linkIcon").val();
		var linkSort = $("#linkSort").val();
		if (linkName == "") {
			alert("昵称不能为空")
			return false;
		}
		if (linkAddress == "") {
			alert("地址不能为空")
			return false;
		}
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/link/save",
			data : {
				linkName : linkName,
				linkAddress : linkAddress,
				linkIcon : linkIcon,
				linkSort : linkSort
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				alert(data.result);
			}
		});
	});
</script>