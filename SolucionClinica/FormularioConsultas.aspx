<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioConsultas.aspx.cs" Inherits="FormularioConsultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <section class="row">
        <div class="col-md-6">

            <asp:Panel ID="ErrorPanel" runat="server" Visible="false"
                CssClass="alert alert-danger" role="alert">
                Error al Guardar el Atencion de Consulta
            </asp:Panel>

            <div class="form-group">
                <label>Fecha</label>
                <asp:Calendar ID="Calendar1" runat="server">
                </asp:Calendar>
            </div>
            

             <div class="form-group">
                <label>Observacion</label>
                <asp:TextBox ID="observacionTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="observacionTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Observacion">
                </asp:RequiredFieldValidator>
            </div>

             <div class="form-group">
                <label>Diagnostico</label>
                <asp:TextBox ID="DiagnosticoTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="DiagnosticoTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Diagnostico">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>Estudio</label>
                <asp:TextBox ID="EstudioTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="EstudioTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Estudio">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>Id Cita</label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCitaId" DataTextField="cita_id" DataValueField="cita_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCitaId" runat="server" ConnectionString="<%$ ConnectionStrings:Clinica %>" SelectCommand="SELECT [cita_id] FROM [Tbl_Cita]"></asp:SqlDataSource>
            </div>


            <asp:LinkButton ID="SaveButton" runat="server"
                CssClass="btn btn-primary"
                ValidationGroup="Consulta"
                OnClick="SaveButton_Click">
                Guardar
            </asp:LinkButton>

           

             <asp:HyperLink runat="server" CssClass="btn"
                NavigateUrl="~/ListaConsultas.aspx">
                Cancelar
            </asp:HyperLink>

            <asp:HiddenField ID="ConsultaIdHiddenField" runat="server" Value="0" />
        </div>
    </section>



</asp:Content>

