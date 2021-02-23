using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class PhotoTypeChambreRepository : BaseRepository<PhotoTypeChambreEntity>, IConcreteRepository<PhotoTypeChambreEntity>
    {
        public PhotoTypeChambreRepository(string connectionString) : base(connectionString)
        {

        }



        public List<PhotoTypeChambreEntity> Get()
        {
            return base.Get("Select * FROM PhotoTypeChambre");
        }

        public PhotoTypeChambreEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }
        //Permet d'aller chercher les photo de toutes les  chambre d'un hotel
        public List<PhotoTypeChambreEntity> GetPhotoChambre(int idHotel)
        {
            string requete = @"SELECT PhotoTypeChambre.Photo
                               FROM Hotel INNER JOIN
                               Chambre ON Hotel.IdHotel = Chambre.IdHotel INNER JOIN
                               TypeChambre ON Chambre.IdTypeChambre = TypeChambre.IdTypeChambre INNER JOIN
                               PhotoTypeChambre ON TypeChambre.IdTypeChambre = PhotoTypeChambre.IdTypeChambre

                               WHERE Hotel.IdHotel=" + idHotel;

            return base.Get(requete);

        }

        public bool Insert(PhotoTypeChambreEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(PhotoTypeChambreEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(PhotoTypeChambreEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
