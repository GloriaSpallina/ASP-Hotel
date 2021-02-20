using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class TemoignageModel
    {
        private string _photo, _commentaire, _nom, _fidelite;
        private int _note;

        public string Photo { get => _photo; set => _photo = value; }
        public string Commentaire { get => _commentaire; set => _commentaire = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Fidelite { get => _fidelite; set => _fidelite = value; }
        public int Note { get => _note; set => _note = value; }
    }
}