using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class CompagnyAboutModel
    {
        private string _slogan, _descriptionCourte, _descriptionLongue, _photo;
        private int _anneeExpe;

        public string Slogan { get => _slogan; set => _slogan = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string DescriptionLongue { get => _descriptionLongue; set => _descriptionLongue = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public int AnneeExpe { get => _anneeExpe; set => _anneeExpe = value; }
    }
}