<%@ Page Title="aPatenteFamilia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aPatenteFamilia.aspx.cs" Inherits="Vista.aPatenteFamilia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; justify-content: center;">
        <asp:Label ID="Label6" runat="server" Text="Gestion de familias" Style="font-size: 30px; text-align: center"></asp:Label>
    </div>
    <div style="display: flex; flex-direction: row; margin: 0 auto; max-width: 60%; justify-content: center;">
        <div style="flex: 33%; padding: 16px; margin: 16px;" class="icon-box">
            <asp:Label ID="Label3" runat="server" Text="Patentes"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control" Style="width: 100%; appearance: auto;" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>

            <asp:Button ID="BtnAddPatent" CssClass="btn-get-started " Style="margin-left: 0" runat="server" Text="Agregar" OnClick="BtnAddPatent_Click" />
            <asp:Button ID="BtnRemovePatent" CssClass="btn-get-started" runat="server" Text="Eliminar" OnClick="BtnRemovePatent_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Descripcion"></asp:Label>
            <br />
            <textarea class="form-control" id="TextArea1" cols="40" rows="5" runat="server"></textarea>
        </div>
        <div style="flex: 33%; padding: 16px; margin: 16px;" class="icon-box">

            <asp:Label ID="Label2" runat="server" Text="Familia"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="form-control" Style="width: 100%; appearance: auto;">
            </asp:DropDownList>
            <br />
            <asp:Button ID="BtnAddFamily" CssClass="btn-get-started" Style="margin-left: 0" runat="server" Text="Agregar" OnClick="BtnAddFamily_Click" />
            <asp:Button ID="BtnRemoveFamily" CssClass="btn-get-started" runat="server" Text="Eliminar" OnClick="BtnRemoveFamily_Click" />

            <br />
            <br />
            <div>
                <asp:Label ID="Label5" runat="server" Text="Nueva familia"></asp:Label>
                <br />
                <input runat="server" id="InputNewFamily" title="Longitud minima 3 letras" pattern="[A-Za-z]{3,}" class="form-control" type="text" />
                <asp:Button ID="BtnCreateFamily" CssClass="btn-get-started" Style="margin-left: 0" runat="server" Text="Crear" OnClick="BtnCreateFamily_Click" />
            </div>
            <br />

        </div>
        <div style="flex: 33%; padding: 16px; margin: 16px;" class="icon-box">
            <asp:Label ID="Label4" runat="server" Text="Familia a configurar"></asp:Label>

            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Style="width: 100%; appearance: auto;" CssClass="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:TreeView ID="TreeView1" runat="server">
            </asp:TreeView>
        </div>
    </div>
</asp:Content>