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
        <asp:Label ID="labelDescripcion" runat="server" Text="Descripcion:"></asp:Label>
        <asp:TextBox ID="txtDescripcionOrden" runat="server"></asp:TextBox>
    </div>

    <asp:RequiredFieldValidator runat="server" ID="txtDescripcionO" ControlToValidate="txtDescripcionOrden" ForeColor="Red" ErrorMessage="La descripcion es reuqerida." Display="Dynamic" />

    <hr />

    <asp:Button ID="clickAgrOrdenTrabajo" runat="server" Text="Agregar Orden de trabajo" OnClick="clickAgregarOrdenTrabajo" CausesValidation="true"></asp:Button>
    <hr />
    <asp:TextBox ID="txtBuscarOrdenTrabajo" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar Orden" OnClick="clickBuscarOrdenTrabajo" CausesValidation="false" />
    <asp:GridView runat="server" ID="pagOrdenes" AutoGenerateColumns="False" Width="105%" AllowPaging="true" OnPageIndexChanging="AsegurarActualizacionGrilla">
        <Columns>
            <asp:BoundField DataField="numeroOrden" HeaderText="ID orden" />
            <asp:TemplateField HeaderText="Ci tecnico">
                <ItemTemplate>
                    <asp:Label ID="lblCedulaTecnico" runat="server"
                        Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("Ci").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--            Verificar si es necesario referencia a Ci en el agregar--%>
            <asp:TemplateField HeaderText="Ci cliente">
                <ItemTemplate>
                    <asp:Label ID="lblCedulaCliente" runat="server"
                        Text='<%# Obligatorio_PR2.Utilities.FormatearCedula(Eval("Ci").ToString()) %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:BoundField DataField="cedulaCliente" HeaderText="Ci cliente" />
            <asp:TemplateField HeaderText="Estado">
                <asp:ItemTemplate>
                    <asp:DropDownList ID="ddlOpcionesEstado" runat="server">
                        <asp:ListItem Text="Pendiente" Value="0" />
                        <asp:ListItem Text="En progreso" Value="1" />
                        <asp:ListItem Text="Completada" Value="2" />
                    </asp:DropDownList>
                </asp:ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="descripcionProblema" HeaderText="Descripcion del orden" />
            <asp:BoundField DataField="fechaAutomatica" HeaderText="fecha" /> 
           <%-- Formato fecha en asp o en c#--%>
        </Columns>
    </asp:GridView>
    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>
