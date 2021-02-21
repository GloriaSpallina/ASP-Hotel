using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class TypeChambreRepository: BaseRepository<TypeChambreEntity>, IConcreteRepository<TypeChambreEntity>
    {
        public TypeChambreRepository(string connectionString): base(connectionString)
        {

        }

    
        public List<TypeChambreEntity> Get()
        {
            string requete = @"SELECT * FROM V_Room";
            return base.Get(requete);
        }

        public TypeChambreEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(TypeChambreEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(TypeChambreEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(TypeChambreEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
