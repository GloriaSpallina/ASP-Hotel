﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Entities
{
    public class ThemeEntity
    {
        private int _idTheme;
        private string _libelle;

        public int IdTheme { get => _idTheme; set => _idTheme = value; }
        public string Libelle { get => _libelle; set => _libelle = value; }
    }
}