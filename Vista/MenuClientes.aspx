<%@ Page Title="MenuClientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuClientes.aspx.cs" Inherits="Vista.MenuClientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <header>
            <h2>Menu de Clientes</h2>
        </header>
        <div> 
            <h3>Seccion del usuario</h3>
            <asp:Button ID="Button1" runat="server" Text="Agregar usuario" />
            <asp:Button ID="Button2" runat="server" Text="Modificar usuario" />
            <asp:Button ID="Button3" runat="server" Text="Listar usuarios" />
            <asp:Button ID="Button4" runat="server" Text="Eliminar usuario" />
             </div>
        <div> 
            <h3>Seccion de permisos</h3>
            <asp:Button ID="Button5" runat="server" Text="Menu de Familias" />
            <asp:Button ID="Button6" runat="server" Text="Menu de Usuarios - FM" Width="220px" />
        </div>
        </main>
</asp:Content>