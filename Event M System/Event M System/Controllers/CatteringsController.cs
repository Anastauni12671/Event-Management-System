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
    public class CatteringsController : Controller
    {
        private EventMSEntities1 db = new EventMSEntities1();

        // GET: Catterings
        public ActionResult Index()
        {
            var catterings = db.Catterings.Include(c => c.Cattering_Type);
            return View(catterings.ToList());
        }

        // GET: Catterings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering cattering = db.Catterings.Find(id);
            if (cattering == null)
            {
                return HttpNotFound();
            }
            return View(cattering);
        }

        // GET: Catterings/Create
        public ActionResult Create()
        {
            ViewBag.CT_Type = new SelectList(db.Cattering_Type, "CT_ID", "Name");
            return View();
        }

        // POST: Catterings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Cattering_ID,CT_Type,Name,Price")] Cattering cattering)
        {
            if (ModelState.IsValid)
            {
                db.Catterings.Add(cattering);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CT_Type = new SelectList(db.Cattering_Type, "CT_ID", "Name", cattering.CT_Type);
            return View(cattering);
        }

        // GET: Catterings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering cattering = db.Catterings.Find(id);
            if (cattering == null)
            {
                return HttpNotFound();
            }
            ViewBag.CT_Type = new SelectList(db.Cattering_Type, "CT_ID", "Name", cattering.CT_Type);
            return View(cattering);
        }

        // POST: Catterings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Cattering_ID,CT_Type,Name,Price")] Cattering cattering)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cattering).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CT_Type = new SelectList(db.Cattering_Type, "CT_ID", "Name", cattering.CT_Type);
            return View(cattering);
        }

        // GET: Catterings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattering cattering = db.Catterings.Find(id);
            if (cattering == null)
            {
                return HttpNotFound();
            }
            return View(cattering);
        }

        // POST: Catterings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cattering cattering = db.Catterings.Find(id);
            db.Catterings.Remove(cattering);
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
