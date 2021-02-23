using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class HomeViewModel
    {
        #region Fields
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private CompagnyAboutModel _companyAbout;
        private List<RoomCardModel> _carteRoomHome;
        private List<ServiceHotelModel> _listeServices;
        private List<TemoignageModel> _temoignages;
        private List<SliderModel> _roomSliderHome;
        private List<ArticleModel> _carteArticle;
        private List<SliderModel> _headerPhotoHotel;
        #endregion

        public HomeViewModel()
        {
            HeaderPhotoHotel = uow.GetPhotoHotel(1);
            //About Compagny
            CompanyAbout = uow.GetInfoHotel();

            //Carte chambres

            // carte chambre
            CarteRoomHome = uow.GetCardHotel();

            // sercice Hotel
            ListeServices = uow.GetService();
                
          

            // partie testimonial

            Temoignages = new List<TemoignageModel>();
            Temoignages.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom= "Miss Titi, ", Fidelite= "Regular Client",Note=5 });
            Temoignages.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "Mister Toto, ", Fidelite = "New Client", Note = 2 });

            // Slider room 
            RoomSliderHome = uow.GetPhotoChambre();

            //carte blog
        
            CarteArticle = uow.GetCardArticleTop();

        }



        #region props
        public CompagnyAboutModel CompanyAbout { get => _companyAbout; set => _companyAbout = value; }
        public List<RoomCardModel> CarteRoomHome { get => _carteRoomHome; set => _carteRoomHome = value; }
        public List<ServiceHotelModel> ListeServices { get => _listeServices; set => _listeServices = value; }
       
        public List<TemoignageModel> Temoignages { get => _temoignages; set => _temoignages = value; }
        public List<SliderModel> RoomSliderHome { get => _roomSliderHome; set => _roomSliderHome = value; }
        public List<ArticleModel> CarteArticle { get => _carteArticle; set => _carteArticle = value; }
        public List<SliderModel> HeaderPhotoHotel { get => _headerPhotoHotel; set => _headerPhotoHotel = value; }
        #endregion
    }
}