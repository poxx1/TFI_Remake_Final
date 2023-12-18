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
    public partial class DeleteCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            CursosModel cm = new CursosModel();
            CursosService cs = new CursosService();

            string name = ListBox1.SelectedValue.ToString();

            List<CursosModel> list = new List<CursosModel>();
            list = cs.listCursos();

            cm = list.Where(x=>x.Name == name).FirstOrDefault();

            cs.deleteCurso(cm);

                (Master as SiteMaster).alert.ShowAlert("Se elimino el curso seleccionado");
            }
            catch(Exception ex)
            {
                (Master as SiteMaster).alert.ShowError("No se pudo eliminar el curso elegido, intente nuevamente. " + ex.Message);
            }
        }
    }
}