using Controladores;
using Model;
using Servicios;
using System;
using System.Web;

namespace Vista
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        UserService us = new UserService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Eliminar usuario";
                Label2.Text = "Seleccione un usuario";
                Button1.Text = "Eliminar usuario";
            }
            else
            {
                title.InnerText = "Delete an user";
                Label2.Text = "Select an user";
                Button1.Text = "Delete";
            }

            if ((bool)Session["logged_in"] != true) HttpContext.Current.Response.Redirect("Start.aspx");
            if ((bool)Session["permission"] != true) HttpContext.Current.Response.Redirect("Start.aspx");
            
            try
            {
                if (ListBox1.Items.Count != 0)
                    ListBox1.Items.Clear();

                foreach (UserModel user in us.GetAll())
                {
                    ListBox1.Items.Add(user.Nickname);
                }
            }
            catch (Exception) { }
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
                //string userName = ListBox1.Text;
                //if(us.delete(userName))
                //    GlobalMessage.MessageBox(this, $"Se elimino a {userName} del sistema");
                //else
                //    GlobalMessage.MessageBox(this, $"No se pudo eliminar a {userName} del sistema");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = ListBox1.Text;
                if (us.delete(userName))
                    (Master as SiteMaster).alert.ShowAlert("Se elimino al usuario seleccionado del sistema");
                else
                    (Master as SiteMaster).alert.ShowError("No se pudo eliminar al usuario intente nuevamente");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo eliminar al usuario intente nuevamente"); }
            try
            {
                if (ListBox1.Items.Count != 0)
                    ListBox1.Items.Clear();

                foreach (UserModel user in us.GetAll())
                {
                    ListBox1.Items.Add(user.Nickname);
                }
            }
            catch (Exception) { }
        }
    }
}