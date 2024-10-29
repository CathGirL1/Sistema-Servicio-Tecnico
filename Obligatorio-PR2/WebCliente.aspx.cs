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
            List<Cliente> listaClientes = new List<Cliente>();
            listaClientes.Add(new Cliente("Matias", "Delgado", 123, "San Carlos", 123, "matiasdels@gmail.com"));
            if (!IsPostBack)
            {
                //pagClientes.DataSource = BaseDeDatos.listaClientes;
                pagClientes.DataSource = listaClientes;
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
            string cedulaTextoCliente;
            string telefonoTextoCliente; 
            int cedulaCliente = 0;
            int telefonoCliente = 0; 
            

            while (true)
            {
                
                cedulaTextoCliente = txtCedulaCliente.Text;
                 
                                  
                if (int.TryParse(cedulaTextoCliente, out cedulaCliente))
                {
                    break;

                }else if (string.IsNullOrEmpty(txtCedulaCliente.Text))
                {
                    mensajeError.Text = "debe agregar una cedula";
                    mensajeError.Visible = true; 
                }
                
            }

            while (true)
            {

                telefonoTextoCliente = txtTelefonoCliente.Text;


                if (int.TryParse(telefonoTextoCliente, out telefonoCliente))
                {
                    break;

                }
                else if (string.IsNullOrEmpty(txtTelefonoCliente.Text))
                {
                    mensajeError.Text = "Debe agregar un teléfono.";
                    mensajeError.Visible = true;
                }

            }

            while (true)
            {
                apellidoCliente = txtApellidoCliente.Text;
                if (string.IsNullOrEmpty(txtApellidoCliente.Text))
                {
                    mensajeError.Text = "Debe agregar un apellido.";
                    mensajeError.Visible = true;
                    break; 
                }
            }

            while (true)
            {
                direccionCliente = txtDireccionCliente.Text;
                if (string.IsNullOrEmpty(txtDireccionCliente.Text))
                {
                    mensajeError.Text = "Debe agregar una dirección.";
                    mensajeError.Visible = true;
                    break; 
                }
            }


            while (true)
            {
                nombreCliente = txtNombreCliente.Text;
                if (string.IsNullOrEmpty(txtNombreCliente.Text))
                {
                    mensajeError.Text = "Debe agregar un nombre.";
                    mensajeError.Visible = true;
                    break;
                }
            }

            while (true)
            {
                emailCliente = txtEmailCliente.Text;
                if (string.IsNullOrEmpty(txtEmailCliente.Text))
                {
                    mensajeError.Text = "Debe agregar un email.";
                    mensajeError.Visible = true;
                    break;
                }
            }



            while (true)
            {
                nombreCliente = txtNombreCliente.Text.Trim();

                if (string.IsNullOrEmpty(nombreCliente))
                {
                    mensajeError.Text = "Debe agregar un nombre.";
                    mensajeError.Visible = true;
                    break;
                }

                Regex regex = new Regex("^[a-zA-Z]+$");
                if (!regex.IsMatch(nombreCliente))
                {
                    mensajeError.Text = "El nombre solo puede contener letras sin espacios.";
                    mensajeError.Visible = true;
                    break;
                }
                nombreCliente = char.ToUpper(nombreCliente[0]) + nombreCliente.Substring(1).ToLower();

            }

            pagClientes.DataSource = BaseDeDatos.listaClientes;
            pagClientes.DataBind();

            listaClientesDrop.DataSource = BaseDeDatos.listaClientes;
            listaClientesDrop.DataTextField = "Nombre";
            listaClientesDrop.DataBind();

            txtNombreCliente.Text = "";
            txtApellidoCliente.Text = "";
            txtCedulaCliente.Text = "";
            txtDireccionCliente.Text = "";
            txtTelefonoCliente.Text = "";
            txtEmailCliente.Text = "";


            BaseDeDatos.AgregarCliente(nombreCliente, apellidoCliente, cedulaCliente, direccionCliente, telefonoCliente, emailCliente);
            

        }
    }

   



}