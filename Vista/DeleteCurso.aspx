<%@ Page Title="DeleteCurso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteCurso.aspx.cs" Inherits="Vista.DeleteCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            Eliminar cursos<br />
            <hr />
            Lista de los cursos<br />
            <asp:ListBox ID="ListBox1" runat="server" Width="358px"></asp:ListBox><br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Eliminar curso" /><hr />
        </div>
    </main>
</asp:Content>