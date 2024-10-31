internal class Cliente : Persona
{

    public string direccion { get; set; }
    public int telefono { get; set; }
    public string email { get; set; }
    public int id { get;  set; }

    public static int contadorIds = 0; 
    public Cliente(string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail) : base(pNombre, pApellido, pCi)
    {
        Cliente.contadorIds++;
        this.id = Cliente.contadorIds;
        this.direccion = pDireccion;
        this.telefono = pTelefono;
        this.email = pEmail; 
    }

    

    public int GetId()
    {
        return id;
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
}