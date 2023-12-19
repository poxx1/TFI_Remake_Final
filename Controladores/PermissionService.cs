using AccesoDatos;
using DigitosVerificadoresLib.interfaces;
using Model;
using Modelos;
using System;
using System.Collections.Generic;
using Component = Modelos.Component;

namespace Servicios
{
    public class PermissionsService : IDVService
    {
        private PermissionRepository permissionsRepository;
        public PermissionsService()
        {
            permissionsRepository = new PermissionRepository();
        }
        public bool Contains(Component component, Component includes)
        {
            bool exist = false;
            if (component.Id.Equals(includes.Id))
            {
                exist = true;
            }
            else
            {
                foreach (Component item in component.Childs)
                {
                    if (Contains(item, includes)) return true;
                }
            }
            return exist;
        }
        public List<PermissionsEnum> GetAllPermission()
        {
            return permissionsRepository.GetAllPermission();
        }
        public Component SaveComponent(Component component, bool isFamily)
        {
            return permissionsRepository.GuardarComponente(component, isFamily);
        }
        public void SaveFamily(Family family)
        {
            permissionsRepository.SaveFamily(family);
        }
        public List<Patent> GetAllPatentes()
        {
            return permissionsRepository.GetAllPatents();
        }
        public List<Family> GetAllFamilies()
        {
            return permissionsRepository.GetAllFamilies();
        }
        public List<Component> GetAll(string familia)
        {
            return permissionsRepository.GetAll(familia);

        }
        public void FillUserComponents(UserModel u)
        {
            permissionsRepository.FillUserComponents(u);

        }
        public void FillFamilyComponents(Family familia)
        {
            permissionsRepository.FillFamilyComponents(familia);
        }
        //public Patent GetPatent(PermissionRepository permissionsEnum)
        //{
        //    return permissionsRepository.GetPatent(permissionsEnum); //Y esta flasheada?
        //}
        public Patent GetPatent(PermissionsEnum permissionsEnum)
        {
            //Este lo agregue nuevo porque el otro era de drogadicto
            return permissionsRepository.GetPatent(permissionsEnum);
        }

        public void reacalcDV()
        {

            permissionsRepository.UpdateAllDV();
            permissionsRepository.updateAllrelations(permissionsRepository.getAllRelations());
            permissionsRepository.updateDVV();
        }

        public List<string> checkintegrity()
        {
            List<String> errors = new List<string>();
            var list = permissionsRepository.getAll();

            list.ForEach(item =>
            {
                if (!item.dvh.Equals(permissionsRepository.calculateDVH(item)))
                {
                    errors.Add($"En la tabla {permissionsRepository.tableName}: El  {permissionsRepository.tableName} con id : {item.Id} , fue modificado");
                }
            });

            if (!permissionsRepository.calculateDVV(list).Equals(permissionsRepository.getDVV()))
            {
                errors.Add($"El digito verificador vertical de la tabla  {permissionsRepository.tableName} no es correcto");
            }


            permissionsRepository.getAllRelations().ForEach(rel =>
            {
                if (!rel.dvh.Equals(permissionsRepository.calculateDVH(rel.IdPadre, rel.IdHijo)))
                {
                    errors.Add($"En la tabla permiso_permiso: La relacion con idpadre : {rel.IdPadre} e idhijo: {rel.IdHijo} , fue modificado");
                }
            }

            );

            return errors;
        }
    }
}

