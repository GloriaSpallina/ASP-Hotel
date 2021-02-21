using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ServiceEntity
    {
        private int _idService;
        private string _nomService, _descriptionCourte, _descriptionLongue, _photoService, _orientation;

        public int IdService { get => _idService; set => _idService = value; }
        public string NomService { get => _nomService; set => _nomService = value; }
        public string DescriptionCourte { get => _descriptionCourte; set => _descriptionCourte = value; }
        public string DescriptionLongue { get => _descriptionLongue; set => _descriptionLongue = value; }
        public string PhotoService { get => _photoService; set => _photoService = value; }
        public string Orientation { get => _orientation; set => _orientation = value; }
    }
}
