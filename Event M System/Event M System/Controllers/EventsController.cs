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
    public class EventsController : Controller
    {
        private EventMSEntities1 db = new EventMSEntities1();

        // GET: Events
        public ActionResult Index()
        {
            var events = db.Events.Include(c => c.Cattering).Include(c => c.Music).Include(c => c.Transport).Include(c => c.Venue);
            return View(events.ToList());
        }

        // GET: Events/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Events.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            return View(@event);
        }

        // GET: Events/Create
        public ActionResult Create()
        {
            ViewBag.Cattering_ID = new SelectList(db.Catterings, "Cattering_ID", "Name");
            ViewBag.Music_ID = new SelectList(db.Musics, "M_ID", "Name");
            ViewBag.Transport_ID = new SelectList(db.Transports, "Transport_ID", "Vehicle_Name");
            ViewBag.Venue_ID = new SelectList(db.Venues, "V_ID", "V_Name");
            return View();
        }

        // POST: Events/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Event_ID,Event_Name,Venue_ID,Cattering_ID,Transport_ID,Music_ID,Date,price")] Event @event)
        {
            if (ModelState.IsValid)
            {
                db.Events.Add(@event);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Cattering_ID = new SelectList(db.Catterings, "Cattering_ID", "Name", @event.Cattering_ID);
            ViewBag.Music_ID = new SelectList(db.Musics, "M_ID", "Name", @event.Music_ID);
            ViewBag.Transport_ID = new SelectList(db.Transports, "Transport_ID", "Vehicle_Name", @event.Transport_ID);
            ViewBag.Venue_ID = new SelectList(db.Venues, "V_ID", "V_Name", @event.Venue_ID);
            return View(@event);
        }

        // GET: Events/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Events.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            ViewBag.Cattering_ID = new SelectList(db.Catterings, "Cattering_ID", "Name", @event.Cattering_ID);
            ViewBag.Music_ID = new SelectList(db.Musics, "M_ID", "Name", @event.Music_ID);
            ViewBag.Transport_ID = new SelectList(db.Transports, "Transport_ID", "Vehicle_Name", @event.Transport_ID);
            ViewBag.Venue_ID = new SelectList(db.Venues, "V_ID", "V_Name", @event.Venue_ID);
            return View(@event);
        }

        // POST: Events/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Event_ID,Event_Name,Venue_ID,Cattering_ID,Transport_ID,Music_ID,Date,price")] Event @event)
        {
            if (ModelState.IsValid)
            {
                db.Entry(@event).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Cattering_ID = new SelectList(db.Catterings, "Cattering_ID", "Name", @event.Cattering_ID);
            ViewBag.Music_ID = new SelectList(db.Musics, "M_ID", "Name", @event.Music_ID);
            ViewBag.Transport_ID = new SelectList(db.Transports, "Transport_ID", "Vehicle_Name", @event.Transport_ID);
            ViewBag.Venue_ID = new SelectList(db.Venues, "V_ID", "V_Name", @event.Venue_ID);
            return View(@event);
        }

        // GET: Events/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Events.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            return View(@event);
        }

        // POST: Events/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Event @event = db.Events.Find(id);
            db.Events.Remove(@event);
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
