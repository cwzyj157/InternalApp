using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using Mysoft.Map.Extensions.DAL;


namespace InternalApp.Entity.PointOfSale
{
	[Serializable]
	[DataEntity(Alias = "Orders")]
	public partial class Order : BaseEntity
	{
		[DataColumn(PrimaryKey = true, Identity = true)]
		public int OrderID { get; set; }
		[DataColumn]
		public string UserName { get; set; }
		[DataColumn]
		public string ShortName { get; set; }
		[DataColumn]
		public string ProviderName { get; set; }
		[DataColumn]
		public string FoodName { get; set; }
		[DataColumn]
		public int Count { get; set; }
		[DataColumn]
		public decimal SumMoney { get; set; }
		[DataColumn]
		public DateTime OrderDate { get; set; }
		[DataColumn]
		public int FoodId { get; set; }
	}
}
