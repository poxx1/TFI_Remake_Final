<%@ Page Title="UsuarioPatente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsuarioPatente.aspx.cs" Inherits="Vista.UsuarioPatente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Permisos de los usuarios</h3><hr />
            Seleccionar usuario:<br />
            <asp:DropDownList ID="DropDownList1" runat="server" Height="52px" Width="199px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            Seleccionar permiso:<br />
            <asp:DropDownList ID="DropDownList2" runat="server" Height="52px" Width="199px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <hr />
            Lista de permisos del usuario:<br />
            <asp:ListBox ID="ListBox1" runat="server" Width="201px"></asp:ListBox>
            <hr />
            <asp:Button ID="Button3" runat="server" Text="Listar permisos del usuario" Width="300px" OnClick="Button2_Click" />
            <asp:Button ID="Button2" runat="server" Text="Agregar permiso al usuario"  Width="300px" OnClick="Button3_Click" />
        </div>
    </main>
</asp:Content>