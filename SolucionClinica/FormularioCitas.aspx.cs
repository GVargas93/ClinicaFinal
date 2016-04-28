using BD_ClinicaControl;
using BD_ClinicaControl.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FormularioCitas : System.Web.UI.Page
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
                int citaId = Convert.ToInt32(strId);
                Cita obj = CitaBLL.GetCitaById(citaId);

                
                fechaTextBox1.Text = obj.fechaHora;
                observacionTextBox1.Text = obj.observacion;
                DropDownList2.SelectedValue = Convert.ToString(obj.doctorId);
                DropDownList3.SelectedValue = Convert.ToString(obj.pacienteid);
                DropDownList1.SelectedValue = Convert.ToString(obj.usuarioId);

                //doctorIdTextBox1.Text = Convert.ToString(obj.doctorId);
                //pacienteidTextBox1.Text = Convert.ToString(obj.pacienteid);
                //usuarioIdTextBox1.Text = Convert.ToString(obj.usuarioId);
                                //DropDownList1.SelectedValue = Convert.ToString(obj.citaId);

                CitaIdHiddenField.Value = strId;
            }
            catch (Exception ex)
            {
                
            }
        }


        protected void SaveButtonn_Click(object sender, EventArgs e)
        {
            try
            {
                ErrorPanel.Visible = false;
                int citaa = Convert.ToInt32(CitaIdHiddenField.Value);
                Cita obj = new Cita()
                {
                    citaId = citaa,
                    fechaHora = fechaTextBox1.Text,
                    observacion = observacionTextBox1.Text,
                    doctorId=Convert.ToInt32(DropDownList2.SelectedValue),
                    pacienteid=Convert.ToInt32(DropDownList3.SelectedValue),
                    usuarioId=Convert.ToInt32(DropDownList1.SelectedValue)
                    //doctorId = Convert.ToInt32(doctorIdTextBox1.Text),
                    //pacienteid = Convert.ToInt32(pacienteidTextBox1.Text),
                    //usuarioId = Convert.ToInt32(usuarioIdTextBox1.Text)
                };

                if (citaa == 0)
                    CitaBLL.InsertarCita(obj);
                else
                    CitaBLL.ActualizarCita(obj);
            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                return;
            }

            Response.Redirect("~/ListaCitas.aspx");
        }
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
}
