using Controladores;
using System;
using System.IO;
using Servicios;
using Model;

namespace Vista
{
    public partial class Backup : System.Web.UI.Page
    {
        BackupService backup = new BackupService();
        string pathActual = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Backup";
                Button2.Text = "Realizar backup";
                title2.InnerText = "Restaurar";
                Label1.Text = "Seleccione el backup que desea restaurar";
                Button1.Text = "Realizar restore";
            }
            else
            {
                title.InnerText = "Backup";
                Button2.Text = "Do backup";
                title2.InnerText = "Restore";
                Label1.Text = "Select the backup to restore";
                Button1.Text = "Do restore";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                checkCreateDirectory();
                backup.realizarBackup("C://Backup");
                BitacoraService bitacoraService = new BitacoraService();
                UserModel user = new UserModel();
                bitacoraService.LogData("Login", $"El usuario {user.Name} realizo un backup.", "Media");
                (Master as SiteMaster).alert.ShowAlert("Operacion exitosa. Se realizo el backup con exito");

            }
            catch (Exception ex) {
                (Master as SiteMaster).alert.ShowError("Error creando el backup");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    checkCreateDirectory();
                    pathActual = "C://Backup//" + FileUpload1.FileName;

                    backup.realizarRestore(pathActual);

                    BitacoraService bitacoraService = new BitacoraService();
                    UserModel user = new UserModel();
                    bitacoraService.LogData("Login", $"El usuario {user.Name} realizo un restore de la base de datos.", "Media");
                    (Master as SiteMaster).alert.ShowAlert("Se realizo el restore correctamente");
                }
                catch(Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo realizar el restore. Intente nuevamente"); }
            }
        }
        private void checkCreateDirectory()
        {
            string path = "C://Backup";

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}