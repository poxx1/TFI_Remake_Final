﻿using Modelos;
using Servicios;
using System;
using System.Collections.Generic;

namespace Vista
{
    public partial class ListCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Listar cursos";
            }
            else
            {
                title.InnerText = "List courses";
            }

            CursosService cs = new CursosService();

            List<CursosModel> list = new List<CursosModel>();
            GridView1.DataSource = cs.listCursos();
            GridView1.DataBind();
        }
    }
}