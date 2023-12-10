<%@ Page Title="ListSolicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListSolicitud.aspx.cs" Inherits="Vista.ListSolicitud" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Listar solicitudes</h3><hr />
            Lista de solicitudes pendientes:<br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="220px">
            </asp:DropDownList>
            <hr />
            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label><br />
            <asp:Label ID="Label1" runat="server" Text="Estado de aprobacion"></asp:Label><br />
            <hr />
            <asp:Button ID="Button2" runat="server" Text="Seleccionar solicitud" OnClick="Listar"/>
            <asp:Button ID="Button1" runat="server" Text="Aprobar solicitud" OnClick="Approve"/>
        </div>
    </main>
</asp:Content>