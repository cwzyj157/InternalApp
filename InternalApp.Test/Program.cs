using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using InternalApp.Entity.PointOfSale;

namespace InternalApp.Test
{
    class Program
    {
        private static readonly string _connectionstring = @"Data Source=WH-PC0447\SQLEXPRESS;Initial Catalog=PointOfSale;Integrated Security=true";

        static void Main(string[] args)
        {
            Mysoft.Map.Extensions.Initializer.UnSafeInit(_connectionstring);

            InternalApp.Test.PointOfSale.FoodsBLL.GetMenus();
            Order order = new Order()
            {
                FoodName = "【海带豆腐汤】",
                Count = 1,
                ShortName = "chenw01",
                SumMoney = 100,
                UserName = "陈伟",
                OrderDate = DateTime.Now
            };

            int orderId = InternalApp.Test.PointOfSale.FoodsBLL.AddOrder(order);
            order.OrderID = orderId;

            InternalApp.Test.PointOfSale.FoodsBLL.DeleteOrder(order);
            InternalApp.Test.PointOfSale.FoodsBLL.GetOrders(DateTime.Now);

            Console.ReadLine();
        }
    }
}
