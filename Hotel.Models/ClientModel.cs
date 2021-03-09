using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Models
{
    public class ClientModel
    {
        int _idClient;
        string _prenom, _nom, _login, _motDePasse, _confirmMotDePasse;
        string  _email, _telephone, _pays, _ville, _photo;
        public int IdClient
        {
            get
            {
                return _idClient;
            }

            set
            {
                _idClient = value;
            }
        }
        [Required]
        [MaxLength(50)]
        public string Prenom
        {
            get
            {
                return _prenom;
            }

            set
            {
                _prenom = value;
            }
        }
        [Required]
        [MaxLength(50)]
        public string Nom
        {
            get
            {
                return _nom;
            }

            set
            {
                _nom = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string Login
        {
            get
            {
                return _login;
            }

            set
            {
                _login = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string MotDePasse
        {
            get
            {
                return _motDePasse;
            }
            set
            {
                _motDePasse = value;
            }
        }

        [Required]
        [MaxLength(50)]
        [Compare("MotDePasse", ErrorMessage = "No Matching Password")]
        public string ConfirmMotDePasse
        {
            get
            {
                return _confirmMotDePasse;
            }

            set
            {
                _confirmMotDePasse = value;
            }
        }
        
        [EmailAddress]
        [DataType(DataType.EmailAddress)]
        public string Email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }

        public string Telephone
        {
            get
            {
                return _telephone;
            }

            set
            {
                _telephone = value;
            }
        }

 
        [Required]

        public string Pays
        {
            get
            {
                return _pays;
            }

            set
            {
                _pays = value;
            }
        }
        [Required]
        public string Ville
        {
            get
            {
                return _ville;
            }

            set
            {
                _ville = value;
            }
        }

        public string Photo
        {
            get
            {
                return _photo;
            }

            set
            {
                _photo = value;
            }
        }
    }
}
