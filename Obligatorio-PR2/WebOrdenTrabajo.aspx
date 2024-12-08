<%@ Page Title="Gestión de ordenes de trabajo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebOrdenTrabajo.aspx.cs" Inherits="Obligatorio_PR2.WebOrdenTrabajo" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelCedulaCliente" runat="server" Text="CI Cliente:"></asp:Label>
        <asp:TextBox ID="txtCedulaCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtCedulaC" ControlToValidate="txtCedulaCliente" ForeColor="Red" ErrorMessage="La cédula del cliente es requerida." Display="Dynamic" />

    <hr />

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelCedulaTecnico" runat="server" Text="CI Tecnico:"></asp:Label>
        <asp:TextBox ID="txtCedulaTecnico" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtCedulaT" ControlToValidate="txtCedulaTecnico" ForeColor="Red" ErrorMessage="La cédula del técnico es requerida." Display="Dynamic" />

    <hr />

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelDescripcion" runat="server" Text="Descripcion:"></asp:Label>
        <asp:TextBox ID="txtDescripcionOrden" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
    </div>

    <asp:RequiredFieldValidator runat="server" ID="txtDescripcionO" ControlToValidate="txtDescripcionOrden" ForeColor="Red" ErrorMessage="La descripción es requerida." Display="Dynamic" />

    <br />

     <asp:LinkButton ID="clickAgrOrdenTrabajo" runat="server" OnClick="clickAgregarOrdenTrabajo" CausesValidation="true" CssClass="botondelagregar">
        <svg class="icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path d="M9 12.5l3 3l7-7" stroke="white" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Agregar
    </asp:LinkButton>
    <hr />

    <asp:TextBox ID="txtBuscarOrdenTrabajo" runat="server"></asp:TextBox><asp:LinkButton ID="BotonBuscar" runat="server" OnClick ="clickBuscarOrdenTrabajo" CausesValidation="false" CssClass="botonBuscar">
        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
           <circle cx="10.5" cy="10.5" r="7" stroke="white" stroke-width="2" fill="none"/>
               <line x1="16" y1="16" x2="22" y2="22" stroke="white" stroke-width="2" stroke-linecap="round"/>
       </svg>
   </asp:LinkButton>
    <asp:GridView runat="server" ID="pagOrdenes" AutoGenerateColumns="False" Width="105%" AllowPaging="true" OnPageIndexChanging="AsegurarActualizacionGrilla">
        <Columns>
            <asp:TemplateField HeaderText="ID Orden">
                <ItemTemplate>
                    <asp:Label ID="numeroOrdenRederencia" runat="server" Text='<%# Eval("numeroOrden") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CI Técnico">
                <ItemTemplate>
                    <asp:Label ID="lblCedulaTecnico" runat="server"
                        Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("cedulaTecnico").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CI Cliente">
                <ItemTemplate>
                    <asp:Label ID="lblCedulaCliente" runat="server"
                        Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("cedulaCliente").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlOpcionesEstado" runat="server"
                        SelectedValue='<%# Eval("Estado")  ?? "Pendiente" %>'
                        OnSelectedIndexChanged="seleccionarOpcionDropList"
                        AutoPostBack="true">
                        <asp:ListItem Text="Pendiente" Value="Pendiente" />
                        <asp:ListItem Text="En progreso" Value="En progreso" />
                        <asp:ListItem Text="Completada" Value="Completada" />
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="descripcionProblema" HeaderText="Descripción" />
            <asp:BoundField DataField="fechaAutomatica" HeaderText="Fecha"
                DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="GridViewButtonContainer">

                        <asp:Button ID="botonVerComentarios" runat="server" Text="Ver comentarios" ForeColor="Blue"
                            CommandName="VerComentario" CommandArgument='<%# Container.DataItemIndex %>'
                            OnCommand="clickVerComentarios" CausesValidation="false" CssClass="botonVerComentarios" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
    <hr />


    <style>

        .botondelagregar {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #3e8e41; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            position: relative; 
            width: 120px; 
            height: 41px; 
            margin: 0px; 
            vertical-align: middle; 
            line-height: normal;
            vertical-align: middle;
        }

         
         .botondelagregar .icon {
             display: none; 
             margin-left: 8px;
             width: 16px;
             height: 16px;
             transition: opacity 0.2s ease;
         }

        
         .botondelagregar:hover {
             background-color: #5cb85c; 
             transform: scale(1.05); 
         }

        
         .botondelagregar:active {
             background-color: #4cae4c; 
         }

         
         .botondelagregar:active .icon,
         .botondelagregar:hover .icon {
             display: inline-block; 
             opacity: 1; 
         }

         .contenedor {
             display: flex;
             align-items: center; 
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

         .botonVerComentarios {
              background-color: cornflowerblue; 
              color: black; 
              border: none; 
              padding: 10px 20px; 
              border-radius: 5px; 
              font-size: 12px; 
              cursor: pointer;
              transition: background-color 0.3s ease;
             
         }

        .botonVerComentarios:hover {
          background-color: navajowhite; 
        }



    </style>

</asp:Content>

