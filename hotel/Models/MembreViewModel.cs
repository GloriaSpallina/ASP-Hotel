using hotel.Infra;
using Hotel.Models;
using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class MembreViewModel
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);


        public ClientModel CurrentClient { get; set; }
        public List<ReservationModel> Rm { get; set; }
   



        public MembreViewModel()
        {
            CurrentClient = SessionUtils.ConnectedUser;
            Rm = uow.GetReservation(CurrentClient.IdClient);
            
        }



    }
}