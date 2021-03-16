using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ReservationEntity
    {
        private DateTime _dateReservation, _dateDebutSejour, _dateFinSejour;
        private int _nombreAdulte, _nombreEnfant, _idClient, _numeroChambre, _capacite;
        private string _nomChambre, _descriptionCourte, _photoTypeChambre, _nomTypeChambre, _login;
        private bool _assuranceAnnulation, _statut;
        private double _prix;

        public DateTime DateReservation { get => _dateReservation; set => _dateReservation = value; }
        public DateTime DateDebutSejour { get => _dateDebutSejour; set => _dateDebutSejour = value; }
        public DateTime DateFinSejour { get => _dateFinSejour; set => _dateFinSejour = value; }
        public int NombreAdulte { get => _nombreAdulte; set => _nombreAdulte = value; }
        public int NombreEnfant { get => _nombreEnfant; set => _nombreEnfant = value; }
        public int IdClient { get => _idClient; set => _idClient = value; }
        public int NumeroChambre { get => _numeroChambre; set => _numeroChambre = value; }
        public int Capacite { get => _capacite; set => _capacite = value; }
        public string NomChambre { get => _nomChambre; set => _nomChambre = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string PhotoTypeChambre { get => _photoTypeChambre; set => _photoTypeChambre = value; }
        public string NomTypeChambre { get => _nomTypeChambre; set => _nomTypeChambre = value; }
        public bool AssuranceAnnulation { get => _assuranceAnnulation; set => _assuranceAnnulation = value; }
        public bool Statut { get => _statut; set => _statut = value; }
        public double Prix { get => _prix; set => _prix = value; }
        public string Login { get => _login; set => _login = value; }
    }
}
