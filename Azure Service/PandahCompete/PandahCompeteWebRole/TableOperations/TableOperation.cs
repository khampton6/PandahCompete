using Microsoft.WindowsAzure.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Azure;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace PandahCompeteWebRole.TableOperations
{
    public static class TableOperation
    {
        public static CloudStorageAccount GetStorageAccount()
        {
            string connectionString = RoleEnvironment.GetConfigurationSettingValue("AzureStorageConnectionString");
            return CloudStorageAccount.Parse(connectionString);
        }
    }
}