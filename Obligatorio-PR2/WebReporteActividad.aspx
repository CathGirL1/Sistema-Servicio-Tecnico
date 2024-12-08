<%@ Page Title="Reporte de Actividad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebReporteActividad.aspx.cs" Inherits="Obligatorio_PR2.WebReporteActividad" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">


    <h4><asp:Label ID="labelCedulaBuscada" runat="server" Text="Cédula del técnico:"></asp:Label></h4>

    <asp:TextBox ID="txtCedula" runat="server" placeholder="Ingrese la cédula"></asp:TextBox>
    <asp:LinkButton ID="BotonBuscar" runat="server" OnClick ="clickBuscarTecnico" CausesValidation="false" CssClass="botonBuscar" style="margin-left: 8px;">
     <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <circle cx="10.5" cy="10.5" r="7" stroke="white" stroke-width="2" fill="none"/>
            <line x1="16" y1="16" x2="22" y2="22" stroke="white" stroke-width="2" stroke-linecap="round"/>
    </svg>
    </asp:LinkButton>
    <asp:Label ID="lblResultado" runat="server"></asp:Label>
    
    <asp:Panel ID="panelResultado" runat="server" Visible="false" CssClass="panel-general"
           Style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
                  width: 285%; max-width: 500px; background-color: #f9f9f9; border-radius: 8px; padding: 20px;
                  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">

        <div class="info-block">
            <h4>Resumen de actividad:</h4>
            <p><strong>Nombre:</strong> <asp:Label ID="txtNombreTecnico" runat="server"></asp:Label></p>
            <p><strong>Apellido:</strong> <asp:Label ID="txtApellidoTecnico" runat="server"></asp:Label></p>
            <p><strong>Cédula:</strong> <asp:Label ID="txtCedulaTecnico" runat="server"></asp:Label></p>
            <p><strong>Órdenes totales:</strong> <asp:Label ID="txtOrdenesTotales" runat="server"></asp:Label></p>
            <p><strong>Órdenes pendientes:</strong> <asp:Label ID="txtEstadoPendiente" runat="server"></asp:Label></p>
            <p><strong>Órdenes en progreso:</strong> <asp:Label ID="txtEstadoEnProgreso" runat="server"></asp:Label></p>
            <p><strong>Órdenes completadas:</strong> <asp:Label ID="txtEstadoCompletadas" runat="server"></asp:Label></p>
        </div>

    </asp:Panel>
    <asp:Label ID="mensajeErrorBusquedaTecnico" runat="server" Visible="false" ForeColor="Red"></asp:Label>

   <style>

       
        .panel-general {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 285%;
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
