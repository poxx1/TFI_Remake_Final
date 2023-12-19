﻿<%@ Page Title="MenuCarrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuCarrito.aspx.cs" Inherits="Vista.MenuCarrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Carrito de compras</h3>
            <hr />
            <a id="title2" runat="server">Lista de cursos</a><br />
            <asp:ListBox ID="ListBox1" runat="server" Height="126px" Width="639px"></asp:ListBox>
            <hr />
            <asp:Label ID="Label2" runat="server" Text="Precio total: 0"></asp:Label>
            <hr />
            <asp:Button ID="Button1" runat="server" Text="Quitar item seleccionado" Width="240px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Realizar compra" OnClick="Button2_Click" />
            <br />
        </div>
    </main>
</asp:Content>