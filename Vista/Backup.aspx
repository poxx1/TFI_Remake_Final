<%@ Page Title="Template" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Backup.aspx.cs" Inherits="Vista.Backup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Backup</h3>
            <asp:Button ID="Button2" runat="server" Text="Realizar backup" OnClick="Button2_Click" /><br />
            <hr />
            <h3 id="title2" runat="server">Restore</h3>
            <asp:Label ID="Label1" runat="server" Text="Seleccione el archivo de backup de la base de datos que desea restaurar:"></asp:Label><br /><br />
            <asp:FileUpload ID="FileUpload1" runat="server" Width="539px" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Realizar restore" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
    </main>
</asp:Content>