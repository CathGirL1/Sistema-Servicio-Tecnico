<%@ Page Title="OrdenTrabajo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebOrdenTrabajo.aspx.cs" Inherits="Obligatorio_PR2.WebOrdenTrabajo" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp; 

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelCedulaCliente" runat="server" Text="Ci Cliente:"></asp:Label>
        <asp:TextBox ID="txtCedulaCliente" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtCedulaC" ControlToValidate="txtCedulaCliente" ForeColor="Red" ErrorMessage="La cedula del cliente es requerida." Display="Dynamic" />

    <hr />

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelCedulaTecnico" runat="server" Text="Ci Tecnico:"></asp:Label>
        <asp:TextBox ID="txtCedulaTecnico" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator runat="server" ID="txtCedulaT" ControlToValidate="txtCedulaTecnico" ForeColor="Red" ErrorMessage="La cedula del tecnico es requerida." Display="Dynamic" />

    <hr />

    <div style="display: flex; gap: 10px;">
        <asp:Label ID="labelCedula" runat="server" Text="Ci Cliente:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>

    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCedulaCliente" ForeColor="Red" ErrorMessage="La cedula del cliente es requerida." Display="Dynamic" />

    <hr />

</asp:Content>
