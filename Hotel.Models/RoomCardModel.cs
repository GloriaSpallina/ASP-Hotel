using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomCardModel
    {
        private string _photoChambre, _nomCategorie;
        private double _prix;

        public string PhotoChambre { get => _photoChambre; set => _photoChambre = value; }
        public string NomCategorie { get => _nomCategorie; set => _nomCategorie = value; }
        public double Prix { get => _prix; set => _prix = value; }
    }
}