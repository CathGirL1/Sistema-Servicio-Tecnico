internal class Cliente : Persona
{

    private string direccion;
    private int telefono;
    private string email;
    static int id;
    static int contadorIds = 0;

    public Cliente(string pNombre, string pApellido, int pCi, string pDireccion, int pTelefono, string pEmail) : base(pNombre, pApellido, pCi)
    {
        Cliente.contadorIds++;
        Cliente.id = Cliente.contadorIds;
        this.direccion = pDireccion;
        this.telefono = pTelefono;
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