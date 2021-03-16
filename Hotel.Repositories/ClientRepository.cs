using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ClientRepository : BaseRepository<ClientEntity>, IConcreteRepository<ClientEntity>
    {
        public ClientRepository(string connectionString) : base(connectionString)
        {

        }


        public List<ClientEntity> Get()
        {
            throw new NotImplementedException();
        }

        public ClientEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ClientEntity toInsert)
        {
            string requete = @"EXECUTE [dbo].[SP_CLIENT_INSERT]
                 @MotDePasse
                ,@Nom
                ,@Prenom
                ,@Login
                ,@Pays
                ,@Ville
	            ,@Rue
                ,@Numero
                ,@Telephone
                ,@Email
                ,@Photo ";
            return base.Insert(toInsert, requete);
        }

        public ClientEntity GetFromLogin(string Login, string MotDePasse)
        {
            string requete = @"EXEC [dbo].[SP_CHECK_PASSWORD]
                @Login,
                @MotDePasse";
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("Login", Login);
            param.Add("MotDePasse", MotDePasse);
            return base.Get(requete, param).FirstOrDefault();
        }
        public bool Update(ClientEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(ClientEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
