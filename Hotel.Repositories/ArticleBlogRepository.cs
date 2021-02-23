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
            string requete = @"SELECT * FROM V_ArticleTop3";
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
