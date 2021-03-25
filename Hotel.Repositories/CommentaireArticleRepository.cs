using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class CommentaireArticleRepository : BaseRepository<CommentaireArticleEntity>, IConcreteRepository<CommentaireArticleEntity>

    {
        public CommentaireArticleRepository(string connectionString):base (connectionString)
        {

        }

        public List<CommentaireArticleEntity> Get()
        {
            throw new NotImplementedException();
        }

        public List<CommentaireArticleEntity> GetCom(int idAricle)
        {
            return base.Get("exec SP_GetCommentsByArticle " + idAricle);
        }
     

        public CommentaireArticleEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(CommentaireArticleEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(CommentaireArticleEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(CommentaireArticleEntity toDelete)
        {
            throw new NotImplementedException();
        }

     
    }
}
