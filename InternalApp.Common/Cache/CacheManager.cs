using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace InternalApp.Common.Cache
{
	public static class CacheManager
	{
		#region 系统缓存建议使用方式
		// init a thread-safe hashtable that contains object's life cycle
		private static Hashtable s_hashCache = Hashtable.Synchronized(new Hashtable());
		/// <summary>
		/// 轻量级缓存(使用Hashtable存放key=value形式的小数据量的缓存e.g "IsWriteLog"="T"。效率高)
		/// </summary>
		public static Hashtable HashCache
		{
			get { return s_hashCache; }
		}
		#endregion

		#region Hashtable相关操作
		public static void ClearHashCache()
		{
			s_hashCache.Clear();
		}
		#endregion
	}
}
