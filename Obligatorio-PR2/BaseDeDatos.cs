using System.Collections.Generic;
using System.Linq;
using Obligatorio_PR2;
// la grilla no deja mostrarla si las propiedades son privadas, la grilla es donde se mostrara la lista de clientes, tecicos, etc

internal class BaseDeDatos
{
    public static List<Cliente> listaClientes = new List<Cliente>();
    public static List<Tecnico> listaTecnicos = new List<Tecnico>();

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
                listaClientes[x].SetNombre(pNombre);
                listaClientes[x].SetApellido(pApellido);
                listaClientes[x].SetDireccion(pDireccion);
                listaClientes[x].SetTelefono(pTelefono);
                listaClientes[x].SetEmail(pEmail);
                break; 
            }
        }

    }


    static BaseDeDatos()
    {
        PreCargoClientes();
    }
    public static void PreCargoClientes()
    {
        Cliente cliente1 = new Cliente("Matias", "Delgado", "0000000", "aguante la calle pou", 09873632, "elMati@gmail.com");
        Cliente cliente2 = new Cliente("Cathy", "Sonderegger", "00010101", "que se acabe la politica", 12345678, "laCathy@gmail.com");
        listaClientes.Add(cliente1);
        listaClientes.Add(cliente2);
    }

}


