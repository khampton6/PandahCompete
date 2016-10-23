using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandahCompeteWebRole.Models
{
    public class User : TableEntity
    {
        public string Name { get; set; }

        public string Password { get; set; }

        public Guid Id { get; set; }

        public User(string username)
        {
            this.Name = username;
            this.PartitionKey = this.Name;
            this.RowKey = "1";
        }
    }
}