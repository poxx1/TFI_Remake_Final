<%@ Page Title="MenuItems" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuItems.aspx.cs" Inherits="Vista.MenuItems" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h2>Menu de compras</h2>
            Desde este menu podra agregar sus items al carrito, y luego en el mismo, finalizar la compra.<br /><hr>
            Lista de cursos<br />
            <asp:ListBox ID="ListBox1" runat="server" Height="126px" Width="655px" AutoPostBack="false" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <br />        <hr>
            Nombre:
            <asp:Label ID="Label4" runat="server" Text="nombre del curso"></asp:Label>
            <br />
            Precio:
            <asp:Label ID="Label3" runat="server" Text="$0"></asp:Label>
            <br />
            Descripcion:
            <asp:Label ID="Label2" runat="server" Text="descripcion del curso"></asp:Label>
            <br />        <hr>
            <asp:Button ID="Button1" runat="server" Text="Agregar al carrito" Width="140px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Ir al carrito" OnClick="Button2_Click" Width="141px" />
            <br />
        </div>
    </main>
</asp:Content>