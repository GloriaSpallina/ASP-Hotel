using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class AboutViewModel
    {
        #region Fields
        private CompagnyAboutModel _aboutC;
        private List<ServiceHotelModel> _serviceAbout;
        private List<SliderModel> _roomSliderAbout;
        private List<TemoignageModel> _temoignageAbout;

        #endregion

        public AboutViewModel()
        {
            //About Compagny
            AboutC = new CompagnyAboutModel();
            AboutC.Slogan = "Make the customer the hero of your story";
            AboutC.DescriptionCourte = "Lorem ipsum dolor sit amet, consectetur adipisic- ing elit, sed do eiusmod tempor inc.";
            AboutC.DescriptionLongue = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.";
            AboutC.AnneeExpe = 25;
            AboutC.Photo = "customar1.png";
           

            // partie testimonial

            TemoignageAbout = new List<TemoignageModel>();
            TemoignageAbout.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "TaTa, ", Fidelite = "Regular Client", Note = 5 });
            TemoignageAbout.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "Tutu, ", Fidelite = "New Client", Note = 2 });

            // Slider room 
            RoomSliderAbout = new List<SliderModel>();
            RoomSliderAbout.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery1.jpg" });
            RoomSliderAbout.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery2.jpg" });
            RoomSliderAbout.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery3.jpg" });

            //Service
            ServiceAbout = new List<ServiceHotelModel>();
            ServiceAbout.Add(new ServiceHotelModel() { Photo = "dining-img.png", NomService = "Our resturent", CourteDescription = "Dining & Drinks", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto = "left" });
            ServiceAbout.Add(new ServiceHotelModel() { Photo = "dining-img2.png", NomService = "Our Pool", CourteDescription = "Swimming Pool", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto = "right" });
        }

        #region Props
        public CompagnyAboutModel AboutC { get => _aboutC; set => _aboutC = value; }
        public List<ServiceHotelModel> ServiceAbout { get => _serviceAbout; set => _serviceAbout = value; }
        public List<SliderModel> RoomSliderAbout { get => _roomSliderAbout; set => _roomSliderAbout = value; }
        public List<TemoignageModel> TemoignageAbout { get => _temoignageAbout; set => _temoignageAbout = value; }

        #endregion
    }
}