﻿using hotel.Models;
using Hotel.Models;
using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
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
        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactModel contact)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
                if (uow.SaveContact(contact))
                {
                    ViewBag.SuccessMessage = "Message bien envoyé";
                    //sendEmail(contact);
                    return View();
                }
                else
                {
                    ViewBag.ErrorMessage = "Message non enregistré";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Formulaire error";
                return View();
            }
        }
        //private void sendEmail(ContactModel contact)
        //{
        //    MailMessage mail = new MailMessage();
        //    mail.To.Add(contact.Email);
        //    mail.From = new MailAddress("Netflask@interface3.be");
        //    mail.Subject = "Contact from NetFlask";
        //    string Body = $"<h1>{contact.Nom} demande </h1><br>{contact.Message}";
        //    mail.Body = Body;
        //    mail.IsBodyHtml = true;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.UseDefaultCredentials = false;
        //    smtp.Credentials = new System.Net.NetworkCredential("user", "password"); // Enter senders User name and password  
        //    smtp.EnableSsl = true;
        //    try
        //    {
        //        smtp.Send(mail);
        //    }
        //    catch (Exception ex)
        //    {
        //        Debug.WriteLine("Erreur mail : " + ex.Message);
        //    }
        //}

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