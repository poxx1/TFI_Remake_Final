using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MenuCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Cursos
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Add
            HttpContext.Current.Response.Redirect("MenuAgregarItems.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Update
            HttpContext.Current.Response.Redirect("EditarCursos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //List
            HttpContext.Current.Response.Redirect("ListCursos.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Delete
            HttpContext.Current.Response.Redirect("DeleteCursos.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Compras
            HttpContext.Current.Response.Redirect("MenuItems.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            //Carrito
            HttpContext.Current.Response.Redirect("MenuCarrito.aspx");
        }
    }
}