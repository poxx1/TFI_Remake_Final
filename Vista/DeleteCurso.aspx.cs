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