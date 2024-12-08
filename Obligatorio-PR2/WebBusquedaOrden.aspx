<%@ Page Title="Busqueda de Orden" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebBusquedaOrden.aspx.cs" Inherits="Obligatorio_PR2.WebBusquedaOrden" %>
      
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;
    <h4>Número de orden</h4>
    <asp:TextBox ID="txtBuscarOrdenTrabajo" runat="server" placeholder="Ingrese número de orden:"></asp:TextBox><asp:LinkButton ID="BotonBuscar" runat="server" OnClick ="clickBuscarOrdenTrabajo" CausesValidation="false" CssClass="botonBuscar" style="margin-left: 8px;">
         <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <circle cx="10.5" cy="10.5" r="7" stroke="white" stroke-width="2" fill="none"/>
                <line x1="16" y1="16" x2="22" y2="22" stroke="white" stroke-width="2" stroke-linecap="round"/>
        </svg>
    </asp:LinkButton>
   
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

    
    .info-block {
        background-color: #A9A9A9;  
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    
    .info-block h4 {
        margin-bottom: 10px;
        color: #333;
    }

  
    .info-block p {
        margin: 5px 0;
        color: #555;
    }


     .botonBuscar {
       display: inline-flex;
       align-items: center;
       justify-content: center;
       width: 35px; 
       height: 35px;
       border-radius: 50%; 
       background-color: black; 
       cursor: pointer;
       box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.164);
       transition: all 0.3s ease;
     }

    .botonBuscar .icon {
        width: 15px; 
        height: 15px;
        fill: white; 
        transition: transform 0.3s ease, fill 0.3s ease; 
    }

    .botonBuscar:hover {
       background-color: #333; 
    }

    .botonBuscar:hover .icon {
       transform: scale(1.2); 
    }



    </style>

</asp:Content>