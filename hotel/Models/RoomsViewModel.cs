using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomsViewModel
    {
        #region Fields

        private List<RoomCardModel> _listRoomCard;
        #endregion

        #region Props
        public List<RoomCardModel> ListRoomCard { get => _listRoomCard; set => _listRoomCard = value; }
        #endregion

        public RoomsViewModel()
        {
            ListRoomCard = new List<RoomCardModel>();
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room1.jpg", NomCatégorie = "Classic Double Bed", Prix = 150 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room2.jpg", NomCatégorie = "Classic Double Bed", Prix = 400 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room3.jpg", NomCatégorie = "Classic Double Bed", Prix = 600 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room4.jpg", NomCatégorie = "Classic Double Bed", Prix = 40 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room5.jpg", NomCatégorie = "Classic Double Bed", Prix = 224 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room6.jpg", NomCatégorie = "Classic Double Bed", Prix = 147 });
        }
    }
}