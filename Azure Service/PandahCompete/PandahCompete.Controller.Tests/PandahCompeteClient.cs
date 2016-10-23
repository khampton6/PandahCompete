using PandahCompeteWebRole.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PandahCompete.Controller.Tests
{
    public class PandahCompeteClient : IDisposable
    {
        private const string BaseUrl = "http://localhost:54523/";

        public PandahCompeteClient()
        {

        }

        public User GetUser()
        {
            string targetUrl = BaseUrl + ""
        }

        public void Dispose()
        {

        }
    }
}
