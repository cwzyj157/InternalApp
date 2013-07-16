using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using MyMVC;
using InternalApp.Entity.PointOfSale;
using InternalApp.BLL.PointOfSale;
using InternalApp.Common.Cache;

namespace InternalApp.Controller.PointOfSale.Page
{
	public class MenuController
	{
		[Action]
		[PageUrl(Url = "/Pages/PointOfSale/Menu.aspx")]
		public object Index()
		{
			PageMenuFoodModel result = new PageMenuFoodModel();
			result.MenuFoods = new FoodsBLL().GetMenus();
			return new PageResult(null, result);
		}
		[Action]
		[PageUrl(Url = "/ClearCache.aspx")]
		public object ClearCache()
		{
			CacheManager.ClearHashCache();
			return new PageResult(null, "0");
		}
	}
}
