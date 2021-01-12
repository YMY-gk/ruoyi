<#import "_layout.ftl" as defaultLayout> <#-- 调用布局指令 -->
<@defaultLayout.layout> <!-- class="content-wrapper"-->

<style>
	.link{
		height:100%; padding:10px; display:block; color:#333333; 
	}
	.link:hover{
		color:red;
	}
</style>
<div style="background-color: #f7f7f7 !important;">
	<div class="container">
		<div class="col-md-12" style="margin: 80px auto;">
			<#list linkList as link>
				<div class="col-md-3">
					<p style="font-size: 12px; color: #333333; background-color:white;display:block">
						<a href="${link.lUrl}" target="_blank" class="link" ><span class="name">${link.lName}</span></a>
					</p>
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
				/* alert(JSON.stringify(data.result) ); */
				var liHtml = "";
				$.each(data.result,function(i,item){
					liHtml += '<li><a href="${values.webroot}/'+item.aUrl+'" style="color:#333;font-size:12px;">'+item.aTitle+'</a></li>';
				});
				$("#"+id+"title").html(liHtml);
			}
		});
	});
</script> 