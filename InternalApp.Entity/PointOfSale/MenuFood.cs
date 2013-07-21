using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mysoft.Map.Extensions.DAL;

namespace InternalApp.Entity.PointOfSale
{
    [Serializable]
    [DataEntity(Alias = "MenuFoods")]
    public partial class MenuFood : BaseEntity
    {
        [DataColumn(PrimaryKey = true, Identity = true)]
        public int FoodId { get; set; }
        [DataColumn]
        public string FoodName { get; set; }
        [DataColumn]
        public string ProviderName { get; set; }
        [DataColumn]
        public decimal Price { get; set; }
        [DataColumn]
        public string WeekDay { get; set; }
        [DataColumn]
        public string PicName { get; set; }
    }
}
