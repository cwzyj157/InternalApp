using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using InternalApp.Entity.PointOfSale;

namespace InternalApp.Test.PointOfSale
{
    internal static class FoodsBLL
    {
        public static void GetMenus()
        {
            List<MenuFood> lstMenuFood = new InternalApp.BLL.PointOfSale.FoodsBLL().GetMenus();
            lstMenuFood.ForEach(m => Console.WriteLine(m.FoodName));
        }

        public static int AddOrder(Order order)
        {
            int result = new InternalApp.BLL.PointOfSale.FoodsBLL().AddOrder(order);
            Console.WriteLine("添加订单" + (result > 0 ? "成功" : "失败"));
            return result;
        }

        public static void DeleteOrder(Order order)
        {
            int result = new InternalApp.BLL.PointOfSale.FoodsBLL().DeleteOrder(order);
            Console.WriteLine("删除订单" + (result > 0 ? "成功" : "失败"));
        }

        public static void GetOrders(DateTime currDateTime)
        {
            List<Order> lstOrder = new InternalApp.BLL.PointOfSale.FoodsBLL().GetOrders(currDateTime);
            lstOrder.ForEach(m => Console.WriteLine(m.FoodName));
        }
    }
}
