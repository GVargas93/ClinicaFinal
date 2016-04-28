
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PacienteBBL
/// </summary>
namespace BD_ClinicaControl.BBL
{
    public class PacienteBBL
    {
        public PacienteBBL()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static List<Pacientes> GetPaciente()
        {
            PacientedbTableAdapters.pacienteTableAdapter adapter = new PacientedbTableAdapters.pacienteTableAdapter();
            Pacientedb.pacienteDataTable table = adapter.GetPaciente();
            List<Pacientes> list = new List<Pacientes>();
            foreach (var row in table)
            {
                Pacientes obj = GetPacienteFromRow(row);
                list.Add(obj);
            }
            return list;
        }

        public static Pacientes GetPacienteById(int paciente_id)
        {
            if (paciente_id <= 0)
                throw new ArgumentException("El id del Paciente no puede ser menor o igual que cero");
            PacientedbTableAdapters.pacienteTableAdapter adapter = new PacientedbTableAdapters.pacienteTableAdapter();
            Pacientedb.pacienteDataTable table = adapter.GetDataBy3(paciente_id);
            Pacientes obj = GetPacienteFromRow(table[0]);

            return obj;
        }
        public static void eliminar_paciente(int paciente_id)
        {
            if (paciente_id <= 0)
                throw new ArgumentException("El id del Paciente no puede ser menor o igual que cero");

            PacientedbTableAdapters.pacienteTableAdapter adapter = new PacientedbTableAdapters.pacienteTableAdapter();
            adapter.eliminar_paciente(paciente_id);
        }

        public static int insertar_paciente(Pacientes obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }

            if (string.IsNullOrEmpty(obj.nombre))
            {
                throw new ArgumentException("El Nombre del Paciente no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.apellido))
            {
                throw new ArgumentException("El Apellido no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.direccion))
            {
                throw new ArgumentException("El Direccion no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.telefono))
            {
                throw new ArgumentException("El Telefono no puede ser nulo");
            }
            int? id = 0;
            PacientedbTableAdapters.pacienteTableAdapter Adapter = new PacientedbTableAdapters.pacienteTableAdapter();
            Adapter.insertar_paciente(obj.nombre, obj.apellido, obj.direccion, obj.telefono, ref id);
            if (id == null || id <= 0)
                throw new Exception("la llave primaria no recorrio  bien");
            return id.Value;
        }





        public static void actulizar_paciente(Pacientes obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }
            if (obj.paciente_id <= 0)
            {
                throw new ArgumentException("El id del doctor no puede ser menor  o igual que a cero");
            }
            if (string.IsNullOrEmpty(obj.nombre))
            {
                throw new ArgumentException("El Nombre del Producto no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.apellido))
            {
                throw new ArgumentException("El especialidad no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.direccion))
            {
                throw new ArgumentException("El telefono no puede ser nulo");
            }
            if (string.IsNullOrEmpty(obj.telefono))
            {
                throw new ArgumentException("El usuario no puede ser nulo");
            }
            int? id = 0;
            PacientedbTableAdapters.pacienteTableAdapter Adapter = new PacientedbTableAdapters.pacienteTableAdapter();

            Adapter.actulizar_paciente(obj.nombre, obj.apellido, obj.direccion, obj.telefono, obj.paciente_id);

        }


        public static Pacientes GetPacienteFromRow(Pacientedb.pacienteRow row)
        {
            Pacientes obj = new Pacientes()
            {
                paciente_id = row.paciente_id,
                nombre = row.nombre,
                apellido = row.apellido,
                direccion = row.direccion,
                telefono = row.telefono
               

            };
            return obj;
        }

    }
}