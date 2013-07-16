<%@ Control Language="C#" Inherits="MyUserControlView<PageOrderModel>" %>
<table cellspacing="0" cellpadding="4" border="0" style="border-collapse: collapse;
	width: 100%">
	<tr align="left">
		<th style="width: 15%">
			用户
		</th>
		<th style="width: 50%">
			菜名
		</th>
		<th style="width: 10%">
			数量
		</th>
		<th style="width: 10%">
			金额
		</th>
		<th style="width: 10%">
			订单时间
		</th>
		<th style="width: 10%">
			操作
		</th>
	</tr>
	<% 	foreach( var item in this.Model.Orders ) { 	%>
	<tr>
		<td>
			<%=item.UserName.HtmlEncode()%>(<%=item.ShortName.HtmlEncode()%>)
		</td>
		<td>
			<span class="spanTitle">(<%=item.ProviderName.HtmlEncode()%>)</span><span><%=item.FoodName.HtmlEncode() %></span>
		</td>
		<td>
			<%=item.Count %>
		</td>
		<td>
			<%=string.Format("{0:N1}",item.SumMoney) %>
		</td>
		<td>
			<%= string.Format("{0:yyyy-MM-dd}", item.OrderDate) %>
		</td>
		<td>
			<a href="javascript:void(0);" class="deleteOrder" alt="删除" orderid="<%=item.OrderID %>"
				shortname="<%=item.ShortName %>">
				<img src="/Images/delete.gif" /></a>
		</td>
	</tr>
	<% } %>
</table>
