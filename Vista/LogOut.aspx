﻿<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="Vista.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h3 id="title" runat="server">Cerrar sesion</h3>
        <hr />
         <div>
            <asp:Label ID="Label1" runat="server" Text="Usuario actualmente logeado"></asp:Label> <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><hr />
             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cerrar sesion" />
        </div>
    </main>
</asp:Content>