using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication.Data;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly ContextRepository _repository;

        public UsuarioController(ContextRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public async Task<IActionResult> Index()
        {
            var response = await _repository.GetAllUsuarios();
            if (response == null) { return NotFound(); }
            return View(response);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdUsuario,TipoIdentificacion,Cedula,NombreCompleto,NombreUsaurio,Password,CorreoElectronico,Telefonos,Habilidades")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                await _repository.InsertUsuario(usuario);
                // hacer que guarde los telefonos y las habilidades
                
                return RedirectToAction(nameof(Index));
            }
            return View(usuario);
        }

        public async Task<IActionResult> Detail(int id)
        {
            var usuario = await _repository.GetUsuarioById(id);
            if (usuario == null)
            {
                return NotFound();
            }
            return View(usuario);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var usuario = await _repository.GetUsuarioById(id);
            if (usuario == null)
            {
                return NotFound();
            }
            return View(usuario);
        }
    }
}
