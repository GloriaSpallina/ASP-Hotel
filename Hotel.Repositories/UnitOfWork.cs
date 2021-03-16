using hotel.Models;
using Hotel.DAL.Repositories;
using Hotel.Entities;
using Hotel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class UnitOfWork
    {
        #region Fields
        IConcreteRepository<HotelPhotoEntity> _hotelPhotoRepo;
        IConcreteRepository<PhotoTypeChambreEntity> _photoChambreRepo;
        IConcreteRepository<CompanyHotelEntity> _infoHotelRepo;
        IConcreteRepository<ServiceEntity> _serviceRepo;
        IConcreteRepository<TypeChambreEntity> _typeChambreRepo;
        IConcreteRepository<ArticleBlogEntity> _articleRepo;
        IConcreteRepository<MessageEntity> _messageRepo;
        IConcreteRepository<ThemeEntity> _themeRepo;
        IConcreteRepository<ClientEntity> _clientRepo;
        IConcreteRepository<ReservationEntity> _reservationRepo;

        #endregion

        public UnitOfWork(string connectionString)
        {
            _hotelPhotoRepo = new HotelPhotoRepository(connectionString);
            _photoChambreRepo = new PhotoTypeChambreRepository(connectionString);
            _infoHotelRepo = new CompanyHotelRepository(connectionString);
            _serviceRepo = new ServiceRepository(connectionString);
            _typeChambreRepo = new TypeChambreRepository(connectionString);
            _articleRepo = new ArticleBlogRepository(connectionString);
            _messageRepo = new MessageRepository(connectionString);
            _themeRepo = new ThemeRepository(connectionString);
            _clientRepo = new ClientRepository(connectionString);
            _reservationRepo = new ReservationRepository(connectionString);
        }

        public List<SliderModel> GetPhotoHotel(int idHotel)
        {
            return ((HotelPhotoRepository)_hotelPhotoRepo).GetPhotoHotel(idHotel).Select(item => new SliderModel() { LienPhoto = item.Photo }).ToList();
        }

        public List<SliderModel> GetPhotoChambre()
        {
            return ((PhotoTypeChambreRepository)_photoChambreRepo).Get().Select(item => new SliderModel() { LienPhoto = item.Photo, Ref = "#" }).ToList();
        }

        public CompagnyAboutModel GetInfoHotel()
        {
            CompanyHotelEntity che = _infoHotelRepo.GetOne(1);
            CompagnyAboutModel cam = new CompagnyAboutModel();
            cam.Slogan = che.Slogan;
            cam.DescriptionCourte = che.DescriptionCourte;
            cam.DescriptionLongue = che.DescriptionLongue;
            cam.AnneeExpe = DateTime.Now.Year - che.DateFondation.Year;
            cam.Photo = che.Photo;
            return cam;
        }

        public List<ServiceHotelModel> GetService()
        {
            return _serviceRepo.Get().Select(s => new ServiceHotelModel() { Photo = s.PhotoService, CourteDescription = s.DescriptionCourte, LongueDescription = s.DescriptionLongue, NomService = s.NomService, OrientationPhoto = s.Orientation }).ToList();
        }

        public List<RoomCardModel> GetCardHotel()
        {

            return _typeChambreRepo.Get()
                .Select(item =>
                new RoomCardModel()
                {
                    NomCategorie = item.Nom,
                    Prix = item.Prix,
                    PhotoChambre = item.Photo
                }
                ).ToList();
        }

        #region Blog

        public int CountArticles()
        {
            return _articleRepo.Get().Count();
        }
        public List<ArticleModel> GetCardArticleTop()
        {
            return ((ArticleBlogRepository)_articleRepo).Get3Last()
                .Select(item =>
                new ArticleModel()
                {
                    Photo = item.Photo,
                    NomAuteur = item.Nom,
                    PrenomAuteur = item.Prenom,
                    Titre = item.Titre,
                    DateArticle = item.Date,
                    NombreCommentaire = item.NBComment
                }
                ).ToList();
        }

        public List<ArticleModel> GetResumeArticle(string searchTheme, string searchString, int page)
        {
            return ((ArticleBlogRepository)_articleRepo).GetResume(searchTheme, searchString, page)
                .Select(item =>
                new ArticleModel()
                {
                    Photo = item.Photo,
                    DateArticle = item.Date,
                    Titre = item.Titre,
                    Resume = item.Accroche,
                    Categorie = item.Themes,
                    NombreCommentaire = item.NBComment

                }
                ).ToList();

        }

        public List<CategorieModel> GetCloudTag()
        {
            return _themeRepo.Get()
                .Select(l =>
                new CategorieModel()
                {
                    Nom = l.Libelle
                }
                ).ToList();
        }

        public List<CategorieModel> GetCategory()
        {
            return _themeRepo.Get()
                .Select(l =>
                new CategorieModel()
                {
                  Nom=l.Libelle,
                }
                ).ToList();
        }

        public List<CategorieModel> GetCategoryAndNbArt()
        {
            return ((ThemeRepository)_themeRepo).GetThemeAndNbArt()
                .Select(l =>
                new CategorieModel()
                {
                    Nom = l.Libelle,
                    NombreArticleCategorie = l.NbArtParTheme
                }
                ).ToList();
        }

        #endregion


        #region Contact
        public bool SaveContact(ContactModel cm)
        {
            //MAppers
            MessageEntity me = new MessageEntity();
            me.Nom = cm.Nom;
            me.Email = cm.Email;
            me.Sujet = cm.Subject;
            me.ContenuMail = cm.Message;

            return _messageRepo.Insert(me);
        }
        #endregion


        #region Account

        public bool CreateClient (ClientModel cl)
        {
            ClientEntity clientEntity = new ClientEntity()
            {
                IdClient = cl.IdClient,
                Nom = cl.Nom,
                Prenom = cl.Prenom,
                Login = cl.Login,
                MotDePasse = cl.MotDePasse,
                Ville = cl.Ville,
                Pays = cl.Pays,
                Email = cl.Email,
                Rue = cl.Rue,
                Telephone = cl.Telephone,
                Photo = cl.Photo,
                Numero = cl.Numero
               

            };
            return _clientRepo.Insert(clientEntity);
        }

        public ClientModel ClientAuth(LoginModel lm)
        {
            ClientEntity ue = ((ClientRepository)_clientRepo).GetFromLogin(lm.Login, lm.MotDePasse);
            if (ue == null) return null;
            
            if (ue != null)
            {
                return new ClientModel()
                {
                   IdClient = ue.IdClient,
                    Nom = ue.Nom,
                   Prenom = ue.Prenom,
                   Login = ue.Login,
                   Ville = ue.Ville,
                   Pays = ue.Pays,
                    Email = ue.Email,
                    Rue = ue.Rue,
                    Telephone = ue.Telephone,
                    Photo = ue.Photo,
                    Numero = ue.Numero
                };
            }
            else
            {
                return null;
            }
        }

        public List<ReservationModel> GetReservation(string Loging)
        {
            return ((ReservationRepository)_reservationRepo).GetAllFromClient(Loging)
                .Select(item =>
                new ReservationModel()
                {
                    IdClient = item.IdClient,
                    Login = item.Login,
                    Datereservation = item.DateReservation,
                    Datedebut = item.DateDebutSejour,
                    Datefin = item.DateFinSejour,
                    Nombreadulte = item.NombreAdulte,
                    Nombreenfant = item.NombreEnfant,
                    Typechambre = item.NomTypeChambre,
                    Photochambre = item.PhotoTypeChambre,
                    Prix = item.Prix

                }
                ).ToList();
        }

        public bool AddReservation(ReservationModel rm)
        {
            return true;
        }

        #endregion
    }
}
