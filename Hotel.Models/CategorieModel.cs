using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class CategorieModel
    {
        private string _nom, _ref;
        private int _nombreArticleCategorie;

        public string Nom { get => _nom; set => _nom = value; }
        public int NombreArticleCategorie { get => _nombreArticleCategorie; set => _nombreArticleCategorie = value; }
        public string Ref { get => _ref; set => _ref = value; }
    }
}