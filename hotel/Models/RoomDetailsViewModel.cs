using Hotel.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomDetailsViewModel
    {
        #region Fields
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private List<RoomCardModel> _roomInfo;
        #endregion


        public RoomDetailsViewModel(int idRoom)
        {
            RoomInfo = uow.GetRoomDetails(idRoom);

        }



        #region Props
        public List<RoomCardModel> RoomInfo { get => _roomInfo; set => _roomInfo = value; }
        #endregion

    }
}