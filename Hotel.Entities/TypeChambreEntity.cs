using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class TypeChambreEntity
    {
        private int _IdTypeChambre, _capacite;
        private string _nom, _descriptionCourte, _descriptionLongue, _Photo;
        private double _prix;

        public int IdTypeChambre { get => _IdTypeChambre; set => _IdTypeChambre = value; }
        public int Capacite { get => _capacite; set => _capacite = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string DescriptionLongue { get => _descriptionLongue; set => _descriptionLongue = value; }
        public double Prix { get => _prix; set => _prix = value; }
        public string Photo { get => _Photo; set => _Photo = value; }
    }
}
