<%@ Page Title="EditarCursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarCursos.aspx.cs" Inherits="Vista.EditarCursos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3>Modificar cursos</h3><hr />
            Lista de cursos<br />
                <asp:DropDownList ID="DropDownList1" runat="server" Height="35px">
                </asp:DropDownList>
            <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Seleccionar curso"/>
            <hr />
    Nombre<br />
    <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox><br />
    Detalles<br />
    <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox><br />
    Precio<br />
    <asp:TextBox ID="TextBox3" runat="server" Width="250px"></asp:TextBox>
    <hr />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Editar curso"/>
        <hr />
        Nota. Los precios de los cursos son en $ARS.
        </div>
    </main>
</asp:Content>