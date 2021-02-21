using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class HotelPhotoEntity
    {
        private int _idHotelPhoto, _idHotel;
        private string _photo;

        public int IdHotelPhoto { get => _idHotelPhoto; set => _idHotelPhoto = value; }
        public int IdHotel { get => _idHotel; set => _idHotel = value; }
        public string Photo { get => _photo; set => _photo = value; }
    }
}
