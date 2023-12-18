using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoDatos;
using DigitosVerificadoresLib.interfaces;
using Model;
using Modelos;

namespace Servicios
{
    public class CursosService : IDVService
    {
        CursosRepository cr = new CursosRepository();

        public bool  addCurso(CursosModel curso) {

            cr.addCurso(curso);
            return true;
        }

        public bool updateCurso(CursosModel curso)
        {

            cr.updateCurso(curso);
            return true;
        }

        public bool deleteCurso(CursosModel curso)
        {

            cr.deleteCurso(curso);
            return true;
        }

        public List<CursosModel> listCursos() {
            return cr.listCursos();
        }

        public void reacalcDV()
        {
            cr.UpdateAllDV();
            cr.updateDVV();
        }

        public List<string> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<CursosModel> list = cr.getAll();

            list.ForEach(item =>
            {
                if (!(cr.calculateDVH(item).Equals(item.dvh)))
                {
                    errors.Add($"En la tabla {cr.tableName}: El item con id : {item.ID} , fue modificado");
                }
            });

            if (!cr.calculateDVV(list).Equals(cr.getDVV()))
            {
                errors.Add($"El digito verificador vertical de la tabla usuarios no es correcto");
            }

            return errors;
        }
    }
}
