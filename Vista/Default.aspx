<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vista._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">TFI - 2023</h1>
            <h2 id="title" runat="server">Pagina de inicio</h2><hr />
            <p id="texto" runat="server">Say IT es una plataforma que brinda servicios a personas con discapacidades auditivas.
                Contamos actualmente con un interprete en tiempo real, que traduce a lenguaje de señas
                la mayoria de palabras del lenguaje español.
                Esto nos permite llegar a las mayorias de personas de habla hispana, ya sea de Argentina, como 
                del resto del mundo. Nuestro objetivo se centra en poder mejorar la calidad de vida, la manera en la
                que se enseñan los contenidos en los colegios, y colaborar en la sociabilidad de las personas.
            </p>
            <p id="texto2" runat="server">Sin mas pretextos, le damos la bienvenida al sitio!</p>
        </section>
        <div class="row">
        </div>
    </main>
</asp:Content>