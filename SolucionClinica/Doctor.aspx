<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doctor.aspx.cs" Inherits="Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     
    <section class="row">
        <div class="col-md-6">
            <asp:Panel ID="Error" runat="server" Visible="false" CssClass="alert alert-danger" role="alert" >
            </asp:Panel>
        <div class="form-group">
    <asp:Label ID="Label1" runat="server" Text="Nombre Del Doctor" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="NombreDoctor" runat="server"
             CssClass="form-control">
    </asp:TextBox>
              <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="NombreDoctor"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Doctor"
                         ErrorMessage="Debe ingresar el nombre del Doctor">

                 </asp:RequiredFieldValidator>
 </div>
  <div class="form-group">
    <asp:Label ID="Label2" runat="server" Text="Especialidad" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="Especialidad" runat="server"
             CssClass="form-control">

    </asp:TextBox>
        <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="Especialidad"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Doctor"
                         ErrorMessage="Debe ingresa la especialidad  del Doctor">

                 </asp:RequiredFieldValidator>

 </div>
             <div class="form-group">
    <asp:Label ID="Label3" runat="server" Text="Telefono" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="TelefonoTextbox" runat="server"
             CssClass="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="TelefonoTextbox"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Doctor"
                         ErrorMessage="Debe ingresar el telefono del Doctor">

                 </asp:RequiredFieldValidator>

 </div>
              <div class="form-group">
    <asp:Label ID="Label4" runat="server" Text="Usuario" ForeColor="Red"></asp:Label>
                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="usuario" DataValueField="usuario_id">
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-NRAK6GG\SQLEXPRESS;Initial Catalog=Clinica;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [usuario_id], [usuario] FROM [Usuario]"></asp:SqlDataSource>
 </div>
                <div class="col-md-12"> 
              <asp:GridView ID="DoctorGridView" runat="server"
             CssClass="table" GridLines="None"
             AutoGenerateColumns="false"
             OnRowCommand="DoctorGridView_RowCommand">
             <Columns>
                 <asp:TemplateField HeaderText="Editar">
                     <ItemTemplate>
                         <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar"
                             CommandArgument='<%# Eval("doctor_id") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Eliminar">
                     <ItemTemplate>
                         <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Eliminar"
                             CommandArgument='<%# Eval("doctor_id") %>'>
                                <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="nombre" HeaderText="Nombre del Doctor" />
                 <asp:BoundField DataField="especialidad" HeaderText="Especialidad" />
                   <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                 <asp:BoundField DataField="usuario_id" HeaderText="Usuario" />

             </Columns>
              
         </asp:GridView>
                 </div>

 <asp:LinkButton ID="botonguardar" runat="server"
                CssClass="btn btn-primary"
                   ValidationGroup="Doctor"
                OnClick="botonguardar_Click">
                
                guardar
            </asp:LinkButton>
            <asp:HyperLink runat="server" CssClass="btn btn-primary"
                NavigateUrl="~/Doctor.aspx">
                cancelar
            </asp:HyperLink>
            <asp:HiddenField ID="doctoridhiddenfield" runat="server"
                Value="0"/>

             </div>
            </section>
</asp:Content>

