using Obligatorio_PR2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class OrdenTrabajo
{
    public int numeroOrden { get; set; } 
    public static int contadorOrden = 0;
    public string descripcionProblema { get; set; }
    public DateTime fechaAutomatica { get; set; }
    public string estado { get; set; }
    public string cedulaTecnico { get; set; }
    public string cedulaCliente { get; set; }
    public List<Comentario> Comentarios { get; set; } = new List<Comentario>();

    //List<string> listaComentariosTecnico { get; set; }

    public OrdenTrabajo(string pDescripcionProblema, string pCedulaCliente, string pCedulaTecnico, string pEstado = "Pendiente")
    {
        this.numeroOrden = OrdenTrabajo.contadorOrden++;
        this.descripcionProblema = pDescripcionProblema;
        this.estado = pEstado;
        this.fechaAutomatica = DateTime.Now.Date;
        this.cedulaTecnico = pCedulaTecnico;
        this.cedulaCliente = pCedulaCliente;
    }
    

    //(esto no estoy segura ya q la base de datos tiene la lista de clientes y tecnicos)

    // las listas de t y c se instancian aca ya q si no existe
    // el orden tampoco los datos de tecnico y cliente en el orden.

    //--------------------------------
    // la descripcion la pone el tecnico por lo tanto se pone por parametro
    // los comentarios tambien existen si el orden existe
    // estado no se pasa por parametro por que predeterinadamente esta en pendiente pero se creara una funcion para editar el metodo.

    // predeterminadamente la fecha actual siempre y por webForm o sea por lado asp se formatea a formato fecha. 
    // el comentario debe de ser de clase comentario ya q el comentario es del tecnico?? por lo tanto el comentario tiene 
    // el nombre del tecnico, id del tecnico? y texto.

    // los textbox  de ordenTrabajo se verian asi: cedula cliente(no se puede editar): cedula Tecnico(no se puede editar): estado(predeterminadamente esta en pendiente)
    // en editar el estado puede cambiar pero en el agregar no, descripcion: y la fecha no por que viene predeterminada en hora actual. 
    // en la lista se veria con: numero orden(incrementado),  la cedula tecnico, cedula cliente, estado de orden, descripcion, fecha de orden.

    // para la web form asp de orden de trabajo, pasar la fecha a formato fecha para que no aparezca la hora 
    // droplist para el estado las opciones. 
    // que se vea la grilla. 


    public int GetNumeroOrden()
    {
        return this.numeroOrden; 
    }

    public string GetEstado()
    {
        return this.estado;
    }

    public void SetEstado(string pEstado)
    {
        this.estado = pEstado; 
    }

    public string GetDescripcionProblema()
    {
        return this.descripcionProblema; 
    }

    public void SetDescripcionProblema(string pDescripcionProblema)
    {
        this.descripcionProblema = pDescripcionProblema; 
    }

    public DateTime GetFechaAutomatica()
    {
        return this.fechaAutomatica; 
    }

    public string GetCedulaTecnico()
    {
        return this.cedulaTecnico; 
    }

    public string GetCedulaCliente()
    {
        return this.cedulaCliente;
    }











}