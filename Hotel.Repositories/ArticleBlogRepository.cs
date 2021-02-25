using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ArticleBlogRepository : BaseRepository<ArticleBlogEntity>, IConcreteRepository<ArticleBlogEntity>
    {
        public ArticleBlogRepository(string connectionString): base(connectionString)
        {

        }


        public List<ArticleBlogEntity> Get()
        {
            string requete = "SELECT * FROM V_ArticleThemes";
            return base.Get(requete);
        }

        public List<ArticleBlogEntity> Get3Last()
        {
            string requete = "SELECT * FROM V_ArticleTop3";
            return base.Get(requete);
        }

        public List<ArticleBlogEntity> GetResume(string searchTheme, string searchString, int page)
        {
            string requete = "SELECT * FROM V_ArticleThemes ";
            if (!String.IsNullOrEmpty(searchString))
            {
                requete += " WHERE Titre LIKE '%" + searchString + "%' ";
            }
            if (!String.IsNullOrEmpty(searchTheme))
            {
                requete += " WHERE Themes LIKE '%" + searchTheme + "%' ";
            }


            int nbParPage = 5;
            int skip = (page - 1) * 5;
            requete += $@"ORDER BY [Date]  OFFSET {skip} ROWS 
                                FETCH NEXT {nbParPage} ROWS ONLY";
            return base.Get(requete);
        }

        public ArticleBlogEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ArticleBlogEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ArticleBlogEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(ArticleBlogEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
