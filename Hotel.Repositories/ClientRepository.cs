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
        public ClientRepository(string connectionString):base(connectionString)
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
            string requete = @"exec SP_CLIENT_Insert (@Nom, @Prenom, @Login, @MotDePasse)";
            return base.Insert(toInsert, requete);
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
