using Controladores;
using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class ListSolicitud : System.Web.UI.Page
    {
        SolicitudService solicitud = new SolicitudService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["language"] == 1)
            {
                title.InnerText = "Listar traducciones";
                Label1.Text = "Estado de aprobacion";
                Label2.Text = "Nombre";
                Label3.Text = "Descripcion";
                Button1.Text = "Aprobar";
                Button2.Text = "Seleccionar";
            }
            else
            {
                title.InnerText = "List of translations";
                Label1.Text = "Status of approval";
                Label2.Text = "Name";
                Label3.Text = "Description";
                Button1.Text = "Approve";
                Button2.Text = "Select";
            }

            if (!IsPostBack)
            {
                List<InterpretacionModel> list = new List<InterpretacionModel>();
                list = solicitud.listSolicitud();
                List<string> lista = new List<string>();

                foreach (var item in list)
                {
                    lista.Add(item.Name.ToString());
                }

                DropDownList1.DataSource = lista;
                DropDownList1.DataBind();
            }
        }

        protected void Approve(object sender, EventArgs e)
        {
            try
            {
                string sol = DropDownList1.SelectedValue.ToString();
                InterpretacionModel sM = new InterpretacionModel();
                sM = solicitud.listSolicitud().Where(x => x.Name == sol).ToList().FirstOrDefault();
                if (!sM.isApproved)
                {
                    solicitud.Approve(sM);
                    (Master as SiteMaster).alert.ShowAlert("Se aprobo la solicitud con exito");
                }
                else (Master as SiteMaster).alert.ShowError("La solicitud ya estaba aprobada previamente");
            }
            catch(Exception ex) { (Master as SiteMaster).alert.ShowError("No se pudo aprobar la solicitud, intente nuevamente"); }
        }

        protected void Listar(object sender, EventArgs e)
        {
            try
            {
                string sol = DropDownList1.SelectedValue.ToString();
                InterpretacionModel sM = new InterpretacionModel();
                sM = solicitud.listSolicitud().Where(x => x.Name == sol).ToList().FirstOrDefault();

                Label2.Text = $"Nombre: {sM.Name}";
                Label3.Text = $"Descripcion: {sM.Description}";
                if (sM.isApproved) Label1.Text = $"Esta aprobada?: Si.";
                else Label1.Text = $"Esta aprobada?: No.";
            }
            catch(Exception) { (Master as SiteMaster).alert.ShowError("Error listando las solicitudes"); }
        }
    }
}