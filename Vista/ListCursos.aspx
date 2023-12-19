<%@ Page Title="ListCursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListCursos.aspx.cs" Inherits="Vista.ListCursos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Lista de los cursos</h3>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </main>
</asp:Content>