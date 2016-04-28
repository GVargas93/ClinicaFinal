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
                D<label>octor</label>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceDoctorId" DataTextField="nombre" DataValueField="doctor_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDoctorId" runat="server" ConnectionString="<%$ ConnectionStrings:Clinica %>" SelectCommand="SELECT [doctor_id], [nombre] FROM [Tbl_Doctor]"></asp:SqlDataSource>
            </div>

            <div class="form-group">
                P<label>aciente</label>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="paciente_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Clinica %>" SelectCommand="SELECT [nombre], [paciente_id] FROM [Tbl_Paciente]"></asp:SqlDataSource>
            </div>

            <div class="form-group">
                U<label>suario</label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="userName" DataValueField="Usuario_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Clinica %>" SelectCommand="SELECT [Usuario_id], [userName] FROM [Tbl_Usuario]"></asp:SqlDataSource>
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

