using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Models
{
    public class ReservationModel
    {
        #region Fields
        private DateTime _datedebut, _datefin;
        private int _nombreadulte, _nombreenfant;
        
        private DateTime? _dateReservation;
        private string _nomTypeChambre, _photoTypeChambre, _login;
        private double? _prix;
        private int? _idClient, _capacite;
        #endregion


        #region props
        public DateTime Datedebut { get => _datedebut; set => _datedebut = value; }
        public DateTime Datefin { get => _datefin; set => _datefin = value; }
        public int Nombreadulte { get => _nombreadulte; set => _nombreadulte = value; }
        public int Nombreenfant { get => _nombreenfant; set => _nombreenfant = value; }
        public DateTime? DateReservation { get => _dateReservation; set => _dateReservation = value; }
        public string NomTypeChambre { get => _nomTypeChambre; set => _nomTypeChambre = value; }
        public string PhotoTypeChambre { get => _photoTypeChambre; set => _photoTypeChambre = value; }
        public string Login { get => _login; set => _login = value; }
        public double? Prix { get => _prix; set => _prix = value; }
        public int? IdClient { get => _idClient; set => _idClient = value; }
        public int? Capacite { get => _capacite; set => _capacite = value; }
        #endregion
    }
}
