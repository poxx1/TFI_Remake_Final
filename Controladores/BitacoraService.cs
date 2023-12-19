using Modelos;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Globalization;
using DigitosVerificadoresLib.interfaces;

namespace Servicios
{
    public class BitacoraService : IDVService
    {
        BitacoraRepository logRepo = new BitacoraRepository();


        private string getCurrentTime()
        {
            //Para no tener problemas con las fechas, le hardcodeo a la verga la cultura y siempre
            //me mantiene el mismo formato. Si en la bd lo guardo como date y no como string soy un tarado.
            CultureInfo.CurrentCulture = new CultureInfo("en-US", false);
            return DateTime.Now.ToString("HH:mm:ss");
        }
        private string getCurrentDate()
        {
            //Para no tener problemas con las fechas, le hardcodeo a la verga la cultura y siempre
            //me mantiene el mismo formato. Si en la bd lo guardo como date y no como string soy un tarado.
            CultureInfo.CurrentCulture = new CultureInfo("en-US", false);
            return DateTime.Now.ToString("MM/dd/yy");
        }
        private string getCurrentUser()
        {
            try
            {
                return SessionModel.GetInstance.user.Nickname;
            }
            catch (Exception)
            {
                //MessageBox.Show("Error obteniendo el usuario actual");
                //MessageBox.Show(ex.Message);
                return "error";
            }
        }
        private int getCurrentUserID()
        {
            try
            {
                return SessionModel.GetInstance.user.Id;
            }
            catch (Exception)
            {             
                return 0;
            }
        }
        public bool LogData(string actividad, string informacion, string prioridad)
        {
            LogModel log = new LogModel();
            log.Usuario = getCurrentUser();
            log.Hora = getCurrentTime();
            log.Fecha = getCurrentDate();
            log.Details = actividad;
            log.Info = informacion;
            log.Priority = prioridad;


            return logRepo.saveLog(log);
        }

        public List<LogModel> ListLogs()
        {
            return logRepo.listLogs();
        }

        public void reacalcDV()
        {
            logRepo.UpdateAllDV();
            logRepo.updateDVV();
        }

        public List<string> checkintegrity()
        {
            List<String> errors = new List<string>();
            List<LogModel> list = logRepo.getAll();

            list.ForEach(item =>
            {
                if (!(logRepo.calculateDVH(item).Equals(item.dvh)))
                {
                    errors.Add($"En la tabla {logRepo.tableName}: El item con id : {item.Id} , fue modificado");
                }
            });

            if (!logRepo.calculateDVV(list).Equals(logRepo.getDVV()))
            {
                errors.Add($"El digito verificador vertical de la tabla usuarios no es correcto");
            }

            return errors;
        }
    }
}