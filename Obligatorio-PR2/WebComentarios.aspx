<%@ Page Title="Comentarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebComentarios.aspx.cs" Inherits="Obligatorio_PR2.WebComentarios" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;
    <div style="display: flex; gap: 10px;">
        <asp:Label ID="label1" runat="server" Text="Comentario:"></asp:Label>
        <asp:TextBox ID="txtComentarioOrden" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>k
    </div>
    <br />
    <div style="display: flex; gap: 12px;">
        <asp:Label ID="label2" runat="server" Text="ID orden:"></asp:Label>
        <asp:TextBox ID="txtIdOrden" runat="server"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Button ID="clickAgregarC" runat="server" Text="Guardar comentario" OnClick="clickGuardarComentario" CausesValidation="true"></asp:Button>
    </div>
    <div>
        <asp:Repeater ID="rptComentarios" runat="server">
            <ItemTemplate>
                <div class="comentario">
                    <strong><%# Eval("numeroOrden") %></strong>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

