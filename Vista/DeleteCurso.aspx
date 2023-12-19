<%@ Page Title="DeleteCurso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteCurso.aspx.cs" Inherits="Vista.DeleteCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            Eliminar cursos<br />
            <hr />
            Lista de los cursos<br />
            <asp:ListBox ID="ListBox1" runat="server" Width="358px"></asp:ListBox><br /><hr />
            Curso seleccionado
            <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <hr />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Seleccionar" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Eliminar curso" />
        </div>
    </main>
</asp:Content>