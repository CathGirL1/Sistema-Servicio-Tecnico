using System.Collections.Generic;
using System.Linq;
using Obligatorio_PR2;
// la grilla no deja mostrarla si las propiedades son privadas, la grilla es donde se mostrara la lista de clientes, tecicos, etc

internal class BaseDeDatos
{
    public static List<Cliente> listaClientes = new List<Cliente>();
    public static List<Tecnico> listaTecnicos = new List<Tecnico>();
    public static List<OrdenTrabajo> listaOrdenTrabajo = new List<OrdenTrabajo>();
    public static List<ComentarioTecnico> listaComentarioTecnico = new List<ComentarioTecnico>();

    public static void AgregarCliente(string pNombre, string pApellido, string pCi, string pDireccion, int pTelefono, string pEmail)
    {

        bool existeCliente = false;
        for (int x = 0; x < listaClientes.Count; x++)
        {

            if (Utilities.FormatearCedula(listaClientes[x].GetCi()) == Utilities.FormatearCedula(pCi) || listaClientes[x].GetEmail() == pEmail || listaClientes[x].GetTelefono() == pTelefono)
            {
                existeCliente = true;
                break;
            }
        }
        if (!existeCliente)
        {
            //las funciones se llamarian dentro de tipo interface.
            Cliente nuevoCliente = new Cliente(pNombre, pApellido, pCi, pDireccion, pTelefono, pEmail);
            listaClientes.Add(nuevoCliente);
        }
    }

    public static void EliminarCliente(string pCi)
    {
        for (int x = 0; x < listaClientes.Count; x++)
        {

            if (Utilities.FormatearCedula(listaClientes[x].GetCi()) == Utilities.FormatearCedula(pCi))
            {
                listaClientes.RemoveAt(x);
                break;
            }
        }
    }
    public static void EditarCliente(string pCi, string pNombre, string pApellido, string pDireccion, int pTelefono, string pEmail)
    {
        for (int x = 0; x < listaClientes.Count; x++)
        {
            if (listaClientes[x].GetCi() == pCi)
            {
                listaClientes[x].nombre = pNombre;
                listaClientes[x].apellido = pApellido;
                listaClientes[x].direccion = pDireccion;
                listaClientes[x].telefono = pTelefono;
                listaClientes[x].email = pEmail;
                break;
            }
        }

    }


    static BaseDeDatos()
    {
        PreCargoClientes();
        PreCargoTecnicos();

    }
    public static void PreCargoClientes()
    {
        Cliente cliente1 = new Cliente("Matias", "Delgado", "0000000", "aguante la calle pou", 09873632, "elMati@gmail.com");
        Cliente cliente2 = new Cliente("Cathy", "Sonderegger", "00010101", "que se acabe la politica", 12345678, "laCathy@gmail.com");
        listaClientes.Add(cliente1);
        listaClientes.Add(cliente2);

    }


    public static void PreCargoTecnicos()
    {
        Tecnico unTecnico1 = new Tecnico("Mati", "Delgado", "12345678", "Programador");
        Tecnico unTecnico2 = new Tecnico("Cathy", "Sonderegger", "87654321", "Programador");
        listaTecnicos.Add(unTecnico1);
        listaTecnicos.Add(unTecnico2);

    }


    public static void AgregarTecnico(string pNombre, string pApellido, string pCi, string pEspecialidad)
    {
        bool existeTecnico = false;

        for (int x = 0; x < listaTecnicos.Count; x++)
        {
            if (Utilities.FormatearCedula(listaTecnicos[x].GetCi()) == Utilities.FormatearCedula(pCi))
            {
                existeTecnico = true;
                break;
            }
        }

        if (!existeTecnico)
        {
            Tecnico unNuevoTecnico = new Tecnico(pNombre, pApellido, pCi, pEspecialidad);
            listaTecnicos.Add(unNuevoTecnico);
        }
    }


    public void AgregarOrdenTrabajo(string pDescripcionProblema, string pCedulaCliente, string pCedulaTecnico)
    {
        Tecnico unTecnicoEncontrado = null;
        Cliente unClienteEncontrado = null;

        for (int x = 0; x < listaClientes.Count; x++)
        {

            if (Utilities.FormatearCedula(listaClientes[x].GetCi()) == Utilities.FormatearCedula(pCedulaCliente))
            {
                unClienteEncontrado = listaClientes[x];
                break; 
            }


        }

        for (int x = 0; x < listaTecnicos.Count; x++)
        {

            if (Utilities.FormatearCedula(listaTecnicos[x].GetCi()) == Utilities.FormatearCedula(pCedulaTecnico))
            {
                unTecnicoEncontrado = listaTecnicos[x];
                break;
            }


        }

        // si el cliente y el tecnico fueron encontrados en memoria o sea no es null se agrega el pedido.

        if (unClienteEncontrado != null && unTecnicoEncontrado != null)
        {
            OrdenTrabajo unNuevoOrdenTrabajo = new OrdenTrabajo(pDescripcionProblema, pCedulaCliente, pCedulaTecnico);
            listaOrdenTrabajo.Add(unNuevoOrdenTrabajo); 
        }
    }


    public void EditarEstado(int pNumeroOrden, string pEstado)
    {
        for (int y = 0; y < listaOrdenTrabajo.Count; y++)
        {
            if (listaOrdenTrabajo[y].GetNumeroOrden() == pNumeroOrden)
            {
                listaOrdenTrabajo[y].estado = pEstado;
                break; 
            }
        }
    }

    public void AgregarComentario(ComentarioTecnico pComentario)
    {
        listaComentarioTecnico.Add(pComentario);
    }


}



