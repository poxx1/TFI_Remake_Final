﻿<%@ Page Title="Delete user" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="Vista.DeleteUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Eliminar usuario</h3>
            <hr />
            Seleccione el usuario que desea eliminar<br />
            <asp:ListBox ID="ListBox1" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="250px"></asp:ListBox><hr />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Eliminar usuario" OnClientClick="return confirm('Esta seguro que quiere eliminar ese usuario?');" />
        </div>
    </main>
</asp:Content>