using AccesoDatos;
using Modelos;
using System;
using System.Collections.Generic;

namespace Controladores
{
    public class SolicitudService
    {
        SolicitudRepository repository = new SolicitudRepository();

        public bool createSolicitud(InterpretacionModel interpretacion)
        {
            return repository.createSolicitud(interpretacion);
        }

        public List<InterpretacionModel> listSolicitud()
        {
            return repository.listSolicitudes();
        }

        public bool deleteSolicitud(InterpretacionModel value)
        {
            return repository.deleteSolicitud(value);
        }

        public bool Approve(InterpretacionModel value)
        {
            return repository.Approve(value);
        }

        public bool UpdateSolicitud(InterpretacionModel value)
        {
            return repository.Update(value);
        }
    }
}