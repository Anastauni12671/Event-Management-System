using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Event_M_System.Models;

namespace Event_M_System.Controllers
{
    public class Cattering_TypeController : Controller
    {
        private EventMSEntities1 db = new EventMSEntities1();

        // GET: Cattering_Type
        public ActionResult Index()
        {
            return View(db.Cattering_Type.ToList());
        }

        // GET: Cattering_Type/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering_Type cattering_Type = db.Cattering_Type.Find(id);
            if (cattering_Type == null)
            {
                return HttpNotFound();
            }
            return View(cattering_Type);
        }

        // GET: Cattering_Type/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Cattering_Type/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CT_ID,Name")] Cattering_Type cattering_Type)
        {
            if (ModelState.IsValid)
            {
                db.Cattering_Type.Add(cattering_Type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(cattering_Type);
        }

        // GET: Cattering_Type/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering_Type cattering_Type = db.Cattering_Type.Find(id);
            if (cattering_Type == null)
            {
                return HttpNotFound();
            }
            return View(cattering_Type);
        }

        // POST: Cattering_Type/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CT_ID,Name")] Cattering_Type cattering_Type)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cattering_Type).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cattering_Type);
        }

        // GET: Cattering_Type/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering_Type cattering_Type = db.Cattering_Type.Find(id);
            if (cattering_Type == null)
            {
                return HttpNotFound();
            }
            return View(cattering_Type);
        }

        // POST: Cattering_Type/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cattering_Type cattering_Type = db.Cattering_Type.Find(id);
            db.Cattering_Type.Remove(cattering_Type);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
