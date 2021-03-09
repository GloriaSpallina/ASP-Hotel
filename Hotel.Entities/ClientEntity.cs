using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ClientEntity
    {
        int _idClient, _idUser;
        string _telephone, _pays, _motDePasse, _salt, _nom, _prenom, _email, _photo, _rue, _numero,_ville, _login;
        bool _isAdmin;

        public int IdClient { get => _idClient; set => _idClient = value; }
        public int IdUser { get => _idUser; set => _idUser = value; }
        public string Telephone { get => _telephone; set => _telephone = value; }
        public string Pays { get => _pays; set => _pays = value; }
        public string MotDePasse { get => _motDePasse; set => _motDePasse = value; }
        public string Salt { get => _salt; set => _salt = value; }
        public bool IsAdmin { get => _isAdmin; set => _isAdmin = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Prenom { get => _prenom; set => _prenom = value; }
        public string Email { get => _email; set => _email = value; }
        public string Photo { get => _photo; set => _photo = value; }
        public string Rue { get => _rue; set => _rue = value; }
        public string Numero { get => _numero; set => _numero = value; }
        public string Ville { get => _ville; set => _ville = value; }
        public string Login { get => _login; set => _login = value; }
    }
}
