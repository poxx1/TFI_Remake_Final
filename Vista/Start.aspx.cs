﻿using System;
using System.Web;
using System.Web.UI.WebControls;
using Controladores;
using Model;
using Servicios;
using LogService = Controladores.Login;

namespace Vista
{
    public partial class Start : System.Web.UI.Page
    {
        UserModel user = new UserModel();
        LogService login = new LogService();
        BitacoraService bitacoraService = new BitacoraService();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["logged_in"] = false;
            Session["language"] = 1;
            //GlobalMessage.MessageBox(this, $"{Session.SessionID}");
            //Label1.Text = Session.SessionID;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            user.Nickname = TextBox1.Text;
            user.Password = TextBox2.Text;

            if (logIn(user))
            {
                Session["logged_in"] = true;

                UserService us = new UserService();
                user = us.Get(user.Nickname);

                if(user.Language == 2) { Session["language"] = 2; HttpContext.Current.Response.Redirect("Default.aspx"); }
                HttpContext.Current.Response.Redirect("Default.aspx");
                (Master as SiteMaster).alert.ShowAlert("Login OK");
            }
            else
                if (login.isCorruputed == true) {
                foreach (var item in login.corrputionList)
                {
                    (Master as SiteMaster).alert.ShowAlert("La DB esta corrpta");
                }

            }
            else
            {
                c
            }
        }

        private bool logIn(UserModel user)
        {
            if (login.LogIn(user,this))
            {
                bitacoraService.LogData("Login", $"El usuario {user.Name} se logueo.", "Baja");

                return true;
            }
            return false;
        }
    }
}