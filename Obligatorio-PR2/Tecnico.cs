using System;

internal class Tecnico : Persona
{
    private string especialidad { get; set; }
    static int id { get; set;}
    static int contadorIds = 0;

    public Tecnico(string pNombre, string pApellido, int pCi, string pEspecialidad) : base(pNombre, pApellido, pCi)
    {
        Tecnico.contadorIds++;
        Tecnico.id = Tecnico.contadorIds;
        this.especialidad = pEspecialidad;
    }

    public string GetEspecialidad()
    {
        return especialidad;
    }
    public void SetEspecialidad(string pEspecialidad)
    {
        this.especialidad = pEspecialidad;
    }
    public int GetId()
    {
        return id;
    }
    public void SetId(int pId)
    {
        id = pId;
    }

}
