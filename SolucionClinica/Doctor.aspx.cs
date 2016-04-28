using BD_ClinicaControl;
using BD_ClinicaControl.BBL;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            CargarLista();

        if (IsPostBack)
            return;
        string stringid = Request.QueryString["id"];
        if (string.IsNullOrEmpty(stringid))
            return;
        try
        {
            int doctor_id = Convert.ToInt32(stringid);
            Doctores obj = DoctorBBL.GetDoctorById(doctor_id);
            NombreDoctor.Text = obj.nombre;
            Especialidad.Text = obj.especialidad;
            TelefonoTextbox.Text = obj.telefono;
  
            doctoridhiddenfield.Value = stringid;
        }
        catch (Exception ex)
        {

        }
     
    }
    protected void botonguardar_Click(object sender, EventArgs e)
    {
        try
        {
            Error.Visible = false;

            int doctor_id = Convert.ToInt32(doctoridhiddenfield.Value);
            Doctores obj = new Doctores()
            {
                doctor_id = doctor_id,
                nombre = NombreDoctor.Text,
                especialidad = Especialidad.Text,
                telefono = TelefonoTextbox.Text,
                usuario_id = Convert.ToInt32(DropDownList1.SelectedValue)



            };
            if (doctor_id == 0)
                DoctorBBL.insertar_doctor(obj);
            else
                DoctorBBL.actulizar_doctor(obj);
        }
        catch (Exception ex)
        {
                Error.Visible = true;
            return;
        }
        Response.Redirect("~/Doctor.aspx");
    }
    private void CargarLista()
    {
        try
        {
            List<Doctores> doctor = DoctorBBL.GetDoctor();
            DoctorGridView.DataSource = doctor;
            DoctorGridView.DataBind();


        }
        catch (Exception ex)
        {

        }
    }
    protected void DoctorGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Eliminar")
        {
            try
            {
                int doctor_id = Convert.ToInt32(e.CommandArgument);
                DoctorBBL.EliminarDoctor(doctor_id);
                CargarLista();
            }
            catch (Exception ex)
            {

            }
        }
        if (e.CommandName == "Editar")
        {
            Response.Redirect("~/Doctor.aspx?id=" + e.CommandArgument.ToString());

        }
    }

}