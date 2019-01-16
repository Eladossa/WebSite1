using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalProj
{
   
    public class User
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public string Password { get; set; }
        //public string Gender { get; set; }
        //public string Image { get; set; }

        public User(string username, string password)
        {

            UserName = username;
            Password = password;
        }

    }
}

