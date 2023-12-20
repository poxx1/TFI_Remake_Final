using Controladores;
using Model;
using Servicios;
using System;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;

namespace Vista
{
    public partial class EditUser : System.Web.UI.Page
    {
        UserService us = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((bool)Session["logged_in"] != true) HttpContext.Current.Response.Redirect("Start.aspx");
                if ((bool)Session["permission"] != true) HttpContext.Current.Response.Redirect("Start.aspx");

                foreach (UserModel user in us.GetAll())
                {
                    ListBox1.Items.Add(user.Nickname);
                }
            }
            #region Idioma
            if ((int)Session["language"] == 1)
            {
                titulo.InnerText = "Editar usuario";
                Label10.Text = "Seleccione un usuario para editarlo";
                Label2.Text = "DNI";
                Label3.Text = "Nombre";
                Label4.Text = "Apellido";
                Label5.Text = "Nombre de usuario";
                Label6.Text = "Contrasenia";
                Label7.Text = "Correo electronico";
                Label8.Text = "Telefono";
                Label9.Text = "Direccion";

                Button1.Text = "Editar";
                Button2.Text = "Desbloquear";
                Button3.Text = "Seleccionar";
            }
            else
            {
                titulo.InnerHtml = "Edit user";
                Label10.Text = "Select an user to edit";
                Label2.Text = "DNI";
                Label3.Text = "Name";
                Label4.Text = "Surename";
                Label5.Text = "Username";
                Label6.Text = "Password";
                Label7.Text = "E-mail";
                Label8.Text = "Telephone";
                Label9.Text = "Address";

                Button1.Text = "Edit";
                Button2.Text = "Unblock";
                Button3.Text = "Select";
            }
            #endregion
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            #region Regex
            bool isValidData = true;
            if (!Regex.IsMatch(TextBox1.Text, "^([0-9]+$)")) //Numbers only DNI
            {
                isValidData = false;
                GlobalMessage.MessageBox(this, $"El DNI no es valido");
            }
            if (!Regex.IsMatch(TextBox2.Text, "^([a-zA-Z]+$)")) //Letters only NOMBRE
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"El nombre no es valido");
            }
            if (!Regex.IsMatch(TextBox3.Text, "^([a-zA-Z]+$)"))//Numbers only APELLIDO
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"El Apellido no es valido");
            }
            if (!Regex.IsMatch(TextBox3.Text, "^([a-zA-Z]+$)"))//Letters only NICK
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"El Nickname no es valido, solo letras");
            }
            int count = TextBox4.Text.ToCharArray().Count();
            if (count <=7)//(!Regex.IsMatch(TextBox3.Text, "^(\\s*(\\S)\\s*){8,}\r\n"))//PASSWORD > 8
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"La password no es valida, mayor a 8 caracteres");
            }
            if (!isValidEmail(TextBox6.Text))//EMAIL
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"El email no es valido");
            }
            if (!Regex.IsMatch(TextBox7.Text, "^([0-9]+$)"))//Numbers only - Telefono
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"El telefono no es valido");
            }
            if (TextBox8.Text == "")//fijate que no te vacio
            {
                isValidData = false; GlobalMessage.MessageBox(this, $"La direccion no es valida");
            }
            #endregion
            if (isValidData)
            { 
                string userName = ListBox1.Text;

                UserModel usuario = us.Get(userName);
                usuario.Dni = TextBox1.Text;
                usuario.Name = TextBox2.Text;
                usuario.LastName = TextBox3.Text;
                usuario.Nickname = TextBox4.Text;
                usuario.Mail = TextBox6.Text;
                usuario.Phone = TextBox7.Text;
                usuario.Adress = TextBox8.Text;

                if (TextBox5.Text.Length > 0) { usuario.Password = Security.HashSha256(TextBox5.Text); }
                if (us.UpdateUser(usuario))
                {
                    BitacoraService bitacoraService = new BitacoraService();
                    UserModel user = new UserModel();
                    bitacoraService.LogData("Login", $"El usuario {user.Name} edito un curso.", "Media");
                    (Master as SiteMaster).alert.ShowAlert("Se edito correctamente al usuario");
                }
                else
                    (Master as SiteMaster).alert.ShowError("No se pudo editar al usuario");
            }
            else
                (Master as SiteMaster).alert.ShowError("Error en la validacion de los campos de la DB");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string userName = ListBox1.Text;

            UserModel usuario = us.Get(userName);
            usuario.Dni = TextBox1.Text;
            usuario.Name = TextBox2.Text;
            usuario.LastName = TextBox3.Text;
            usuario.Nickname = TextBox4.Text;
            usuario.Mail = TextBox6.Text;
            usuario.Phone = TextBox7.Text;
            usuario.Adress = TextBox8.Text;

            us.UnblockUser(usuario);

            GlobalMessage.MessageBox(this, $"Se desbloqueo a {userName}");


            BitacoraService bitacoraService = new BitacoraService();
            UserModel user = new UserModel();
            bitacoraService.LogData("Login", $"El usuario {user.Name} desbloqueo a otro usuario.", "Media");
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userName = ListBox1.Text;
            UserModel usuario = us.Get(userName);
            TextBox1.Text = usuario.Dni;
            TextBox2.Text = usuario.Name;
            TextBox3.Text = usuario.LastName;
            TextBox4.Text = usuario.Nickname;
            TextBox5.Text = "";
            TextBox6.Text = usuario.Mail;
            TextBox7.Text = usuario.Phone;
            TextBox8.Text = usuario.Adress;
        }
    }
}