using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
            string cedulaString;
            string cedulaConFormato;


            while (true)
            {
                cedulaString = txtCedulaCliente.Text.Trim();

                if (string.IsNullOrEmpty(cedulaString))
                {
                    mensajeError.Text = "Debe agregar una cédula.";
                    mensajeError.Visible = true;
                    return;
                }

                Regex cedulaFormatoCedula = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
                if (!cedulaFormatoCedula.IsMatch(cedulaString))
                {
                    mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
                    mensajeError.Visible = true;
                    return;
                }

                string cedulaSinFormato = cedulaString.Replace(".", "").Replace("-", "");
                if (int.TryParse(cedulaSinFormato, out cedulaCliente))
                {
                    cedulaConFormato = Utilities.FormatearCedula(cedulaSinFormato);
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
                    break;
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

                Regex regex = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
                if (!regex.IsMatch(nombreCliente))
                {
                    mensajeError.Text = "El nombre solo puede contener letras sin espacios.";
                    mensajeError.Visible = true;
                    return;
                }
                nombreCliente = char.ToUpper(nombreCliente[0]) + nombreCliente.Substring(1).ToLower();
                break;
            }


            while (true)
            {
                apellidoCliente = txtApellidoCliente.Text.Trim();
                if (string.IsNullOrEmpty(apellidoCliente))
                {
                    mensajeError.Text = "Debe agregar un apellido.";
                    mensajeError.Visible = true;
                    return;
                }
                Regex soloLetrasApellido = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
                if (!soloLetrasApellido.IsMatch(apellidoCliente))
                {
                    mensajeError.Text = "El apellido solo puede contener letras sin espacios.";
                    mensajeError.Visible = true;
                    return;
                }
                apellidoCliente = char.ToUpper(apellidoCliente[0]) + apellidoCliente.Substring(1).ToLower();
                break;
            }


            direccionCliente = txtDireccionCliente.Text.Trim();

            if (string.IsNullOrEmpty(direccionCliente))
            {
                mensajeError.Text = "Debe agregar una dirección.";
                mensajeError.Visible = true;
                return;
            }


            emailCliente = txtEmailCliente.Text.Trim();


            for (int x = 0; x < BaseDeDatos.listaClientes.Count; x++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaClientes[x].GetCi()) == cedulaConFormato)
                {
                    mensajeError.Text = "Ya hay un cliente con esta cédula.";
                    mensajeError.Visible = true;
                    return;


                }
                else if (BaseDeDatos.listaClientes[x].GetTelefono() == telefonoCliente)
                {
                    mensajeError.Text = "Ya hay un cliente con este telefono.";
                    mensajeError.Visible = true;
                    return;

                }
                else if (BaseDeDatos.listaClientes[x].GetEmail() == emailCliente)
                {
                    mensajeError.Text = "Ya hay un cliente con este email.";
                    mensajeError.Visible = true;
                    return;

                }
            }

            BaseDeDatos.AgregarCliente(nombreCliente, apellidoCliente, cedulaConFormato, direccionCliente, telefonoCliente, emailCliente);

            ActualizarListas();

            txtNombreCliente.Text = "";
            txtApellidoCliente.Text = "";
            txtCedulaCliente.Text = "";
            txtDireccionCliente.Text = "";
            txtTelefonoCliente.Text = "";
            txtEmailCliente.Text = "";

        }

        protected void clickEditarCliente(object sender, EventArgs e)
        {

            string cedulaCliente = txtCedulaCliente.Text.Trim();
            string nombreCliente = txtNombreCliente.Text.Trim();
            string apellidoCliente = txtApellidoCliente.Text.Trim();
            string direccionCliente = txtDireccionCliente.Text.Trim();
            string telefonoCliente = txtTelefonoCliente.Text.Trim();
            string emailCliente = txtEmailCliente.Text.Trim();
            bool encontrarCliente = false;


            for (int i = 0; i < BaseDeDatos.listaClientes.Count; i++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaClientes[i].GetCi()) == Utilities.FormatearCedula(cedulaCliente))
                {
                    encontrarCliente = true;
                }
            }
            if (!encontrarCliente)
            { // error
                mensajeError.Text = "El cliente no existe";
                mensajeError.Visible = true;
                return;
            }

            bool huboError = false;
            int numeroParseadoTelefono = 0;
            //validaciones

            string validacionNombre = Utilities.ValidarSoloTexto(nombreCliente);
            if (validacionNombre != string.Empty)
            {
                mensajeError.Text = validacionNombre;
                huboError = true;
            }

            string validacionApellido = Utilities.ValidarSoloTexto(apellidoCliente);
            if (validacionApellido != string.Empty)
            {
                mensajeError.Text = validacionApellido;
                huboError = true;
            }

            string validacionTelefono = Utilities.ValidarSoloInt(telefonoCliente);
            if (validacionTelefono != string.Empty)
            {
                mensajeError.Text = validacionTelefono;
                huboError = true;
            }
            else
            {
                numeroParseadoTelefono = int.Parse(telefonoCliente);
            }

            string validacionDireccion = Utilities.ValidarDireccion(direccionCliente);
            if (validacionDireccion != string.Empty)
            {
                mensajeError.Text = validacionDireccion;
                huboError = true;
            }

            string validacionEmail = Utilities.ValidarEmail(emailCliente);
            if (validacionEmail != string.Empty)
            {
                mensajeError.Text = validacionEmail;
                huboError = true;
            }
            // fin validaciones

            if (!huboError)
            {
                BaseDeDatos.EditarCliente(cedulaCliente, nombreCliente, apellidoCliente, direccionCliente, numeroParseadoTelefono, emailCliente);

                ActualizarListas();


                txtNombreCliente.Text = "";
                txtApellidoCliente.Text = "";
                txtCedulaCliente.Text = "";
                txtDireccionCliente.Text = "";
                txtTelefonoCliente.Text = "";
                txtEmailCliente.Text = "";
            }

        }

        protected void clickEliminarCliente(object sender, EventArgs e)
        {
            string cedulaClienteEliminarString;
            int cedulaEliminar = 0;
            string cedulaConFormato;

            cedulaClienteEliminarString = txtCedulaCliente.Text.Trim();

            if (string.IsNullOrEmpty(cedulaClienteEliminarString))
            {
                mensajeError.Text = "Debe agregar una cédula.";
                mensajeError.Visible = true;
                return;
            }

            Regex cedulaFormatoCedula = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
            if (!cedulaFormatoCedula.IsMatch(cedulaClienteEliminarString))
            {
                mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
                mensajeError.Visible = true;
                return;
            }

            string cedulaSinFormato = cedulaClienteEliminarString.Replace(".", "").Replace("-", "");
            if (int.TryParse(cedulaSinFormato, out cedulaEliminar))
            {
                cedulaConFormato = Utilities.FormatearCedula(cedulaSinFormato);
                
            }
            else
            {
                mensajeError.Text = "La cédula debe ser un número válido.";
                mensajeError.Visible = true;
                return;
            }
         

            bool buscarClienteElimnar = false;


            for (int i = 0; i < BaseDeDatos.listaClientes.Count; i++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaClientes[i].GetCi()) == cedulaConFormato)
                {
                    buscarClienteElimnar = true;
                }
            }
            if (!buscarClienteElimnar)
            { // error
                mensajeError.Text = "El cliente no existe";
                mensajeError.Visible = true;
                return;
            }


            BaseDeDatos.EliminarCliente(cedulaConFormato);

            ActualizarListas();

            mensajeError.Text = "Cliente eliminado correctamente.";
            mensajeError.Visible = true;

            // Para ocultarlo después de unos segundos, si es necesario
            System.Threading.Thread.Sleep(2000);  // (2 segundos)
            mensajeError.Visible = false;

            txtCedulaCliente.Text = "";
        }

        protected void ActualizarListas()
        {
            pagClientes.DataSource = BaseDeDatos.listaClientes;
            pagClientes.DataBind();


        }

        protected void ClickBuscarCliente(object sender, EventArgs e)
        {
            string cedulaCliente = txtBuscarCliente.Text.Trim();
            bool encontrarCliente = false;

            for (int i = 0; i < pagClientes.Rows.Count; i++)
            {
                GridViewRow filaGrilla = pagClientes.Rows[i];
                filaGrilla.Visible = true;
            }

            for (int i = 0; i < pagClientes.Rows.Count; i++)
            {
                GridViewRow filaGrilla = pagClientes.Rows[i];


                string cedulaGrilla = "";
                Label lblCedula = (Label)filaGrilla.Cells[3].FindControl("lblCedula");
                if (lblCedula != null)
                {
                    cedulaGrilla = lblCedula.Text.Trim();
                }


                if (Utilities.FormatearCedula(cedulaGrilla) == Utilities.FormatearCedula(cedulaCliente))
                {
                    filaGrilla.Visible = true;
                    encontrarCliente = true;
                }
                else
                {
                    filaGrilla.Visible = false;
                }
            }

            if (!encontrarCliente)
            {
                if (string.IsNullOrEmpty(cedulaCliente))
                {
                    ActualizarListas();
                    mensajeError.Text = "Cédula inválida..";
                    mensajeError.Visible = true;
                }
                else
                {
                    ActualizarListas();
                    mensajeError.Text = "El cliente no existe.";
                    mensajeError.Visible = true;
                }

            }
            else
            {
                mensajeError.Visible = false;
            }






        }
    }
}

    