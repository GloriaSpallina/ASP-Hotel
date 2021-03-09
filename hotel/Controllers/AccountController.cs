﻿using hotel.Infra;
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
    public class AccountController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel lm)
        {
            //string userResponse = HttpContext.Request.Params["g-recaptcha-response"];
            //bool validCaptcha = ReCaptcha.ValidateCaptcha(userResponse);
            //if (validCaptcha)
            //{
            if (ModelState.IsValid)
            {
               
                if (lm.Login != "Gloria" && lm.MotDePasse != "test")
                {
                    ViewBag.Error = "Erreur Login/Password";
                    return View();
                }
                else if (lm.Login == "Admin" && lm.MotDePasse == "test")
                {
                    SessionUtils.IsLogged = true;
                    return RedirectToAction("Index", "Home", new { area = "Admin" });
                }
                else
                {
                    SessionUtils.IsLogged = true;
                    return RedirectToAction("Index", "Home", new { area = "Membre" });
                }
            }
            else
            {
                return View();
            }



        }

      
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(ClientModel cl)
        {
            if (ModelState.IsValid)
            {
                if (uow.CreateClient(cl))
                {
                    SessionUtils.IsLogged = true;
                    //SessionUtils.ConnectedUser = cl;
                    return RedirectToAction("Index", "Home", new { area = "Membre" });
                }
                else
                {
                    ViewBag.Error = "Pas en DB";
                    return View(cl);
                }
            }
            else
            {
                ViewBag.Error = "Champs requis";
                return View(cl);
            }
        }
    }
}