<%@ Page Title="MenuUtilidad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuUtilidad.aspx.cs" Inherits="Vista.MenuUtilidad" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h2>Menu de utilidades</h2>
        </div>
        <hr />
        <div>
            <h3>Seccion del Administrador</h3>
            <asp:Button ID="Button1" runat="server" Text="Bitacora" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Salidas XML" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="WebServices" OnClick="Button3_Click" />
        </div>
        <hr />
        <div>
            <h3>Seccion del WebMaster</h3>
            <asp:Button ID="Button4" runat="server" Text="Backup" OnClick="Button5_Click" />
            <asp:Button ID="Button5" runat="server" Text="Restore" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Corrupcion" OnClick="Button6_Click" />
        </div>
    </main>
</asp:Content>