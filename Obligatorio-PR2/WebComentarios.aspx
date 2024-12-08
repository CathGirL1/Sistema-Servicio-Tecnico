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
         <asp:LinkButton ID="clickAgregarC" runat="server" OnClick="clickGuardarComentario" CausesValidation="true" CssClass="botondelguardar">
           <svg viewBox="0 -0.5 25 25" xmlns="http://www.w3.org/2000/svg">
           <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" d="M18.507 19.853V6.034C18.5116 5.49905 18.3034 4.98422 17.9283 4.60277C17.5532 4.22131 17.042 4.00449 16.507 4H8.50705C7.9721 4.00449 7.46085 4.22131 7.08577 4.60277C6.7107 4.98422 6.50252 5.49905 6.50705 6.034V19.853C6.45951 20.252 6.65541 20.6407 7.00441 20.8399C7.35342 21.039 7.78773 21.0099 8.10705 20.766L11.907 17.485C12.2496 17.1758 12.7705 17.1758 13.113 17.485L16.9071 20.767C17.2265 21.0111 17.6611 21.0402 18.0102 20.8407C18.3593 20.6413 18.5551 20.2522 18.507 19.853Z" clip-rule="evenodd" fill-rule="evenodd"></path>
           </svg>
           Guardar
        </asp:LinkButton>
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

    <style>

            .botondelguardar {
                display: inline-flex;
                align-items: center;
                cursor: pointer;
                background-color: #E1B12C; 
                color: #bef264; 
                border: none;
                border-radius: 0.375rem; 
                padding: 0.5rem 1rem; 
                font-size: 0.875rem; 
                font-weight: bold;
                transition: background-color 0.2s, border-color 0.2s; 
                width: 120px; 
                height: 41px;
                margin: 0; 
                vertical-align: middle; 
                line-height: normal;
                vertical-align: middle;
            }

            .botondelguardar svg {
                margin-right: 0.5rem; 
                height: 20px;
                width: 20px;
                fill: #bef264; 
            }

            .botondelguardar:hover {
                background-color: #365314; 
                color: #C7941B;
            }

            .botondelguardar:active {
                border: 1px solid ; 
                color: #FFFFFF; 
            }


    </style>
</asp:Content>

