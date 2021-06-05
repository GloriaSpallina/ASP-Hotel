using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ReservationEntity
    {
        private DateTime _dateDebutSejour, _dateFinSejour;
        private int _nombreAdulte, _nombreEnfant, _idClient, _idChambre, _idReservation;
        private bool _assuranceAnnulation, _statut;

        private DateTime? _dateReservation;
        private string _nomTypeChambre, _photoTypeChambre,_login;
        private double? _prix;
        private int? _capacite;





        public DateTime DateDebutSejour { get => _dateDebutSejour; set => _dateDebutSejour = value; }
        public DateTime DateFinSejour { get => _dateFinSejour; set => _dateFinSejour = value; }
        public int NombreAdulte { get => _nombreAdulte; set => _nombreAdulte = value; }
        public int NombreEnfant { get => _nombreEnfant; set => _nombreEnfant = value; }
        public int IdClient { get => _idClient; set => _idClient = value; }

        public bool AssuranceAnnulation { get => _assuranceAnnulation; set => _assuranceAnnulation = value; }
        public bool Statut { get => _statut; set => _statut = value; }
      
        public int IdChambre { get => _idChambre; set => _idChambre = value; }
        public int IdReservation { get => _idReservation; set => _idReservation = value; }
        public DateTime? DateReservation { get => _dateReservation; set => _dateReservation = value; }
        public string NomTypeChambre { get => _nomTypeChambre; set => _nomTypeChambre = value; }
        public string PhotoTypeChambre { get => _photoTypeChambre; set => _photoTypeChambre = value; }
        public string Login { get => _login; set => _login = value; }
        public double? Prix { get => _prix; set => _prix = value; }
        public int? Capacite { get => _capacite; set => _capacite = value; }
    }
}
