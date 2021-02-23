using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class AboutViewModel
    {
        #region Fields
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private CompagnyAboutModel _aboutC;
        private List<ServiceHotelModel> _serviceAbout;
        private List<SliderModel> _roomSliderAbout;
        private List<TemoignageModel> _temoignageAbout;

        #endregion

        public AboutViewModel()
        {
            //About Compagny
            AboutC = uow.GetInfoHotel();
           

            // partie testimonial

            TemoignageAbout = new List<TemoignageModel>();
            TemoignageAbout.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "TaTa, ", Fidelite = "Regular Client", Note = 5 });
            TemoignageAbout.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "Tutu, ", Fidelite = "New Client", Note = 2 });

            // Slider room 
            RoomSliderAbout =  uow.GetPhotoChambre();

            //Service
            ServiceAbout = uow.GetService();
        }

        #region Props
        public CompagnyAboutModel AboutC { get => _aboutC; set => _aboutC = value; }
        public List<ServiceHotelModel> ServiceAbout { get => _serviceAbout; set => _serviceAbout = value; }
        public List<SliderModel> RoomSliderAbout { get => _roomSliderAbout; set => _roomSliderAbout = value; }
        public List<TemoignageModel> TemoignageAbout { get => _temoignageAbout; set => _temoignageAbout = value; }

        #endregion
    }
}