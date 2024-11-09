internal class Persona
{
    public string nombre { get; set; }
    public string apellido { get; set; }
    public string ci { get; set; }

    public Persona(string pNombre, string pApellido, string pCi)
    {
        this.nombre = pNombre;
        this.apellido = pApellido;
        this.ci = pCi;
    }

    public string GetNombre()
    {
        return nombre;
    }
    public string GetApellido()
    {
        return apellido;
    }
    public string GetCi()
    {
        return ci;
    }

    public void SetNombre(string pNombre)
    {
        nombre = pNombre;
    }
    public void SetApellido(string pApellido)
    {
        apellido = pApellido;
    }
    public void SetCi(string pCi)
    {
        ci = pCi;
    }
}