using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obligatorio_PR2
{
    public partial class WebComentarios : System.Web.UI.Page
    {
        OrdenTrabajo orden;
        protected void Page_Load(object sender, EventArgs e)
        {
            // agarra el número del url del botón ver comentarios.
            string numeroOrden = Request.QueryString["numeroOrden"];

            // parsea string numeroOrden a int parseoNumeroOrden
            if (int.TryParse(numeroOrden, out int parseoNumeroOrden))
            {
                //Esto pone el número de orden en el título de la página.
                lblNumeroOrden.Text = numeroOrden;

                foreach (var ordenTrabajo in BaseDeDatos.listaOrdenTrabajo)
                {
                    if (ordenTrabajo.GetNumeroOrden() == parseoNumeroOrden)
                    {
                        orden = ordenTrabajo;
                        break;
                    }
                }
                if (orden != null)
                {
                    rptComentarios.DataSource = orden.Comentarios;
                    rptComentarios.DataBind();
                }
            }

        }
        protected void clickGuardarComentario(object sender, EventArgs e)
        {
            //Manda mensaje de error si se accedió desde otro lugar que no sea el botón ver comentarios y quieres guardar un comentario.
            if (orden == null)
            {
                lblError.Text = "No hay una orden válida seleccionada. Debes acceder desde el botón 'Ver comentarios'.";
                lblError.Visible = true;
            }
            // Si la orden no es null y la caja de texto no está vacia, agrega el comentario (Cree una nueva clase Comentario para no tocar la vieja por si no andaba).
            else if (orden != null && !string.IsNullOrWhiteSpace(txtComentarioOrden.Text))
            {
                Comentario nuevoComentario = new Comentario
                {
                    textoComentario = txtComentarioOrden.Text,
                    fechaComentario = DateTime.Now
                };

                // con la orden que creamos con el profe y una lista creada en OrdenTrabajo, agregamos el comentario.
                orden.Comentarios.Add(nuevoComentario);

                // asigna el comentario y actualiza el repetear cuando se añade comentario
                rptComentarios.DataSource = orden.Comentarios;
                rptComentarios.DataBind();

                // limpia la caja
                txtComentarioOrden.Text = string.Empty;
            }
        }
    }
}