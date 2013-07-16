using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using MyMVC;
using InternalApp.Entity.PointOfSale;
using InternalApp.BLL.PointOfSale;
using InternalApp.Common.WindowsIdentiy;
using System.Configuration;
using InternalApp.Common.Exception;

namespace InternalApp.Controller.PointOfSale.Services
{
	public class OrderService
	{
		[Action]
		public void AddOrder(Order order)
		{
			UserInfo ui = WindowsUserInfoHelper.GetContextUserInfo();
			if( ui == null )
				throw new MessageException("获取登录人员信息异常");
			// 获取windows用户信息
			order.OrderDate = DateTime.Now;
			order.ShortName = ui.ShortName;
			order.UserName = ui.FullName;

			new FoodsBLL().AddOrder(order);
		}

		[Action]
		public int DeleteOrder(Order order)
		{
			if( ValidateAuthority(order.ShortName) == false )
				throw new MessageException("无删除订单权限");

			return new FoodsBLL().DeleteOrder(order);
		}
		// 验证权限
		private bool ValidateAuthority(string shortName)
		{
			UserInfo ui = WindowsUserInfoHelper.GetContextUserInfo();
			if( ui == null )
				return false;
			if( ui.ShortName == shortName )
				return true;

			string adiminitrators = ConfigurationManager.AppSettings["Adiminitrators"];
			string[] administratorAry = adiminitrators.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
			return administratorAry.Contains(ui.ShortName);
		}

		[Action]
		public object Search(DateTime dt)
		{
			PageOrderModel data = new PageOrderModel();
			data.Orders = new FoodsBLL().GetOrders(dt);

			return new UcResult("~/Controls/PointOfSale/OrderList.ascx", data);
		}

		[Action]
		public object GetUserInfo()
		{
			UserInfo ui = WindowsUserInfoHelper.GetContextUserInfo();
			return new JsonResult(ui);
		}
	}
}
