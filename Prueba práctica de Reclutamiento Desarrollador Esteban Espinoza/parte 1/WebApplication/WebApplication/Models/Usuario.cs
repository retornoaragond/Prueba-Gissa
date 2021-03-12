using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Controllers;

namespace WebApplication.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public bool TipoIdentificacion { get; set; }
        public string Cedula { get; set; }
        public string NombreCompleto { get; set; }
        public string NombreUsaurio { get; set; }
        public string Password { get; set; }
        public string CorreoElectronico { get; set; }
        public List<Telefono> Telefonos { get; set; }
        public List<HabilidadBlanda> Habilidades { get; set; }
    }
}
