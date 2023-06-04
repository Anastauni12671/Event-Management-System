using Event_M_System.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Event_M_System.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        EventMSEntities1 db = new EventMSEntities1();
        [HttpPost]
        public ActionResult Login(Customer c)
        {
            bool user = db.Customers.Any(x => x.User_Name == c.User_Name && x.Password == c.Password);
            Customer u = db.Customers.FirstOrDefault(x => x.User_Name == c.User_Name && x.Password == c.Password);
            if (user)
            {
                FormsAuthentication.SetAuthCookie(u.User_Name, false);
                return RedirectToAction("Index", "Catterings");
            }
            else {
                ViewBag.error = "User name or password is Incorrect";
                return View();
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Default");
        }
    }
}