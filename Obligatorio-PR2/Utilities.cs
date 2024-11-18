using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using Antlr.Runtime;

namespace Obligatorio_PR2
{
    public class Utilities
    {
        public static string ValidarSoloTexto(string texto)
        {
            string mensajeError = string.Empty; 
            Regex regex = new Regex("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");

            if (string.IsNullOrEmpty(texto))
            {
                mensajeError = "Debe completar este campo.";
                return mensajeError;
            }
            if (!regex.IsMatch(texto))
            {
                mensajeError = "Este campo puede contener letras sin espacios.";
                return mensajeError;
            }

            return mensajeError; 
        }

        public static string FormatearCedula(string pCedula)
        {
            pCedula = new string(pCedula.Where(char.IsDigit).ToArray());

            if (pCedula.Length == 8)
            {
                return $"{pCedula.Substring(0, 2)}.{pCedula.Substring(2, 3)}.{pCedula.Substring(5, 3)}";
            }
            else if (pCedula.Length == 7)
            {
                return $"{pCedula.Substring(0, 1)}.{pCedula.Substring(1, 3)}.{pCedula.Substring(4, 3)}";
            }
            else if (pCedula.Length == 6)
            {
                return $"{pCedula.Substring(0, 3)}.{pCedula.Substring(3, 3)}";
            }

            return pCedula;
        }


        public static string ValidarSoloInt(string numero)
        {
            
            string mensajeError = string.Empty;
            if (string.IsNullOrEmpty(numero))
            {
                mensajeError = "Debe completar este campo.";
            }

            if (!numero.All(char.IsDigit))
            {
                mensajeError = "Este campo solo puede contener dígitos numericos.";
            }
            return mensajeError;
        }

        public static string ValidarDireccion(string direccion)
        {
            string mensajeError = string.Empty;
            if (string.IsNullOrEmpty(direccion))
            {
                mensajeError = "Debe agregar una dirección.";
            }
            Regex regex = new Regex(@"^[a-zA-Z0-9\s.,-]+$");
            if (!regex.IsMatch(direccion))
            {
                mensajeError = "La dirección solo puede contener letras, números y caracteres especiales.";
            }

            return mensajeError;
        }

        public static string ValidarEmail(string email)
        {
            string mensajeError = string.Empty;

            if (string.IsNullOrEmpty(email))
            {
                return mensajeError; // por que el campo esta vacio se retorna vacio ya q el email es opcional y puede estar vacio. 
            }

            Regex emailRegex = new Regex(@"^[^@\s]+@[^@\s]+\.(com|net|org|edu)$");
            if (!emailRegex.IsMatch(email))
            {
                mensajeError = "El email ingresado no es válido.";
            }
            return mensajeError;
        }

    }
}

