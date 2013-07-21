<%@ Control Language="C#" Inherits="MyUserControlView<PageOrderInfoModel>" %>
<table cellspacing="0" cellpadding="4" border="0" style="border-collapse: collapse;
	width: 100%">
	<tr align="left">
		<th>
			菜名
		</th>
		<th style="width: 10%">
			数量
		</th>
		<th style="width: 10%">
			金额
		</th>
		<th style="width: 50%" nowrap>
			用户
		</th>
	</tr>
	<% 	foreach( var item in this.Model.OrderInfos ) { 	%>
	<tr>
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
			<%=item.UserNames.HtmlEncode()%>
		</td>
	</tr>
	<% } %>
</table>
