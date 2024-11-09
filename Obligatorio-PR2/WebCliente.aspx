<%@ Page Title="Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebCliente.aspx.cs" Inherits="Obligatorio_PR2.WebCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

    <asp:Label ID="label2" runat="server" Text="Nombre: "></asp:Label>
    <asp:TextBox ID="txtNombreCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtNombreC" ControlToValidate="txtNombreCliente" ForeColor="Red" ErrorMessage="El nombre es requerido." Display="Dynamic" />
    <br />

    <asp:Label ID="label3" runat="server" Text="Apellido: "></asp:Label>
    <asp:TextBox ID="txtApellidoCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtApellidoC" ControlToValidate="txtApellidoCliente" ForeColor="Red" ErrorMessage="El apellido es requerido." Display="Dynamic" />
    <br/>

    <asp:Label ID="Label4" runat="server" Text="Cédula: "></asp:Label>
    <asp:TextBox ID="txtCedulaCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="rfvCedula" ControlToValidate="txtCedulaCliente" ForeColor="Red" ErrorMessage="La cédula es requerida." ErrorMessageDisplayLocation="Inline" ValidationExpression="^\d{1,2}\.\d{3}\.\d{3}$" />
    <br/>

    <asp:Label ID="Label5" runat="server" Text="telefono: "></asp:Label>
    <asp:TextBox ID="txtTelefonoCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtATelefonoC" ControlToValidate="txtTelefonoCliente" ForeColor="Red" ErrorMessage="El teléfono es requerido." Display="Dynamic" />
    <br/>

    <!-- Email -->
    <div style="text-align: left; margin-bottom: 10px;">
    <asp:Label ID="Label6" runat="server" Text="(Opcional) Email: "></asp:Label>
    <asp:TextBox ID="txtEmailCliente" TextMode="Email" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator  ID="txtEmailC"  runat="server" ControlToValidate="txtEmailCliente" ForeColor="Red" ErrorMessage="Ingrese un email válido." ValidationExpression="^[^@\s]*$|^[^@\s]+@[^@\s]+\.[^@\s]+$" />
    <br/>

    <hr />
    <asp:Label ID="Label7" runat="server" Text="direccion: "></asp:Label>
    <asp:TextBox ID="txtDireccionCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtDireccionC" ControlToValidate="txtDireccionCliente" ForeColor="Red" ErrorMessage="La dirección es requerida." Display="Dynamic" />
    <br/>

    <asp:Button ID="clickAgrCliente" runat="server" Text="Creación de cliente" OnClick="clickAgregarCliente" /> 
    <asp:Button ID="BotonEditar" runat="server" Text=" Editar cliente" OnClick="clickEditarCliente" />
    
    <hr />
    
    <br/>

   

   <asp:GridView runat="server" ID="pagClientes" AutoGenerateColumns="False" Width="100%">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID"/>
        <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
        <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>
        <asp:BoundField DataField="Ci" HeaderText="Ci"/>
        <asp:BoundField DataField="Telefono" HeaderText="Teléfono"/>
        <asp:BoundField DataField="Email" HeaderText="Email"/>
        <asp:BoundField DataField="Direccion" HeaderText="Dirección"/>
    </Columns>
    </asp:GridView>




    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>