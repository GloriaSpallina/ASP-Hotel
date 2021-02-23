using System;
using System.Collections.Generic;
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

        #endregion

        public SingleBlogViewModel()
        {
            DetailArticle = new ArticleModel();
            {
                DetailArticle.Photo = "single_blog_1.png";
                DetailArticle.Titre = "Second divided from form fish beast made every of seas all gathered us saying he our";
                DetailArticle.Categorie = " Travel, Lifestyle";
                DetailArticle.NombreCommentaire = 3;
                
                DetailArticle.Para1="MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower";
                DetailArticle.Para2 = "MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training. who has the willpower to actually";
                DetailArticle.Para3 = "MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower";
                DetailArticle.Para4 = "MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training. who has the willpower to actually";
                DetailArticle.EvidenceTexte = "MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training.";
                DetailArticle.NombreLike1 = 5;
                DetailArticle.NomLikeur = "Lily";
                DetailArticle.NomAuteur = "Harvard milan";
                DetailArticle.PhototAuteur = "author.png";
                DetailArticle.TextAuteur = "Second divided from form fish beast made. Every of seas all gathered use saying you're, he our dominion twon Second divided from";
            };

            TitrePostPrecedent = new ArticleModel();
            TitrePostPrecedent.Photo = "preview.png";
            TitrePostPrecedent.Titre = "Space The Final Frontier";

            TitrePostSuivant = new ArticleModel();
            TitrePostSuivant.Photo = "next.png";
            TitrePostSuivant.Titre = "Telescopes 101";

            //Commentaires Article
            CommentsAricle = new List<CommentaireModel>();
            CommentsAricle.Add(new CommentaireModel() { Photo = "comment_1.png", Commentaire = "Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser", Nom = "Emily Blunt", DateHeureCommentaire = new DateTime(2021,02,21,20,29,00) });
            CommentsAricle.Add(new CommentaireModel() { Photo = "comment_2.png", Commentaire = "Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser", Nom = "Emily Blunt", DateHeureCommentaire = new DateTime(2021, 02, 21, 20, 29, 00) });
            CommentsAricle.Add(new CommentaireModel() { Photo = "comment_3.png", Commentaire = "Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser", Nom = "Emily Blunt", DateHeureCommentaire = new DateTime(2021, 02, 21, 20, 29, 00) });

            // Nombre d'artcile par catégorie
            ListeCategoriesSB = new List<CategorieModel>();
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Resaurant food", NombreArticleCategorie = 37 });
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Travel news", NombreArticleCategorie = 10 });
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Modern technology", NombreArticleCategorie = 3 });
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Product", NombreArticleCategorie = 11 });
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Inspiration", NombreArticleCategorie = 21 });
            ListeCategoriesSB.Add(new CategorieModel() { Ref = "#", Nom = "Health care", NombreArticleCategorie = 14 });

            //recent poste
            RecentPostSB = new List<ArticleModel>();
            RecentPostSB.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_1.png", Titre = "From life was fish...", DateArticle = new DateTime(2019, 01, 12) });
            RecentPostSB.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_2.png", Titre = "The Amazing Hubble", DateArticle = new DateTime(2019, 01, 12) });
            RecentPostSB.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_3.png", Titre = "Astronomy Or Astrology", DateArticle = new DateTime(2019, 01, 12) });
            RecentPostSB.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_4.png", Titre = "Asteroids telescope", DateArticle = new DateTime(2019, 01, 12) });

            //tag Cloud
            TagCloudSB = new List<CategorieModel>();
            TagCloudSB.Add(new CategorieModel() { Nom = "project", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "love", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "technology", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "travel", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "restaurant", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "life style", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "design", Ref = "#" });
            TagCloudSB.Add(new CategorieModel() { Nom = "illustration", Ref = "#" });

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
        #endregion
    }
}