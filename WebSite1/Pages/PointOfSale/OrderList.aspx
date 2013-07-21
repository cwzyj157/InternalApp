<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/PointOfSale/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<%= UiHelper.RefCssFileHtml("/Css/datepicker.css")%>
	<%= UiHelper.RefJsFileHtml("/Js/datepicker.js")%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="width">
		<div class="fixWidth">
			<div class="divOrderList">
				<div class="s-Label">
					查询时间：</div>
				<div class="div-date">
					<input type="text" class="input-date" id="txtDateTime" />
					<span><span class="combo-arrow"></span></span>
				</div>
				<input type="button" id="btnSearch" class="btn margin-left" value="查询">
				<div class="float-right margin-right">
					<div class="s-Label margin-right">
						显示方式：</div>
					<div class="group">
						<a href="javascript:;" class="btnType margin-left width">
							<label>
								依用户+菜名分组</label></a><a href="javascript:;" class="btnType margin-left "><span class="caret">
								</span></a>
						<ul class="dmenu margin-left dmenuType">
							<li type="0"><a href="javascript:;">依用户+菜名分组</a></li>
							<li type="1"><a href="javascript:;">依菜名分组</a></li>
						</ul>
					</div>
				</div>
			</div>
			<table id="divResultList">
			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSearch").click(function() {
				search("0");
			});
			$("a.deleteOrder").live("click", function() {
				if (confirm("确定要删除记录吗？") == false)
					return;

				var obj = $(this);
				var orderId = obj.attr("orderid");
				var shortName = obj.attr("shortname");
				$.ajax({
					dataType: "text",
					url: "/Ajax/Order/DeleteOrder.aspx",
					data: { OrderID: orderId, ShortName: shortName },
					cache: false,
					success: function(responseText) {
						obj.closest("tr").remove();
						obj = null;
					}
				});
			});
			function search(type) {
				var datetime = $("#txtDateTime").val();
				var url = "/Ajax/Order/Search.aspx";
				$.ajax({
					dataType: "html",
					url: url,
					data: { dt: datetime, type: type },
					cache: false,
					success: function(responseHtml) {
						$("#divResultList").html(responseHtml);
						setGridStyle($("#divResultList"));
					}
				});
			}
			function setGridStyle(obj) {
				return obj.each(function() {
					$(this).find('tr')
					.removeClass()
					.filter(':first').addClass("GridView_HeaderStyle").end()
					.filter(':gt(0)')
					.filter(':odd').addClass("GridView_AlternatingRowStyle").end()
					.filter(':even').addClass("GridView_RowStyle");
				});
			}
			function initDateTimePicker() {
				var date = new Date();
				var m = date.getMonth();
				var z = (m / 10 >= 1 ? "" : "0");
				var d = date.getDate();
				var y = date.getFullYear();
				$('#txtDateTime').val(y + "-" + z + (m + 1) + "-" + d);
				$("#txtDateTime").DatePicker({
					format: 'Y-m-d',
					date: $('#txtDateTime').val(),
					starts: 1,
					position: 'bottom',
					mode: "single",
					onBeforeShow: function() {
						$('#txtDateTime').DatePickerSetDate($('#txtDateTime').val(), true);
					},
					onChange: function(formated, dates) {
						$('#txtDateTime').val(formated);
						$('#txtDateTime').DatePickerHide();
					}
				});
			}
			$("span.combo-arrow").click(function() {
				$('#txtDateTime').DatePickerShow();
			});
			$("a.btnType").click(function() {
				$("ul.dmenuType").show();
				return false;
			});
			$("ul.dmenuType li").click(function(e) {
				var obj = $(this);
				$("a.btnType label").eq(0).html(obj.children().eq(0).html());
				search(obj.attr("type"));
			})

			$("ul.dmenuType").hide();

			initDateTimePicker();
			search("0");
		});
	</script>

</asp:Content>
