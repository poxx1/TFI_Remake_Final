<%@ Page Title="Corrupcion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Corrupcion.aspx.cs" Inherits="Vista.Corrupcion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h2>Corrupcion en las tablas de la base de datos</h2><hr />
            Opcion 1. Restaurar la base de datos a un estado previo (el mas reciente).<br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Restaurar" Width="124px" /><hr />
            Opcion 2. Recalcular los digitos verificadores pisando los cambios aplicados a la base de datos.<br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Recalcular" Width="120px" />

            <asp:Label ID="errores" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </main>
</asp:Content>