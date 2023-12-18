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