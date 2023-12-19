using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelos
{
    public class LogModel : IDVEntity
    {
        public int Id { get; set; }
        public string Hora { get; set; }
        public string Fecha { get; set; }
        public string Details { get; set; }
        public string Info { get; set; }
        public string Usuario { get; set; }
        public string Priority { get; set; }
        public string dvh { get; set; }
    }
}