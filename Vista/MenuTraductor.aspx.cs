using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MenuTraductor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Interprete
            HttpContext.Current.Response.Redirect("Interprete.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Add
            HttpContext.Current.Response.Redirect("AddSolicitud.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Update
            HttpContext.Current.Response.Redirect("EditSolicitud.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //List
            HttpContext.Current.Response.Redirect("ListSolicitud.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Delete
            HttpContext.Current.Response.Redirect("DeleteSolicitud.aspx");
        }
    }
}