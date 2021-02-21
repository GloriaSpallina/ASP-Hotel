using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class CompanyHotelEntity
    {
        private int _idCompanyHotel;
        private string _nom, _slogan, _descriptionCourte, _descriptionLongue, _photo;
        private DateTime _dateFondation;

        public int IdCompanyHotel { get => _idCompanyHotel; set => _idCompanyHotel = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Slogan { get => _slogan; set => _slogan = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string DescriptionLongue { get => _descriptionLongue; set => _descriptionLongue = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public DateTime DateFondation { get => _dateFondation; set => _dateFondation = value; }
    }
}
