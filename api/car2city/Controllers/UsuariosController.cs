using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using car2city;

namespace car2city.Controllers
{
    public class UsuariosController : ApiController
    {
        public class ModelUser
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Gender { get; set; }
            public int TypeDoc { get; set; }
            public decimal NumDoc { get; set; }
            public int Country { get; set; }
            public string Prefix { get; set; }
            public string AreaCode { get; set; }
            public int Number { get; set; }
        }

        public class ModelCreate
        {
            public string UserName { get; set; }
            public string Mail { get; set; }
            public string Password { get; set; }
        }

        private CarTwoCityEntities db = new CarTwoCityEntities();

        // GET: api/Usuarios
        public IQueryable<Usuario> GetUsuarios()
        {
            return db.Usuarios;
        }

        // GET: api/Usuarios/5
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult GetUsuario(int id)
        {
            Usuario usuario = db.Usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            return Ok(usuario);
        }

        [HttpPost]
        [Route("api/user/create")]
        public HttpResponseMessage InsertUser(ModelUser user)
        {
            var Phone = user.Prefix + user.AreaCode + user.Number;

            db.sp_UsuarioInsert(user.FirstName, user.LastName, user.UserName, user.Mail, user.Gender, user.Country, user.TypeDoc, user.NumDoc, Phone);
            db.SaveChanges();

            return new HttpResponseMessage { StatusCode = HttpStatusCode.OK };
        }


        // DELETE: api/Usuarios/5
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult DeleteUsuario(int id)
        {
            Usuario usuario = db.Usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            db.Usuarios.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UsuarioExists(int id)
        {
            return db.Usuarios.Count(e => e.id == id) > 0;
        }
    }
}