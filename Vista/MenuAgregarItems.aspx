<%@ Page Title="MenuAgregarItems" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuAgregarItems.aspx.cs" Inherits="Vista.MenuAgregarItems" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Menu de compras</h3>
    Ingrese los detalles del curso que desea agregar al sistema.
    <hr />
    Nombre<br>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br>
    Detalles<br>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br>
    Precio<br>
    <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox><hr/>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar curso" /><hr />
    Nota. Los precios de los cursos son en $ARS.

</asp:Content>