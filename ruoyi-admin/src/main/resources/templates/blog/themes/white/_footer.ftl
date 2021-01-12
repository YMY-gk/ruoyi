
  <footer class="main-footer">
    <div class="container">
      <div class="col-md-12 new-article">
		<div class="col-md-3" >
			<p style=" padding:0px;">一切都是因为兴趣。</p> 
			<p><a href="javascript:void(0);" >Version:${values.version}</a></p>
			<p><a href="javascript:void(0);" >Author: ${values.author}</a></p>
		</div>
		<div class="col-md-3 new-article" >
			<p style=" padding:0px;">最新文章</p>
			<#list values.articleList as article>
				<p><a href="${article.aUrl}" style="">${article.aTitle}</a></p>
			</#list>
			
		</div>
		<div class="col-md-3 new-article" >
			<p style=" padding:0px;">最新评论</p>
			<#if values.commentStrList??>
				<#list values.commentStrList as commentStr>
				<p><a href="javascript:void(0);">${commentStr}</a></p>
				</#list>
			<#else>
				<p><a href="javascript:void(0);">暂无评论数据</a></p>
			</#if>
			
		</div>
		<div class="col-md-3 new-article" >
			<p style=" padding:0px;">友情链接</p>
			<#list values.linkList as link>
			<p><a href="${link.lUrl}">${link.lName}</a></p>
			</#list>
		</div>
	  </div>
	 
    </div>
	 <div class="col-md-10  new-article" style="border-top:1px solid #EEEEEE; margin-top:20px; color:#767676; margin:0 auto; float:none;">
			<p style="text-align:center; padding:10px;">${values.copyright}</p>
	  </div>
    <!-- /.container -->
  </footer>
  


<!-- Bootstrap 3.3.6 -->
<script src="${values.webroot}/assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>