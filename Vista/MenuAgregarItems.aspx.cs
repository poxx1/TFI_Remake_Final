using Model;
using Modelos;
using Servicios;
using System;

namespace Vista
{
    public partial class MenuAgregarItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu de compras";
                Label1.Text = "Detalles";
                Label2.Text = "Nombre";
                Label3.Text = "Precio";
                Label4.Text = "Nota. Los precios son en $ARS";
                Label5.Text = "Ingrese los detalles del curso";
                Button1.Text = "Agregar";
            }
            else
            {
                title.InnerText = "Purchase menu";
                Label1.Text = "Details";
                Label2.Text = "Name";
                Label3.Text = "Price";
                Label4.Text = "Note. Prices are being given in $ARS";
                Label5.Text = "Add the details of the course";
                Button1.Text = "Add";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                CursosModel curso = new CursosModel();
                curso.Name = TextBox1.Text;
                curso.Description = TextBox2.Text;
                curso.Price = float.Parse(TextBox3.Text);

                CursosService cs = new CursosService();
                cs.addCurso(curso);

                BitacoraService bitacoraService = new BitacoraService();
                UserModel user = new UserModel();
                bitacoraService.LogData("Login", $"El usuario {user.Name} agrego un curso.", "Media");
                GlobalMessage.MessageBox(this, $"Se agrego el curso");
            }
            catch(Exception ex) 
            { 
                GlobalMessage.MessageBox(this,ex.Message+"SayIt - Error"); 
            }
        }
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            //No hay que hacer nada aca.
        }
    }
}