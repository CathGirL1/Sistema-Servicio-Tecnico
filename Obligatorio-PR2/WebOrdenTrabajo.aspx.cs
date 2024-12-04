using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obligatorio_PR2
{
    public partial class WebOrdenTrabajo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                pagOrdenes.DataSource = BaseDeDatos.listaOrdenTrabajo;
                pagOrdenes.DataBind();
                ApagarError();

                // se carga la grilla con las ordenes del tecnico correspondiente si existe el tecnico logeado
                //if (Session["Tecnico"] != null)
                //{
                //    CargarOrdenesDeTrabajo();
                //}
                //    // si no esta registrado el tecnico, mostramos el formulario de login con mesnaje de error
                //    mensajeError.Text = "el tecnico no esta registrado.";
                //    mensajeError.ForeColor = Color.Red;
                //    mensajeError.Visible = true;
                //}
            }
        }

        protected void CargarOrdenesDeTrabajo()
        {
            // se obtiene el tecnico desde la sesion
            Tecnico tecnico = (Tecnico)Session["Tecnico"];
             

            List<OrdenTrabajo> ordenesDelTecnicoEncontrado = new List<OrdenTrabajo>();

            // aca se busca la cedula del tecnico en la lista de las ordenes que coincidan con un tecnico
            // si existe, se guarda la lista de pedidos de ese tecnico

            for (int x = 0; x < BaseDeDatos.listaOrdenTrabajo.Count; x++)
            {
                  if (Utilities.FormatearCedula(BaseDeDatos.listaOrdenTrabajo[x].GetCedulaTecnico()) == Utilities.FormatearCedula(tecnico.GetCi()))
                  {
                      ordenesDelTecnicoEncontrado.Add(BaseDeDatos.listaOrdenTrabajo[x]);
                      
                  }
            }

            if (ordenesDelTecnicoEncontrado.Count > 0)
            {
                // si se encontro el tecnico se ponen los pedidos del tecnico en la grilla
                pagOrdenes.DataSource = ordenesDelTecnicoEncontrado;
                pagOrdenes.DataBind();
            }
            else
            {
                pagOrdenes.DataSource = null; // limpia la grilla
                pagOrdenes.DataBind();
                mensajeError.Text = "No tienes órdenes registradas.";
                mensajeError.Visible = true;
            }

        }

        //protected void botonLoginClick(object sender, EventArgs e)
        //{
        //    string cedulaTecnicoLogin = txtLoginCedulaTecnico.Text; 
        //    if (string.IsNullOrEmpty(cedulaTecnicoLogin))
        //    {
        //        mensajeError.Text = "Debe agregar una cédula.";
        //        mensajeError.Visible = true;
               
        //        return;
        //    }

        //    Regex cedulaFormatoCedulaTecnicoLogin = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
        //    if (!cedulaFormatoCedulaTecnicoLogin.IsMatch(cedulaTecnicoLogin))
        //    {
        //        mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
        //        mensajeError.Visible = true;
        //        return;
        //    }

        //    string cedulaConFormatoTLogin = Utilities.FormatearCedula(cedulaTecnicoLogin);

            
        //    Tecnico unTecnico = BuscarTecnico(cedulaConFormatoTLogin); 

           

        //    if (unTecnico != null)
        //    {
        //        // si el tecnico existe y no es null, lo almacenamos en la sesion
        //        Session["Tecnico"] = unTecnico;
        //        // se cargan las ordenes del tecnico encontrado
        //        CargarOrdenesDeTrabajo();
        //        // se oculta el login

        //    }
        //    else
        //    {
        //        // si no se encuentra el tecnico, mostramos un mensaje de error
        //        mensajeErrorLogin.Text = "Cédula incorrecta. verifique que esta cedula aeste registrada.";
        //        mensajeErrorLogin.Visible = true;
        //    }

        //    txtLoginCedulaTecnico.Text = "";
        //}

        private Tecnico BuscarTecnico(string pCedulaTecnico)
        {
           
            for (int x = 0; x < BaseDeDatos.listaTecnicos.Count; x++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaTecnicos[x].GetCi()) == Utilities.FormatearCedula(pCedulaTecnico))
                {
                    return BaseDeDatos.listaTecnicos[x]; 
                    
                }
            }
            return null;  
        }


        protected void ActualizarListas()
        {
            int paginaActual = pagOrdenes.PageIndex;
            pagOrdenes.DataSource = BaseDeDatos.listaOrdenTrabajo;
            pagOrdenes.DataBind();
            pagOrdenes.PageIndex = paginaActual;
            
        }

        protected void AsegurarActualizacionGrilla(object sender, GridViewPageEventArgs e)
        {
            pagOrdenes.PageIndex = e.NewPageIndex;
            ActualizarListas();
        }
        protected void clickAgregarOrdenTrabajo(object sender, EventArgs e)
        {
            string cedulaCliente = txtCedulaCliente.Text;
            string cedulaTecnico = txtCedulaTecnico.Text;
            string descripcionOrden = txtDescripcionOrden.Text;
            bool huboError = false; 


            if (string.IsNullOrEmpty(cedulaCliente))
            {
                mensajeError.Text = "Debe agregar una cédula.";
                mensajeError.Visible = true;
                return;
            }

            Regex cedulaFormatoCedulaCliente = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
            if (!cedulaFormatoCedulaCliente.IsMatch(cedulaCliente))
            {
                mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
                mensajeError.Visible = true;
                return;
            }

            string cedulaConFormatoC = Utilities.FormatearCedula(cedulaCliente);

            if (string.IsNullOrEmpty(cedulaTecnico))
            {
                mensajeError.Text = "Debe agregar una cédula.";
                mensajeError.Visible = true;
                return;
            }

            Regex cedulaFormatoCedulaTecnico = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
            if (!cedulaFormatoCedulaTecnico.IsMatch(cedulaTecnico))
            {
                mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
                mensajeError.Visible = true;
                return;
            }

            string cedulaConFormatoT = Utilities.FormatearCedula(cedulaTecnico);

            if (!BaseDeDatos.ValidarCedulaCliente(BaseDeDatos.listaClientes, cedulaConFormatoC))
            {
                mensajeError.Text = "No hay un cliente con esta cédula.";
                mensajeError.ForeColor = Color.Red;
                mensajeError.Visible = true;
                huboError = true;
            }


            if (!BaseDeDatos.ValidarCedulaTecnico(BaseDeDatos.listaTecnicos, cedulaConFormatoT))
            {
                mensajeError.Text = "No hay un tecnico con esta cédula.";
                mensajeError.ForeColor = Color.Red;
                mensajeError.Visible = true;
                huboError = true;
            }

            if (!huboError)
            {
                string estadoInicial = "Pendiente";

                
                BaseDeDatos.AgregarOrdenTrabajo(descripcionOrden, cedulaConFormatoC, cedulaConFormatoT, estadoInicial);
                ActualizarListas();  

               
                mensajeError.Text = "Orden agregada con éxito.";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Green;

               
                txtCedulaCliente.Text = "";
                txtCedulaTecnico.Text = "";
                txtDescripcionOrden.Text = "";
            }

        }

       

        protected void clickBuscarOrdenTrabajo(object sender, EventArgs e)
        {
            string cedulaONumeroOrden = txtBuscarOrdenTrabajo.Text.Trim();
            bool encontrado = false;

            // se muestran todas las filas inicialmente
            for (int i = 0; i < pagOrdenes.Rows.Count; i++)
            {
                GridViewRow fila = pagOrdenes.Rows[i];
                fila.Visible = true;
            }

            // se busca en las filas
            for (int i = 0; i < pagOrdenes.Rows.Count; i++)
            {
                GridViewRow fila = pagOrdenes.Rows[i];
                //se recorre las filas y segunn donde se este iterando se referencia el numeroOrden al asp de la grilla o la cedula
                Label lblNumeroOrden = fila.FindControl("numeroOrdenRederencia") as Label;
                Label lblCedulaCliente = fila.FindControl("lblCedulaCliente") as Label;

                if (lblNumeroOrden != null && lblCedulaCliente != null)
                {
                    // se compara si el numero de Orden buscado es existente en la grilla o si la cedula del cliente que ingreso en la bbusqueda
                    // se encuentra existente en la lista
                    if (lblNumeroOrden.Text == cedulaONumeroOrden ||
                        Utilities.FormatearCedula(lblCedulaCliente.Text) == Utilities.FormatearCedula(cedulaONumeroOrden))
                    {
                        fila.Visible = true;
                        encontrado = true;
                    }
                    else
                    {
                        fila.Visible = false;
                    }
                }
            }

            // se muestra los mensajes segun el resultado
            if (!encontrado)
            {
                mensajeError.Text = "No se encontraron pedidos de esta cedula o numero de orden ingresados.";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Red;
            }
            else
            {
                mensajeError.Text = "Búsqueda con exito.";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Green;
            }

        }

        protected void seleccionarOpcionDropList(object sender, EventArgs e)
        {
            // es EventArgs no GridViewPageEventArgs por que al ser evento de la propiedad del objeto y no de la gridview, se esta haciendo 
            // evento del estado no de la grilla en si 

            DropDownList ddlEstado = (DropDownList)sender;

            // la fila de la DropDownList
            GridViewRow fila = (GridViewRow)ddlEstado.NamingContainer;

            // se obtiene el nuemro de la fila de la dropDownList con la referencia del orden
            int numeroOrden = int.Parse(((Label)fila.FindControl("numeroOrdenRederencia")).Text);

            // se obtiene el nuevo estado que se selecciono en las opciones para editar
            string nuevoEstado = ddlEstado.SelectedValue;

            //  validar que se selecciono si se selecciono, se guarda la opcion seleccionada
            if (!string.IsNullOrEmpty(nuevoEstado) && nuevoEstado != "Seleccione una opción")
            {
                // se almacena el estado utilizando el método de la base de datos, es predeterminado pendiente pero 
                // una vez que se elije la opcion se almacena y se actualiza el estado. 
                BaseDeDatos.EditarEstado(numeroOrden, nuevoEstado);

                // se actaliza la grilla con el estado seleccionado
                ActualizarListas();

                // se muestra mensaje de que se edito con exito el estado
                mensajeError.Text = "El estado se edito con exito.";
                mensajeError.ForeColor = Color.Green;
                mensajeError.Visible = true;
            }
            

        }

        protected void clickVerComentarios(object sender, EventArgs e)
        {
            //Para redirigir desde ordenTrabajo a la ventana comentarios.
            int indiceOrden = Int32.Parse(((Button)sender).CommandArgument);
            int numeroOrden = (BaseDeDatos.listaOrdenTrabajo[indiceOrden]).numeroOrden;
            Response.Redirect("~/WebComentarios.aspx?numeroOrden=" + numeroOrden);


        }

        //protected void clickGuardarComentario(object sender, EventArgs e)
        //{
        //    string unComentario = txtComentarioOrden.Text; 
        //    string unIdOrden = txtBuscarOrdenTrabajo.Text;
        //    string validarIdOrden = Utilities.ValidarSoloInt(unIdOrden); 
            

        //}

        protected void ApagarError()
        {
            mensajeError.Visible = false; 
        }
    }
}