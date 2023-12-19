using Controladores;
using Model;
using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class AddSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Agregar una solicitud de traduccion";
                Label2.Text = "Palabra a agregar";
                Label3.Text = "Descripcion";
                Button1.Text = "Realizar solicitud";

            }
            else
            {
                title.InnerText = "Request a translation";
                Label2.Text = "Word to add";
                Label3.Text = "Description";
                Button1.Text = "Do the request";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //Create solicitud
                InterpretacionModel model = new InterpretacionModel();
                model.Description = TextBox2.Text;
                model.Name = TextBox1.Text;
                model.Fecha = DateTime.Now.ToString();
                model.ID_user = SessionModel.getID();
                model.isApproved = false;

                BitacoraService bitacoraService = new BitacoraService();
                UserModel user = new UserModel();
                bitacoraService.LogData("Login", $"El usuario {user.Name} realizo una solicitud.", "Media");

                SolicitudService solicitud = new SolicitudService();
                if (solicitud.createSolicitud(model))
                {
                    GlobalMessage.MessageBox(this, "Se creo la solicitud");
                }
                else
                {
                    //Create alert
                    GlobalMessage.MessageBox(this, "No se pudo crear la solicitud");
                }
            }
            catch (Exception ex) { GlobalMessage.MessageBox(this,ex.Message); }
        }
    }
}