<#import "_layout.ftl" as defaultLayout> <#-- 调用布局指令 -->
<@defaultLayout.layout> <!-- class="content-wrapper"-->
<div style="background-color: #f7f7f7 !important;">
	<div class="container">
		<div class="col-md-10" style="float: none; margin: 80px auto;">
		
		
			<#list archiveList as archive>
			<div class="box-body">
				<div class="box-group" id="accordion${archive_index}">
					<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
					<div class="panel panel-default">
						<div class="box-header ">
							<h4 class="box-title">
								<a data-toggle="collapse"
									data-parent="#accordion${archive_index}"
									href="#${archive_index}" class="collapsed"
									aria-expanded="false" style="font-size: 12px; color: #333333">
									<span class="date">${archive.date}</span> (<span
									style="color: red;">${archive.count}</span>)
								</a>
							</h4>
						</div>
						<div id="${archive_index}" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<ul id="${archive_index}title">
									<li>无数据</li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
			</#list>
		</div>
	</div>
</div>


</@defaultLayout.layout> 
<script>
	$("a").click(function(){
		var date = $(this).find('.date').html();
		var id = $(this).attr('href').replace('#','');
		$.ajax({
			type : "post",
			url : "${values.webroot}/archives/detail",
			data : {
				date:date
			},
			dataType : "json",
			success : function(data) {//请求正确执行的方法（后台返回的结果）
				var liHtml = "";
				$.each(data.result,function(i,item){
					liHtml += '<li><a href="${values.webroot}/'+item.aUrl+'" style="color:#333;font-size:12px;">'+item.aTitle+'</a></li>';
				});
				$("#"+id+"title").html(liHtml);
			}
		});
	});
</script> 