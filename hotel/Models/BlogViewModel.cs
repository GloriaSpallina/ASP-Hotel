using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class BlogViewModel
    {
        #region fields
        private List<ArticleModel> _articleBlog;
        private List<CategorieModel> _listeCategories;
        private List<ArticleModel> _recentPost;
        private List<CategorieModel> _tagCloud;
        private List<ArticleModel> _instaPost;
        private int _maxArticle, _maxPage;
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        #endregion
        public BlogViewModel()
        {
            // aperçu article



            // Nombre d'artcile par catégorie
            //ListeCategories = new List<CategorieModel>();
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Resaurant food", NombreArticleCategorie = 37 });
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Travel news", NombreArticleCategorie = 10 });
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Modern technology", NombreArticleCategorie = 3 });
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Product", NombreArticleCategorie = 11 });
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Inspiration", NombreArticleCategorie = 21 });
            //ListeCategories.Add(new CategorieModel() { Ref = "#", Nom = "Health care", NombreArticleCategorie = 14 });
            ListeCategories = uow.GetCategoryAndNbArt();
            //recent poste
            RecentPost = new List<ArticleModel>();
            RecentPost.Add(new ArticleModel() { LienArticle= "/Home/SingleBlog", Photo = "post_1.png", Titre="From life was fish...", DateArticle = new DateTime(2019,01,12) });
            RecentPost.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_2.png", Titre = "The Amazing Hubble", DateArticle = new DateTime(2019, 01, 12) });
            RecentPost.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_3.png", Titre = "Astronomy Or Astrology", DateArticle = new DateTime(2019, 01, 12) });
            RecentPost.Add(new ArticleModel() { LienArticle = "/Home/SingleBlog", Photo = "post_4.png", Titre = "Asteroids telescope", DateArticle = new DateTime(2019, 01, 12) });

            //tag Cloud
            TagCloud = uow.GetCloudTag();
            //TagCloud = new List<CategorieModel>();
            //TagCloud.Add(new CategorieModel(){ Nom="project", Ref="#"});
            //TagCloud.Add(new CategorieModel() { Nom = "love", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "technology", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "travel", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "restaurant", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "life style", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "design", Ref = "#" });
            //TagCloud.Add(new CategorieModel() { Nom = "illustration", Ref = "#" });

            //insta

            InstaPost = new List<ArticleModel>();
            InstaPost.Add(new ArticleModel() { Photo = "post_5.png", LienArticle = "#" });
            InstaPost.Add(new ArticleModel() { Photo = "post_6.png", LienArticle = "#" });
            InstaPost.Add(new ArticleModel() { Photo = "post_7.png", LienArticle = "#" });
            InstaPost.Add(new ArticleModel() { Photo = "post_8.png", LienArticle = "#" });
            InstaPost.Add(new ArticleModel() { Photo = "post_9.png", LienArticle = "#" });
            InstaPost.Add(new ArticleModel() { Photo = "post_10.png", LienArticle = "#" });

            MaxArticle = uow.CountArticles();
            MaxPage = MaxArticle / 5;

        }

        public void paginateResumeArticle(string searchTheme = null, string searchString = null, int page = 1)
        {
            ArticleBlog = uow.GetResumeArticle(searchTheme, searchString, page);
            if (searchString != null)
            {
                MaxArticle = ArticleBlog.Count();
                MaxPage = ArticleBlog.Count() / 5;
            }

        }
        #region props

        public List<ArticleModel> ArticleBlog { get => _articleBlog; set => _articleBlog = value; }
        public List<CategorieModel> ListeCategories { get => _listeCategories; set => _listeCategories = value; }
        public List<ArticleModel> RecentPost { get => _recentPost; set => _recentPost = value; }
        public List<CategorieModel> TagCloud { get => _tagCloud; set => _tagCloud = value; }
        public List<ArticleModel> InstaPost { get => _instaPost; set => _instaPost = value; }
        public int MaxArticle { get => _maxArticle; set => _maxArticle = value; }
        public int MaxPage { get => _maxPage; set => _maxPage = value; }
        #endregion
    }
}