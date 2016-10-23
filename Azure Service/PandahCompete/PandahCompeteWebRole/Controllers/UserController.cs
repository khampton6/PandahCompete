using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using PandahCompeteWebRole.Models;
using PandahCompeteWebRole.TableOperations;

namespace PandahCompeteWebRole.Controllers
{
    public class UserController : ApiController
    {
        [HttpGet]
        public async Task<HttpResponseMessage> GetUser([FromUri] string username)
        {
            User foundUser = await UserOperations.GetUser(username);
            if (foundUser == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User does not exist.");
            }

            return Request.CreateResponse(HttpStatusCode.OK, foundUser);
        }
       
        [HttpPut]
        public async Task<HttpResponseMessage> CreateUser(string username, [FromBody] string password)
        {
            try
            {
                User createdUser = await UserOperations.CreateUser(username, password);
                return Request.CreateResponse(HttpStatusCode.Created, createdUser);
            }
            catch
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User not found.");
            }
        }

        [HttpDelete]
        public async Task<HttpResponseMessage> DeleteUser([FromUri] string username, [FromBody] Guid userId)
        {
            try
            {
                User deletedUser = await UserOperations.DeleteUser(username, userId);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch(StorageException se)
            {
                return Request.CreateErrorResponse(se.StatusCode, se.Message);
            }
        }
    }
}