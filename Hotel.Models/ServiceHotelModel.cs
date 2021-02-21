using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class ServiceHotelModel
    {
        private string _photo, _nomService, _courteDescription, _longueDescription,_orientationPhoto;
   

        public string Photo { get => _photo; set => _photo = value; }
        public string NomService { get => _nomService; set => _nomService = value; }
        public string CourteDescription { get => _courteDescription; set => _courteDescription = value; }
        public string LongueDescription { get => _longueDescription; set => _longueDescription = value; }
        public string OrientationPhoto { get => _orientationPhoto; set => _orientationPhoto = value; }
    }
}