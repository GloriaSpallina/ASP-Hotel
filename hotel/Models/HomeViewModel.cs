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
            RoomSliderHome = uow.GetPhotoChambre(1);

            //carte blog
            CarteArticle = new List<ArticleModel>();
            CarteArticle.Add(new ArticleModel() { Photo = "blog-img1.jpg", LienArticle = "/Home/SingleBlog", Auteur = "John Guru", Titre = "5 Simple Tricks for Getting Stellar Hotel Service Wherever You Are", NombreCommentaire = 4, DateArticle = new DateTime(2021, 02, 10) });
            CarteArticle.Add(new ArticleModel() { Photo = "blog-img2.jpg", LienArticle= "/Home/SingleBlog", Auteur = "Toto Titi", Titre = "5 Simple Tricks for Getting Stellar Hotel Service Wherever You Are", NombreCommentaire = 3, DateArticle = new DateTime(2021, 02, 20) });
            CarteArticle.Add(new ArticleModel() { Photo = "blog-img3.jpg", LienArticle = "/Home/SingleBlog", Auteur = "Toto Titi", Titre = "5 Simple Tricks for Getting Stellar Hotel Service Wherever You Are", NombreCommentaire = 3, DateArticle = new DateTime(2021, 02, 20) });

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