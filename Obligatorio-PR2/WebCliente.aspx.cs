using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obligatorio_PR2
{
    public partial class WebCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //List<Cliente> listaClientes = new List<Cliente>();
            //listaClientes.Add(new Cliente("Matias", "Delgado", 123, "San Carlos", 123, "matiasdels@gmail.com"));
            if (!IsPostBack)
            {
                //pagClientes.DataSource = BaseDeDatos.listaClientes;
                pagClientes.DataSource = BaseDeDatos.listaClientes;  
                pagClientes.DataBind();
                listaClientesDrop.DataSource = BaseDeDatos.listaClientes; 
                listaClientesDrop.DataTextField = "Nombre";
                listaClientesDrop.DataBind(); 
            }

        }

        protected void clickAgregarCliente(object sender, EventArgs e)
        {

            string nombreCliente;
            string apellidoCliente;
            string direccionCliente;
            string emailCliente;
            int cedulaCliente = 0; 
            int telefonoCliente = 0;

            
            while (true)
            {
                if (string.IsNullOrEmpty(txtCedulaCliente.Text))
                {
                    mensajeError.Text = "Debe agregar una cédula.";
                    mensajeError.Visible = true;
                    return;
                }

                if (int.TryParse(txtCedulaCliente.Text, out cedulaCliente))
                {
                    break; 
                }
                else
                {
                    mensajeError.Text = "La cédula debe ser un número válido.";
                    mensajeError.Visible = true;
                    return;
                }
            }

            
            while (true)
            {
                if (string.IsNullOrEmpty(txtTelefonoCliente.Text))
                {
                    mensajeError.Text = "Debe agregar un teléfono.";
                    mensajeError.Visible = true;
                    return;
                }

                if (int.TryParse(txtTelefonoCliente.Text, out telefonoCliente))
                {
                    break; // Salir del bucle si se convierte correctamente
                }
                else
                {
                    mensajeError.Text = "El teléfono debe ser un número válido.";
                    mensajeError.Visible = true;
                    return;
                }
            }

            
            while (true)
            {
                nombreCliente = txtNombreCliente.Text.Trim();
                if (string.IsNullOrEmpty(nombreCliente))
                {
                    mensajeError.Text = "Debe agregar un nombre.";
                    mensajeError.Visible = true;
                    return;
                }

                Regex regex = new Regex("^[a-zA-Z]+$");
                if (!regex.IsMatch(nombreCliente))
                {
                    mensajeError.Text = "El nombre solo puede contener letras sin espacios.";
                    mensajeError.Visible = true;
                    return;
                }
                nombreCliente = char.ToUpper(nombreCliente[0]) + nombreCliente.Substring(1).ToLower();
                break;
            }

            
            apellidoCliente = txtApellidoCliente.Text.Trim();
            if (string.IsNullOrEmpty(apellidoCliente))
            {
                mensajeError.Text = "Debe agregar un apellido.";
                mensajeError.Visible = true;
                return;
            }

            direccionCliente = txtDireccionCliente.Text.Trim();
            if (string.IsNullOrEmpty(direccionCliente))
            {
                mensajeError.Text = "Debe agregar una dirección.";
                mensajeError.Visible = true;
                return;
            }

            emailCliente = txtEmailCliente.Text.Trim();

            
            BaseDeDatos.AgregarCliente(nombreCliente, apellidoCliente, cedulaCliente, direccionCliente, telefonoCliente, emailCliente);

           
            ActualizarListas();

          
            txtNombreCliente.Text = "";
            txtApellidoCliente.Text = "";
            txtCedulaCliente.Text = "";
            txtDireccionCliente.Text = "";
            txtTelefonoCliente.Text = "";
            txtEmailCliente.Text = "";
            


        }


        public void ActualizarListas()
        {
            pagClientes.DataSource = BaseDeDatos.listaClientes;
            pagClientes.DataBind();

            listaClientesDrop.DataSource = BaseDeDatos.listaClientes;
            listaClientesDrop.DataTextField = "Nombre";
            listaClientesDrop.DataBind();
        }


    }

   



}