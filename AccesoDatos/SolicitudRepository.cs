using Modelos;
using Servicios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using System.Text;
using System.Linq;
using System.Data;

namespace AccesoDatos
{
    public class SolicitudRepository : IDVDAO<InterpretacionModel>
    {
        public String tableName = "Interpretaciones";
        public List<InterpretacionModel> listSolicitudes()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            List<InterpretacionModel> list = new List<InterpretacionModel>();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from Interpretaciones";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    InterpretacionModel mm = new InterpretacionModel();
                    mm.ID = reader.GetInt32(reader.GetOrdinal("ID"));
                    mm.Name = reader.GetString(reader.GetOrdinal("Nombre"));
                    mm.Fecha = reader.GetString(reader.GetOrdinal("Fecha"));
                    mm.Description = reader.GetString(reader.GetOrdinal("Descripcion"));
                    var test = (reader.GetBoolean(reader.GetOrdinal("Aprobada")));
                    //mm.isApproved = bool.Parse(reader.GetString(reader.GetOrdinal("Aprobada")));
                    mm.isApproved = reader.GetBoolean(reader.GetOrdinal("Aprobada"));
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
        public bool createSolicitud(InterpretacionModel interpretacion)
        {
            try
            {
               save(interpretacion);

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool deleteSolicitud(InterpretacionModel interpretacion)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"delete from Interpretaciones where ID = @ID";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("ID", interpretacion.ID));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Update(InterpretacionModel interpretacion)
        {
           

            try
            {
               update(interpretacion);

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public bool Approve(InterpretacionModel interpretacion)
        {
            try
            {
                //FALTA hacer este update para que apruebe la solicitud
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"UPDATE Interpretaciones SET Aprobada = 1, dvh = @dvh where ID = @ID";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("ID", interpretacion.ID));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(interpretacion)));


                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<InterpretacionModel> getAll()
        {
           return listSolicitudes();
        }

        public string calculateDVH(InterpretacionModel obj)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.Name);
            sb.Append(obj.ID_user.ToString());
            sb.Append(obj.Description);
            sb.Append(obj.isApproved.ToString());
            sb.Append(obj.Fecha);
        
            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV(List<InterpretacionModel> list)
        {
            return list.Aggregate<InterpretacionModel, String>("", (a, b) => DVService.getDV(a + b.dvh));
        }

        public void save(InterpretacionModel obj)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
               
                connection.Open();
                string query = $@"INSERT into Interpretaciones
                            ([Nombre]
                            ,[Descripcion]
                            ,[ID_user]
                            ,[Aprobada]
                            ,[Fecha]
                            ,[dvh])            
                        VALUES
                            ( @Nombre
                            , @Descripcion
                            , @ID_user
                            , @Aprobada
                            , @Fecha
                            , @dvh
                            )";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("Nombre", obj.Name));
                cmd.Parameters.Add(new SqlParameter("Descripcion", obj.Description));
                cmd.Parameters.Add(new SqlParameter("ID_user", obj.ID_user));
                cmd.Parameters.Add(new SqlParameter("Aprobada", obj.isApproved));
                cmd.Parameters.Add(new SqlParameter("Fecha", obj.Fecha));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();

            }
            catch (Exception ex)
            {
                connection.Close();
                throw ex;
            }
        }

        public void update(InterpretacionModel obj)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            connection.Open();

            try
            {
                string query = $@"UPDATE Interpretaciones SET Nombre = @Nombre, Descripcion = @Descripcion , dvh = @dvh where ID = @ID";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("ID", obj.ID));
                cmd.Parameters.Add(new SqlParameter("Nombre", obj.Name));
                cmd.Parameters.Add(new SqlParameter("Descripcion", obj.Description));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(obj)));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();
            }
            catch (Exception ex)
            {
                connection.Close();
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
            List<InterpretacionModel> list = getAll();
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