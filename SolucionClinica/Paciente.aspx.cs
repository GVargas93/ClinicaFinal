
using BD_ClinicaControl;
using BD_ClinicaControl.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Paciente : System.Web.UI.Page
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
            int paciente_id = Convert.ToInt32(stringid);
            Pacientes obj = PacienteBBL.GetPacienteById(paciente_id);
            NombreTextbox.Text = obj.nombre;
            Apellido.Text = obj.apellido;
            Direcciontextbox.Text = obj.direccion;
            TelefonoTextbox.Text = obj.telefono;

            Pacienteidhiddenfield.Value = stringid;
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

            int paciente_id = Convert.ToInt32(Pacienteidhiddenfield.Value);
            Pacientes obj = new Pacientes()
            {
                paciente_id = paciente_id,
                nombre = NombreTextbox.Text,
                apellido = Apellido.Text,
                 direccion = Direcciontextbox.Text,
                telefono = TelefonoTextbox.Text


            };
            if (paciente_id == 0)
               PacienteBBL.insertar_paciente(obj);
            else
                PacienteBBL.actulizar_paciente(obj);
        }
        catch (Exception ex)
        {
            Error.Visible = true;
        }
        Response.Redirect("~/Paciente.aspx");
    }
    private void CargarLista()
    {
        try
        {
            List<Pacientes> paciente = PacienteBBL.GetPaciente();
            PacienteGridView.DataSource = paciente;
            PacienteGridView.DataBind();


        }
        catch (Exception ex)
        {

        }
    }
    protected void PacienteGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Eliminar")
        {
            try
            {
                int paciente_id = Convert.ToInt32(e.CommandArgument);
                PacienteBBL.eliminar_paciente(paciente_id);
                CargarLista();
            }
            catch (Exception ex)
            {

            }
        }
        if (e.CommandName == "Editar")
        {
            Response.Redirect("~/Paciente.aspx?id=" + e.CommandArgument.ToString());

        }
    }
}