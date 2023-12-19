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
                Button5.Text = "Permisos";
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
                Button5.Text = "Permissions";
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
            HttpContext.Current.Response.Redirect("aPatenteFamilia.aspx");
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
    }
}