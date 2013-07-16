using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace InternalApp.Common.Exception
{
	[Serializable]
	public class MessageException : System.Exception
	{
		public MessageException()
			: base()
		{
		}
		public MessageException(string message)
			: base(message)
		{
		}
		public MessageException(string message, System.Exception innerException)
			: base(message, innerException)
		{
		}
		protected MessageException(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}
	}
}
