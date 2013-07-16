<%@ Page Title="" Language="C#" Inherits="MyPageView<String>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	
	<div>
		<% if( this.Model == "0" ) {%>
		<div>
			清除缓存成功</div>
		<% }
		else { %>
		<div>
			清除缓存失败</div>
		<%} %>
	</div>
	
</body>
</html>
