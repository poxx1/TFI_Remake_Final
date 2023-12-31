﻿using Controladores;
using Model;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["logged_in"] != true) HttpContext.Current.Response.Redirect("Start.aspx");
            if ((bool)Session["permission"] != true) HttpContext.Current.Response.Redirect("Default.aspx");

            if ((int)Session["language"] == 1)
            {
                Label1.Text = "DNI";
                Label2.Text = "Nombre";
                Label3.Text = "Apellido";
                Label4.Text = "Nombre de usuario";
                Label5.Text = "Contrasenia";
                Label6.Text = "Correo electronico";
                Label7.Text = "Telefono";
                Label8.Text = "Direccion";

                Button1.Text = "Agregar usuario";
            }
            else
            {
                Label1.Text = "DNI";
                Label2.Text = "Name";
                Label3.Text = "Surename";
                Label4.Text = "Username";
                Label5.Text = "Password";
                Label6.Text = "E-mail";
                Label7.Text = "Telephone";
                Label8.Text = "Address";

                Button1.Text = "Add user";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isValidData = true;

            #region Regex
            if (!Regex.IsMatch(TextBox1.Text, "^([0-9]+$)")) //Numbers only DNI
            {
                isValidData = false;
                GlobalMessage.MessageBox(this, $"El DNI no es valido");
            }
            if (!Regex.IsMatch(TextBox2.Text, "^([a-zA-Z]+$)")) //Letters only NOMBRE
            { isValidData = false; GlobalMessage.MessageBox(this, $"El nombre no es valido");
            }
            if (!Regex.IsMatch(TextBox3.Text, "^([a-zA-Z]+$)"))//Numbers only APELLIDO
            { isValidData = false; GlobalMessage.MessageBox(this, $"El Apellido no es valido");
            }
            if (!Regex.IsMatch(TextBox4.Text, "^([a-zA-Z]+$)"))//Letters only NICK
            { isValidData = false; GlobalMessage.MessageBox(this, $"El Nickname no es valido, solo letras");
            }
            int count = TextBox5.Text.ToCharArray().Count();
            if (count < 8)//(!Regex.IsMatch(TextBox3.Text, "^(\\s*(\\S)\\s*){8,}\r\n"))//PASSWORD > 8
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"La password no es valida, mayor a 8 caracteres");
            }
            if (!isValidEmail(TextBox6.Text))//EMAIL
            { isValidData = false; GlobalMessage.MessageBox(this, $"El email no es valido");
            }
            if (!Regex.IsMatch(TextBox7.Text, "^([0-9]+$)"))//Numbers only - Telefono
            { isValidData = false; GlobalMessage.MessageBox(this, $"El telefono no es valido");
            }
            if (TextBox8.Text == "")//fijate que no te vacio
            { isValidData = false; GlobalMessage.MessageBox(this, $"La direccion no es valida");
            }
            #endregion

            //FIX THIS
            //isValidData = true;

            if (isValidData)
            {
                UserModel user = new UserModel();
                user.Dni = TextBox1.Text;
                user.Name = TextBox2.Text;
                user.LastName = TextBox3.Text;
                user.Nickname = TextBox4.Text;
                user.Password = TextBox5.Text;
                user.Mail = TextBox6.Text;
                user.Phone = TextBox7.Text;
                user.Adress = TextBox8.Text;

                if (AddUser(user))
                {
                    (Master as SiteMaster).alert.ShowAlert("Se agrego al usuario con exito");

                    BitacoraService bitacoraService = new BitacoraService();
                    bitacoraService.LogData("Login", $"El usuario {user.Name} agrego un usuario nuevo.", "Media");
                }
                else
                    (Master as SiteMaster).alert.ShowError("No se pudo agregar al usuario");
            }
            else
                (Master as SiteMaster).alert.ShowAlert("Alguno de los campos que intento ingresar no es valido. Por favor revise y vuelva a intentar");
        }

        public bool isValidEmail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        public bool AddUser(UserModel user) {
            UserService us = new UserService();
            us.CreateUser(user);
            return true;
        }
    }
}