using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MenuUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu de usuarios";
                title2.InnerText = "Seccion de usuarios";
                title3.InnerText = "Seccion de permisos";
                Button1.Text = "Agregar usuario";
                Button2.Text = "Modificar usuarios";
                Button3.Text = "Listar usuarios";
                Button4.Text = "Eliminar usuario";
                Button5.Text = "Familias";
                Button6.Text = "Patentes";
                Button7.Text = "Crear familias";
            }
            else
            {
                title.InnerText = "User menu";
                title2.InnerText = "User section";
                title3.InnerText = "Permision section";
                Button1.Text = "Add user";
                Button2.Text = "Edit user";
                Button3.Text = "List user";
                Button4.Text = "Delete user";
                Button5.Text = "Families";
                Button6.Text = "Patents";
                Button7.Text = "Create families";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //add
            HttpContext.Current.Response.Redirect("AddUser.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Familia
            HttpContext.Current.Response.Redirect("FamiliaPatente.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Patente
            HttpContext.Current.Response.Redirect("UsuarioPatente.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Update
            HttpContext.Current.Response.Redirect("EditUser.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //LIst
            HttpContext.Current.Response.Redirect("ListUser.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Delete
            HttpContext.Current.Response.Redirect("DeleteUser.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("AddFamilia.aspx");
        }
    }
}