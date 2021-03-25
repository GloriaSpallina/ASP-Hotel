using Hotel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class ReservationViewModel
    {
        private ReservationModel _nReservation;
        private List<RoomCardModel> _listeChambre;
  
        public ReservationModel NReservation { get => _nReservation; set => _nReservation = value; }
        public List<RoomCardModel> ListeChambre { get => _listeChambre; set => _listeChambre = value; }
    }
}