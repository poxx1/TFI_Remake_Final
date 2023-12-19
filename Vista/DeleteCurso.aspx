<%@ Page Title="DeleteCurso" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteCurso.aspx.cs" Inherits="Vista.DeleteCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Eliminar cursos</h3><br />
            <hr />
            <asp:Label ID="Label2" runat="server" Text="Seleccione un curso"></asp:Label><br />
            <asp:ListBox ID="ListBox1" runat="server" Width="358px"></asp:ListBox><br /><hr />
            <asp:Label ID="Label1" runat="server" Text="Curso seleccionado"></asp:Label>
            <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <hr />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Seleccionar" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Eliminar curso" />
        </div>
    </main>
</asp:Content>