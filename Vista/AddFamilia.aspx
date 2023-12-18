<%@ Page Title="AddFamilia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddFamilia.aspx.cs" Inherits="Vista.AddFamilia" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Agregar nueva familia</h3>
            <hr />
            Nombre de la familia<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><hr />
            <asp:Button ID="Button1" runat="server" Text="Agregar familia" onclick="Button1_Click"/>
        </div>
    </main>
</asp:Content>