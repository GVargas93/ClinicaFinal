<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioCitas.aspx.cs" Inherits="FormularioCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    
    <section class="row">
        <div class="col-md-6">

            <asp:Panel ID="ErrorPanel" runat="server" Visible="false"
                CssClass="alert alert-danger" role="alert">
                Error al Guardar el Atencion de Cita
            </asp:Panel>

            <div class="form-group">
                <label>Fecha</label>
                <asp:TextBox ID="fechaTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="fechaTextBox1"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Cita"
                    ErrorMessage="Debe ingresar el Fecha">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label>observacion</label>
                <asp:TextBox ID="observacionTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="observacionTextBox1"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Cita"
                    ErrorMessage="Debe ingresar el observacion">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>doctorId</label>
                <asp:TextBox ID="doctorIdTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="doctorIdTextBox1"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Cita"
                    ErrorMessage="Debe ingresar el doctorId">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>pacienteid</label>
                <asp:TextBox ID="pacienteidTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="pacienteidTextBox1"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Cita"
                    ErrorMessage="Debe ingresar el pacienteid">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>usuarioId</label>
                <asp:TextBox ID="usuarioIdTextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="usuarioIdTextBox1"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Cita"
                    ErrorMessage="Debe ingresar el usuarioId">
                </asp:RequiredFieldValidator>
            </div>

            <asp:LinkButton ID="SaveButtonn" runat="server"
                CssClass="btn btn-primary"
                ValidationGroup="Cita"
                OnClick="SaveButtonn_Click">
                Guardar
            </asp:LinkButton>
            <asp:HyperLink runat="server" CssClass="btn"
                NavigateUrl="~/ListaCitas.aspx">
                Cancelar
            </asp:HyperLink>

            <asp:HiddenField ID="CitaIdHiddenField" runat="server"
                Value="0" />
        </div>
    </section>

</asp:Content>

