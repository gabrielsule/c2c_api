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
    public class TipoDocumentoesController : ApiController
    {
        private CarTwoCityEntities db = new CarTwoCityEntities();

        [HttpGet]
        [Route("api/document")]
        public IQueryable<TipoDocumento> GetTipoDocumentoes()
        {
            return db.TipoDocumentoes;
        }

        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TipoDocumentoExists(int id)
        {
            return db.TipoDocumentoes.Count(e => e.id == id) > 0;
        }
    }
}