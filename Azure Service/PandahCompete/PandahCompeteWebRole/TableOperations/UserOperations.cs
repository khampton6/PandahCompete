using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using PandahCompeteWebRole.Models;
using AzureTable = Microsoft.WindowsAzure.Storage.Table;

namespace PandahCompeteWebRole.TableOperations
{
    public static class UserOperations
    {
        private static CloudTable usersTable;

        public static void ConnectToUserTable()
        {
            CloudStorageAccount storageAccount = TableOperation.GetStorageAccount();
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
            usersTable = tableClient.GetTableReference("Users");
            usersTable.CreateIfNotExists();
        }

        public static async Task<User> CreateUser(string username, string password)
        {
            User userEntity = new User(username)
            {
                Password = password,
                Id = Guid.NewGuid()
            };

            AzureTable.TableOperation addOp = AzureTable.TableOperation.Insert(userEntity);
            TableResult result = await usersTable.ExecuteAsync(addOp);
            return (User)result.Result;
        }

        public static async Task<User> GetUser(string username)
        {
            User userEntity = new User(username);
            AzureTable.TableOperation tableOp = AzureTable.TableOperation.Retrieve(userEntity.PartitionKey, userEntity.RowKey);
            TableResult result = await usersTable.ExecuteAsync(tableOp);

            return (result.HttpStatusCode == (int)HttpStatusCode.NotFound) ? null : (User)(result.Result);
        }

        public static async Task<User> DeleteUser(string username, Guid userId)
        {
            User userEntity = new User(username)
            {
                Id = userId
            };

            User foundUser = await GetUser(username);
            if (foundUser == null)
            {
                throw new StorageException("User does not exist", HttpStatusCode.NotFound);
            }

            if (foundUser.Id != userId)
            {
                throw new StorageException("User details do not fully match.", HttpStatusCode.BadRequest);
            }

            AzureTable.TableOperation deleteOp = AzureTable.TableOperation.Delete(foundUser);
            TableResult result = await usersTable.ExecuteAsync(deleteOp);
            return (User)result.Result;
        }
    }
}