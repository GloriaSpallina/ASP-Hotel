using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class RoomCardModel
    {
        private string _photoChambre, _nomCategorie, _nomChambre, _descCourte, _descLongue, _equipement;
        private double _prix;
        private int _capacite, _numeroChambre, _idChambre, _idTypeChambre;

        public string PhotoChambre { get => _photoChambre; set => _photoChambre = value; }
        public string NomCategorie { get => _nomCategorie; set => _nomCategorie = value; }
        public double Prix { get => _prix; set => _prix = value; }
        public int Capacite { get => _capacite; set => _capacite = value; }
        public int NumeroChambre { get => _numeroChambre; set => _numeroChambre = value; }
        public int IdChambre { get => _idChambre; set => _idChambre = value; }
        public string DescCourte { get => _descCourte; set => _descCourte = value; }
        public string DescLongue { get => _descLongue; set => _descLongue = value; }
        public string NomChambre { get => _nomChambre; set => _nomChambre = value; }
        public string Equipement { get => _equipement; set => _equipement = value; }
        public int IdTypeChambre { get => _idTypeChambre; set => _idTypeChambre = value; }
    }
}