﻿<%@ Page Title="MenuUsuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuUsuarios.aspx.cs" Inherits="Vista.MenuUsuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h2 id="title" runat="server">Menu de Usuarios</h2>
        </div>
        <hr />
        <div>
            <h3 id="title2" runat="server">Seccion de usuarios</h3>
            <asp:Button ID="Button1" runat="server" Text="Agregar usuario" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Modificar usuario" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Listar usuarios" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Eliminar usuario" OnClick="Button4_Click" />
        </div>
        <hr />
        <div>
            <h3 id="title3" runat="server">Seccion de permisos</h3>
            <asp:Button ID="Button5" runat="server" Text="Permisos" OnClick="Button5_Click" />
        </div>
    </main>
</asp:Content>