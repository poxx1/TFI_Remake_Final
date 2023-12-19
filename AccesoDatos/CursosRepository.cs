using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Model;
using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class CursosRepository : IDVDAO<CursosModel>
    {
        public String tableName = "Courses";

        public List<CursosModel> listCursos()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            List<CursosModel> list = new List<CursosModel>();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from Courses";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CursosModel mm = new CursosModel();
                    mm.ID = reader.GetInt32(reader.GetOrdinal("ID"));
                    mm.Name = reader.GetString(reader.GetOrdinal("Name"));
                    mm.Description = reader.GetString(reader.GetOrdinal("Description"));
                    mm.Price = float.Parse(reader.GetString(reader.GetOrdinal("Precio")));
                    mm.dvh = reader.GetString(reader.GetOrdinal("dvh"));


                    list.Add(mm);
                }

                reader.Close();
                connection.Close();

                return list;
            }
            catch (Exception e)
            {
                connection.Close();
                throw e;
            }
        }
        public bool addCurso(CursosModel curso)
        {
            try
            {
                save(curso);

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool deleteCurso(CursosModel curso)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"delete from Courses where ID = @ID";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("ID", curso.ID));
                
                cmd.ExecuteNonQuery();
                connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void updateCurso(CursosModel curso)
        {
            try
            {
                update(curso);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<CursosModel> getAll()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            List<CursosModel> list = new List<CursosModel>();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from Courses";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CursosModel mm = new CursosModel();
                    mm.ID = reader.GetInt32(reader.GetOrdinal("ID"));
                    mm.Name = reader.GetString(reader.GetOrdinal("Name"));
                    mm.Description = reader.GetString(reader.GetOrdinal("Description"));
                    mm.Price = float.Parse(reader.GetString(reader.GetOrdinal("Precio")));
                    mm.dvh = reader.GetString(reader.GetOrdinal("dvh"));


                    list.Add(mm);
                }

                reader.Close();
                connection.Close();

                return list;
            }
            catch (Exception e)
            {
                connection.Close();
                throw e;
            }
        }

        public string calculateDVH(CursosModel obj)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.Name);
            sb.Append(obj.Description);
            sb.Append(obj.Price.ToString());
           
            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV(List<CursosModel> list)
        {
            return list.Aggregate<CursosModel, String>("", (a, b) => DVService.getDV(a + b.dvh));
        }

        public void save(CursosModel obj)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"INSERT into Courses
                            ([Name]
                            ,[Description]
                            ,[Precio]
                            ,[dvh])            
                        VALUES
                            ( @Name
                            , @Descripcion
                            , @Precio
                            , @dvh
                            )";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("Name", obj.Name));
                cmd.Parameters.Add(new SqlParameter("Descripcion", obj.Description));
                cmd.Parameters.Add(new SqlParameter("Precio", obj.Price));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void update(CursosModel obj)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"UPDATE Courses SET Name=@Name,Description=@Description,Precio=@Precio,dvh=@dvh where ID = @ID";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("ID", obj.ID));
                cmd.Parameters.Add(new SqlParameter("Name", obj.Name));
                cmd.Parameters.Add(new SqlParameter("Description", obj.Description));
                cmd.Parameters.Add(new SqlParameter("Precio", obj.Price));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();
            }
            catch (Exception ex)
            {
                throw ex;
            }
           
        }

        public void updateDVV()
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();

                String dvvString = calculateDVV(getAll());
                if (connection.State != ConnectionState.Open) connection.Open();
                using (IDbCommand command = connection.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                                             UPDATE [tfi].[dbo].[dvv]
		                                        SET [dvv] = @dvv
		                                        WHERE [tablename] = @tablename ;
                                           ";

                    IDbDataParameter dvv = command.CreateParameter();
                    dvv.ParameterName = "dvv";
                    dvv.Value = dvvString;
                    command.Parameters.Add(dvv);

                    IDbDataParameter tablename = command.CreateParameter();
                    tablename.ParameterName = "tablename";
                    tablename.Value = tableName;
                    command.Parameters.Add(tablename);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                //                connection.Close();
            }
            catch (Exception ex)
            {
                // TODO: ver como hacemos el handle de este error
                Console.Write(ex.ToString());
                throw ex;
            }
        }

        public void UpdateAllDV()
        {
            List<CursosModel> list = getAll();
            list.ForEach(obj =>
            {
                update(obj);
            });
        }

        public string getDVV()
        {
            try
            {
                String dvv = "";
                SqlConnection connection = ConnectionSingleton.getConnection();

                if (connection.State != ConnectionState.Open) connection.Open();
                using (IDbCommand command = connection.CreateCommand())
                {
                    command.Connection = connection;
                    command.CommandText = $@"
                        SELECT  dvv
                            FROM dvv 
                            where tablename = @tablename
                    ";

                    IDbDataParameter tablename = command.CreateParameter();
                    tablename.ParameterName = "tablename";
                    tablename.Value = tableName;
                    command.Parameters.Add(tablename);

                    IDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        dvv = reader.GetValue(reader.GetOrdinal("dvv")).ToString();
                    }
                }
                connection.Close();
                return dvv;
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                throw ex;
            }
        }
    }
}