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
    public class Music_TypeController : Controller
    {
        private EventMSEntities1 db = new EventMSEntities1();

        // GET: Music_Type
        public ActionResult Index()
        {
            return View(db.Music_Type.ToList());
        }

        // GET: Music_Type/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music_Type music_Type = db.Music_Type.Find(id);
            if (music_Type == null)
            {
                return HttpNotFound();
            }
            return View(music_Type);
        }

        // GET: Music_Type/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Music_Type/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MT_ID,Name")] Music_Type music_Type)
        {
            if (ModelState.IsValid)
            {
                db.Music_Type.Add(music_Type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(music_Type);
        }

        // GET: Music_Type/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music_Type music_Type = db.Music_Type.Find(id);
            if (music_Type == null)
            {
                return HttpNotFound();
            }
            return View(music_Type);
        }

        // POST: Music_Type/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MT_ID,Name")] Music_Type music_Type)
        {
            if (ModelState.IsValid)
            {
                db.Entry(music_Type).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(music_Type);
        }

        // GET: Music_Type/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music_Type music_Type = db.Music_Type.Find(id);
            if (music_Type == null)
            {
                return HttpNotFound();
            }
            return View(music_Type);
        }

        // POST: Music_Type/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Music_Type music_Type = db.Music_Type.Find(id);
            db.Music_Type.Remove(music_Type);
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
