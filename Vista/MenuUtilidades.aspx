<%@ Page Title="MenuUtilidades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuUtilidades.aspx.cs" Inherits="Vista.MenuUtilidades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <header>
            <h2>Menu de utilidades</h2>
        </header>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Backup y restore" />
            <asp:Button ID="Button2" runat="server" Text="Corrupcion" />
            <asp:Button ID="Button3" runat="server" Text="WebServices" />
            <asp:Button ID="Button4" runat="server" Text="Corrupcion" />
            <asp:Button ID="Button5" runat="server" Text="Bitacora" />
        </div>
        </main>
</asp:Content>