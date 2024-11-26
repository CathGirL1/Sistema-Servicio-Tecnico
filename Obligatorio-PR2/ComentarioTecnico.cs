using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class ComentarioTecnico
{
    public int id { get; set; }
    public static int incrementoIdComentario = 0;
    public string comentarioTec { get; set;}

    public ComentarioTecnico(string pComentarioTec)
    {
        this.id = ComentarioTecnico.incrementoIdComentario++;
        this.comentarioTec = pComentarioTec; 
    }


    public string GetComentarioTec()
    {
        return this.comentarioTec;
    }

    public int GetId()
    {
        return this.id; 
    }




}
