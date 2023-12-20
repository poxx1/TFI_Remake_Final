using System;
using System.Linq;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controladores;
using Model;
using Modelos;
using Servicios;

namespace Vista
{
    public partial class aPatenteFamilia : Page
    {
        PermissionsService permissionsService;
        protected void Page_Load(object sender, EventArgs e)
        {
            permissionsService = new PermissionsService();

            if ((int)Session["language"] == 1)
            {
                Label6.Text = "Gestion de familias";
                Label3.Text = "Patentes";
                BtnAddPatent.Text = "Agregar";
                BtnRemovePatent.Text = "Eliminar";
                Label1.Text = "Descripcion";
                Label2.Text = "Famiia";
                BtnAddFamily.Text = "Agregar";
                BtnRemoveFamily.Text = "Eliminar";
                Label5.Text = "Nueva familia";
                BtnCreateFamily.Text = "Crear familia";
                Label4.Text = "Familia a configurar";
            }
            else
            {
                Label6.Text = "Family managemente";
                Label3.Text = "Patents";
                BtnAddPatent.Text = "Add";
                BtnRemovePatent.Text = "Delete";
                Label1.Text = "Description";
                Label2.Text = "Family";
                BtnAddFamily.Text = "Add";
                BtnRemoveFamily.Text = "Delete";
                Label5.Text = "New family";
                BtnCreateFamily.Text = "Create family";
                Label4.Text = "Family to be configured";
            }

            try
            {
                UserService userService = new UserService();
                //UserModel user = userService.Get(Session["NickUsuario"].ToString());

                //if (tienepermisos) { }
            }
            catch (Exception)
            {

            }

            if (!IsPostBack)
            {
                preload();
            }
        }

        private void MostrarFamilia(int family)
        {
            Family familia = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList3.SelectedValue)).First();
            MostrarFamilia(permissionsService.FillFamilyComponents(familia));
        }
        private void MostrarFamilia(Family family)
        {
            TreeView1.Nodes.Clear();
            TreeNode root = new TreeNode(family.Nombre);

            foreach (var item in family.Childs)
            {
                LlenarTreeView(root, item);
            }

            TreeView1.Nodes.Add(root);
            TreeView1.ExpandAll();
        }
        private void LlenarTreeView(TreeNode padre, Component componente)
        {
            TreeNode hijo = new TreeNode(componente.Nombre);
            // hijo. = componente;
            padre.ChildNodes.Add(hijo);

            foreach (var item in componente.Childs)
            {
                LlenarTreeView(hijo, item);
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextArea1.Value = permissionsService.GetAllPatentes().FindAll(pat => pat.Id == int.Parse(DropDownList1.SelectedValue)).First().Description;
        }

        private void preload()
        {
            DropDownList1.DataSource = permissionsService.GetAllPatentes();
            DropDownList1.DataTextField = "Nombre";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();


            TextArea1.Value = permissionsService.GetAllPatentes().FindAll(pat => pat.Id == int.Parse(DropDownList1.SelectedValue)).First().Description;

            DropDownList3.DataSource = permissionsService.GetAllFamilies();
            DropDownList3.DataTextField = "Nombre";
            DropDownList3.DataValueField = "Id";
            DropDownList3.DataBind();

            DropDownList2.DataSource = permissionsService.GetAllFamilies().FindAll(familia => familia.Id != int.Parse(DropDownList3.SelectedValue));
            DropDownList2.DataTextField = "Nombre";
            DropDownList2.DataValueField = "Id";
            DropDownList2.DataBind();

            MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
        }

        protected void BtnAddPatent_Click(object sender, EventArgs e)
        {
            try
            {
                Family family = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList3.SelectedValue)).First();
                family = permissionsService.FillFamilyComponents(family);

                Patent patent = permissionsService.GetAllPatentes().Where(pat => pat.Id == int.Parse(DropDownList1.SelectedValue)).First();

                if (!permissionsService.Contains(family, patent))
                {
                    family.AddChild(patent);
                    permissionsService.SaveFamily(family);
                    (Master as SiteMaster).alert.ShowAlert("Se agrego la patente con exito");
                }
                else
                {
                }
                MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
            }
            catch (Exception)
            {
                (Master as SiteMaster).alert.ShowError("Ocurrió un problema con la base de datos");
            }


        }

        protected void BtnRemovePatent_Click(object sender, EventArgs e)
        {
            try
            {
                Family family = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList3.SelectedValue)).First();
                family = permissionsService.FillFamilyComponents(family);

                Patent patent = permissionsService.GetAllPatentes().Where(pat => pat.Id == int.Parse(DropDownList1.SelectedValue)).First();

                if (permissionsService.Contains(family, patent))
                {
                    family.RemoveChild(family.Childs.Find(item => patent.Id == item.Id));
                    permissionsService.SaveFamily(family);
                    (Master as SiteMaster).alert.ShowAlert("Se quito la patente con exito");
                }
                else
                {

                }
                MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
            }
            catch (Exception)
            {
                (Master as SiteMaster).alert.ShowError("Ocurrió un problema con la base de datos");
            }

        }

        protected void BtnAddFamily_Click(object sender, EventArgs e)
        {
            try
            {
                Family family = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList3.SelectedValue)).First();
                family = permissionsService.FillFamilyComponents(family);

                Family family2 = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList2.SelectedValue)).First();
                family2 = permissionsService.FillFamilyComponents(family2);


                if (!permissionsService.Contains(family, family2))
                {
                    family.AddChild(family2);
                    permissionsService.SaveFamily(family);

                    (Master as SiteMaster).alert.ShowAlert("Se guardo la familia con exito");
                }
                else
                {
                }
                MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
            }
            catch (Exception)
            {
                (Master as SiteMaster).alert.ShowError("Ocurrió un problema con la base de datos");
            }

        }

        protected void BtnRemoveFamily_Click(object sender, EventArgs e)
        {
            try
            {
                Family family = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList3.SelectedValue)).First();
                family = permissionsService.FillFamilyComponents(family);

                Family family2 = permissionsService.GetAllFamilies().Where(fam => fam.Id == int.Parse(DropDownList2.SelectedValue)).First();
                family2 = permissionsService.FillFamilyComponents(family2);


                if (permissionsService.Contains(family, family2))
                {
                    family.RemoveChild(family.Childs.Find(item => family2.Id == item.Id));
                    permissionsService.SaveFamily(family);
                    (Master as SiteMaster).alert.ShowAlert("Se elimino la familia con exito");
                }
                else
                {

                }
                MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
            }
            catch (Exception)
            {
                (Master as SiteMaster).alert.ShowError("Ocurrió un problema con la base de datos");
            }

        }

        protected void BtnCreateFamily_Click(object sender, EventArgs e)
        {
            try
            {
                if (InputNewFamily.Value.Length < 2) throw new Exception();

                Family p = new Family()
                {
                    Nombre = InputNewFamily.Value

                };
                permissionsService.SaveComponent(p, true);
                (Master as SiteMaster).alert.ShowAlert("Se creo la familia con exito");
            }
            catch (Exception)
            {

                (Master as SiteMaster).alert.ShowError("Ocurrió un problema con la base de datos");
            }
            InputNewFamily.Value = "";
            preload();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.DataSource = null;
            DropDownList2.DataBind();
            DropDownList2.DataSource = permissionsService.GetAllFamilies().FindAll(familia => familia.Id != int.Parse(DropDownList3.SelectedValue));
            DropDownList2.DataBind();

            MostrarFamilia(int.Parse(DropDownList3.SelectedValue));
        }
    }
}