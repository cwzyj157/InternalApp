using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Mysoft.Map.Extensions.DAL;
using InternalApp.Entity.PointOfSale;
using System.Web.Caching;
using InternalApp.Common.Exception;
using InternalApp.Common.Cache;
using System.Collections;

namespace InternalApp.BLL.PointOfSale
{
	public class FoodsBLL
	{
		private static Hashtable s_htMenuFoods = Hashtable.Synchronized(new Hashtable());

		public List<MenuFood> GetMenus()
		{
			string weekDay = DateTime.Today.GetDayOfWeek().ToString();
			List<MenuFood> lstMenuFood = GetMenusFromCache(weekDay);

			return lstMenuFood.Where(m => m.WeekDay.IndexOf(weekDay) > -1).ToList();
		}

		public int AddOrder(Order order)
		{
			Order originalOrder = ExistsOrder(order);
			if( originalOrder != null ) {
				decimal sumMoney = originalOrder.SumMoney + originalOrder.SumMoney / originalOrder.Count;
				originalOrder.Count = originalOrder.Count + 1;
				originalOrder.SumMoney = sumMoney;
				return originalOrder.Update();
			}
			else {
				MenuFood mf = GetMenuFoodById(order.FoodId);
				if( mf == null )
					throw new MessageException("菜品不存在");
				order.SumMoney = order.Count * mf.Price;
				order.ProviderName = mf.ProviderName;
				order.FoodName = mf.FoodName;
				return order.Insert();
			}
		}
		private List<MenuFood> GetMenusFromCache(string weekDay)
		{
			List<MenuFood> lstMenuFood = CacheManager.HashCache[weekDay] as List<MenuFood>;

			if( lstMenuFood == null ) {
				CPQuery query = "SELECT [FoodId],[FoodName],[ProviderName] ,[Price] ,[WeekDay] ,[PicName] FROM [dbo].[MenuFoods] ORDER BY [ProviderName] DESC".AsCPQuery();
				lstMenuFood = query.ToList<MenuFood>();
				CacheManager.HashCache.Add(weekDay, lstMenuFood);
			}
			return lstMenuFood;
		}

		private MenuFood GetMenuFoodById(int foodId)
		{
			List<MenuFood> lstMenuFood = GetMenus();
			return lstMenuFood.SingleOrDefault(m => m.FoodId == foodId);
		}
		private Order ExistsOrder(Order order)
		{
			var parameters = new {
				ShortName = order.ShortName,
				Start = DateTime.Today,
				End = DateTime.Today.AddDays(1),
				FoodId = order.FoodId
			};
			//存在
			CPQuery query = CPQuery.From("SELECT top 1 * FROM [dbo].[Orders] WHERE ShortName = @ShortName and OrderDate>=@Start and OrderDate<@End and FoodId=@FoodId", parameters);

			return query.ToSingle<Order>();
		}

		public int DeleteOrder(Order order)
		{
			return order.Delete();
		}

		public List<Order> GetOrders(DateTime datetime)
		{
			DateTime dateTemp = Convert.ToDateTime(datetime.ToShortDateString());

			var parameters = new {
				Start = dateTemp,
				End = dateTemp.AddDays(1)
			};

			CPQuery query = CPQuery.From(@"SELECT [OrderID]
	                        ,[UserName]
	                        ,[ShortName]
							,[ProviderName]
	                        ,[FoodName]
	                        ,[Count]
	                        ,[SumMoney]
	                        ,[OrderDate]
	                        FROM [dbo].[Orders] WHERE OrderDate>=@Start and OrderDate<@End", parameters);
			return query.ToList<Order>();
		}
	}
}
