using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class HomeViewModel
    {
        #region Fields
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
            HeaderPhotoHotel = new List<SliderModel>();
            HeaderPhotoHotel.Add(new SliderModel() { LienPhoto = "h1_hero.jpg" });
            HeaderPhotoHotel.Add(new SliderModel() { LienPhoto = "h1_hero.jpg" });
            HeaderPhotoHotel.Add(new SliderModel() { LienPhoto = "h1_hero.jpg" });
            //About Compagny
            CompanyAbout = new CompagnyAboutModel();
            CompanyAbout.Slogan = "Make the customer the hero of your story";
            CompanyAbout.DescriptionCourte = "Lorem ipsum dolor sit amet, consectetur adipisic- ing elit, sed do eiusmod tempor inc.";
            CompanyAbout.DescriptionLongue = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.";
            CompanyAbout.AnneeExpe = 25;
            CompanyAbout.Photo = "customar1.png";

            //Carte chambres

            // carte chambre
            CarteRoomHome = new List<RoomCardModel>();
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room1.jpg", NomCatégorie = "Classic Double Bed", Prix = 150 });
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room2.jpg", NomCatégorie = "Classic Double Bed", Prix = 400 });
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room3.jpg", NomCatégorie = "Classic Double Bed", Prix = 600 });
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room4.jpg", NomCatégorie = "Classic Double Bed", Prix = 40 });
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room5.jpg", NomCatégorie = "Classic Double Bed", Prix = 224 });
            CarteRoomHome.Add(new RoomCardModel() { PhotoChambre = "room6.jpg", NomCatégorie = "Classic Double Bed", Prix = 147 });

            // sercice Hotel
            ListeServices = new List<ServiceHotelModel>();
            ListeServices.Add(new ServiceHotelModel() { Photo = "dining-img.png", NomService = "Our resturent", CourteDescription = "Dining & Drinks", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto= "left" });
            ListeServices.Add(new ServiceHotelModel() { Photo = "dining-img2.png", NomService = "Our Pool", CourteDescription = "Swimming Pool", LongueDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim <br>veniam, quis nostrud.", OrientationPhoto = "right" });

            // partie testimonial

            Temoignages = new List<TemoignageModel>();
            Temoignages.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom= "Miss Titi, ", Fidelite= "Regular Client",Note=5 });
            Temoignages.Add(new TemoignageModel() { Photo = "testimonial.png", Commentaire = "Yorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.", Nom = "Mister Toto, ", Fidelite = "New Client", Note = 2 });

            // Slider room 
            RoomSliderHome = new List<SliderModel>();
            RoomSliderHome.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery1.jpg" });
            RoomSliderHome.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery2.jpg" });
            RoomSliderHome.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery3.jpg" });

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