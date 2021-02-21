using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class PhotoTypeChambreEntity
    {
        private int _idPhotoTypeChambre, _idTypeChambre;
        private string _lienPhoto;

        public int IdPhotoTypeChambre { get => _idPhotoTypeChambre; set => _idPhotoTypeChambre = value; }
        public int IdTypeChambre { get => _idTypeChambre; set => _idTypeChambre = value; }
        public string LienPhoto { get => _lienPhoto; set => _lienPhoto = value; }
    }
}
