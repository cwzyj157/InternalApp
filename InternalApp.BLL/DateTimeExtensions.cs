using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InternalApp.BLL
{
    public static class DateTimeExtensions
    {
		public static int GetDayOfWeek(this DateTime date)
		{
			int dayOfWeek = (int)date.DayOfWeek;
			if( dayOfWeek == 0 )
				return 7;
			return dayOfWeek;
		}
    }
}
