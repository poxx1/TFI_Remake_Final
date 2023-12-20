<%@ Page Title="EditTraduccion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTraduccion.aspx.cs" Inherits="Vista.EditTraduccion" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-label-ledby="title">
        <div>
            <h3 id="title" runat="server">Modificar traduccion</h3><br />
            <hr />
            <asp:Label ID="Label2" runat="server" Text="Lista de traducciones"></asp:Label><br />
            <asp:ListBox ID="ListBox1" runat="server" Width="300px"></asp:ListBox>
            <br />
            <hr />
            <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" required="required" Width="248px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label><br />
            <asp:TextBox ID="TextBox2" runat="server" required="required" Width="248px"></asp:TextBox>
            <br />
            <hr />
            <asp:Button ID="Button1" runat="server" Text="Seleccionar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Editar" OnClick="Button2_Click" />
        </div>
    </main>
</asp:Content>