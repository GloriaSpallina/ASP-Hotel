using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class ServiceViewModel
    {
        #region Fields
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private List<ServiceHotelModel> _services;
        private List<TemoignageModel> _temoignagesService;
        private List<SliderModel> _sliderRoomSer; 
        #endregion
        public ServiceViewModel()
        {
            // partie testimonial

            TemoignagesService = new List<TemoignageModel>();

            TemoignagesService.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "Tirlititi, ", Fidelite = "Regular Client", Note = 1 });
            TemoignagesService.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "youyou, ", Fidelite = "New Client", Note = 3 });

            // Slider room 
            SliderRoomSer = uow.GetPhotoChambre();

            //Service
            Services = uow.GetService();

        }

        #region Props
        public List<ServiceHotelModel> Services { get => _services; set => _services = value; }
        public List<TemoignageModel> TemoignagesService { get => _temoignagesService; set => _temoignagesService = value; }
        public List<SliderModel> SliderRoomSer { get => _sliderRoomSer; set => _sliderRoomSer = value; } 
        #endregion
    }
}