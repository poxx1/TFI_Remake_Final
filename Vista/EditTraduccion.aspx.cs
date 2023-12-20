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
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Editar solicitud";
                Label2.Text = "Lista de traducciones";
                Label1.Text = "Nombre";
                Label3.Text = "Descripcion";
                Button1.Text = "Seleccionar";
                Button2.Text = "Editar";
            }
            else
            {
                title.InnerText = "Edit request";
                Label2.Text = "List of requests";
                Label1.Text = "Name";
                Label3.Text = "Description";
                Button1.Text = "Select";
                Button2.Text = "Edit";
            }

            if (!IsPostBack)
            {

                try
                {
                    List<string> strings = new List<string>();
                    foreach (InterpretacionModel im in ss.listSolicitud())
                    {
                        strings.Add(im.Name.ToString());
                    }

                    ListBox1.DataSource = strings;
                    ListBox1.DataBind();
                }
                catch (Exception ex) { 
                    
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Select
            try
            {
                InterpretacionModel im = new InterpretacionModel();
                string name = ListBox1.SelectedValue.ToString();

                List<InterpretacionModel> lista = new List<InterpretacionModel>();
                lista = ss.listSolicitud();
                im = lista.Where(x => x.Name == name).FirstOrDefault();

                TextBox1.Text = im.Name;
                TextBox2.Text = im.Description;
            }
            catch (Exception ex) { }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                //Editar
                InterpretacionModel im = new InterpretacionModel();
                string name = ListBox1.SelectedValue.ToString();

                List<InterpretacionModel> lista = new List<InterpretacionModel>();
                lista = ss.listSolicitud();
                im = lista.Where(x => x.Name == name).FirstOrDefault();

                im.Description = TextBox2.Text;
                im.Name = TextBox1.Text;

                ss.UpdateSolicitud(im);
                (Master as SiteMaster).alert.ShowAlert("Se edito la traduccion/solicitud correctamente");
                //Mensaje de oki
            }
            catch (Exception ex)
            {
                (Master as SiteMaster).alert.ShowAlert("No se pudo editar la solicitud/traduccion");
                //Mensaje de error
            }
            try
            {
                List<string> strings = new List<string>();
                foreach (InterpretacionModel im in ss.listSolicitud())
                {
                    strings.Add(im.Name.ToString());
                }

                ListBox1.DataSource = strings;
                ListBox1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
    }
}