<%@ Page Title="AddFamilia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddFamilia.aspx.cs" Inherits="Vista.AddFamilia" %>
<%-- Aca todavia falta cambiar el template de arriba para que tome el master--%>  
<%-- O capaz ya esta hecho, ni idea xd--%>  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h3>Editar familia</h3><hr />
        Nombre de la familia
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Width="219px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar familia" Width="222px" />
    </p>
</asp:Content>