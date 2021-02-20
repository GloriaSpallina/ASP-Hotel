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
        private List<SliderModel> _roomSlider;
        #endregion

        #region Props
        public List<RoomCardModel> ListRoomCard { get => _listRoomCard; set => _listRoomCard = value; }
        public List<SliderModel> RoomSlider { get => _roomSlider; set => _roomSlider = value; }
        #endregion

        public RoomsViewModel()
        {
            // carte chambre
            ListRoomCard = new List<RoomCardModel>();
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room1.jpg", NomCatégorie = "Classic Double Bed", Prix = 150 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room2.jpg", NomCatégorie = "Classic Double Bed", Prix = 400 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room3.jpg", NomCatégorie = "Classic Double Bed", Prix = 600 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room4.jpg", NomCatégorie = "Classic Double Bed", Prix = 40 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room5.jpg", NomCatégorie = "Classic Double Bed", Prix = 224 });
            ListRoomCard.Add(new RoomCardModel() { PhotoChambre = "room6.jpg", NomCatégorie = "Classic Double Bed", Prix = 147 });

            // slider photos chambres

            RoomSlider = new List<SliderModel>();
            RoomSlider.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery1.jpg" });
            RoomSlider.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery2.jpg" });
            RoomSlider.Add(new SliderModel() { Ref = "#", LienPhoto = "gallery3.jpg" });
        }
    }
}