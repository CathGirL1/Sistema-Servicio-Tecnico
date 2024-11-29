<%@ Page Title="Tecnico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebTecnico.aspx.cs" Inherits="Obligatorio_PR2.WebTecnico" %>

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

    <asp:Button ID="clickAgrTecnico" runat="server" Text="Agregar tecnico" OnClick="clickAgregarTecnico" CausesValidation="true"></asp:Button>
    <asp:Button ID="clickGrdTecnico" runat="server" Text="Guardar" OnClick="clickGuardarTecnico" CausesValidation="true" />

    <hr />
    <asp:TextBox ID="txtBuscarTecnico" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar" OnClick="clickBuscarTecnico" CausesValidation="false" />
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

                        <asp:Button ID="botonEditarTecnico" runat="server" Text="Editar" ForeColor="Blue"
                            CommandName="EditarTecnico" CommandArgument='<%# Container.DataItemIndex %>'
                            OnCommand="clickEditarTecnico" CausesValidation="false" />


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

   
            .GridViewButtonContainer {
                display: flex;
                align-items: center;
            }

    </style>


</asp:Content>
