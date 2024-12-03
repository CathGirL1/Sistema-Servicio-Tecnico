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
            string numeroOrden = Request.QueryString["numeroOrden"];
            int parseoNumeroOrden = Int32.Parse(numeroOrden);
            for (int i = 0; i < BaseDeDatos.listaOrdenTrabajo.Count; i++)
            {
                if (BaseDeDatos.listaOrdenTrabajo[i].GetNumeroOrden() == parseoNumeroOrden)
                {
                    orden = BaseDeDatos.listaOrdenTrabajo[i];
                }
            }

            //Con esta orden metemos los comentarios para mostrarlos.
        }
    }
}