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

        public List<ReservationEntity> GetAllFromClient(int idClient)
        {
            //Dictionary<string, object> p = new Dictionary<string, object>();
            //p.Add("login", login);
            string requete = "SELECT * FROM V_ReservationFullInfo WHERE [IdClient]=" + idClient;
            return base.Get(requete); 
        }

        public bool Insert(ReservationEntity toInsert)
        {
            string requete = @"INSERT INTO [dbo].[Reservation]
           ([DateDebutSejour]
           ,[DateFinSejour]
           ,[NombreAdulte]
           ,[NombreEnfant]
           ,[Statut]
           ,[AssuranceAnnulation]
           ,[IdChambre]
           ,[IdClient]
           ,[DateReservation])
                            VALUES
            (@DateDebutSejour,
            @DateFinSejour,
            @NombreAdulte,
            @NombreEnfant,
            @Statut,
            @AssuranceAnnulation,
            @IdChambre,
            @IdClient,
            GETDATE())";
            return base.Insert(toInsert, requete);
        }

        public bool Update(ReservationEntity toUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
