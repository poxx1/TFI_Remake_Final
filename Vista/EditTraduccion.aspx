<%@ Page Title="EditTraduccion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTraduccion.aspx.cs" Inherits="Vista.EditTraduccion" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-label-ledby="title">
        <div>
            Modificar traduccion<br />
            <hr />
            Lista de traducciones<br />
            <asp:ListBox ID="ListBox1" runat="server" Width="300px"></asp:ListBox>
            <br />
            <hr />
            Nombre<br />
            <asp:TextBox ID="TextBox1" runat="server" Width="248px"></asp:TextBox>
            <br />
            <br />
            Descripcion<br />
            <asp:TextBox ID="TextBox2" runat="server" Width="248px"></asp:TextBox>
            <br />
            <hr />
            <asp:Button ID="Button1" runat="server" Text="Seleccionar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Editar" OnClick="Button2_Click" />
        </div>
    </main>
</asp:Content>