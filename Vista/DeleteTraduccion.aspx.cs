using Controladores;
using Modelos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Vista
{
    public partial class DeleteTraduccion : System.Web.UI.Page
    {
        SolicitudService ss = new SolicitudService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Eliminar solicitudes de traduccion/traducciones";
                Label2.Text = "Lista de las solicitudes";
                Label1.Text = "Solicitud elegida";
                Button1.Text = "Seleccionar";
                Button2.Text = "Eliminar";
            }
            else
            {
                title.InnerText = "Delete a translation";
                Label2.Text = "List of translations";
                Label1.Text = "Selected translation";
                Button1.Text = "Select";
                Button2.Text = "Delete";
            }

            //Falta cagargar bien la lista y desues revisar si cambio bien la data en los otros metodos
            if (!IsPostBack)
            {
                List<InterpretacionModel> lista = ss.listSolicitud().ToList();
                List<string> strings = new List<string>();
                
                foreach(InterpretacionModel model in lista)
                {
                    strings.Add(model.Name.ToString());
                }

                ListBox1.DataSource = strings;
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
            try
            {
                InterpretacionModel im = new InterpretacionModel();
                string name = TextBox1.Text;

                im = ss.listSolicitud().Where(x => x.Name == name).FirstOrDefault();

                ss.deleteSolicitud(im);

                (Master as SiteMaster).alert.ShowAlert("Se elimino la traduccion con exito");
            }
            catch(Exception ex) { (Master as SiteMaster).alert.ShowError("Error al momento de eliminar la traducicon"); }
        }
    }
}