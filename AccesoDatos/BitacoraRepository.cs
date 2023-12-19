using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DigitosVerificadoresLib;
using DigitosVerificadoresLib.services;
using Modelos;
using Servicios;

namespace DataAccess
{
    public class BitacoraRepository : IDVDAO<LogModel>
    {
        public String tableName = "Bitacora";
        public string calculateDVH(LogModel obj)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(obj.Priority);
            sb.Append(obj.Details);
            sb.Append(obj.Usuario);
            sb.Append(obj.Fecha);
            sb.Append(obj.Info);
            sb.Append(obj.Hora);

            return DVService.getDV(sb.ToString());
        }

        public string calculateDVV(List<LogModel> list)
        {
            return list.Aggregate<LogModel, String>("", (a, b) => DVService.getDV(a + b.dvh));
        }

        public List<LogModel> getAll()
        {
           return  listLogs();
        }

        public List<LogModel> listLogs()
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            List<LogModel> list = new List<LogModel>();

            try
            {
                connection.Open();
                var cmd = new SqlCommand();
                cmd.Connection = connection;

                var sql = $@"select * from Bitacora";

                cmd.CommandText = sql;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    LogModel mm = new LogModel();
                    mm.Id = reader.GetInt32(reader.GetOrdinal("ID"));
                    mm.Usuario = reader.GetString(reader.GetOrdinal("UserName"));
                    mm.Fecha = reader.GetString(reader.GetOrdinal("Date"));
                    mm.Hora = reader.GetString(reader.GetOrdinal("Time"));
                    mm.Info = reader.GetString(reader.GetOrdinal("Info"));
                    mm.Details = reader.GetString(reader.GetOrdinal("Activity"));
                    mm.Priority = reader.GetString(reader.GetOrdinal("Priority"));
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

        public void save(LogModel log)
        {
            SqlConnection connection = ConnectionSingleton.getConnection();
            try
            {
              
                connection.Open();
                string query = $@"INSERT into Bitacora
                            ([UserName]
                            ,[Date]
                            ,[Time]
                            ,[Info]
                            ,[Activity]
                            ,[Priority]
                            ,[dvh])            
                        VALUES
                            ( @UserName
                            , @Date
                            , @Time
                            , @Info
                            , @Activity    
                            , @Priority
                            , @dvh
                            )";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("UserName", log.Usuario));
                cmd.Parameters.Add(new SqlParameter("Date", log.Fecha));
                cmd.Parameters.Add(new SqlParameter("Time", log.Hora));
                cmd.Parameters.Add(new SqlParameter("Info", log.Info));
                cmd.Parameters.Add(new SqlParameter("Activity", log.Details));
                cmd.Parameters.Add(new SqlParameter("Priority", log.Priority));
                cmd.Parameters.Add(new SqlParameter("dvh", calculateDVH(log)));

                cmd.ExecuteNonQuery();
                connection.Close();
                updateDVV();
            }
            catch (Exception)
            {
                connection.Close();
                throw;
            }
        }

        public bool saveLog(LogModel log)
        {
            try
            {
                save(log);

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void update(LogModel obj)
        {
            try
            {
                SqlConnection connection = ConnectionSingleton.getConnection();
                connection.Open();
                string query = $@"UPDATE [dbo].[Bitacora]
                                    SET [UserName] = @UserName
                                        ,[Date] = @Date
                                        ,[Time] = @Time
                                        ,[Info] = @Info
                                        ,[Priority] = @Priority
                                        ,[Activity] = @Activity
                                        ,[dvh] = @dvh
                                    WHERE Id = @Id
                                ";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = connection;

                cmd.Parameters.Add(new SqlParameter("UserName", obj.Usuario));
                cmd.Parameters.Add(new SqlParameter("Date", obj.Fecha));
                cmd.Parameters.Add(new SqlParameter("Time", obj.Hora));
                cmd.Parameters.Add(new SqlParameter("Info", obj.Info));
                cmd.Parameters.Add(new SqlParameter("Priority", obj.Priority));
                cmd.Parameters.Add(new SqlParameter("Activity", obj.Details));
                cmd.Parameters.Add(new SqlParameter("Id", obj.Id));
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
            List<LogModel> list = getAll();
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
