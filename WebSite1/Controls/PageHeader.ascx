<%@ Control Language="C#" %>
<div class="header">
    <div class="fixWidth clearfix">
        <div class="float-left header-l">
            <a href="/">内部应用</a>
        </div>
        <div class="float-left">
            <ul class="nav">
                <li><a href="javascript:void(0);" id="PointOfSale">订餐服务</a>
                    <ul class="dmenu dmenu-PointOfSale" style="display: none;">
                        <li><a href="/Pages/PointOfSale/Menu.aspx">菜品列表</a></li>
                        <li><a href="/Pages/PointOfSale/OrderList.aspx">订单列表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="float-right header-u">
            <span>当前用户:</span><span id="spanUserInfo"></span>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#PointOfSale").click(function() {
                $("ul.dmenu-PointOfSale").show();
                return false;
            });

            $(document).click(function() {
                $("ul.dmenu-PointOfSale").hide();
                $("ul.dmenuType").hide();
            });

            $.ajax({
                dataType: "json",
                url: "/Ajax/Order/GetUserInfo.aspx",
                cache: false,
                success: function(json) {
                    $("#spanUserInfo").text(json.FullName + "(" + json.ShortName + ")");
                }
            });
        })
    </script>

</div>
