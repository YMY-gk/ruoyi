<#import "_layout.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout>
 	<!-- Full Width Column -->
  <div style="background-color:#f7f7f7 !important">
    <div class="container">
      <div class="row" style="margin-top:80px;">
		<div class="col-md-12" id="articleList">
		
			<#list pageList as page>
			<div class="col-md-4 article-list" >
				<div class="list-body">
					<div class="body-title">
						${page.aTitle}
					</div>
					<div class="body-footer">
						<span>发布时间 ${page.aDatetime?string("yyyy-MM-dd")}</span>
						<span class="pull-right">
						<#if page.aUrl?? >
							<a href="${page.aUrl}"><i class="fa fa-search">&nbsp;</i>查看原文</a>
						<#else>
							<a href="javascript:void(0)"><i class="fa fa-search">&nbsp;</i>查看原文</a>
						</#if>
						
						</span>
					</div>
				</div>
			</div>
			</#list>
			
		</div>
		
		<!--分页-->
		<div class="col-md-12" style="text-align:center;">
			<ul class="pagination btn-flat page">
				<li><a id="upPage" href="javascript:void(0);">上一页</a></li>
				<li><a id="nowPageNum" href="javascript:void(0);">1</a></li>
				<li><a href="javascript:void(0);">/</a></li>
				<li><a id="sumPageNum" href="javascript:void(0);">${sumPageNum }</a></li>
				<li><a id="nextPage" href="javascript:void(0);">下一页</a></li>
			</ul>
		</div>
	  </div>
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
   
 
</@defaultLayout.layout>
<script>
	
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

	$(function(){
	
		$('#showmsg').on('show.bs.modal', function (e) {  
		    $(this).find('.modal-dialog').css({  
		        'margin-top': function () {  
		            var modalHeight = $('#showmsg').find('.modal-dialog').height();  
		            return ($(window).height() / 2 - (modalHeight / 2 + 100));  
		        }  
		    });      
		});  
	});

 	//下一页
	$("#nextPage").click(function(){
		var nowPageNum = parseInt($("#nowPageNum").html());
		var sumPageNum = parseInt($("#sumPageNum").html());
		if(nowPageNum>=sumPageNum){
			
			$("#tips").html("已经是最后一页了");
			$("#showmsg").modal('show');
			setTimeout(function(){$("#showmsg").modal("hide")},2000);
		}else{
			$("#nowPageNum").html(nowPageNum+1);
			$.ajax({
				type : "post",
				url : "${values.webroot}/pageList",
				data : {
					nowPageNum:nowPageNum
				},
				dataType : "json",
				success : function(data) {//请求正确执行的方法（后台返回的结果）
					var pageList = data.result.list;
					var articleHtml ='';
					$.each(pageList,function(i,item){
						var datetime = new Date(item.aDatetime);
						articleHtml+=
							'<div class="col-md-4 article-list" >'+
							'	<div class="list-body">'+
							'		<div class="body-title">'
							+item.aTitle+
							'		</div>'+
							'		<div class="body-footer">'+
							'			<span>发布时间 '+datetime.format('yyyy-MM-dd')+'</span>'+
							'			<span class="pull-right"><a href="'+item.aUrl+'"><i class="fa fa-search">&nbsp;</i>查看原文</a></span>'+
							'		</div>'+
							'	</div>'+
							'</div>';
							
					});
					 $("#articleList").html(articleHtml);
				}
			});
		}
	});
	//上一页
$("#upPage").click(function(){
	var nowPageNum = parseInt($("#nowPageNum").html());
	var sumPageNum = parseInt($("#sumPageNum").html());
	if(nowPageNum<=1){
		$("#tips").html("已经是第一页了");
		$("#showmsg").modal('show');
		setTimeout(function(){$("#showmsg").modal("hide")},2000);
	}else{
		$("#nowPageNum").html(nowPageNum-1);
		$.ajax({
			type : "post",
			url : "${values.webroot}/pageList",
			data : {
				nowPageNum:nowPageNum-2
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				var pageList = data.result.list;
					var articleHtml ='';
					$.each(pageList,function(i,item){
						var datetime = new Date(item.aDatetime);
						articleHtml+=
							'<div class="col-md-4 article-list" >'+
							'	<div class="list-body">'+
							'		<div class="body-title">'
							+item.aTitle+
							'		</div>'+
							'		<div class="body-footer">'+
							'			<span>发布时间 '+datetime.format('yyyy-MM-dd')+'</span>'+
							'			<span class="pull-right"><a href="'+item.aUrl+'"><i class="fa fa-search">&nbsp;</i>查看原文</a></span>'+
							'		</div>'+
							'	</div>'+
							'</div>';
							
					});
					 $("#articleList").html(articleHtml);
			}
		});
	}
});
	
 </script>
