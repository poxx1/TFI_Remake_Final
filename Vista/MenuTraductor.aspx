<%@ Page Title="MenuTraductor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuTraductor.aspx.cs" Inherits="Vista.MenuTraductor" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <header>
            <h2>Menu del Interprete</h2>
        </header>
        <hr>
        <div><h3>Seccion del Interprete</h3>
            <asp:Button ID="Button1" runat="server" Text="Interprete virtual" OnClick="Button1_Click" />
        </div>
        <hr>
        <div><h3>Seccion las traducciones</h3>
            <asp:Button ID="Button2" runat="server" Text="Agregar traduccion" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Modificar traduccion" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Listar traducciones" OnClick="Button4_Click" />
            <asp:Button ID="Button5" runat="server" Text="Eliminar traduccion" OnClick="Button5_Click" />
        </div>
        </main>
</asp:Content>