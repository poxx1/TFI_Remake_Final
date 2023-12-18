<%@ Page Title="DeleteTraduccion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteTraduccion.aspx.cs" Inherits="Vista.DeleteTraduccion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Eliminar solicitud / traduccion</h3><hr />
        </div>
        Lista de las solicitudes<br />
    <asp:ListBox ID="ListBox1" runat="server" Width="274px"></asp:ListBox><hr />
    Curso seleccionado
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Width="263px"></asp:TextBox><hr />
    <asp:Button ID="Button1" runat="server" Text="Seleccionar" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Eliminar" OnClick="Button2_Click" />
    </main>
</asp:Content>