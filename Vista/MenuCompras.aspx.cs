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
            if (!(bool)Session["permission"])
            {
                Button1.Enabled = false;
                Button2.Enabled = false;
                Button3.Enabled = false;
                Button4.Enabled = false;
            }

            //Cursos
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu de compras";
                title2.InnerText = "Seccion de los cursos";
                title3.InnerText = "Seccion de compras";
                Button1.Text = "Agregar curso";
                Button2.Text = "Modificar curso";
                Button3.Text = "Listar cursos";
                Button4.Text = "Eliminar cursos";
                Button5.Text = "Menu de compras";
                Button6.Text = "Carrito de compras";
            }
            else
            {
                title.InnerText = "Purchase menu";
                title2.InnerText = "Courses section";
                title3.InnerText = "Purchases section";
                Button1.Text = "Add course";
                Button2.Text = "Edit course";
                Button3.Text = "List courses";
                Button4.Text = "Delete course";
                Button5.Text = "Purchase menu";
                Button6.Text = "Shopping bag";
            }

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
            HttpContext.Current.Response.Redirect("DeleteCurso.aspx");
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