﻿using hotel.Models;
using Hotel.DAL.Repositories;
using Hotel.Entities;
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
        #endregion

        public UnitOfWork(string connectionString)
        {
            _hotelPhotoRepo = new HotelPhotoRepository(connectionString);
            _photoChambreRepo = new PhotoTypeChambreRepository(connectionString);
            _infoHotelRepo = new CompanyHotelRepository(connectionString);
            _serviceRepo = new ServiceRepository(connectionString);
            _typeChambreRepo = new TypeChambreRepository(connectionString);
            _articleRepo = new ArticleBlogRepository(connectionString);
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

        public List<ArticleModel> GetCardArticleTop()
        {
            return _articleRepo.Get()
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
    }
}
