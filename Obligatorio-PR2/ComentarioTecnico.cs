using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class ComentarioTecnico
{
    public int id { get; set; }
    public static int incrementoIdComentario = 0;
    public string cedulaTecnico { get; set; }
    public string nombreTec { get; set; }
    public string comentarioTec { get; set;}

    public ComentarioTecnico(string pNombreTec, string pComentarioTec)
    {
        this.id = ComentarioTecnico.incrementoIdComentario++;
        this.nombreTec = pNombreTec;
        this.comentarioTec = pComentarioTec; 
    }

    public string GetNombreTec()
    {
        return this.nombreTec;
    }

    public string GetComentarioTec()
    {
        return this.comentarioTec;
    }

    public int GetId()
    {
        return this.id; 
    }

    public string GetCedulaTecnico()
    {
        return this.cedulaTecnico;
    }



}
