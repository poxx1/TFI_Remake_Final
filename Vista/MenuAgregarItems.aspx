<%@ Page Title="MenuAgregarItems" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuAgregarItems.aspx.cs" Inherits="Vista.MenuAgregarItems" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="title" runat="server">Menu de compras</h3>
    <asp:Label ID="Label5" runat="server" Text="Ingrese los detalles del curso"></asp:Label><br />
    <hr />
    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label><br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br>
    <asp:Label ID="Label1" runat="server" Text="Detalles"></asp:Label><br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br>
    <asp:Label ID="Label3" runat="server" Text="Precio"></asp:Label><br />
    <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox><hr/>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar curso" /><hr />
    <asp:Label ID="Label4" runat="server" Text="Nota. Los precios son en $ARS"></asp:Label><br />

</asp:Content>