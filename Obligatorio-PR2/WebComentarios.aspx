<%@ Page Title="Comentarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebComentarios.aspx.cs" Inherits="Obligatorio_PR2.WebComentarios" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;
    <h6>Agregar comentarios a la orden #<asp:Label ID="lblNumeroOrden" runat="server"></asp:Label>:</h6>
    <div style="display: flex; gap: 10px;">
        <asp:Label ID="label1" runat="server" Text="Comentario:"></asp:Label>
        <asp:TextBox ID="txtComentarioOrden" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Button ID="clickAgregarC" runat="server" Text="Guardar comentario" OnClick="clickGuardarComentario" CausesValidation="true"></asp:Button>
    </div>
     <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    <hr />

    <div>
        <asp:Repeater ID="rptComentarios" runat="server">
            <ItemTemplate>
                <div class="comentario">
                    - <%# Eval("textoComentario") %> (Fecha: <%# Eval("fechaComentario", "{0:dd/MM/yyyy}") %>)
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

