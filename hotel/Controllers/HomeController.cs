using hotel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hotel.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Blog()
        {
            ViewBag.Message = "Your blog page.";

            return View();
        }
        public ActionResult Element()
        {
            ViewBag.Message = "Your Element page.";

            return View();
        }
        public ActionResult Rooms()
        {
            RoomsViewModel rvm = new RoomsViewModel();
            ViewBag.Message = "Your rooms page.";

            return View(rvm);
        }
        public ActionResult Services()
        {
            ViewBag.Message = "Your Services page.";

            return View();
        }
        public ActionResult SingleBlog()
        {
            ViewBag.Message = "Your Single blog page.";

            return View();
        }
    }
}