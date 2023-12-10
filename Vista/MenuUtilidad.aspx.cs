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