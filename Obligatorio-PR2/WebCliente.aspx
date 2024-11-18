

<%@ Page Title="Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebCliente.aspx.cs" Inherits="Obligatorio_PR2.WebCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

    
    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelNombre" runat="server" Text="Nombre:"></asp:Label>
        <asp:TextBox ID="txtNombreCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtNombreC" ControlToValidate="txtNombreCliente" ForeColor="Red" ErrorMessage="El nombre es requerido." Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelApellido" runat="server" Text="Apellido:"></asp:Label>
        <asp:TextBox ID="txtApellidoCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtApellidoC" ControlToValidate="txtApellidoCliente" ForeColor="Red" ErrorMessage="El apellido es requerido." Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 20px;">
        <asp:Label ID="LabelCedula" runat="server" Text="Cédula:"></asp:Label>
        <asp:TextBox ID="txtCedulaCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="rfvCedula" ControlToValidate="txtCedulaCliente" ForeColor="Red" ErrorMessage="La cédula es requerida." ErrorMessageDisplayLocation="Inline" ValidationExpression="^\d{1,2}\.\d{3}\.\d{3}$" Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 8px;">
        <asp:Label ID="LabelTelefono" runat="server" Text="Telefono:"></asp:Label>
        <asp:TextBox ID="txtTelefonoCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtATelefonoC" ControlToValidate="txtTelefonoCliente" ForeColor="Red" ErrorMessage="El teléfono es requerido." Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 30px;">
        <asp:Label ID="LabelEmail" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="txtEmailCliente" TextMode="Email" runat="server"></asp:TextBox>
    </div>
    <asp:RegularExpressionValidator ID="txtEmailC" runat="server" ControlToValidate="txtEmailCliente" ForeColor="Red" ErrorMessage="Ingrese un email válido." ValidationExpression="^$|^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" />

    <hr />
    <div style="display: flex; gap: 3px;">
        <asp:Label ID="LabelDireccion" runat="server" Text="Dirección:"></asp:Label>
        <asp:TextBox ID="txtDireccionCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtDireccionC" ControlToValidate="txtDireccionCliente" ForeColor="Red" ErrorMessage="La dirección es requerida." Display="Dynamic" />

    <br />
    <asp:Button ID="clickAgrCliente" runat="server" Text="Agregar cliente" OnClick="clickAgregarCliente" CausesValidation="true" />
    <asp:Button ID="clickGrdCliente" runat="server" Text="Guardar" OnClick="clickGuardarCliente" CausesValidation="true" />
    
    <hr />

    <asp:TextBox ID="txtBuscarCliente" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar" OnClick ="ClickBuscarCliente" CausesValidation ="false"/>
        <asp:GridView runat="server" ID="pagClientes" AutoGenerateColumns="False" Width="105%">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:TemplateField HeaderText="Cédula">
            <ItemTemplate>
                <asp:Label ID="lblCedula" runat="server"
                    Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("Ci").ToString()) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
        <asp:TemplateField>
            <ItemTemplate>
                <div class="GridViewButtonContainer">
                    
                    <asp:Button ID="botonEditarCliente" runat="server" Text="Editar" ForeColor="Blue" 
                        CommandName="EditarCliente" CommandArgument='<%# Container.DataItemIndex %>' 
                        OnCommand="clickEditarCliente" CausesValidation="false" />

                   
                   <asp:LinkButton ID="botonDeEliminar" runat="server" CommandName="EliminarCliente"
                                CommandArgument='<%# Eval("Ci") %>' OnCommand="clickEliminarCliente" CausesValidation="false" CssClass="btnEliminar">
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
       
            /* estilo base del botón (btnEliminar) */
            .btnEliminar {
              width: 35px; /* tamaño del botón */
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
              width: 15px; /* tamaño del icono o sea la basuritaa */
              height: 15px;
              fill: white; /* color del icono */
              transition: all 0.3s ease;
            }

            .btnEliminar:hover {
              width: 40px; /* tamaño del desplazamiento */
              background-color: rgb(255, 69, 69);
            }

            .btnEliminar:hover::before {
              content: "Eliminar";
              position: absolute;
              left: 45px; /* esto seria para ajustar el texto pero capaz dejo solo la papelera por que es complicado q se vea la papelera y el texto a la vez */
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

            /* se asegurara  de que los botones estén alineados correctamente en la GridView */
            .GridViewButtonContainer {
              display: flex;
              align-items: center;
            }
        

    </style>
    

</asp:Content>
