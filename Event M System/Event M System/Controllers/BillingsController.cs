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
    public class BillingsController : Controller
    {
        public EventMSEntities1 db = new EventMSEntities1();

        // GET: Billings
        public ActionResult Index()
        {
            var billings = db.Billings.Include(b => b.Customer).Include(b => b.Event).Include(b => b.Ticket);
            return View(billings.ToList());
        }

        // GET: Billings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Billing billing = db.Billings.Find(id);
            if (billing == null)
            {
                return HttpNotFound();
            }
            return View(billing);
        }

        // GET: Billings/Create
        public ActionResult Create()
        {
            ViewBag.C_ID = new SelectList(db.Customers, "C_ID", "First_Name");
            ViewBag.Event_ID = new SelectList(db.Events, "Event_ID", "Event_Name");
            ViewBag.Ticket_ID = new SelectList(db.Tickets, "Ticket_ID", "Ticket_ID");
            return View();
        }

        // POST: Billings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Bill_ID,C_ID,Event_ID,Ticket_ID,Transport,Food,Price,Total")] Billing billing)
        {
            if (ModelState.IsValid)
            {
                db.Billings.Add(billing);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.C_ID = new SelectList(db.Customers, "C_ID", "First_Name", billing.C_ID);
            ViewBag.Event_ID = new SelectList(db.Events, "Event_ID", "Event_Name", billing.Event_ID);
            ViewBag.Ticket_ID = new SelectList(db.Tickets, "Ticket_ID", "Ticket_ID", billing.Ticket_ID);
            return View(billing);
        }

        // GET: Billings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Billing billing = db.Billings.Find(id);
            if (billing == null)
            {
                return HttpNotFound();
            }
            ViewBag.C_ID = new SelectList(db.Customers, "C_ID", "First_Name", billing.C_ID);
            ViewBag.Event_ID = new SelectList(db.Events, "Event_ID", "Event_Name", billing.Event_ID);
            ViewBag.Ticket_ID = new SelectList(db.Tickets, "Ticket_ID", "Ticket_ID", billing.Ticket_ID);
            return View(billing);
        }

        // POST: Billings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Bill_ID,C_ID,Event_ID,Ticket_ID,Transport,Food,Price,Total")] Billing billing)
        {
            if (ModelState.IsValid)
            {
                db.Entry(billing).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.C_ID = new SelectList(db.Customers, "C_ID", "First_Name", billing.C_ID);
            ViewBag.Event_ID = new SelectList(db.Events, "Event_ID", "Event_Name", billing.Event_ID);
            ViewBag.Ticket_ID = new SelectList(db.Tickets, "Ticket_ID", "Ticket_ID", billing.Ticket_ID);
            return View(billing);
        }

        // GET: Billings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Billing billing = db.Billings.Find(id);
            if (billing == null)
            {
                return HttpNotFound();
            }
            return View(billing);
        }

        // POST: Billings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Billing billing = db.Billings.Find(id);
            db.Billings.Remove(billing);
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
