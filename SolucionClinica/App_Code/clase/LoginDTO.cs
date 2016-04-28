using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoClinica.App_Code.DTO
{
    public class LoginDTO
    {
        private string userName;
        private string password;
        private string permiso;

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Permiso
        {
            get { return permiso; }
            set { permiso = value; }
        }
    }
}