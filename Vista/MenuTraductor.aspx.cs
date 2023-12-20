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
            if(!(bool)Session["permission"])
            { 
                Button2.Enabled = false;
                Button3.Enabled = false;
                Button4.Enabled = false;
                Button5.Enabled = false;
            }

            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu del interprete";
                title2.InnerText = "Seccion del intermprete";
                title3.InnerText = "Seccion de las solicitudes/traducciones";
                Button1.Text = "Interprete virtual";
                Button2.Text = "Agregar traduccion";
                Button3.Text = "Modificar traduccion";
                Button4.Text = "Listar traducciones";
                Button5.Text = "Eliminar traduccion";
            }
            else
            {
                title.InnerText = "Interpreter menu";
                title2.InnerText = "Interpreter section";
                title3.InnerText = "Translation section";
                Button1.Text = "Virtual interpreter";
                Button2.Text = "Add translation";
                Button3.Text = "Modify a translation";
                Button4.Text = "List translations";
                Button5.Text = "Delete translations";
            }
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
            HttpContext.Current.Response.Redirect("EditTraduccion.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //List
            HttpContext.Current.Response.Redirect("ListSolicitud.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Delete
            HttpContext.Current.Response.Redirect("DeleteTraduccion.aspx");
        }
    }
}