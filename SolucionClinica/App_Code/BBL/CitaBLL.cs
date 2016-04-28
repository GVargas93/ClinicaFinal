using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de CitaBLL
/// </summary>
namespace BD_ClinicaControl.BBL{
public class CitaBLL
{
	public CitaBLL()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public static List<Cita> GetCita()
    {
        CitaDSTableAdapters.CitaTableAdapter adapter = new CitaDSTableAdapters.CitaTableAdapter();
        CitaDS.CitaDataTable table = adapter.GetCita();

        List<Cita> list = new List<Cita>();
        foreach (var row in table)
        {
            Cita obj = getCitaFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static Cita getCitaFromRow(CitaDS.CitaRow row)
    {
        Cita obj = new Cita()
        {
            citaId = row.cita_id,
            fechaHora = row.fecha_hora,
            observacion = row.observacion,
            doctorId = row.Fk_doctor_id,
            pacienteid = row.Fk_paciente_id,
            usuarioId = row.Fk_usuario_id
        };
        return obj;
    }

    public static void EliminarCita(int citaId)
    {
        if (citaId <= 0)
            throw new ArgumentException("El id de la Cita no puede ser menor o igual que cero");
        CitaDSTableAdapters.CitaTableAdapter adapter = new CitaDSTableAdapters.CitaTableAdapter();
        adapter.EliminarCita(citaId);
    }

    public static int InsertarCita(Cita obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto no puede ser nulo");
        }

        if (string.IsNullOrEmpty(obj.fechaHora))
        {
            throw new ArgumentException("El fecha no puede ser nulo o vacio");
        }

        if (string.IsNullOrEmpty(obj.observacion))
        {
            throw new ArgumentException("El observacion no puede ser nulo o vacio");
        }
        if (obj.pacienteid == null)
        {
            throw new ArgumentException("El paciente no puede ser nulo o vacio");
        }
        if (obj.usuarioId == null)
        {
            throw new ArgumentException("El usuario no puede ser nulo o vacio");
        }
        if (obj.doctorId == null)
        {
            throw new ArgumentException("El doctor no puede ser nulo o vacio");
        }

        //string fecha1 = string.Format(obj.fecha);
        //string hora1 = string.Format(obj.hora);


        int? id = 0;
        CitaDSTableAdapters.CitaTableAdapter adapter = new CitaDSTableAdapters.CitaTableAdapter();

        adapter.InsertarCita(obj.fechaHora, obj.observacion, obj.doctorId, obj.pacienteid, obj.usuarioId, ref id);

        if (id == null || id <= 0)
            throw new Exception("La llave primaria no se generó correctamente");
        return id.Value;
    }

    public static void ActualizarCita(Cita obj)
    {
        if (obj == null)
        {
            throw new ArgumentException("El objeto no puede ser nulo");
        }
        if (string.IsNullOrEmpty(obj.fechaHora))
        {
            throw new ArgumentException("El fecha no puede ser nulo o vacio");
        }

        if (string.IsNullOrEmpty(obj.observacion))
        {
            throw new ArgumentException("El observacion no puede ser nulo o vacio");
        }
        if (obj.pacienteid == null)
        {
            throw new ArgumentException("El paciente no puede ser nulo o vacio");
        }
        if (obj.usuarioId == null)
        {
            throw new ArgumentException("El usuario no puede ser nulo o vacio");
        }
        if (obj.doctorId == null)
        {
            throw new ArgumentException("El doctor no puede ser nulo o vacio");
        }

        CitaDSTableAdapters.CitaTableAdapter adapter = new CitaDSTableAdapters.CitaTableAdapter();
        adapter.ActualizarCita(obj.fechaHora, obj.observacion, obj.doctorId, obj.pacienteid, obj.usuarioId, obj.citaId);
    }

    public static Cita GetCitaById(int citaId)
    {
        if (citaId <= 0)
            throw new ArgumentException("El id de la Cita no puede ser menor o igual que cero");

        CitaDSTableAdapters.CitaTableAdapter adapter = new CitaDSTableAdapters.CitaTableAdapter();
        CitaDS.CitaDataTable table = adapter.GetCitaById(citaId);
        Cita obj = getCitaFromRow(table[0]);
        return obj;
    }
}
}