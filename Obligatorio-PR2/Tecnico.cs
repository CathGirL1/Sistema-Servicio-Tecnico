using System;

internal class Tecnico : Persona
{
    public string especialidad { get; set; }
    public int ID { get; set;}
    public static int contadorIds = 0;

    public Tecnico(string pNombre, string pApellido, string pCi, string pEspecialidad) : base(pNombre, pApellido, pCi)
    {
        Tecnico.contadorIds++;
        this.ID = Tecnico.contadorIds;
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
        return ID;
    }
    public void SetId(int pId)
    {
        this.ID = pId;
    }

}
