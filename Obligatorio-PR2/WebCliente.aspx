

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
    <asp:RegularExpressionValidator ID="txtEmailC" runat="server" ControlToValidate="txtEmailCliente" ForeColor="Red" ErrorMessage="Ingrese un email válido." ValidationExpression="^[^@\s]*$|^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" />

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
    <asp:GridView runat="server" ID="pagClientes" AutoGenerateColumns="False" Width="100%" > 
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
                   
                    <asp:Button ID="botonEditarCliente" runat="server" Text="Editar" ForeColor="Blue" CommandName="EditarCliente" CommandArgument='<%# Container.DataItemIndex %>' OnCommand="clickEditarCliente" CausesValidation="false"/>  
                    <asp:Button ID="botonDeEliminar" runat="server" Text="x" ForeColor="Red" CommandName="EliminarCliente" CommandArgument='<%# Eval("Ci") %>' OnCommand="clickEliminarCliente" CausesValidation="false"/>
                
                 </ItemTemplate>  

            </asp:TemplateField>
        </Columns>
    
    </asp:GridView>




    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>
