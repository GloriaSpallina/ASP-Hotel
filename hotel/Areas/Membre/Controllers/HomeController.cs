using hotel.Infra;
using hotel.Models;
using Hotel.Models;
using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hotel.Areas.Membre.Controllers
{
    public class HomeController : Controller
    {
        //UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        // GET: Membre/Home
        public ActionResult Index()
        {

            if (!SessionUtils.IsLogged) return RedirectToAction("Login", "Account", new { area = "" });
            MembreViewModel mvm = new MembreViewModel();
            return View(mvm);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Home", new { area = "" });
        }

        public ActionResult Reservation()
        {

            if (!SessionUtils.IsLogged) return RedirectToAction("Login", "Account", new { area = "" });
            return View(SessionUtils.ConnectedUser);
        }

    }
}