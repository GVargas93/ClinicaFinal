using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Cita
/// </summary>
namespace BD_ClinicaControl{
public class Cita
{
		public int citaId { get; set; }
        public string fechaHora { get; set; }
        public string observacion { get; set; }
        public int doctorId { get; set; }
        public int pacienteid { get; set; }
        public int usuarioId { get; set; }
        public Cita() { }

}
}