using Controladores;
using System;

namespace Vista
{
    public partial class llamarWebService : System.Web.UI.Page
    {
        salidaXML ws = new salidaXML();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Llamar a los webservices";
                title2.InnerText = "WS1. Solicitudes aprobadas ";
                title3.InnerText = "WS2. Solicitudes pendientes: ";
                title4.InnerText = "WS3. Cantidad total de solicitudes: ";
                Label2.Text = "Cantidad";
                Label3.Text = "Cantidad";
                Label4.Text = "Cantidad";
                Button1.Text = "Llamar";
                Button2.Text = "Llamar";
                Button3.Text = "Llamar";
            }
            else
            {
                title.InnerText = "Call webservices";
                title2.InnerText = "WS1. Approved requests";
                title3.InnerText = "WS2. Remaining requests";
                title4.InnerText = "WS3. Total quantity of requests";
                Label2.Text = "Quantity";
                Label3.Text = "Quantity";
                Label4.Text = "Quantity";
                Button1.Text = "Call";
                Button2.Text = "Call";
                Button3.Text = "Call";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //solicitudesAprobadas
            Label2.Text = "Cantidad: " + ws.llamarWebService("solicitudesAprobadas").ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //solicitudesPendientes
            Label3.Text = "Cantidad: " + ws.llamarWebService("solicitudesPendientes").ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //solicitudesTotales
            Label4.Text = "Cantidad: " + ws.llamarWebService("solicitudesTotales").ToString();
        }
    }
}