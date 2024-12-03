<%@ Page Title="OrdenTrabajo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebOrdenTrabajo.aspx.cs" Inherits="Obligatorio_PR2.WebOrdenTrabajo" %>


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

    <asp:Button ID="clickAgrOrdenTrabajo" runat="server" Text="Agregar orden de trabajo" OnClick="clickAgregarOrdenTrabajo" CausesValidation="true"></asp:Button>
    <hr />
    <asp:TextBox ID="txtBuscarOrdenTrabajo" runat="server"></asp:TextBox><asp:Button ID="BotonBuscar" runat="server" Text="Buscar Orden" OnClick="clickBuscarOrdenTrabajo" CausesValidation="false" />
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
                            OnCommand="clickVerComentarios" CausesValidation="false" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="mensajeError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
    <hr />
    <div>
        <h4>Agregar comentario:</h4>
        <br />
    </div>

    <br />

</asp:Content>

