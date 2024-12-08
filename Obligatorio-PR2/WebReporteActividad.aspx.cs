using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obligatorio_PR2
{
    public partial class WebReporteActividad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panelResultado.Visible = false; 
                mensajeErrorBusquedaTecnico.Visible = false;
            }
        }
        protected void clickBuscarTecnico(object sender, EventArgs e)
        {
            string cedulaBuscada = Utilities.FormatearCedula(txtCedula.Text);
            int contadorCedula = 0;
            int ordenesPendientes = 0;
            int ordenesEnProgeso = 0;
            int ordenesCompletadas = 0;
            string nombreTecnico = "No encontrado";
            string apellidoTecnico = "No encontrado";

            foreach (var orden in BaseDeDatos.listaOrdenTrabajo)
            {
                if (Utilities.FormatearCedula(orden.cedulaTecnico) == cedulaBuscada)
                {
                    contadorCedula++;
                    if (orden.estado == "Pendiente")
                    {
                        ordenesPendientes++;
                    }
                    if (orden.estado == "En progreso") 
                    {
                        ordenesEnProgeso++;
                    }
                    if (orden.estado == "Completada") 
                    {
                        ordenesCompletadas++;
                    }
                }
            }

            if (contadorCedula == 0)
            {
                mensajeErrorBusquedaTecnico.Text = "No se encontró ningún técnico con esta cédula.";
                mensajeErrorBusquedaTecnico.Visible = true;
                return;
            }

            foreach (var tecnico in BaseDeDatos.listaTecnicos)
            {
                if (Utilities.FormatearCedula(tecnico.ci) == cedulaBuscada)
                {
                    nombreTecnico = tecnico.nombre;
                    apellidoTecnico = tecnico.apellido;
                    break;
                }
            }

            txtNombreTecnico.Text = nombreTecnico;
            txtApellidoTecnico.Text = apellidoTecnico;
            txtCedulaTecnico.Text = cedulaBuscada;
            txtOrdenesTotales.Text = contadorCedula.ToString();
            txtEstadoPendiente.Text = ordenesPendientes.ToString();
            txtEstadoEnProgreso.Text = ordenesEnProgeso.ToString();
            txtEstadoCompletadas.Text = ordenesCompletadas.ToString();

            panelResultado.Visible = true;
            mensajeErrorBusquedaTecnico.Visible = false;
        }

    }
}