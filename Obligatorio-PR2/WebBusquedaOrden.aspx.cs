using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obligatorio_PR2
{
    public partial class WebBusquedaOrden : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InicializarFormulario();
               
            }
        }


        protected void clickBuscarOrdenTrabajo(object sender, EventArgs e)
        {
            OrdenTrabajo unOrden = null;
            Cliente unCliente = null;
            Tecnico unTecnico = null; 

            string idOrden = txtBuscarOrdenTrabajo.Text;
            string validarIdOrden = Utilities.ValidarSoloInt(idOrden);
            int idOrdenParseado = 0;

            if (validarIdOrden != string.Empty)
            {
                mensajeErrorBusquedaOrden.Text = validarIdOrden;
                mensajeErrorBusquedaOrden.Visible = true;
                mensajeErrorBusquedaOrden.ForeColor = Color.Red;
                return; //  si hay un error en la validación se sale
            }

            idOrdenParseado = int.Parse(idOrden);

            for (int x = 0; x < BaseDeDatos.listaOrdenTrabajo.Count; x++)
            {
                if (BaseDeDatos.listaOrdenTrabajo[x].GetNumeroOrden() == idOrdenParseado)
                {
                    unOrden = BaseDeDatos.listaOrdenTrabajo[x];
                    break;
                }
            }

            if (unOrden == null)
            {
                mensajeErrorBusquedaOrden.Text = "Esta orden no existe, intente buscar de nuevo añadiendo otro id...";
                mensajeErrorBusquedaOrden.ForeColor = Color.Red;
                mensajeErrorBusquedaOrden.Visible = true;
                return; // se sale si no se encontró la orden
            }

            for (int j = 0; j < BaseDeDatos.listaClientes.Count; j++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaClientes[j].GetCi()) == Utilities.FormatearCedula(unOrden.GetCedulaCliente()))
                {
                    unCliente = BaseDeDatos.listaClientes[j];
                    break;
                }
            }

            if (unCliente == null)
            {
                mensajeErrorBusquedaOrden.Text = "No se encontró un cliente asociado a esta orden.";
                mensajeErrorBusquedaOrden.ForeColor = Color.Red;
                mensajeErrorBusquedaOrden.Visible = true;
                return; // se sale si no se encontró el cliente
            }


            for (int c = 0; c < BaseDeDatos.listaTecnicos.Count; c++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaTecnicos[c].GetCi()) == Utilities.FormatearCedula(unOrden.GetCedulaTecnico()))
                {
                    unTecnico = BaseDeDatos.listaTecnicos[c];
                    break;
                }
            }

            if (unTecnico == null)
            {
                mensajeErrorBusquedaOrden.Text = "No se encontró un tecnico asociado a esta orden.";
                mensajeErrorBusquedaOrden.ForeColor = Color.Red;
                mensajeErrorBusquedaOrden.Visible = true;
                return; 
            }

            // si todo esta bien se muestran los datos
            txtNumeroOrden.Text = unOrden.numeroOrden.ToString();
            txtDescripcionOrden.Text = unOrden.descripcionProblema;
            txtFechaOrden.Text = unOrden.fechaAutomatica.ToString("dd/MM/yyyy");
            txtEstadoOrden.Text = unOrden.estado;

            txtApellidoCliente.Text = unCliente.apellido;
            txtNombreCliente.Text = unCliente.nombre;
            txtTelefonoCliente.Text = unCliente.telefono.ToString();
            txtEmailCliente.Text = unCliente.email;
            txtDireccionCliente.Text = unCliente.direccion;
            txtCedulaCliente.Text = unCliente.ci.ToString();

            txtCedulaTecnico.Text = unTecnico.ci.ToString();
            txtNombreTecnico.Text = unTecnico.nombre;
            txtApellidoTecnico.Text = unTecnico.apellido;
            txtEspecialidadTecnico.Text = unTecnico.especialidad; 

            // ocultamos mensajes de error y mostramos detalles
            mensajeErrorBusquedaOrden.Visible = false;
            panelDetalles.Visible = true;

            // se vinculan los comentarios
            rptComentarios.DataSource = unOrden.Comentarios;
            rptComentarios.DataBind();
        }

        private void InicializarFormulario()
        {
            panelDetalles.Visible = false; 
        }

    }

   
}