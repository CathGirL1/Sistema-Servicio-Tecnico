<%@ Page Title="Busqueda de Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebBusquedaOrden.aspx.cs" Inherits="Obligatorio_PR2.WebBusquedaOrden" %>
      
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;
    <h4>Escriba el numero de orden que quiera informarse... </h4>
     <br />
<asp:TextBox ID="txtBuscarOrdenTrabajo" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar Orden" OnClick="clickBuscarOrdenTrabajo" CausesValidation="false" style="margin-left: 8px;" />
   
    <asp:Panel ID="panelDetalles" runat="server" Visible="false" 
           Style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
                  width: 285%; max-width: 500px; height: 200px; background-color: #f9f9f9; border-radius: 8px; padding: 20px;
                  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">

    <!-- cuadrado de la Orden -->
    <div class="info-block">
        <h4>Detalles de la Orden</h4>
        <p><strong>Numero de orden:</strong> <asp:Label ID="txtNumeroOrden" runat="server"></asp:Label></p>
        <p><strong>Descripción:</strong> <asp:Label ID="txtDescripcionOrden" runat="server" TextMode="Number"></asp:Label></p>
        <p><strong>Estado:</strong> <asp:Label ID="txtEstadoOrden" runat="server"></asp:Label></p>
        <p><strong>Fecha de Creación:</strong> <asp:Label ID="txtFechaOrden" runat="server" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false"></asp:Label></p>
        <p><strong>Comentarios:</strong> 
            <asp:Repeater ID="rptComentarios" runat="server">
                <ItemTemplate>
                    <div class="comentario">
                        - <%# Eval("textoComentario") %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </p>
    </div>

    <!-- cuadrado del cliente -->
    <div class="info-block">
        <h4>Información del Cliente</h4>
        <p><strong>Nombre:</strong> <asp:Label ID="txtNombreCliente" runat="server"></asp:Label></p>
        <p><strong>Apellido:</strong> <asp:Label ID="txtApellidoCliente" runat="server"></asp:Label></p>
        <p><strong>Cédula:</strong> <asp:Label ID="txtCedulaCliente" runat="server"></asp:Label></p>
        <p><strong>Dirección:</strong> <asp:Label ID="txtDireccionCliente" runat="server"></asp:Label></p>
        <p><strong>Telefono:</strong> <asp:Label ID="txtTelefonoCliente" runat="server"></asp:Label></p>
        <p><strong>Email:</strong> <asp:Label ID="txtEmailCliente" runat="server"></asp:Label></p>
    </div>

    <!-- cuadrado del tecnico -->
    <div class="info-block">
        <h4>Información del Técnico</h4>
        <p><strong>Nombre:</strong> <asp:Label ID="txtNombreTecnico" runat="server"></asp:Label></p>
        <p><strong>Apellido:</strong> <asp:Label ID="txtApellidoTecnico" runat="server"></asp:Label></p>
        <p><strong>Cédula:</strong> <asp:Label ID="txtCedulaTecnico" runat="server"></asp:Label></p>
        <p><strong>Especialidad:</strong> <asp:Label ID="txtEspecialidadTecnico" runat="server"></asp:Label></p>
    </div>

</asp:Panel>


        <asp:Label ID="mensajeErrorBusquedaOrden" runat="server" Visible="false" ForeColor="Red"></asp:Label>

    <style>
        /* Estilo para el panel principal */
    #panelDetalles {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 200%;
        max-width: 500px;
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    /* Estilo para cada bloque de información */
    .info-block {
        background-color: #A9A9A9;  /* Gris medio claro oscuro */
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* Estilo para los títulos dentro de cada bloque */
    .info-block h4 {
        margin-bottom: 10px;
        color: #333;
    }

    /* Estilo para los párrafos dentro de cada bloque */
    .info-block p {
        margin: 5px 0;
        color: #555;
    }


    </style>

</asp:Content>