using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Hotel.Models
{
    public class ContactModel
    {
        private string _nom, _email, _message, _subject;


        [Required]
        [MaxLength(250)]
        public string Nom { get => _nom; set => _nom = value; }

        [Required]
        [MaxLength(323)] //New MAxLenghtValidationAttibute(323).IsValid()
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
        public string Email { get => _email; set => _email = value; }

        [Required]
        public string Message { get => _message; set => _message = value; }
        [MaxLength(500)]
        public string Subject { get => _subject; set => _subject = value; }
    }
}
