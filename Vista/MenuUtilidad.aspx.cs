using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MenuUtilidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu de utilidades";
                title2.InnerText = "Seccion del aldministrador";
                title3.InnerText = "Seccion del webmaster";
                Button1.Text = "Bitacora";
                Button1.Text = "Salidas XML";
                Button1.Text = "WebServices";
                Button1.Text = "Backup";
                Button1.Text = "Restore";
                Button1.Text = "Corrupcion";

            }
            else
            {
                title.InnerText = "Utilities menu";
                title2.InnerText = "Admin section";
                title3.InnerText = "WS section";
                Button1.Text = "Logs";
                Button1.Text = "XML outputs";
                Button1.Text = "WebServices";
                Button1.Text = "Backup";
                Button1.Text = "Restore";
                Button1.Text = "Corruption";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Bitacora
            HttpContext.Current.Response.Redirect("Bitacora.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Salidas xml
            HttpContext.Current.Response.Redirect("salidasXML.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Webservices
            HttpContext.Current.Response.Redirect("llamarWebService.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Backup
            HttpContext.Current.Response.Redirect("Backup.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            //Corrupcion
            HttpContext.Current.Response.Redirect("Corrupcion.aspx");
        }
    }
}