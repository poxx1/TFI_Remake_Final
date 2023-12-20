<%@ Page Title="Interprete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Interprete.aspx.cs" Inherits="Vista.Interprete" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title" runat="server">Interprete virtual</h2>
       <hr />
        <div>
            <asp:Label ID="Label2" runat="server" Text="Ingrese la palabra a interpretar"></asp:Label><br />
            <input id="Text1" type="text" required="required"/><br><br>
            <input id="Button2" runat="server" type="button" onclick="onButtonClick()" value="Interpretar" /><hr />
        </div>
        <video id="video" width="640" height="480" autoplay>
            <source id="VideoPlayer" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <script>
            let videoSource = document.getElementById("VideoPlayer");
            let video = document.getElementById("video");
            const sleep = ms => new Promise(r => setTimeout(r, ms));

            async function onButtonClick() {
                document.getElementById("Button2").setAttribute("disabled", "disabled");
                let str = document.getElementById("Text1").value;
                str = str.replace(/\s/g, '');
                for (var i = 0; i < str.length; i++) {

                    videoSource.src = '/Letters/' + str[i] + '-abc.mp4'
                    video.load();
                    video.play();
                    await new Promise(r => setTimeout(r, 1000));
                    console.log(videoSource.src)
                }
                document.getElementById("Button2").removeAttribute("disabled");

            }
        </script>
    </main>
</asp:Content>
