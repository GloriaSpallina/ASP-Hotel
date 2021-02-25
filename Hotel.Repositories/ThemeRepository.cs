using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ThemeRepository : BaseRepository<ThemeEntity>, IConcreteRepository<ThemeEntity>
    {
        public ThemeRepository(string connectionString) : base(connectionString)
        {

        }


        public List<ThemeEntity> Get()
        {
            return base.Get("SELECT * FROM THEME");
        }

        public List<ThemeEntity> GetThemeAndNbArt()
        {
            string requete = @"SELECT dbo.Theme.Libelle, COUNT(*) AS NbArtParTheme
                                FROM dbo.ArticleBlog INNER JOIN
                  dbo.ThemeArticle ON dbo.ArticleBlog.IdArticleBlog = dbo.ThemeArticle.IdArticleBlog INNER JOIN
                  dbo.Theme ON dbo.ThemeArticle.IdTheme = dbo.Theme.IdTheme
                                GROUP BY dbo.Theme.Libelle 
                                ORDER BY NbArtParTheme DESC";
            return base.Get(requete);
        }

        public ThemeEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ThemeEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ThemeEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(ThemeEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
