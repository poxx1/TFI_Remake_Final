using AccesoDatos;
using DigitosVerificadoresLib.interfaces;
using Modelos;
using System;
using System.Collections.Generic;

namespace Controladores
{
    public class SolicitudService : IDVService
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

        public void reacalcDV()
        {
            repository.UpdateAllDV();
            repository.updateDVV();
        }

        public List<string> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<InterpretacionModel> list = repository.getAll();

            list.ForEach(item =>
            {
                if (!(repository.calculateDVH(item).Equals(item.dvh)))
                {
                    errors.Add($"En la tabla {repository.tableName}: El item con id : {item.ID} , fue modificado");
                }
            });

            if (!repository.calculateDVV(list).Equals(repository.getDVV()))
            {
                errors.Add($"El digito verificador vertical de la tabla {repository.tableName} no es correcto");
            }

            return errors;
        }
    }
}