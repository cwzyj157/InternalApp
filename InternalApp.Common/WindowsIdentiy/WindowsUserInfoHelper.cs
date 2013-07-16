using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.DirectoryServices;
using System.Management;
using System.Collections;
using InternalApp.Common.Cache;

namespace InternalApp.Common.WindowsIdentiy
{
	public static class WindowsUserInfoHelper
	{
		/// <summary>
		/// 活动目录中的搜索路径，也可根据实际情况来修改这个值。
		/// </summary>
		private static readonly string _directoryPath = "LDAP://" + GetDomainName();

		/// <summary>
		/// 获取与指定HttpContext相关的用户信息
		/// </summary>
		/// <param name="context"></param>
		/// <returns></returns>
		private static UserInfo GetContextUserInfo(HttpContext context)
		{
			string loginName = GetUserLoginName(context);
			if( string.IsNullOrEmpty(loginName) )
				return null;

			return GetUserInfoByLoginName(loginName);
		}
		public static UserInfo GetContextUserInfo()
		{
			return GetContextUserInfo(HttpContext.Current);
		}


		/// <summary>
		/// 根据指定的HttpContext对象，获取登录名。
		/// </summary>
		/// <param name="context"></param>
		/// <returns></returns>
		public static string GetUserLoginName(HttpContext context)
		{
			if( context == null )
				return null;

			if( context.Request.IsAuthenticated == false )
				return null;

			string userName = context.User.Identity.Name;
			// 此时userName的格式为：UserDomainName\LoginName
			// 我们只需要后面的LoginName就可以了。

			string[] array = userName.Split(new char[] { '\\' }, StringSplitOptions.RemoveEmptyEntries);
			if( array.Length == 2 )
				return array[1];

			return null;
		}


		/// <summary>
		/// 根据登录名查询活动目录，获取用户信息。
		/// </summary>
		/// <param name="loginName"></param>
		/// <returns></returns>
		public static UserInfo GetUserInfoByLoginName(string loginName)
		{
			if( string.IsNullOrEmpty(loginName) )
				return null;

			SearchResult result = GetSearchResult(loginName);
			if( result != null ) {
				UserInfo info = new UserInfo();
				info.ShortName = result.Properties["samaccountname"][0].ToString();
				info.FullName = result.Properties["cn"][0].ToString();
				return info;
			}
			return null;
		}
		private static SearchResult GetSearchResult(string loginName)
		{
			SearchResult result = CacheManager.HashCache[loginName] as SearchResult;

			if( result == null ) {
				DirectoryEntry entry = new DirectoryEntry(_directoryPath);
				DirectorySearcher search = new DirectorySearcher(entry);
				search.Filter = "(SAMAccountName=" + loginName + ")";

				search.PropertiesToLoad.Add("samaccountname");
				search.PropertiesToLoad.Add("cn");
				// 如果还需要从AD中获取其它的用户信息，请参考ActiveDirectoryDEMO
				result = search.FindOne();
				// 添加缓存项
				CacheManager.HashCache.Add(loginName, result);
			}
			return result;
		}


		private static string GetDomainName()
		{
			// 注意：这段代码需要在Windows XP及较新版本的操作系统中才能正常运行。
			SelectQuery query = new SelectQuery("Win32_ComputerSystem");
			using( ManagementObjectSearcher searcher = new ManagementObjectSearcher(query) ) {
				foreach( ManagementObject mo in searcher.Get() ) {
					if( (bool)mo["partofdomain"] )
						return mo["domain"].ToString();
				}
			}
			return null;
		}

	}

	public sealed class UserInfo
	{
		public string ShortName;
		public string FullName;
	}
}