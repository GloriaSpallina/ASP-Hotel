using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class TypeChambreEntity
    {
        private int _IdChambre, _IdTypeChambre, _capacite, _numeroChambre;
        private string _nomChambre, _nomCat, _descriptionCourte, _descriptionLongue, _Photo, _equipementNom;
        private double _prix;

        public int IdTypeChambre { get => _IdTypeChambre; set => _IdTypeChambre = value; }
        public int Capacite { get => _capacite; set => _capacite = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string DescriptionLongue { get => _descriptionLongue; set => _descriptionLongue = value; }
        public double Prix { get => _prix; set => _prix = value; }
        public string Photo { get => _Photo; set => _Photo = value; }
        public int IdChambre { get => _IdChambre; set => _IdChambre = value; }
        public int NumeroChambre { get => _numeroChambre; set => _numeroChambre = value; }
        public string NomChambre { get => _nomChambre; set => _nomChambre = value; }
        public string NomCat { get => _nomCat; set => _nomCat = value; }
        public string EquipementNom { get => _equipementNom; set => _equipementNom = value; }
    }
}
