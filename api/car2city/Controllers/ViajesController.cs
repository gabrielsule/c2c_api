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
using System.Threading.Tasks;

namespace car2city.Controllers
{
    public class ViajesController : ApiController
    {
        private CarTwoCityEntities db = new CarTwoCityEntities();

        // GET: api/Viajes
        public IQueryable<Viaje> GetViajes()
        {
            return db.Viajes;
        }

        // GET: api/Viajes/5
        [ResponseType(typeof(Viaje))]
        public IHttpActionResult GetViaje(int id)
        {
            Viaje viaje = db.Viajes.Find(id);
            if (viaje == null)
            {
                return NotFound();
            }

            return Ok(viaje);
        }

       

        // DELETE: api/Viajes/5
        [ResponseType(typeof(Viaje))]
        public IHttpActionResult DeleteViaje(int id)
        {
            Viaje viaje = db.Viajes.Find(id);
            if (viaje == null)
            {
                return NotFound();
            }

            db.Viajes.Remove(viaje);
            db.SaveChanges();

            return Ok(viaje);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ViajeExists(int id)
        {
            return db.Viajes.Count(e => e.id == id) > 0;
        }
    }
}