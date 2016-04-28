using BD_ClinicaControl;
using BD_ClinicaControl.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FormularioConsultas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            string strId = Request.QueryString["id"];
            if (string.IsNullOrEmpty(strId))
                return;
            try
            {
                int consultaId = Convert.ToInt32(strId);
                Consulta obj = ConsultaBLL.GetConsultaById(consultaId);
                //Calendar1.SelectedDate = dateOn
                //Calendar1.SelectedDate = Convert.ToDateTime(dateOnly.ToString(obj.fechaHora));
                Calendar1.SelectedDate = Convert.ToDateTime(obj.fechaHora);
                //Calendar1.SelectedDate.ToString('dd/MM/yyyy') = Convert.ToString(obj.fechaHora);
                //Calendar1.SelectedDate = conver
                //fechaTextBox.Text = obj.fechaHora;
                observacionTextBox.Text = obj.observacion;
                DiagnosticoTextBox.Text = obj.diagnostico;
                EstudioTextBox.Text = obj.estudio;
                DropDownList1.SelectedValue = Convert.ToString(obj.citaId);
                //cita_IdTextBox.Text = Convert.ToString(obj.citaId);

                ConsultaIdHiddenField.Value = strId;
            }
            catch (Exception ex)
            {
                
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                ErrorPanel.Visible = false;
                int consultaId = Convert.ToInt32(ConsultaIdHiddenField.Value);
                Consulta obj = new Consulta()
                {
                    consultaId = consultaId,
                    //fechaHora = Calendar1.SelectedDate.ToString(),
                    fechaHora = Calendar1.SelectedDate.ToString("dd/MM/yyyy"),
                    //fechaHora = Convert.ToString(Calendar1.SelectedDate),
                    observacion = observacionTextBox.Text,
                    diagnostico=DiagnosticoTextBox.Text,
                    estudio=EstudioTextBox.Text,
                    citaId=Convert.ToInt32(DropDownList1.SelectedValue)
                    //citaId = Convert.ToInt32(cita_IdTextBox.Text)
                };

                if (consultaId == 0)
                    ConsultaBLL.InsertarConsulta(obj);
                else
                    ConsultaBLL.ActualizarConsulta(obj);
            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                return;
            }

            Response.Redirect("~/ListaConsultas.aspx");
        }
    }
