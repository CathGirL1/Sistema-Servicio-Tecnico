<%@ Page Title="Gestión de tecnicos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebTecnico.aspx.cs" Inherits="Obligatorio_PR2.WebTecnico" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

     <div style="display: flex; gap: 10px;">
         <asp:Label ID="labelNombre" runat="server" Text="Nombre:"></asp:Label>
         <asp:TextBox ID="txtNombreTecnico" runat="server"></asp:TextBox>
     </div>
    <asp:RequiredFieldValidator runat="server" ID="txtNombreT" ControlToValidate="txtNombreTecnico" ForeColor="Red" ErrorMessage="El nombre es requerido." Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelApellido" runat="server" Text="Apellido:"></asp:Label>
        <asp:TextBox ID="txtApellidoTecnico" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtApellidoT" ControlToValidate="txtApellidoTecnico" ForeColor="Red" ErrorMessage="El apellido es requerido." Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 20px;">
        <asp:Label ID="LabelCedula" runat="server" Text="Cédula:"></asp:Label>
        <asp:TextBox ID="txtCedulaTecnico" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="rfvCedula" ControlToValidate="txtCedulaTecnico" ForeColor="Red" ErrorMessage="La cédula es requerida." ErrorMessageDisplayLocation="Inline" ValidationExpression="^\d{1,2}\.\d{3}\.\d{3}$" Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 1px;">
        <asp:Label ID="labelEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
        <asp:TextBox ID="txtEspecialidadTecnico" runat="server" Width="169px"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtEspecialidadT" ControlToValidate="txtEspecialidadTecnico" ForeColor="Red" ErrorMessage="La especialidad es requerida." Display="Dynamic" />

    <br />

       <asp:LinkButton ID="clickAgrTecnico" runat="server" OnClick="clickAgregarTecnico" CausesValidation="true" CssClass="botondelagregar">
          <svg class="icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M9 12.5l3 3l7-7" stroke="white" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        Agregar
      </asp:LinkButton>


      <asp:LinkButton ID="clickGrdTecnico" runat="server" OnClick="clickGuardarTecnico" CausesValidation="true" CssClass="botondelguardar">
            <svg viewBox="0 -0.5 25 25" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" d="M18.507 19.853V6.034C18.5116 5.49905 18.3034 4.98422 17.9283 4.60277C17.5532 4.22131 17.042 4.00449 16.507 4H8.50705C7.9721 4.00449 7.46085 4.22131 7.08577 4.60277C6.7107 4.98422 6.50252 5.49905 6.50705 6.034V19.853C6.45951 20.252 6.65541 20.6407 7.00441 20.8399C7.35342 21.039 7.78773 21.0099 8.10705 20.766L11.907 17.485C12.2496 17.1758 12.7705 17.1758 13.113 17.485L16.9071 20.767C17.2265 21.0111 17.6611 21.0402 18.0102 20.8407C18.3593 20.6413 18.5551 20.2522 18.507 19.853Z" clip-rule="evenodd" fill-rule="evenodd"></path>
            </svg>
        Guardar
     </asp:LinkButton>

    <hr />
    <asp:TextBox ID="txtBuscarTecnico" runat="server"></asp:TextBox><asp:LinkButton ID="BotonBuscar" runat="server" OnClick ="clickBuscarTecnico" CausesValidation ="false" CssClass="botonBuscar">
        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
           <circle cx="10.5" cy="10.5" r="7" stroke="white" stroke-width="2" fill="none"/>
               <line x1="16" y1="16" x2="22" y2="22" stroke="white" stroke-width="2" stroke-linecap="round"/>
       </svg>
    </asp:LinkButton>
    <asp:GridView runat="server" ID="pagTecnicos" AutoGenerateColumns="False" Width="105%" AllowPaging="true" OnPageIndexChanging="AsegurarActualizacionGrilla">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
            <asp:TemplateField HeaderText="Cédula">
                <ItemTemplate>
                    <asp:Label ID="lblCedula" runat="server"
                        Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("Ci").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="GridViewButtonContainer">

                         <asp:LinkButton ID="botonEditarTecnico" runat="server" Text="Editar" ForeColor="Blue" 
                              CommandName="EditarTecnico" CommandArgument='<%# Container.DataItemIndex %>' 
                              OnCommand="clickEditarTecnico" CausesValidation="false" CssClass="botondeEditar">

                              <svg class="icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M3 21v-3.75l10.94-10.94 3.75 3.75L6.75 21H3z" 
                                    fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                 <path d="M16.97 8.22l2.69-2.69a.75.75 0 0 0 0-1.06l-2.19-2.19a.75.75 0 0 0-1.06 0l-2.69 2.69 3.75 3.75z" 
                                   fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                              </svg>

                        </asp:LinkButton>


                        <asp:LinkButton ID="botonDeEliminar" runat="server" CommandName="EliminarTecnico"
                            CommandArgument='<%# Eval("Ci") %>' OnCommand="clickEliminarTecnico" CausesValidation="false" CssClass="btnEliminar">
                                    <span class="svgButton">
                                        <svg viewBox="0 0 24 24" class="svgIcon" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M3 6h18v2H3V6zm2 3h14v13H5V9zm3 2v9h2v-9H8zm4 0v9h2v-9h-2zm4 0v9h2v-9h-2z"></path>
                                        </svg>
                                    </span>
                        </asp:LinkButton>

                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>

   <style>


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



     
        .btnEliminar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: rgb(20, 20, 20);
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.164);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            margin-left: 15px;
        }

            .btnEliminar .svgIcon {
                width: 15px;
                height: 15px;
                fill: white; 
                transition: all 0.3s ease;
            }

            .btnEliminar:hover {
                width: 40px;
                background-color: rgb(255, 69, 69);
            }

            .btnEliminar:hover::before {
                content: "Eliminar";
                position: absolute;
                left: 45px;
                font-size: 12px;
                color: white;
                opacity: 1;
                transition: opacity 0.3s ease;
                white-space: nowrap;
            }


            .btnEliminar::before {
                content: "";
                opacity: 0;
            }

            .botondeEditar {
                  display: inline-flex;
                  align-items: center;
                  justify-content: center;
                  width: 35px; 
                  height: 35px;
                  border-radius: 50%; 
                  background-color: rgb(25, 118, 210);
                  text-decoration: none; 
                  color: black; 
                  cursor: pointer;
                  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.164);
                  transition: all 0.3s ease;
                  margin-left: 15px;
                  position: relative;
            }

            .botondeEditar .icon {
              width: 15px; 
              height: 15px;
              transition: transform 0.3s ease;
            }

            .botondeEditar:hover {
              background-color: rgb(135, 206, 235); 
            }

            .botondeEditar:active .icon {
              transform: translateY(-2px); 
            }


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
                margin: 0;
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


   
            .GridViewButtonContainer {
                display: flex;
                align-items: center;
            }

    </style>


</asp:Content>
