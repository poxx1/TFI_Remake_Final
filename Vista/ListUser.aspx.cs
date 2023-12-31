﻿using Controladores;
using Model;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class ListUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Listar usuarios";
                title2.InnerText = "Detalle de los usuarios";
                Button1.Text = "Listar";
            }
            else
            {
                title.InnerText = "List users";
                title2.InnerText = "User details";
                Button1.Text = "List";
            }

            if ((bool)Session["logged_in"] != true) HttpContext.Current.Response.Redirect("Start.aspx");
            if ((bool)Session["permission"] != true) HttpContext.Current.Response.Redirect("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataSource = null;
                GridView1.DataSource = UserList();
                GridView1.DataBind();

            }
            catch(Exception ex) { (Master as SiteMaster).alert.ShowError("Error listando los usuarios"); }
        }

        private List<UserModel> UserList() { 
            UserService userService = new UserService();
            return userService.GetAll();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //GridView1.Columns[1].Visible = false;
        }
    }
}