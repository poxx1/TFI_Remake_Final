using Controladores;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class DeleteTraduccion : System.Web.UI.Page
    {
        SolicitudService ss = new SolicitudService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListBox1.DataSource = ss.listSolicitud(); ;
                ListBox1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Select
            TextBox1.Text = ListBox1.SelectedValue.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Delte
            InterpretacionModel im = new InterpretacionModel();
            string name = TextBox1.Text;

            im = ss.listSolicitud().Where(x=>x.Name == name).FirstOrDefault();

            ss.deleteSolicitud(im);
        }
    }
}