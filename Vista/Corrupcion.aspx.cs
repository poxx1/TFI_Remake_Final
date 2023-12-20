using Business;
using Controladores;
using Servicios;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Corrupcion : System.Web.UI.Page
    {
        BackupService backup = new BackupService();
        string pathActual = string.Empty;
        IntegrityService integrityService = new IntegrityService();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            var lista = integrityService.check();
            errores.Text = lista.Aggregate("</br>", (a,b)=> a + "</br>" +b);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //Restaurar al backup mas reciente.
                DirectoryInfo directory = new DirectoryInfo("C://Backup//");
                //Es un quilombo ese LINQ pero saca el ultimo file y lo ordena por fecha a demas de buscar solo .baks.
                var myFile = directory.GetFiles().OrderByDescending(f => f.LastWriteTime).ToList().Where(x => x.Extension == ".bak").ToList().First();
                pathActual = myFile.FullName;
                backup.realizarRestore(pathActual);
                (Master as SiteMaster).alert.ShowAlert("Se realizo el backup correctamente");
                HttpContext.Current.Response.Redirect("Start.aspx");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error restaurando el backup"); }
            }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                //Recalcular digitos verificadores.
                integrityService.recalcDV();
                (Master as SiteMaster).alert.ShowAlert("Se recalcularon los digitos con exito");
                HttpContext.Current.Response.Redirect("Default.aspx");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo recalcular el digito verificador"); }
        }
    }
}