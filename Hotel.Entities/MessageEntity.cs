using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class MessageEntity
    {
        private int _idMessage;
        private string _contenuMail, _dateEnvoie, _nom, _sujet, _email;

        public int IdMessage { get => _idMessage; set => _idMessage = value; }
        public string ContenuMail { get => _contenuMail; set => _contenuMail = value; }
        public string DateEnvoie { get => _dateEnvoie; set => _dateEnvoie = value; }
        public string Nom { get => _nom; set => _nom = value; }
        public string Sujet { get => _sujet; set => _sujet = value; }
        public string Email { get => _email; set => _email = value; }
    }
}
