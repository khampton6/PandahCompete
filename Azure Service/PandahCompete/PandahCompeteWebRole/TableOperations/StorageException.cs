using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace PandahCompeteWebRole.TableOperations
{
    public class StorageException : Exception
    {
        public HttpStatusCode StatusCode { get; private set; }

        public StorageException(string message, HttpStatusCode statusCode) : base(message)
        {
            this.StatusCode = StatusCode;
        }
    }
}