using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace Servicios
{
    public class GlobalMessage
    {
        public static void MessageBox(System.Web.UI.Page page, string strMsg)
        {
            //(Master as SiteMaster).alert.ShowError("Error. El usuario no tiene los suficientes privilegios");
        }
        public static void MessageBox(System.Web.UI.Page page, string mensaje, string tipo)
        {
            page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", "swall('Titulo?','Body?'," + tipo + ")",true);
        }
    }
}
