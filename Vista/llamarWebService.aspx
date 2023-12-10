<%@ Page Title="llamarWebService" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="llamarWebService.aspx.cs" Inherits="Vista.llamarWebService" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
           <h3>Servicios Web</h3><hr />
            <h4>WebService 1 - Solicitudes aprobadas</h4><br />
            <asp:Label ID="Label2" runat="server" Text="Cantidad: "></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Llamar WebService" />
            <hr />
            <h4>WebService 2 - Solicitudes pendientes</h4><br />
            <asp:Label ID="Label3" runat="server" Text="Cantidad: "></asp:Label><br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Llamar WebService" />
            <hr />
            <h4>WebService 3 - Cantidad total de solicitudes</h4><br />
            <asp:Label ID="Label4" runat="server" Text="Cantidad: "></asp:Label>
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Llamar WebService" />
&nbsp;
        </div>
    </main>
</asp:Content>