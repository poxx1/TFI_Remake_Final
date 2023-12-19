<%@ Page Title="AddSolicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSolicitud.aspx.cs" Inherits="Vista.AddSolicitud" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Agregar una solicitud de traduccion</h3><hr />
            <asp:Label ID="Label2" runat="server" Text="Palabra a agregar"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label><br />
            <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
            <hr />
            <asp:Button ID="Button1" runat="server" Text="Realizar solicitud" OnClick="Button1_Click" />
            <br />
        </div>
    </main>
</asp:Content>