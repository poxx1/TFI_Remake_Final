﻿<%@ Page Title="salidasXML" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="salidasXML.aspx.cs" Inherits="Vista.salidasXML" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div>
            <h3 id="title" runat="server">Exportar a XML</h3><hr />
            <asp:GridView ID="GridView1" runat="server" Height="212px" Width="748px">
            </asp:GridView>
            <hr />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pendientes" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Aprobadas" />
            <asp:Button ID="Button3" runat="server" Text="Totales" OnClick="Button3_Click" />
        </div>
    </main>
</asp:Content>