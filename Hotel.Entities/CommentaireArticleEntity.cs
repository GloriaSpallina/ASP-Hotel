using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class CommentaireArticleEntity
    {
        private int _idArticleBlog, _idCommentaireArticle, _idClient;
        private string _nom, _prenom, _commentaire, _photo;
        private DateTime _date;

        public int IdArticleBlog { get => _idArticleBlog; set => _idArticleBlog = value; }
        public int IdCommentaireArticle { get => _idCommentaireArticle; set => _idCommentaireArticle = value; }
        public int IdClient { get => _idClient; set => _idClient = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public string Commentaire { get => _commentaire; set => _commentaire = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public DateTime Date { get => _date; set => _date = value; }
    }
}
