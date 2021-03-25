using hotel.Infra;
using hotel.Models;
using Hotel.Models;
using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;

namespace hotel.Areas.Membre.Controllers
{
    public class HomeController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
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

        [HttpGet]
        public ActionResult Booking()
        {
            if (!SessionUtils.IsLogged) return RedirectToAction("Login", "Account", new { area = "" });
            ReservationViewModel rvm = new ReservationViewModel();
            return View(rvm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Booking(ReservationModel rm)
        {
            if (ModelState.IsValid)
            {
                if (uow.AddReservation(rm, SessionUtils.ConnectedUser.IdClient))
                {
                    return RedirectToAction("Index", "Home", new { area = "Membre" });
                }
                else
                {
                    ViewBag.Error = "Reservation impossible !";
                    return View(rm);
                }
            }
            else
            {
                ViewBag.Error = "Bien remplir le formulaire !";
                return View(rm);
            }

        }



    }
}