using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomCardModel
    {
        private string _photoChambre, _nomCatégorie;
        private double _prix;

        public string PhotoChambre { get => _photoChambre; set => _photoChambre = value; }
        public string NomCatégorie { get => _nomCatégorie; set => _nomCatégorie = value; }
        public double Prix { get => _prix; set => _prix = value; }
    }
}