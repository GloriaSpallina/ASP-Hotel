using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class CompanyHotelRepository: BaseRepository<CompanyHotelEntity>, IConcreteRepository<CompanyHotelEntity>
    {
        public CompanyHotelRepository(string connectionString): base(connectionString)
        {

        }


        public List<CompanyHotelEntity> Get()
        {
            throw new NotImplementedException();
        }

        public CompanyHotelEntity GetOne(int PK)
        {
            string requete = @"SELECT *
                                FROM CompanyHotel WHERE IdCompanyHotel =@id";
            return base.GetOne(PK, requete);
        }

        public bool Insert(CompanyHotelEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(CompanyHotelEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(CompanyHotelEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
