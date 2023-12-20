using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Vista
{
    public partial class DeleteCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Eliminar cursos";
                Label2.Text = "Seleccione un curso";
                Label1.Text = "Curso seleccionado";
                Button2.Text = "Seleccionar";
                Button1.Text = "Eliminar";
            }
            else
            {

                title.InnerText = "Delete courses";
                Label2.Text = "Select a course";
                Label1.Text = "Selected course";
                Button2.Text = "Select";
                Button1.Text = "Delete";
            }

            try
            {
                if (!IsPostBack)
                {
                    CursosService cs = new CursosService();
                    List<CursosModel> lista = cs.listCursos();
                    List<string> listaList = new List<string>();

                    foreach (CursosModel cursos in lista)
                    {
                        listaList.Add(cursos.Name);
                    }

                    ListBox1.DataSource = listaList;
                    ListBox1.DataBind();
                }
            }
            catch (Exception ex) { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                CursosModel cm = new CursosModel();
                CursosService cs = new CursosService();

                string name = TextBox1.Text;

                List<CursosModel> list = new List<CursosModel>();
                list = cs.listCursos();

                cm = list.Where(x => x.Name == name).FirstOrDefault();

                cs.deleteCurso(cm);

                (Master as SiteMaster).alert.ShowAlert("Se elimino el curso seleccionado");

                try
                {
                    if (!IsPostBack)
                    {
                        List<CursosModel> lista = cs.listCursos();
                        List<string> listaList = new List<string>();

                        foreach (CursosModel cursos in lista)
                        {
                            listaList.Add(cursos.Name);
                        }

                        ListBox1.DataSource = listaList;
                        ListBox1.DataBind();
                    }
                }
                catch (Exception ex) { }
            }
            catch (Exception ex)
            {
                (Master as SiteMaster).alert.ShowError("No se pudo eliminar el curso elegido, intente nuevamente. " + ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Seleccionar curso
            CursosModel cm = new CursosModel();
            CursosService cs = new CursosService();

            TextBox1.Text = ListBox1.SelectedValue.ToString();

            //List<CursosModel> list = new List<CursosModel>();
            //list = cs.listCursos();

            //cm = list.Where(x => x.Name == name).FirstOrDefault();


        }
    }
}