using System;
using System.Collections.Generic;


internal class BaseDeDatos
{
    static List<Cliente> listaClientes = new List<Cliente>();
    static List<Tecnico> listaTecnicos = new List<Tecnico>();

    public static List<Cliente> GetListaClientes()
    {
        return listaClientes;
    }

    public static List<Tecnico> GetTecnicos()
    {
        return listaTecnicos;
    }

    public static void AgregarCliente(string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail)
    {


        bool existeCliente = false;
        for (int x = 0; x < listaClientes.Count; x++)
        {

            if (listaClientes[x].GetCi() == pCi)
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

    public static void EliminarCliente(int pId)
    {
        for (int x = 0; x < listaClientes.Count; x++)
        {

            if (listaClientes[x].GetId() == pId)
            {
                listaClientes.RemoveAt(x);
                break;
            }
        }
    }
    public static void EditarCliente(int pId, string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail)
    {
        for (int x = 0; x < listaClientes.Count; x++)
        {
            if (listaClientes[x].GetId() == pId)
            {
                listaClientes[x].SetNombre(pNombre);
                listaClientes[x].SetApellido(pApellido);
                listaClientes[x].SetCi(pCi);
                listaClientes[x].SetDireccion(pDireccion);
                listaClientes[x].SetTelefono(pTelefono);
                listaClientes[x].SetEmail(pEmail);
            }
        }
    }
    public static void PreCargoClientes()
    {
        Cliente cliente1 = new Cliente("pepe", "gomez", 2342424, "la calle pou", 09873632, "pepe@gmail.com");
        Cliente cliente2 = new Cliente("pepe", "gomez", 2342424, "la calle pou", 09873632, "gomez@gmail.com");
        listaClientes.Add(cliente1);
        listaClientes.Add(cliente2);
    }

}


