<%@ Page Title="EditarCursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarCursos.aspx.cs" Inherits="Vista.EditarCursos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
    <div>
    <h3 id="title" runat="server">Modificar cursos</h3><hr />
    <asp:Label ID="Label1" runat="server" Text="Lista de cursos"></asp:Label><br />
    <asp:DropDownList ID="DropDownList1" runat="server" Height="35px">
    </asp:DropDownList><br /><br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Seleccionar curso"/>
    <hr />
    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label><br />
    <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="Detalles"></asp:Label><br />
    <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox><br />
    <asp:Label ID="Label4" runat="server" Text="Precio"></asp:Label><br />
    <asp:TextBox ID="TextBox3" runat="server" Width="250px"></asp:TextBox>
    <hr />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Editar curso"/>
        <hr />
        <asp:Label ID="Label5" runat="server" Text="Nota. Los precios son en $ARS"></asp:Label><br />
        </div>
    </main>
</asp:Content>