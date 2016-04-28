using ProyectoClinica.App_Code.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoClinica.App_Code.BBL
{
    public class LoginBBL
    {
        public LoginBBL()
        {

        }

        public static List<DTO.LoginDTO> GetLogin(string userName, string password)
        {
            ProyectoClinica.App_Code.DAL.LoginDALTableAdapters.LOGIN_GETALLTableAdapter adapter = new ProyectoClinica.App_Code.DAL.LoginDALTableAdapters.LOGIN_GETALLTableAdapter();
            DAL.LoginDAL.LOGIN_GETALLDataTable table = adapter.GetAllLogin(userName, password);
            List<DTO.LoginDTO> list = new List<DTO.LoginDTO>();
            foreach (var row in table)
            {
                DTO.LoginDTO obj = GetLoginFromRow(row);
                list.Add(obj);
            }
            return list;
        }

        public static DTO.LoginDTO GetLoginFromRow(DAL.LoginDAL.LOGIN_GETALLRow row)
        {
            DTO.LoginDTO obj = new DTO.LoginDTO();
            obj.UserName = row.userName;
            obj.Password = row.password;
            obj.Permiso = row.nombrePermiso;
            return obj;
        }
    }
}