<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Paciente.aspx.cs" Inherits="Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <section class="row">
        <div class="col-md-6">
            <asp:Panel ID="Error" runat="server" Visible="false" CssClass="alert alert-danger" role="alert" >
                error  al guardar producto   
            </asp:Panel>

     <div class="form-group">
    <asp:Label ID="Label1" runat="server" Text="Nombre del Paciente" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="NombreTextbox" runat="server"
             CssClass="form-control" BackColor="White" BorderStyle="Double"></asp:TextBox>
          <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="NombreTextbox"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Paciente"
                         ErrorMessage="Debe ingresar el nombre del paciente">

                 </asp:RequiredFieldValidator>
 </div>
  <div class="form-group">
    <asp:Label ID="Label2" runat="server" Text="Apellido" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="Apellido" runat="server"
             CssClass="form-control" BorderStyle="Double"></asp:TextBox>
       <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="Apellido"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Paciente"
                         ErrorMessage="Debe ingresar el Apellido del Paciente">

                 </asp:RequiredFieldValidator>
 </div>
            
              <div class="form-group">
    <asp:Label ID="Label4" runat="server" Text="Direccion" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="Direcciontextbox" runat="server"
             CssClass="form-control" BorderStyle="Double"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="Direcciontextbox"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Paciente"
                         ErrorMessage="Debe ingresar La Direccion del paciente">

                 </asp:RequiredFieldValidator>
 </div>

     <div class="form-group">
    <asp:Label ID="Label3" runat="server" Text="Telefono" ForeColor="Red"></asp:Label>
    <asp:TextBox ID="TelefonoTextbox" runat="server"
             CssClass="form-control" BorderStyle="Double"></asp:TextBox>
          <asp:RequiredFieldValidator runat="server"
                     ControlToValidate="TelefonoTextbox"
                     display="Dynamic"
                         ForeColor="Blue"
                         ValidationGroup="Paciente"
                         ErrorMessage="Debe ingresar el telefono del paciente">

                 </asp:RequiredFieldValidator>
 </div>

             <div class="col-md-12"> 
              <asp:GridView ID="PacienteGridView" runat="server"
             CssClass="table" GridLines="None"
             AutoGenerateColumns="false"
             OnRowCommand="PacienteGridView_RowCommand">
             <Columns>
                 <asp:TemplateField HeaderText="Editar">
                     <ItemTemplate>
                         <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar"
                             CommandArgument='<%# Eval("paciente_id") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Eliminar">
                     <ItemTemplate>
                         <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Eliminar"
                             CommandArgument='<%# Eval("paciente_id") %>'>
                                <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="nombre" HeaderText="Nombre del Paciente" />
                 <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                 <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                   <asp:BoundField DataField="telefono" HeaderText="Telefono" />

             </Columns>
              
         </asp:GridView>
                 </div>

 <asp:LinkButton ID="botonguardar" runat="server"
                CssClass="btn btn-primary"
                   ValidationGroup="Paciente"
                OnClick="botonguardar_Click">
                
                guardar
            </asp:LinkButton>
            <asp:HyperLink runat="server" CssClass="btn btn-primary"
                NavigateUrl="~/Paciente.aspx">
                cancelar
            </asp:HyperLink>
            <asp:HiddenField ID="Pacienteidhiddenfield" runat="server"
                Value="0"/>



   </div>
        
     </section>
</asp:Content>

