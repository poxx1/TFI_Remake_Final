using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Interprete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Interprete";
                Button2.Name = "Intepretar";
                //La cague con esto?
            }
            else
            {

                title.InnerText = "Interpreter";
                Button2.Name = "Intepret";
                //La cague con esto?
            }
        }
    }
}