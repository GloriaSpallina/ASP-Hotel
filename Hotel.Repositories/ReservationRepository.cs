using Hotel.DAL.Repositories;
using Hotel.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Repositories
{
    public class ReservationRepository : BaseRepository<ReservationEntity>, IConcreteRepository<ReservationEntity>
    {
        public ReservationRepository(string connectionString): base(connectionString)
        {

        }

        public bool Delete(ReservationEntity toDelete)
        {
            throw new NotImplementedException();
        }

        public List<ReservationEntity> Get()
        {
            throw new NotImplementedException();
        }

        public ReservationEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public List<ReservationEntity> GetAllFromClient(string login)
        {
            string requete = "SELECT * FROM V_ReservationFullInfo WHERE [Login]='"+login+"'";
            return base.Get(requete); 
        }

        public bool Insert(ReservationEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(ReservationEntity toUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
