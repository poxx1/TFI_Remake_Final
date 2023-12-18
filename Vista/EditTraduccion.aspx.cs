using Controladores;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Vista
{
    public partial class EditTraduccion : System.Web.UI.Page
    {
        SolicitudService ss = new SolicitudService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                ListBox1.DataSource = ss.listSolicitud(); ;
                ListBox1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Select
            InterpretacionModel im = new InterpretacionModel();
            string name = ListBox1.SelectedValue.ToString();
            
            List<InterpretacionModel> lista = new List<InterpretacionModel>();
            im = lista.Where(x=>x.Name==name).FirstOrDefault();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                //Editar
                InterpretacionModel im = new InterpretacionModel();
                im.Name = TextBox1.Text;
                im.Description = TextBox2.Text;

                ss.UpdateSolicitud(im);

                //Mensaje de oki
            }
            catch(Exception ex)
            {
                //Mensaje de error
            }
        }
    }
}