<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListaCitas.aspx.cs" Inherits="ListaCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">



    <section class="row">
        <div class="col-md-12">

            <asp:HyperLink runat="server" NavigateUrl="~/FormularioCitas.aspx"
                CssClass="btn btn-primary">
                Crear Cita
            </asp:HyperLink>
           
            <br /><br />

            <asp:GridView ID="ClientesGridView" runat="server"
                CssClass="table" GridLines="None"
                AutoGenerateColumns="false"
                OnRowCommand="ClientesGridView_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("citaId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('Esta seguro que desea eliminar el Cita seleccionado?')"
                                CommandArgument='<%# Eval("citaId") %>'>
                                <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="fechaHora" HeaderText="Fecha" />
                    <asp:BoundField DataField="observacion" HeaderText="Observacion" />
                    <asp:BoundField DataField="doctorId" HeaderText="Id Doctor" />
                    <asp:BoundField DataField="pacienteid" HeaderText="Id Paciente" />
                    <asp:BoundField DataField="usuarioId" HeaderText="Id usuario" />


                </Columns>
            </asp:GridView>
        </div>
    </section>













</asp:Content>

