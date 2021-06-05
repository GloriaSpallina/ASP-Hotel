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
            string requete = @"SELECT dbo.TypeChambre.IdTypeChambre, dbo.TypeChambre.Nom AS NomCat, dbo.TypeChambre.Capacite, dbo.TypeChambre.Prix, dbo.PhotoTypeChambre.Photo
                                FROM dbo.TypeChambre INNER JOIN
                                      dbo.PhotoTypeChambre ON dbo.TypeChambre.IdTypeChambre = dbo.PhotoTypeChambre.IdTypeChambre";
            return base.Get(requete);
        }

        public List<TypeChambreEntity> GetRoomFilter(string dateDeb, string dateFin, int nbPerson)
        {
            string requete = @"EXECUTE sp_RecupChambreDispo '" + dateDeb + "', '" + dateFin + "', " + nbPerson;
         
            return base.Get(requete);
        }

        public TypeChambreEntity GetOne(int PK)
        {
            string requete = @"SELECT * FROM V_Room WHERE IdTypeChambre =" + PK;
            return base.GetOne(PK, requete);
        }

        public List<TypeChambreEntity> GetDetails(int id)
        {
            string requete = @"SELECT * FROM V_Room WHERE IdTypeChambre =" + id;

            return base.Get(requete);
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
