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


            while (true)
            {
                apellidoCliente = txtApellidoCliente.Text.Trim();
                if (string.IsNullOrEmpty(apellidoCliente))
                {
                    mensajeError.Text = "Debe agregar un apellido.";
                    mensajeError.Visible = true;
                    return;
                }
                Regex soloLetrasApellido = new Regex("^[a-zA-Z]+$");
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
                if (BaseDeDatos.listaClientes[x].GetCi() == cedulaCliente)
                {
                    mensajeError.Text = "Ya hay un cliente con esta cédula.";
                    mensajeError.Visible = true;
                    return;
                     

                }else if (BaseDeDatos.listaClientes[x].GetTelefono() == telefonoCliente)
                {
                    mensajeError.Text = "Ya hay un cliente con este telefono.";
                    mensajeError.Visible = true;
                    return;

                }else if (BaseDeDatos.listaClientes[x].GetEmail() == emailCliente)
                {
                    mensajeError.Text = "Ya hay un cliente con este email.";
                    mensajeError.Visible = true;
                    return;

                }
            }

            BaseDeDatos.AgregarCliente(nombreCliente, apellidoCliente, cedulaCliente, direccionCliente, telefonoCliente, emailCliente);

           
            ActualizarListas();

          
            txtNombreCliente.Text = "";
            txtApellidoCliente.Text = "";
            txtCedulaCliente.Text = "";
            txtDireccionCliente.Text = "";
            txtTelefonoCliente.Text = "";
            txtEmailCliente.Text = "";
            


        }


        protected void ActualizarListas()
        {
            pagClientes.DataSource = BaseDeDatos.listaClientes;
            pagClientes.DataBind();

           
        }


    }

    internal struct NewStruct
    {
        public object Item1;
        public object Item2;

        public NewStruct(object item1, object item2)
        {
            Item1 = item1;
            Item2 = item2;
        }

        public override bool Equals(object obj)
        {
            return obj is NewStruct other &&
                   EqualityComparer<object>.Default.Equals(Item1, other.Item1) &&
                   EqualityComparer<object>.Default.Equals(Item2, other.Item2);
        }

        public override int GetHashCode()
        {
            int hashCode = -1030903623;
            hashCode = hashCode * -1521134295 + EqualityComparer<object>.Default.GetHashCode(Item1);
            hashCode = hashCode * -1521134295 + EqualityComparer<object>.Default.GetHashCode(Item2);
            return hashCode;
        }

        public void Deconstruct(out object item1, out object item2)
        {
            item1 = Item1;
            item2 = Item2;
        }

        public static implicit operator (object, object)(NewStruct value)
        {
            return (value.Item1, value.Item2);
        }

        public static implicit operator NewStruct((object, object) value)
        {
            return new NewStruct(value.Item1, value.Item2);
        }
    }
}