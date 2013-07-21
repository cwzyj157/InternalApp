<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/PointOfSale/MasterPage.master"
    Inherits="MyPageView<PageMenuFoodModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="width">
        <div class="fixWidth padding-right">
            <% foreach (MenuFood food in this.Model.MenuFoods)
               {%>
            <div class="divMenu float-left">
                <div>
                    <img src="/Images/PointOfSale/<%=food.PicName %>" />
                    <div>
                        <div class="divTitle float-left">
                            <span class="spanTitle float-left">(<%=food.ProviderName.HtmlEncode() %>)</span><span><%=food.FoodName.HtmlEncode()%></span></div>
                    </div>
                    <div class="divMargin">
                        <div class="padding-top padding-left float-left">
                            <strong class="color">￥<%=string.Format("{0:N1}", food.Price)%></strong>
                        </div>
                        <div class="float-right">
                            <input type="button" value="订餐" class="btn" foodid="<%=food.FoodId %>" />
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
    </div>

    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $("input.btn").click(function() {
                var obj = $(this);
                // 在此验证数字
                var data = {
                    FoodId: obj.attr("foodId"),
                    Count: 1
                };
                $.ajax({
                    dataType: "text",
                    url: "/Ajax/Order/AddOrder.aspx",
                    data: data,
                    cache: false,
                    success: function(responseText) {
                        alert("订餐成功");
                    }
                });
            });
        })
    </script>

</asp:Content>
