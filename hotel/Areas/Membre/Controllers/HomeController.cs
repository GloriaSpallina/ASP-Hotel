using hotel.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hotel.Areas.Membre.Controllers
{
    public class HomeController : Controller
    {
        // GET: Membre/Home
        public ActionResult Index()
        {
            ViewBag.ZoneMembre = "active";
            if (!SessionUtils.IsLogged) return RedirectToAction("Login", "Account", new { area = "" });

            return View(SessionUtils.ConnectedUser);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Home", new { area = "" });
        }
    }
}