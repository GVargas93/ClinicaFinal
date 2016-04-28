
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Doctor
/// </summary>
namespace BD_ClinicaControl.BBL
{
    public class DoctorBBL
    {
        public DoctorBBL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static List<Doctores> GetDoctor()
        {
            DoctordbTableAdapters.DoctorTableAdapter adapter = new DoctordbTableAdapters.DoctorTableAdapter();
            Doctordb.DoctorDataTable table = adapter.GetDoctor();
            List<Doctores> list = new List<Doctores>();
            foreach (var row in table)
            {
                Doctores obj = GetDoctorFromRow(row);
                list.Add(obj);
            }
            return list;
        }

        public static Doctores GetDoctorById(int doctor_id)
        {
            if (doctor_id <= 0)
                throw new ArgumentException("El id del Doctor no puede ser menor o igual que cero");
            DoctordbTableAdapters.DoctorTableAdapter adapter = new DoctordbTableAdapters.DoctorTableAdapter();
            Doctordb.DoctorDataTable table = adapter.GetDataBy3(doctor_id);
            Doctores obj = GetDoctorFromRow(table[0]);

            return obj;
        }
        public static void EliminarDoctor(int doctor_id)
        {
            if (doctor_id <= 0)
                throw new ArgumentException("El id del Doctor no puede ser menor o igual que cero");

            DoctordbTableAdapters.DoctorTableAdapter adapter = new DoctordbTableAdapters.DoctorTableAdapter();
            adapter.EliminarDoctor(doctor_id);
        }

        public static int insertar_doctor(Doctores obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }
           
            if (string.IsNullOrEmpty(obj.nombre))
            {
                throw new ArgumentException("El Nombre del Doctor no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.especialidad))
            {
                throw new ArgumentException("La especialidad no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.telefono))
            {
                throw new ArgumentException("El telefono no puede ser nulo");
            }
            if (string.IsNullOrEmpty(Convert.ToString( obj.usuario_id)))
            {
                throw new ArgumentException("El usuario no puede ser nulo");
            }
            int? id = 0;
            DoctordbTableAdapters.DoctorTableAdapter Adapter = new DoctordbTableAdapters.DoctorTableAdapter();
            Adapter.insertar_doctor(obj.nombre, obj.especialidad, obj.telefono, Convert.ToString(obj.usuario_id), ref id);  
            if (id == null || id <= 0)
                throw new Exception("la llave primaria no recorrio  bien");
            return id.Value;
        }





        public static void actulizar_doctor(Doctores obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }
            if (obj.doctor_id <= 0)
            {
                throw new ArgumentException("El id del doctor no puede ser menor  o igual que a cero");
            }
            if (string.IsNullOrEmpty(obj.nombre))
            {
                throw new ArgumentException("El Nombre del Producto no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.especialidad))
            {
                throw new ArgumentException("El especialidad no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.telefono))
            {
                throw new ArgumentException("El telefono no puede ser nulo");
            }
            if (string.IsNullOrEmpty(Convert.ToString( obj.usuario_id)))
            {
                throw new ArgumentException("El usuario no puede ser nulo");
            }
            int? id = 0;
            DoctordbTableAdapters.DoctorTableAdapter Adapter = new DoctordbTableAdapters.DoctorTableAdapter();

            Adapter.actulizar_doctor(obj.nombre,obj.especialidad,obj.telefono, Convert.ToString(obj.usuario_id), obj.doctor_id);

        }


        public static Doctores GetDoctorFromRow(Doctordb.DoctorRow row)
        {
            Doctores obj = new Doctores()
            {
                doctor_id = row.doctor_id,
                nombre = row.nombre,
                especialidad = row.especialidad,
                telefono = row.telefono,
                usuario_id = Convert.ToInt32(row.usuario_id)
     

            };
            return obj;
        }

    }
}