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
    public partial class EditarCursos : System.Web.UI.Page
    {
        CursosService cs = new CursosService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Editar curso";
                Label1.Text = "Lista de cursos";
                Label2.Text = "Nombre";
                Label3.Text = "Detalles";
                Label4.Text = "Precio";
                Label5.Text = "Nota. Los precios son en $ARS";
                Button1.Text = "Editar";
                Button2.Text = "Seleccionar";
            }
            else
            {
                title.InnerText = "Edit course";
                Label1.Text = "Courses list";
                Label2.Text = "Name";
                Label3.Text = "Details";
                Label4.Text = "Price";
                Label5.Text = "Note. Prices are in $ARS";
                Button1.Text = "Edit";
                Button2.Text = "Select";
            }

            //Listar cursos
            if (!IsPostBack)
            {
                cargarDropDown();
            }
        }

        private void cargarDropDown()
        {
            try
            {
                List<CursosModel> list = new List<CursosModel>();
                list = cs.listCursos();
                List<string> cursos = new List<string>();
                foreach (CursosModel curso in list)
                {
                    cursos.Add(curso.Name);
                }
                DropDownList1.DataSource = cursos;
                DropDownList1.DataBind();
            }
            catch (Exception ex) { 
                
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Get current curso
            string cursoActual = DropDownList1.SelectedValue;
            CursosModel currentCurso = new CursosModel();
            currentCurso = cs.listCursos().Where(x => x.Name == cursoActual).ToList().FirstOrDefault();

            TextBox1.Text = currentCurso.Name;
            TextBox2.Text = currentCurso.Description;
            TextBox3.Text = currentCurso.Price.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Editar los datos del curso
            //Get current curso
            try
            {
                string cursoActual = DropDownList1.SelectedValue;
                CursosModel currentCurso = new CursosModel();
                currentCurso = cs.listCursos().Where(x => x.Name == cursoActual).ToList().FirstOrDefault();
                currentCurso.Name = TextBox1.Text;
                currentCurso.Description = TextBox2.Text;
                currentCurso.Price = float.Parse(TextBox3.Text);
                cs.updateCurso(currentCurso);
                cargarDropDown();

                BitacoraService bitacoraService = new BitacoraService();
                UserModel user = new UserModel();
                bitacoraService.LogData("Login", $"El usuario {user.Name} edito un curso.", "Media");
                (Master as SiteMaster).alert.ShowAlert("Se edito el curso con exito");
            }
            catch(Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo editar el curso, intente nuevamente"); }
        }
    }
}