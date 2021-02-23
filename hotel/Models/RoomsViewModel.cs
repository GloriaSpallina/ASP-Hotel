using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomsViewModel
    {
        #region Fields
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private List<RoomCardModel> _listRoomCard;
        private List<SliderModel> _roomSlider;
        #endregion

        #region Props
        public List<RoomCardModel> ListRoomCard { get => _listRoomCard; set => _listRoomCard = value; }
        public List<SliderModel> RoomSlider { get => _roomSlider; set => _roomSlider = value; }
        #endregion

        public RoomsViewModel()
        {
            // carte chambre
            ListRoomCard = uow.GetCardHotel();

            // slider photos chambres

            RoomSlider = uow.GetPhotoChambre();
        }
    }
}