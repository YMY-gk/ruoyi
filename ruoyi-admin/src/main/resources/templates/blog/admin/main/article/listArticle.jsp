<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="box no-border">
	<div class="box-header">
		<h3 class="box-title">文章管理</h3>

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
				<th>序号</th>
				<th>文章标题</th>
				<th>发布日期</th>
				<th>浏览量</th>
				<th>所属分类</th>
				<th>发布状态</th>
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
						<c:forEach items="${list }" var="articleInfo" varStatus="i">
							<tr>
								<td>${i.index+1 }</td>
								<td>${articleInfo.aTitle }</td>
								<td><fmt:formatDate value='${articleInfo.aDatetime}'
										pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td>${articleInfo.aViewnum }</td>
								<td>${articleInfo.aTypeid }</td>
								<td><span class="label label-success">已发布</span></td>
								<td>
									<div class="btn-group">
										<button type="button" data-url="${articleInfo.id }"
											class="btn btn-success btn-flat editBtn">修改</button>
										<button type="button" data-url="${articleInfo.id }"
											class="btn btn-danger btn-flat delBtn">删除</button>
										<a href="${articleInfo.aUrl }" target="_blank"
											class="btn btn-warning btn-flat">查看</a>
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

<script>

$(function(){
	bindClick();
});

function bindClick(){
	$(".editBtn").on('click',function(){
		var _clickTab = "<%=request.getContextPath()%>/sys/article/edit?articleId="+$(this).attr('data-url');
		if(_clickTab == undefined){
			return;
		}else{
			//alert(_clickTab);
			$.get(_clickTab,function(data){
				//alert(data);
				$("#mainBody").html(data); 
			});
		}
	});
	$(".delBtn").on('click',function(){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/article/delete?id="+$(this).attr('data-url'),
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				if(data.result=="success"){
					$.get("${pageContext.request.contextPath}/sys/article/list",function(data){
						//alert(data);
						$("#mainBody").html(data); 
					});
				}else{
					alert(data.result);
				}
			}
		});
	}); 
}

Date.prototype.format = function(format) {
    var date = {
       "M+": this.getMonth() + 1,
       "d+": this.getDate(),
       "h+": this.getHours(),
       "m+": this.getMinutes(),
       "s+": this.getSeconds(),
       "q+": Math.floor((this.getMonth() + 3) / 3),
       "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
       format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
       if (new RegExp("(" + k + ")").test(format)) {
           format = format.replace(RegExp.$1, RegExp.$1.length == 1
              ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
       }
    }
    return format;
}
//下一页
$("#nextPage").click(function(){
	var nowPageNum = parseInt($("#nowPageNum").html());
	var sumPageNum = parseInt($("#sumPageNum").html());
	if(nowPageNum>=sumPageNum){
		alert("已经是最后一页了");
	}else{
		$("#nowPageNum").html(nowPageNum+1);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/article/pageList",
			data : {
				nowPageNum:nowPageNum
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				var pageList = data.result.list;
				var trHtml ;
				$.each(pageList,function(i,item){
					var datetime = new Date(item.aDatetime);
					trHtml+=
						'<tr>'+
						'<td>'+(i+1)+'</td>'+
						'	<td>'+item.aTitle+'</td>'+
						'	<td>'+datetime.format('yyyy-MM-dd h:mm:ss')+'</td>'+ 
						'	<td>'+item.aViewnum +'</td>'+
						'	<td>'+item.aTypeid +'</td>'+
						'	<td><span class="label label-success">已发布</span></td>'+
						'	<td>'+
						'		<div class="btn-group">'+
						'			<button type="button" data-url="'+item.id+'" class="btn btn-success btn-flat editBtn">修改</button>'+
						'			<button type="button" data-url="'+item.id+'" class="btn btn-danger btn-flat delBtn">删除</button>'+
						'			<a href="'+item.aUrl+'" target="_blank" class="btn btn-warning btn-flat">查看</a>'+
						'		</div>'+
						'	</td>'+
						'</tr>';
				});
				 $("#tbodyHtml").html(trHtml);
				 bindClick();
			}
		});
	}
});

//上一页
$("#upPage").click(function(){
	var nowPageNum = parseInt($("#nowPageNum").html());
	var sumPageNum = parseInt($("#sumPageNum").html());
	if(nowPageNum<=1){
		alert("这已经是第一页了！");
	}else{
		$("#nowPageNum").html(nowPageNum-1);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sys/article/pageList",
			data : {
				nowPageNum:nowPageNum-2
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				var pageList = data.result.list;
				var trHtml ;
				$.each(pageList,function(i,item){
					var datetime = new Date(item.aDatetime);
					trHtml+=
						'<tr>'+
						'<td>'+(i+1)+'</td>'+
						'	<td>'+item.aTitle+'</td>'+
						'	<td>'+datetime.format('yyyy-MM-dd h:mm:ss')+'</td>'+ 
						'	<td>'+item.aViewnum +'</td>'+
						'	<td>'+item.aTypeid +'</td>'+
						'	<td><span class="label label-success">已发布</span></td>'+
						'	<td>'+
						'		<div class="btn-group">'+
						'			<button type="button" data-url="'+item.id+'" class="btn btn-success btn-flat editBtn">修改</button>'+
						'			<button type="button" data-url="'+item.id+'" class="btn btn-danger btn-flat delBtn">删除</button>'+
						'			<a href="'+item.aUrl+'" target="_blank" class="btn btn-warning btn-flat">查看</a>'+
						'		</div>'+
						'	</td>'+
						'</tr>';
				});
				 $("#tbodyHtml").html(trHtml);
				 bindClick();
				/* alert(JSON.stringify(data.result.list)); */
			}
		});
	}
});

</script>