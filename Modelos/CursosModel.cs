using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelos
{
    public class CursosModel : IDVEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int ID { get; set; }
        public float Price { get; set; }
        public string dvh { get; set; }
    }
}
