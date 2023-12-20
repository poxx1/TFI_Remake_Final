using Model;
using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vista.Customs;

namespace Vista
{
    public partial class SiteMaster : MasterPage
    {
        public Alert alert
        {
            get { return privatealert; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {            
                Button1.Text = "Idioma: ES";
                Button2.Text = "Cerrar sesion";
                Button3.Text = "Interprete";
                Button4.Text = "Compras";
                Button5.Text = "Clientes";
                Button6.Text = "Utilidades";
            }
            else
            {
                Button1.Text = "Language: EN";
                Button2.Text = "LogOut";
                Button3.Text = "Interpreter";
                Button4.Text = "Purchases";
                Button5.Text = "Clients";
                Button6.Text = "Utilities";
            }

            #region Permisos

            UserModel user = new UserModel();
            PermissionsService ps = new PermissionsService();


            if ((bool)Session["recalcular"] != true)
            {
                user = SessionModel.GetInstance.user;
                List<Component> permisos = user.Permissions;
                List<string> strings = new List<string>();

                string tipoUsuario = "";

                foreach (Component permiso in permisos)
                {
                    if (permiso.Nombre == "Admin" || permiso.Nombre == "Cliente" || permiso.Nombre == "Webmaster")
                        tipoUsuario = permiso.Nombre;
                    permiso.Childs.ForEach(x => strings.Add(x.Nombre));
                }

                Label1.Text = "2023 - Lastra Julian - Proyecto - Trabajo Final de Ing. | Nombre de usuario: " + user.Nickname + " | Tipo de usuario: " + tipoUsuario;
            #endregion

            }

        }


        protected void Idioma(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CambiarIdioma();
        }
        private void CambiarIdioma()
        {
            if ((int)Session["language"] == 1)
            {
                Session["language"] = 2;

                Button1.Text = "Language: EN";
                Button2.Text = "Cerrar sesion";
                Button3.Text = "Interprete";
                Button4.Text = "Compras";
                Button5.Text = "Clientes";
                Button6.Text = "Utilidades";

                Page.Response.Redirect(Page.Request.Url.ToString(), true);

            }
            else 
            {   
                Session["language"] = 1;

                Button1.Text = "Idioma: ES";
                Button2.Text = "LogOut";
                Button3.Text = "Interpreter";
                Button4.Text = "Purchases";
                Button5.Text = "Clients";
                Button6.Text = "Utilities";

                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("MenuUtilidad.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("MenuUsuarios.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("MenuCompras.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("MenuTraductor.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("LogOut.aspx");
        }
    }
}