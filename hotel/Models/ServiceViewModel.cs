using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class ServiceViewModel
    {
        #region Fields
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
            SliderRoomSer = new List<SliderModel>();
            SliderRoomSer.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery1.jpg" });
            SliderRoomSer.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery2.jpg" });
            SliderRoomSer.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery3.jpg" });

            //Service
            Services = new List<ServiceHotelModel>();
            Services.Add(new ServiceHotelModel() { Photo = "dining-img.png", NomService = "Our resturent", CourteDescription = "Dining & Drinks", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto = "left" });
            Services.Add(new ServiceHotelModel() { Photo = "dining-img2.png", NomService = "Our Pool", CourteDescription = "Swimming Pool", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto = "right" });

        }

        #region Props
        public List<ServiceHotelModel> Services { get => _services; set => _services = value; }
        public List<TemoignageModel> TemoignagesService { get => _temoignagesService; set => _temoignagesService = value; }
        public List<SliderModel> SliderRoomSer { get => _sliderRoomSer; set => _sliderRoomSer = value; } 
        #endregion
    }
}