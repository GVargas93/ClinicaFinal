using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace BD_ClinicaControl
{
    /// <summary>
    /// Summary description for Doctor
    /// </summary>
    public class Doctores
    {
        public int doctor_id { get; set; }
        public string nombre { get; set; }
        public string especialidad { get; set; }
        public string telefono { get; set; }
        public int usuario_id { get; set; }
     

    public Doctores()
        {
        }


    }
}