using hotel.Infra;
using Hotel.Models;
using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class SingleBlogViewModel
    {
        #region Fields
        private ArticleModel _detailArticle;
        private ArticleModel _titrePostPrecedent;
        private ArticleModel _titrePostSuivant;
        private List<CommentaireModel> _commentsAricle;
        private List<CategorieModel> _listeCategoriesSB;
        private List<ArticleModel> _RecentPostSB;
        private List<CategorieModel> _TagCloudSB;
        private List<ArticleModel> _InstaPostSB;
        private int _maxArticle;
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private CommentaireModel _addComments;

        #endregion

        public SingleBlogViewModel(int idArticle)
        {
            DetailArticle = uow.GetArticleEntier(idArticle);
            TitrePostPrecedent = uow.GetPreviousTitle(idArticle - 1);
            TitrePostSuivant = uow.GetNextTitle(idArticle + 1);
            ListeCategoriesSB = uow.GetCategoryAndNbArt();
            TagCloudSB = uow.GetCloudTag();
            RecentPostSB = uow.GetCardArticleTop();
            MaxArticle = uow.CountArticles();
            CommentsAricle = uow.GetComments(idArticle);
            
           



            //insta
            InstaPostSB = new List<ArticleModel>();
            InstaPostSB.Add(new ArticleModel() { Photo = "post_5.png", LienArticle = "#" });
            InstaPostSB.Add(new ArticleModel() { Photo = "post_6.png", LienArticle = "#" });
            InstaPostSB.Add(new ArticleModel() { Photo = "post_7.png", LienArticle = "#" });
            InstaPostSB.Add(new ArticleModel() { Photo = "post_8.png", LienArticle = "#" });
            InstaPostSB.Add(new ArticleModel() { Photo = "post_9.png", LienArticle = "#" });
            InstaPostSB.Add(new ArticleModel() { Photo = "post_10.png", LienArticle = "#" });
        }

        #region Props
        public ArticleModel DetailArticle { get => _detailArticle; set => _detailArticle = value; }
        public ArticleModel TitrePostPrecedent { get => _titrePostPrecedent; set => _titrePostPrecedent = value; }
        public ArticleModel TitrePostSuivant { get => _titrePostSuivant; set => _titrePostSuivant = value; }
        public List<CommentaireModel> CommentsAricle { get => _commentsAricle; set => _commentsAricle = value; }
        public List<CategorieModel> ListeCategoriesSB { get => _listeCategoriesSB; set => _listeCategoriesSB = value; }
        public List<ArticleModel> RecentPostSB { get => _RecentPostSB; set => _RecentPostSB = value; }
        public List<CategorieModel> TagCloudSB { get => _TagCloudSB; set => _TagCloudSB = value; }
        public List<ArticleModel> InstaPostSB { get => _InstaPostSB; set => _InstaPostSB = value; }
        public int MaxArticle { get => _maxArticle; set => _maxArticle = value; }
       
        public CommentaireModel AddComments { get => _addComments; set => _addComments = value; }
        #endregion
    }
}