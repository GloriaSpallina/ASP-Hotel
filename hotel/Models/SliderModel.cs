using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class SliderModel
    {
        private string _ref, _lienPhoto;

        public string Ref { get => _ref; set => _ref = value; }
        public string LienPhoto { get => _lienPhoto; set => _lienPhoto = value; }
    }
}