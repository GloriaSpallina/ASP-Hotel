using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class HotelPhotoRepository: BaseRepository<HotelPhotoEntity>, IConcreteRepository<HotelPhotoEntity>
    {
        public HotelPhotoRepository(string connectionString): base (connectionString)
        {

        }


        public List<HotelPhotoEntity> Get()
        {
            throw new NotImplementedException();
        }

        public HotelPhotoEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }
        // permet d'aller chercher toutes les photos correspondant à un hotel
        public List<HotelPhotoEntity> GetPhotoHotel(int idHotel)
        {
            string requete ="SELECT HotelPhoto.* FROM HotelPhoto INNER JOIN Hotel ON HotelPhoto.IdHotel = Hotel.IdHotel WHERE Hotel.IdHotel=" + idHotel;
            
            return base.Get(requete);

        }
        public bool Insert(HotelPhotoEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(HotelPhotoEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(HotelPhotoEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
