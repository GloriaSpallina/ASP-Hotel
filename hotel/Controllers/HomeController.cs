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
            HomeViewModel hm = new HomeViewModel();
            return View(hm);
        }

        public ActionResult About()
        {
            AboutViewModel am = new AboutViewModel();
            ViewBag.Message = "Your application description page.";

            return View(am);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Blog()
        {
            BlogViewModel bm = new BlogViewModel();
            ViewBag.Message = "Your blog page.";

            return View(bm);
        }
    
        public ActionResult Rooms()
        {
            RoomsViewModel rvm = new RoomsViewModel();
            ViewBag.Message = "Your rooms page.";

            return View(rvm);
        }
        public ActionResult Services()
        {
            ServiceViewModel svm = new ServiceViewModel();
            ViewBag.Message = "Your Services page.";

            return View(svm);
        }
        public ActionResult SingleBlog()
        {
            SingleBlogViewModel sbm = new SingleBlogViewModel();
            ViewBag.Message = "Your Single blog page.";

            return View(sbm);
        }
    }
}