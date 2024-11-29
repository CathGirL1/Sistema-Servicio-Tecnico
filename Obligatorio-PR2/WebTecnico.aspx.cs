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
    public partial class WebTecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pagTecnicos.DataSource = BaseDeDatos.listaTecnicos;
                pagTecnicos.DataBind();
                ApagarError(); 
            }
        }

        protected void clickAgregarTecnico(object sender, EventArgs e)
        {
            string nombreTecnico = txtNombreTecnico.Text.Trim();
            string apellidoTecnico = txtApellidoTecnico.Text.Trim(); 
            string especialidadTecnico = txtEspecialidadTecnico.Text.Trim();
            string cedulaTecnico = txtCedulaTecnico.Text.Trim();
            bool huboErrorAlAgregar = false;
            

            if (string.IsNullOrEmpty(cedulaTecnico))
            {
                mensajeError.Text = "Debe agregar una cédula.";
                mensajeError.Visible = true;
                return;
            }

            Regex cedulaFormatoCedula = new Regex(@"^(\d{1,2}[-\.]?\d{3}[-\.]?\d{3}|\d{6,8})$");
            if (!cedulaFormatoCedula.IsMatch(cedulaTecnico))
            {
                mensajeError.Text = "La cédula debe de ser numérica, opcionalmente con guiones o puntos.";
                mensajeError.Visible = true;
                return;
            }

            string cedulaConFormato = Utilities.FormatearCedula(cedulaTecnico);



            if (string.IsNullOrEmpty(nombreTecnico))
            {
                mensajeError.Text = "Debe agregar un nombre.";
                mensajeError.Visible = true;
                return;
            }

            Regex regex = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
            if (!regex.IsMatch(nombreTecnico))
            {
                mensajeError.Text = "El nombre solo puede contener letras sin espacios.";
                mensajeError.Visible = true;
                return;
            }
            nombreTecnico = char.ToUpper(nombreTecnico[0]) + nombreTecnico.Substring(1).ToLower();


            if (string.IsNullOrEmpty(apellidoTecnico))
            {
                mensajeError.Text = "Debe agregar un apellido.";
                mensajeError.Visible = true;
                return;
            }
            Regex soloLetrasApellido = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
            if (!soloLetrasApellido.IsMatch(apellidoTecnico))
            {
                mensajeError.Text = "El apellido solo puede contener letras sin espacios.";
                mensajeError.Visible = true;
                return;
            }
            apellidoTecnico = char.ToUpper(apellidoTecnico[0]) + apellidoTecnico.Substring(1).ToLower();


            if (string.IsNullOrEmpty(especialidadTecnico))
            {
                mensajeError.Text = "Debe agregar un apellido.";
                mensajeError.Visible = true;
                return;
            }
            Regex soloLetrasEspecialidad = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
            if (!soloLetrasEspecialidad.IsMatch(especialidadTecnico))
            {
                mensajeError.Text = "La especialidad solo puede contener letras sin espacios.";
                mensajeError.Visible = true;
                return;
            }
            especialidadTecnico = char.ToUpper(especialidadTecnico[0]) + especialidadTecnico.Substring(1).ToLower();



            for (int x = 0; x < BaseDeDatos.listaTecnicos.Count; x++)
            {
                if (Utilities.FormatearCedula(BaseDeDatos.listaTecnicos[x].GetCi()) == cedulaConFormato)
                {
                    mensajeError.Text = "Ya hay un tecnico con esta cédula.";
                    mensajeError.ForeColor = Color.Red;
                    mensajeError.Visible = true;
                    huboErrorAlAgregar = true;
                    break;


                }
            }

            if (!huboErrorAlAgregar)
            {
                BaseDeDatos.AgregarTecnico(nombreTecnico, apellidoTecnico, cedulaConFormato, especialidadTecnico);
                ActualizarListas();

                mensajeError.Text = "Tecnico agregado con éxito.";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Green;

               

                txtCedulaTecnico.Text = "";
                txtNombreTecnico.Text = "";
                txtApellidoTecnico.Text = "";
                txtEspecialidadTecnico.Text = "";
            }
           

        }

        protected void ActualizarListas()
        {
            int paginaActual = pagTecnicos.PageIndex;
            pagTecnicos.DataSource = BaseDeDatos.listaTecnicos;
            pagTecnicos.DataBind();
            pagTecnicos.PageIndex = paginaActual; 
        }

        protected void AsegurarActualizacionGrilla(object sender, GridViewPageEventArgs e)
        {
            pagTecnicos.PageIndex = e.NewPageIndex;
            ActualizarListas(); 
        }

        protected void clickBuscarTecnico(object sender, EventArgs e)
        {
            string cedulaTecnico = txtBuscarTecnico.Text.Trim();
            bool encontrarTecnico = false;

            for (int i = 0; i < pagTecnicos.Rows.Count; i++)
            {
                GridViewRow filaGrilla = pagTecnicos.Rows[i];
                filaGrilla.Visible = true;
            }

            for (int i = 0; i < pagTecnicos.Rows.Count; i++)
            {
                GridViewRow filaGrilla = pagTecnicos.Rows[i];


                string cedulaGrilla = "";
                Label lblCedula = (Label)filaGrilla.Cells[3].FindControl("lblCedula");
                if (lblCedula != null)
                {
                    cedulaGrilla = lblCedula.Text.Trim();
                }


                if (Utilities.FormatearCedula(cedulaGrilla) == Utilities.FormatearCedula(cedulaTecnico))
                {
                    filaGrilla.Visible = true;
                    encontrarTecnico = true;

                }
                else
                {
                    filaGrilla.Visible = false;
                }
            }

            if (!encontrarTecnico)
            {
                if (string.IsNullOrEmpty(cedulaTecnico))
                {
                    ActualizarListas();
                    mensajeError.Text = "Cédula inválida..";
                    mensajeError.Visible = true;
                }
                else
                {
                    ActualizarListas();
                    mensajeError.Text = "El tecnico no existe.";
                    mensajeError.Visible = true;
                }

            }
            else
            {
                mensajeError.Text = "Tecnico encontrado con éxito.";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Green;
            }
        }


        protected void clickEditarTecnico(object sender, CommandEventArgs e)
        {

            if (e.CommandName == "EditarTecnico")
            {
                int filaIndice = Convert.ToInt32(e.CommandArgument);

                GridViewRow fila = pagTecnicos.Rows[filaIndice];

                txtNombreTecnico.Text = fila.Cells[1].Text;
                txtApellidoTecnico.Text = fila.Cells[2].Text;
                txtEspecialidadTecnico.Text = fila.Cells[3].Text;

                Label lblCedula = (Label)fila.FindControl("lblCedula");
                if (lblCedula != null)
                {
                    txtCedulaTecnico.Text = lblCedula.Text;
                }

                ActualizarListas();
            }

        }

        protected void clickEliminarTecnico(object sender, CommandEventArgs e)
        {

            if (e.CommandName == "EliminarTecnico")
            {
                string cedula = e.CommandArgument.ToString();

                BaseDeDatos.EliminarTecnico(cedula);

                mensajeError.Text = "Técnico eliminado correctamente.";
                mensajeError.ForeColor = Color.Green;
                mensajeError.Visible = true;

                ActualizarListas();
            }

            txtCedulaTecnico.Text = "";
        }

        protected void clickGuardarTecnico(object sender, EventArgs e)
        {

            string cedulaTecnico = txtCedulaTecnico.Text.Trim();
            string nombreTecnico = txtNombreTecnico.Text.Trim();
            string apellidoTecnico = txtApellidoTecnico.Text.Trim();
            string especialidadTecnico = txtEspecialidadTecnico.Text.Trim();
            bool huboError = false;
            bool encontrarTecnico = false;
            Tecnico tecnicoEncontrado = null;

            for (int i = 0; i < BaseDeDatos.listaTecnicos.Count; i++)
            {

                if (Utilities.FormatearCedula(BaseDeDatos.listaTecnicos[i].GetCi()) == Utilities.FormatearCedula(cedulaTecnico))
                {
                    encontrarTecnico = true;
                    mensajeError.Text = "Ya hay un técnico con esta cédula.";
                    mensajeError.Visible = true;
                    mensajeError.ForeColor = Color.Red;

                    tecnicoEncontrado = BaseDeDatos.listaTecnicos[i];
                    break;
                }
            }

            if (!encontrarTecnico)
            {
                mensajeError.Text = "El cliente no existe";
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Red;
                return;
            }

            string validacionNombre = Utilities.ValidarSoloTexto(nombreTecnico);
            if (validacionNombre != string.Empty)
            {
                mensajeError.Text = validacionNombre;
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Red;
                huboError = true;
            }
            nombreTecnico = char.ToUpper(nombreTecnico[0]) + nombreTecnico.Substring(1).ToLower();


            string validacionApellido = Utilities.ValidarSoloTexto(apellidoTecnico);
            if (validacionApellido != string.Empty)
            {
                mensajeError.Text = validacionApellido;
                mensajeError.Visible = true;
                mensajeError.ForeColor = Color.Red;
                huboError = true;
            }
            apellidoTecnico = char.ToUpper(apellidoTecnico[0]) + apellidoTecnico.Substring(1).ToLower();

            if (!huboError)
            {

                BaseDeDatos.EditarTecnico(tecnicoEncontrado.nombre = nombreTecnico, tecnicoEncontrado.apellido = apellidoTecnico, tecnicoEncontrado.ci = cedulaTecnico, tecnicoEncontrado.especialidad = especialidadTecnico);

                ActualizarListas();
                mensajeError.Text = "Cliente editado con éxito.";
                mensajeError.ForeColor = Color.Green;
                mensajeError.Visible = true;
                txtNombreTecnico.Text = "";
                txtApellidoTecnico.Text = "";
                txtCedulaTecnico.Text = "";
                txtEspecialidadTecnico.Text = "";
            }
        }

        protected void ApagarError()
        {
            mensajeError.Visible = false;
        }

    }

}
