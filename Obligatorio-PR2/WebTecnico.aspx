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
       <asp:TextBox ID="txtEspecialidadTecnico" runat="server" Width="169px" ></asp:TextBox>
   </div>
<asp:RequiredFieldValidator runat="server" ID="txtEspecialidadT" ControlToValidate="txtEspecialidadTecnico" ForeColor="Red" ErrorMessage="La especialidad es requerida." Display="Dynamic" />

    <br />
    
    <asp:Button ID="clickAgrTecnico" runat="server" Text="Agregar tecnico" OnClick="clickAgregarTecnico" CausesValidation="true"></asp:Button>
    <hr />
    <asp:TextBox ID="txtBuscarTecnico" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar" OnClick ="clickBuscarTecnico" CausesValidation ="false"/>
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
             
        </Columns>
            </asp:GridView>
     <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>
