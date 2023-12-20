using Controladores;
using Model;
using Modelos;
using Servicios;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Vista
{
    public partial class MenuCarrito : System.Web.UI.Page
    {
        CursosService cs = new CursosService();
        List<CursosModel> cursos = new List<CursosModel>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Carrito de compras";
                title2.InnerText = "Lista de cursos";
                Label2.Text = "Precio total: 0";
                Button1.Text = "Quitar item seleccionado";
                Button2.Text = "Realizar compra";
            }
            else
            {
                title.InnerText = "Shopping bag";
                title2.InnerText = "Courses List";
                Label2.Text = "Total price: 0";
                Button1.Text = "Remove selected item";
                Button2.Text = "Buy";
            }

            if (!IsPostBack)
            {
                if (Session["carrito"] != null)
                {
                    List<string> lista = (List<string>)Session["carrito"];

                    foreach (object item in lista)
                    {
                        var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                        cursos.Add(cursoActual);
                    }
                    ListBox1.DataSource = lista;
                    ListBox1.DataBind();
                    calcularPrecio();
                }
            }
        }

        private void calcularPrecio()
        {

            List<string> lista1 = (List<string>)Session["carrito"];
            cursos = new List<CursosModel>();

            float count = 0;

            foreach (object item in lista1)
            {
                var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                cursos.Add(cursoActual);
                count += cursoActual.Price;
            }

            Label2.Text = "Precio total: ARS$" + count.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["carrito"] != null)
                {
                    List<string> lista = (List<string>)Session["carrito"];

                    lista.Remove(ListBox1.SelectedValue);

                    foreach (object item in lista)
                    {
                        var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                        cursos.Add(cursoActual);
                    }
                    ListBox1.DataSource = lista;
                    ListBox1.DataBind();

                    calcularPrecio();
                }
            }
            catch(Exception ex) 
            {
                (Master as SiteMaster).alert.ShowAlert("Error en el proceso, intente nuevamente");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                pdf p = new pdf();

                List<string> lista = (List<string>)Session["carrito"];
                cursos = new List<CursosModel>();

                foreach (object item in lista)
                {
                    var cursoActual = listarCursos().Where(x => x.Name.Contains(item.ToString())).ToList().First();
                    cursos.Add(cursoActual);
                }

                p.create(cursos);
                ListBox1.Items.Clear();
                MenuItems.items.Clear();

                calcularPrecio();

                BitacoraService bitacoraService = new BitacoraService();
                UserModel user = new UserModel();
                bitacoraService.LogData("Login", $"El usuario {user.Name} realizo una compra.", "Media");
                (Master as SiteMaster).alert.ShowAlert("Compra realizada con exito");
            }
            catch (Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo realizar la compra"); }
        }
        private List<CursosModel> listarCursos()
        {
            return cs.listCursos();
        }
    }
}