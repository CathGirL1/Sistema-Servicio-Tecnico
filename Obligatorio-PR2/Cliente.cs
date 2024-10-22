using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;


public class Cliente
{
    private string nombre;
    private string apellido;
    private int ci;
    private string direccion;
    private int telefono;
    private string email;
    static int id = 0;
    static List<Cliente> listaClientes = new List<Cliente>();

    public Cliente(int pId, string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono)
    {
        Cliente.id++;
        Cliente.id = pId;
        this.nombre = pNombre;
        this.apellido = pApellido;
        this.ci = pCi;
        this.direccion = pDireccion;
        this.telefono = pTelefono; 
    }

    public Cliente(int pId, string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail)
    {
        Cliente.id++;
        Cliente.id = pId;
        this.nombre = pNombre;
        this.apellido = pApellido;
        this.ci = pCi;
        this.direccion = pDireccion;
        this.telefono = pTelefono;
        this.email = pEmail;
    }

    public int GetId()
    {
        return id;
    }

    public string GetNombre()
    {
        return nombre;
    }

    public string GetApellido()
    {
        return apellido;
    }

    public int GetCi()
    {
        return ci;
    }

    public string GetDireccion()
    {
        return direccion;
    }
    public int GetTelefono()
    {
        return telefono;
    }
    public string GetEmail() 
    { 
        return email;
    }

    public void SetNombre(string pNombre)
    {
        this.nombre = pNombre; 
    }

    public void SetApellido(string pApellido)
    {
        this.apellido = pApellido; 
    }

    public void SetCi(int pCi)
    {
        this.ci = pCi; 
    }

    public void SetDireccion(string pDireccion)
    {
        this.direccion = pDireccion; 
    }

    public void SetTelefono(int pTelefono)
    {
        this.telefono = pTelefono; 
    }

    public void SetEmail(string pEmail)
    {
        this.email = pEmail;
    }


    public List<Cliente> GetListaClientes()
    {
        return listaClientes; 
    }

    public void AgregarCliente(int pId, string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail)
    {

        bool existeCliente = false;

        for (int x = 0; x < listaClientes.Count; x++)
        {
           
            if (listaClientes[x].GetId() == pId)
            {
                existeCliente = true;
                break; 
            }
            else
            {   // agregar cliente va afuera del for; 
                // funciones agregar, editar y eliminar en base de datos y deben de ser estaticas. 
                //las funciones se llamarian dentro de tipo interface.
                Cliente unClienten = new Cliente(pId, pNombre, pApellido, pCi, pDireccion, pTelefono, pEmail);
                listaClientes.Add(unClienten);
                existeCliente = false;
                break; 

            }
        }

    }



    public void EliminarCliente(int pId)
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

    public void EditarCliente(int pId, string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail)
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







}