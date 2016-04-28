using BD_ClinicaControl;
using BD_ClinicaControl.BBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaCitas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarLista();
        }
        private void CargarLista()
        {
            try
            {
                List<Cita> cita = CitaBLL.GetCita();
                ClientesGridView.DataSource = cita;
                ClientesGridView.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void ClientesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                try
                {
                    int citaId = Convert.ToInt32(e.CommandArgument);
                    CitaBLL.EliminarCita(citaId);
                    CargarLista();
                }
                catch (Exception ex)
                {
                    ;
                }
            }

            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/FormularioCitas.aspx?id=" + e.CommandArgument.ToString());
            }
        }

    }
