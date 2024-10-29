internal class Persona
{
    public string nombre;
    public string apellido;
    public int ci;

    public Persona(string pNombre, string pApellido, int pCi)
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
    public int GetCi()
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
    public void SetCi(int pCi)
    {
        ci = pCi;
    }
}