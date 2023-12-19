using Interfaces;
using System;
using System.Xml.Serialization;

namespace Modelos
{
    [Serializable]

    public class InterpretacionModel : IDVEntity
    {
        public int ID { get; set; } 
        public string Name { get; set; }
        public string Description { get; set; }
        public int ID_user { get; set; }
        public bool isApproved { get; set; }
        public string Fecha { get; set; }

        [XmlIgnore]
        public string dvh { get; set; }
    }
}