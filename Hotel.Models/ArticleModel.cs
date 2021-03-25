using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hotel.Models
{
    public class ArticleModel
    {
        private string _titre, _phototAuteur, _textAuteur, _categorie, _photo, _article, _evidenceTexte, _nomLikeur, _lienArticle, _resume, _para1, _para2, _para3, _para4, _nomAuteur, _prenomAuteur;
        private int nombreCommentaire, NombreLike, _idBlog;
        private DateTime _dateArticle;

        public string Titre { get => _titre; set => _titre = value; }
        public string Resume { get => _resume; set => _resume = value; }
        public string LienArticle { get => _lienArticle; set => _lienArticle = value; }
        public string Categorie { get => _categorie; set => _categorie = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public string Article { get => _article; set => _article = value; }
        public string EvidenceTexte { get => _evidenceTexte; set => _evidenceTexte = value; }
        public string NomLikeur { get => _nomLikeur; set => _nomLikeur = value; }
        public int NombreCommentaire { get => nombreCommentaire; set => nombreCommentaire = value; }
        public int NombreLike1 { get => NombreLike; set => NombreLike = value; }
        public DateTime DateArticle { get => _dateArticle; set => _dateArticle = value; }
        public string Para1 { get => _para1; set => _para1 = value; }
        public string Para2 { get => _para2; set => _para2 = value; }
        public string Para3 { get => _para3; set => _para3 = value; }
        public string Para4 { get => _para4; set => _para4 = value; }
        public string PhototAuteur { get => _phototAuteur; set => _phototAuteur = value; }
        public string TextAuteur { get => _textAuteur; set => _textAuteur = value; }
        public string NomAuteur { get => _nomAuteur; set => _nomAuteur = value; }
        public string PrenomAuteur { get => _prenomAuteur; set => _prenomAuteur = value; }
        public int IdBlog { get => _idBlog; set => _idBlog = value; }
    }
}