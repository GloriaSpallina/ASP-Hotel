using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ServiceRepository : BaseRepository<ServiceEntity>, IConcreteRepository<ServiceEntity>
    {
        public ServiceRepository(string connectionString): base(connectionString)
        {

        }

        public List<ServiceEntity> Get()
        {
            return base.Get("SELECT IdService, NomService, DescriptionCourte, DescriptionLongue, PhotoService, Orientation FROM Service");
        }

        public ServiceEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(ServiceEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ServiceEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(ServiceEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
