<%@ Page Title="Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebCliente.aspx.cs" Inherits="Obligatorio_PR2.WebCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

    <asp:Label ID="Label1" runat="server" Text="Id: "></asp:Label>
    <asp:TextBox ID="txtIdCliente" TextMode="Number" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtIdC" ControlToValidate="txtIdCliente" ForeColor="Red" Text="el id es requerido"></asp:RequiredFieldValidator>
    <br/>

    <asp:Label ID="label2" runat="server" Text="Nombre: "></asp:Label>
    <asp:TextBox ID="txtNombreCliente" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtNombreC" ControlToValidate="txtNombreCliente" ForeColor="Red" Text="el nombre es requerido"></asp:RequiredFieldValidator>
    <br />

    <asp:Label ID="label3" runat="server" Text="Apellido: "></asp:Label>
    <asp:TextBox ID="txtApellidoCliente" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtApellidoC" ControlToValidate="txtApellidoCliente" ForeColor="Red" Text="el apellido es requerido"></asp:RequiredFieldValidator>
    <br/>

    <asp:Label ID="Label4" runat="server" Text="Cedula: "></asp:Label>
    <asp:TextBox ID="txtCedulaCliente" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtCedulaC" ControlToValidate="txtCedulaCliente" ForeColor="Red" Text="la cedula es requerida"></asp:RequiredFieldValidator>
    <br/>

    <asp:Label ID="Label5" runat="server" Text="telefono: "></asp:Label>
    <asp:TextBox ID="txtTelefonoCliente" TextMode="Number" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtATelefonoC" ControlToValidate="txtTelefonoCliente" ForeColor="Red" Text="el telefono es requerido"></asp:RequiredFieldValidator>
    <br/>

    <asp:Label ID="Label6" runat="server" Text="email: "></asp:Label>
    <asp:TextBox ID="txtEmailCliente" TextMode="Email" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtEmailC" ControlToValidate="txtEmailCliente" ForeColor="Red" Text="el email es requerido"></asp:RequiredFieldValidator>
    <br/>

    <asp:Label ID="Label7" runat="server" Text="direccion: "></asp:Label>
    <asp:TextBox ID="txtDireccionCliente" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="txtDireccionC" ControlToValidate="txtDireccionCliente" ForeColor="Red" Text="la direccion es requerida"></asp:RequiredFieldValidator>
    <br/>

    <asp:DropDownList ID="listaClientesDrop" runat="server"></asp:DropDownList>
    <asp:Button ID="clickAgrCliente" runat="server" Text="Creación de Cliente" OnClick="clickAgregarCliente" />


    <asp:GridView runat="server" ID="pagClientes">
    </asp:GridView>

    <%--<asp:ListView runat="server" ID="pagClientes">
    <ItemTemplate>
        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
    </ItemTemplate>
    </asp:ListView>--%>


    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>