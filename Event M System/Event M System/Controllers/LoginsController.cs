using Event_M_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Event_M_System.Controllers
{
    public class LoginsController : Controller
    {
        // GET: Logins
        public ActionResult Logins()
        {
            return View();
        }

        EventMSEntities1 db = new EventMSEntities1();
        [HttpPost]
        public ActionResult Logins(Staff c)
        {
            bool user = db.Staffs.Any(x => x.User_Name == c.User_Name && x.Password == c.Password);
            Staff u = db.Staffs.FirstOrDefault(x => x.User_Name == c.User_Name && x.Password == c.Password);
            if (user)
            {
                FormsAuthentication.SetAuthCookie(u.User_Name, false);
                return RedirectToAction("Index", "Events");
            }

            else
            {
                ViewBag.error = "User name or password is Incorrect";
                return View();
            }
            return View();
        }
        public ActionResult Logouts()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Default");
        }
    }
}