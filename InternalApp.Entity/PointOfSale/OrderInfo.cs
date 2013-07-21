using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mysoft.Map.Extensions.DAL;

namespace InternalApp.Entity.PointOfSale
{
	[Serializable]
	[DataEntity(Alias = "OrderInfos")]
	public partial class OrderInfo : BaseEntity
	{
		[DataColumn]
		public string ProviderName { get; set; }
		[DataColumn]
		public string FoodName { get; set; }
		[DataColumn]
		public int Count { get; set; }
		[DataColumn]
		public decimal SumMoney { get; set; }
		[DataColumn]
		public string UserNames { get; set; }
	}
}
