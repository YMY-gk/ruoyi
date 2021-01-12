<header id="header" class="main-header" >
    <nav class="navbar navbar-static-top navbar-fixed-top" style="box-shadow:0 1px 5px rgba(100,100,100,0.2)">
      <div class="container">
        <div class="navbar-header">
          <a href="${values.webroot}/" class="navbar-brand">${values.webname}</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse " id="navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${values.webroot}/archives">归档 <span class="sr-only">(current)</span></a></li>
            <li><a href="${values.webroot}/links">友链</a></li>
             <li><a href="${values.webroot}/chat">聊聊</a></li>
           
          </ul>
        </div>
        <!-- /.navbar-collapse -->
       
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  
<div class="modal" id="showmsg">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">系统提示</h4>
			</div>
			<div class="modal-body" id="tips">
				
			</div>
			
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->