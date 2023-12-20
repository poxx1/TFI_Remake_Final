using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using Controladores;
using Model;
using Modelos;
using Servicios;
using Vista.Customs;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Vista
{
    public partial class salidasXML : System.Web.UI.Page
    {
        salidaXML salida = new salidaXML();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Salidas XML";
                Button1.Text = "Pendientes";
                Button2.Text = "Aprobadas";
                Button3.Text = "Totales";
            }
            else
            {
                title.InnerText = "XML outputs";
                Button1.Text = "Remaining";
                Button2.Text = "Approved";
                Button3.Text = "Total";
            }

            //Totales
            try
            {
                GridView1.DataSource = salida.solicitudesTotales();
                GridView1.DataBind();
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error escribiendo el XML. Valida que tenga permisos de escritura"); }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Pendientes
            try { 
            GridView1.DataSource = salida.solicitudesAprobadas();
            GridView1.DataBind();
            exportarXML(salida.solicitudesAprobadas());

            BitacoraService bitacoraService = new BitacoraService();
            UserModel user = new UserModel();
            bitacoraService.LogData("Login", $"El usuario {user.Name} listo el XML.", "Media");
                (Master as SiteMaster).alert.ShowError("Se exporto correctamente el XML");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error escribiendo el XML. Valida que tenga permisos de escritura"); }
}
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Aprobadas
            try { 
            GridView1.DataSource = salida.solicitudesPendientes();
            GridView1.DataBind();
            exportarXML(salida.solicitudesPendientes());
            BitacoraService bitacoraService = new BitacoraService();
            UserModel user = new UserModel();
            bitacoraService.LogData("Login", $"El usuario {user.Name} listo el XML.", "Media");
            //GlobalMessage.MessageBox(this, $"Se listo el XML","success");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Titulo?','Body?'," + "success" + ")",true);
                (Master as SiteMaster).alert.ShowError("Se exporto correctamente el XML");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error escribiendo el XML. Valida que tenga permisos de escritura"); }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            try { 
            //Totales
            GridView1.DataSource = salida.solicitudesTotales();
            GridView1.DataBind();
            exportarXML(salida.solicitudesTotales());
            BitacoraService bitacoraService = new BitacoraService();
            UserModel user = new UserModel();
            bitacoraService.LogData("Login", $"El usuario {user.Name} listo el XML.", "Media");
                (Master as SiteMaster).alert.ShowError("Se exporto correctamente el XML");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error escribiendo el XML. Valida que tenga permisos de escritura"); }

        }

        private bool exportarXML(List<InterpretacionModel> lista)
        {
            var serializer = new XmlSerializer(lista.GetType());

            string result;
            using (var writer = new System.IO.StringWriter())
            {
                serializer.Serialize(writer, lista);
                result = writer.ToString();
            }

            string check = (DateTime.Now.ToString().Replace(' ','-').Replace('/','-').Replace(':','-'));

            try
            {
                using (var writer = new System.IO.StreamWriter(@"C:\XML\" + check + ".xml"))
                {
                    writer.Write(result);
                    writer.Close();
                }   
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("Error escribiendo el XML. Valida que tenga permisos de escritura"); }

            return true;
        }
    }
}