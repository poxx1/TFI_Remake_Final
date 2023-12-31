﻿using Modelos;
using Servicios;
using System;

namespace Vista
{
    public partial class AddFamilia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                Label2.Text = "Nombre";
                Label3.Text = "Descripcion";
                Button1.Text = "Agregar familia";

            }
            else
            {        
                Label2.Text = "Name";
                Label3.Text = "Description";
                Button1.Text = "Add family";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                PermissionsService ps = new PermissionsService();
                Family f = new Family();
                f.Nombre = TextBox1.Text;
                f.Description = TextBox2.Text;
                
                //Hay que agregarle el componente default a esta familia porque sino rompe todo

                //f.AddChild();

                ps.SaveComponent(f, true);
                (Master as SiteMaster).alert.ShowAlert("Operacion realizada con exito");
            }
            catch { (Master as SiteMaster).alert.ShowError("No se pudo agregar a la familia"); }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}