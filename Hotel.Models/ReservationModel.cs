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
        private DateTime _datereservation, _datedebut, _datefin;
        private string _typechambre, _photochambre;
        private int _nombreadulte, _nombreenfant, _idClient;

        #endregion


        #region props
        public DateTime Datereservation { get => _datereservation; set => _datereservation = value; }
        public DateTime Datedebut { get => _datedebut; set => _datedebut = value; }
        public DateTime Datefin { get => _datefin; set => _datefin = value; }
        public string Typechambre { get => _typechambre; set => _typechambre = value; }
        public string Photochambre { get => _photochambre; set => _photochambre = value; }
        public int Nombreadulte { get => _nombreadulte; set => _nombreadulte = value; }
        public int Nombreenfant { get => _nombreenfant; set => _nombreenfant = value; }
        public int IdClient { get => _idClient; set => _idClient = value; }

        #endregion
    }
}
