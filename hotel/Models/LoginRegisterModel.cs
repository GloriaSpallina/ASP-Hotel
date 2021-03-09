using Hotel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class LoginRegisterModel
    {
        public LoginModel LoginModel { get; set; }
        public ClientModel ClientModel { get; set; }
    }
}