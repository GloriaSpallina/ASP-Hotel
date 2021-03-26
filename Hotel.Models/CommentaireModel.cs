using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class CommentaireModel
    {
        private string _photo, _nom, _commentaire, _prenom;
        private DateTime _dateHeureCommentaire;

        public string Photo { get => _photo; set => _photo = value; }
        public string Nom { get => _nom; set => _nom = value; }

        [Required]
        public string Commentaire { get => _commentaire; set => _commentaire = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public DateTime DateHeureCommentaire { get => _dateHeureCommentaire; set => _dateHeureCommentaire = value; }
     
    }
}