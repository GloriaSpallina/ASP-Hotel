using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ArticleBlogEntity
    {
        private int _idArticleBlog,  _idHotel, _idAuteurArticle, _NBComment;
        private string _photo, _titre, _accroche, _contenuArticle, _texteEvidence, _pargraphe1, _pargraphe2, _pargraphe3, _pargraphe4, _nom,_prenom,_themes, _photoAuteur, _description;
        private DateTime _date;


        public int IdHotel { get => _idHotel; set => _idHotel = value; }
        public int IdAuteurArticle { get => _idAuteurArticle; set => _idAuteurArticle = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public string Titre { get => _titre; set => _titre = value; }
        public string Accroche { get => _accroche; set => _accroche = value; }
        public string ContenuArticle { get => _contenuArticle; set => _contenuArticle = value; }
        public string TexteEvidence { get => _texteEvidence; set => _texteEvidence = value; }
        public string Pargraphe1 { get => _pargraphe1; set => _pargraphe1 = value; }
        public string Pargraphe2 { get => _pargraphe2; set => _pargraphe2 = value; }
        public string Pargraphe3 { get => _pargraphe3; set => _pargraphe3 = value; }
        public string Pargraphe4 { get => _pargraphe4; set => _pargraphe4 = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public int NBComment { get => _NBComment; set => _NBComment = value; }
        public DateTime Date { get => _date; set => _date = value; }
        public string Themes { get => _themes; set => _themes = value; }
        public int IdArticleBlog { get => _idArticleBlog; set => _idArticleBlog = value; }
        public string PhotoAuteur { get => _photoAuteur; set => _photoAuteur = value; }
       
        public string Description { get => _description; set => _description = value; }
    }
}
