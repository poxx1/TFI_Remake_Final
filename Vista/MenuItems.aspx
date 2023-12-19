<%@ Page Title="MenuItems" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuItems.aspx.cs" Inherits="Vista.MenuItems" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Menu de compras</h3>
            <asp:Label ID="Label1" runat="server" Text="Lista de cursos"></asp:Label><br />
            <asp:ListBox ID="ListBox1" runat="server" Height="126px" Width="655px" AutoPostBack="false" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <br />        <hr>
            <asp:Label ID="Label5" runat="server" Text="Nombre"></asp:Label><br />
            <asp:Label ID="Label4" runat="server" Text="nombre del curso"></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Precio"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text="$0"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Descripcion"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="descripcion del curso"></asp:Label>
            <br />        <hr>
            <asp:Button ID="Button1" runat="server" Text="Agregar al carrito" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Ir al carrito" OnClick="Button2_Click" Width="141px" />
            <br />
        </div>
            <div>
                <hr />
        <asp:Label ID="Label8" runat="server" Text="Carrito de compras"></asp:Label><br />
         <asp:ListBox ID="ListBox2" runat="server" Height="126px" Width="639px"></asp:ListBox>
    </div>
    </main>
</asp:Content>