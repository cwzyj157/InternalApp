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
			</div>
			<table id="divResultList">
			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSearch").click(function() {
				search();
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
			function search() {
				var datetime = $("#txtDateTime").val();
				var url = "/Ajax/Order/Search.aspx";
				$.ajax({
					dataType: "html",
					url: url,
					data: { dt: datetime },
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

			initDateTimePicker();
			search();
		});
	</script>

</asp:Content>
