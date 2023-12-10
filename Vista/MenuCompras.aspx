<%@ Page Title="MenuCompras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuCompras.aspx.cs" Inherits="Vista.MenuCompras" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
            <h3>Menu de Compras</h3>
        <hr>
        <div><h3>Seccion de los cursos</h3>
            <asp:Button ID="Button1" runat="server" Text="Agregar curso" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Modificar curso" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Listar cursos" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Eliminar curso" OnClick="Button4_Click" />
        </div>
        <hr>
        <div><h3>Seccion de compras</h3>
            <asp:Button ID="Button5" runat="server" Text="Menu de Compras" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Carrito de compras" OnClick="Button6_Click" />
        </div>
        </main>
</asp:Content>