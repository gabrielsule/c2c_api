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
    public class PaisController : ApiController
    {
        private CarTwoCityEntities db = new CarTwoCityEntities();

        [HttpGet]
        [Route("api/Pais")]
        public IQueryable<Pai> GetPais()
        {
            return db.Pais;
        }

        // GET: api/Pais/5
        [ResponseType(typeof(Pai))]
        public IHttpActionResult GetPai(int id)
        {
            Pai pai = db.Pais.Find(id);
            if (pai == null)
            {
                return NotFound();
            }

            return Ok(pai);
        }

        // PUT: api/Pais/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPai(int id, Pai pai)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != pai.id)
            {
                return BadRequest();
            }

            db.Entry(pai).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaiExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Pais
        [ResponseType(typeof(Pai))]
        public IHttpActionResult PostPai(Pai pai)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Pais.Add(pai);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = pai.id }, pai);
        }

        // DELETE: api/Pais/5
        [ResponseType(typeof(Pai))]
        public IHttpActionResult DeletePai(int id)
        {
            Pai pai = db.Pais.Find(id);
            if (pai == null)
            {
                return NotFound();
            }

            db.Pais.Remove(pai);
            db.SaveChanges();

            return Ok(pai);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PaiExists(int id)
        {
            return db.Pais.Count(e => e.id == id) > 0;
        }
    }
}