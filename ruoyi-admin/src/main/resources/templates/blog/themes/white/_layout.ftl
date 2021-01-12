<#macro layout>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<#include "_head.ftl">  
</head>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  <#include "_top.ftl">  
  <#nested>
  <#include "_footer.ftl">  
</div>
</body>
</html>
</#macro>