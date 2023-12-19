using Model;
using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Vista
{
    public partial class MenuItems : System.Web.UI.Page
    {
        CursosService cs = new CursosService();
        public static List<string> items;
        List<string> cursos = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Menu de compras";
                Button1.Text = "Agregar al carrito";
                Button2.Text = "Ir al carrito";
                Label1.Text = "Lista de cursos";
                Label2.Text = "Descripcion del curso";
                Label3.Text = "$0";
                Label4.Text = "Nombre del curso";
                Label5.Text = "Nombre";
                Label6.Text = "Precio";
                Label7.Text = "Descripcion";
                Label8.Text = "Carrito de compras";
            }
            else
            {
                title.InnerText = "Purchase menu";
                Button1.Text = "Add to the shopping bag";
                Button2.Text = "Go to the shopping bag";
                Label1.Text = "Courses list";
                Label2.Text = "Course description";
                Label3.Text = "$0";
                Label4.Text = "Name of the course";
                Label5.Text = "Name";
                Label6.Text = "Price";
                Label7.Text = "Description";
                Label8.Text = "Shopping bag";
            }

            if (!IsPostBack)
            {
                ListBox1.SelectedIndex = 0;
                if (Session["carrito"] == null)
                {
                    items = new List<string>();
                    Session["carrito"] = items;
                }

                //Foreach 
                List<string> listCursos = new List<string>();

                foreach (CursosModel curso in listarCursos())
                {
                    listCursos.Add(curso.Name);
                }

                //Listar cursos
                ListBox1.DataSource = listCursos;
                ListBox1.DataBind();
                
                if (Session["carrito"] != null)
                {
                    List<string> lista = (List<string>)Session["carrito"];

                    foreach (object item in lista)
                    {
                        var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                        cursos.Add(ListBox1.SelectedValue.ToString());
                    }
                    ListBox2.DataSource = lista;
                    ListBox2.DataBind();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Redirect
            HttpContext.Current.Response.Redirect("MenuCarrito.aspx");
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CursosModel cursoActual = new CursosModel();
            string curso = ListBox1.SelectedValue.ToString();
            //string[] curso = cursoFull[0].ToString().Split(' ');

            cursoActual = listarCursos().Where(x => x.Name.Contains(curso.ToString())).ToList().First();

            if (cursoActual != null)
            {
                Label4.Text = cursoActual.Name;
                Label3.Text = "ARS$" + cursoActual.Price.ToString();
                Label2.Text = cursoActual.Description;
            }

            if(items!=null)
                items.Add(ListBox1.SelectedValue.ToString());

            BitacoraService bitacoraService = new BitacoraService();
            UserModel user = new UserModel();
            bitacoraService.LogData("Login", $"El usuario {user.Name} agrego un item al carrito.", "Media");
            GlobalMessage.MessageBox(this, $"Se agrego el item al carrito");
        }
        private List<CursosModel> listarCursos() {
            return cs.listCursos();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
            {
                List<string> lista = (List<string>)Session["carrito"];

                foreach (object item in lista)
                {
                    var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                    cursos.Add(ListBox1.SelectedValue.ToString());
                }
                ListBox2.DataSource = lista;
                ListBox2.DataBind();
            }
        }
    }
}