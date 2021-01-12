<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="box no-border">
	<div class="box-header">
		<h3 class="box-title">评论管理</h3>

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
				<th>昵称 / 邮箱</th>
				<th>内容</th>
				<th>时间</th>
				<th>操作</th>
			</tr>
			<tbody id="tbodyHtml">
				<c:choose>
					<c:when test="${list==null}">
						<tr>
							<th colspan="6">没有数据</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="comment" varStatus="i">
							<tr>
								<td>${comment.cName } / ${comment.cEmail }</td>
								<td>${comment.cContent }</td>
								<td><fmt:formatDate value='${comment.cTime }'
										pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td>
									<div class="btn-group">
										<button type="button" 
											class="btn btn-sm btn-danger btn-flat delBtn">删除</button>
										<button	type="button" 
											class="btn btn-sm btn-warning btn-flat viewBtn">查看</button>
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
		<ul class="pagination pagination-sm no-margin pull-right">
			<li><a id="upPage" href="javascript:void(0);">上一页</a></li>
			<li><a id="nowPageNum" href="javascript:void(0);">1</a></li>
			<li><a href="javascript:void(0);">/</a></li>
			<li><a id="sumPageNum" href="javascript:void(0);">${sumPageNum }</a></li>
			<li><a id="nextPage" href="javascript:void(0);">下一页</a></li>
		</ul>
	</div>
</div>
<!-- /.box -->
