using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using WebApplication.Models;

namespace WebApplication.Data
{
    public class ContextRepository
    {
        private readonly string _connection;

        public ContextRepository(IConfiguration configuration)
        {
            _connection = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<List<Telefono>> GetTelefonosByIdUsuario(int Id)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_SelectAllTelefonosByUsuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    var response = new List<Telefono>();
                    await sql.OpenAsync();
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(MapToTelefono(reader));
                        }
                    }
                    return response;
                }
            }
        }

        public async Task InsertTelefono(Telefono telefono)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_InsertTelefono", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Numero", telefono.Numero));
                    cmd.Parameters.Add(new SqlParameter("@test_User_IdUsuario", telefono.test_User_IdUsuario));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task DeleteTelefonoById(int Id)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_DeleteTelefono", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        private Telefono MapToTelefono(SqlDataReader reader)
        {
            return new Telefono()
            {
                IdTelefono = (int)reader["IdTelefono"],
                Numero = reader["Numero"].ToString(),
                test_User_IdUsuario = (int)reader["test_User_IdUsuario"]
            };
        }

        // -----------------------------------------------------------------------------------------------------

        public async Task<List<Usuario>> GetAllUsuarios()
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_SelectAllUsuarios", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<Usuario>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var ListHabilidaes = new List<HabilidadBlanda>();
                            var ListTelefonos = new List<Telefono>();
                            Usuario user = MapToUsuario(reader);
                            ListHabilidaes = await GetHabilidadesByIdUsuario(user.IdUsuario);
                            ListTelefonos = await GetTelefonosByIdUsuario(user.IdUsuario);
                            user.Habilidades = ListHabilidaes;
                            user.Telefonos = ListTelefonos;
                            response.Add(user);
                        }
                    }
                    return response;
                }
            }
        }

        public async Task<Usuario> GetUsuarioById(int Id)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_SelectOneUsuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    Usuario response = null;
                    await sql.OpenAsync();
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response = MapToUsuario(reader);
                        }
                    }
                    return response;
                }
            }
        }

        public async Task<Usuario> GetUsuarioByCedula(string cedula)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_SelectUsuarioByCedula", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Cedula", cedula));
                    Usuario response = null;
                    await sql.OpenAsync();
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response = MapToUsuario(reader);
                        }
                    }
                    return response;
                }
            }
        }

        public async Task InsertUsuario(Usuario usuario)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_InsertUsuario", sql))
                {
                    //Usuario inserted = null;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@TipoIdentificacion", usuario.TipoIdentificacion));
                    cmd.Parameters.Add(new SqlParameter("@Cedula", usuario.Cedula));
                    cmd.Parameters.Add(new SqlParameter("@NombreCompleto", usuario.NombreCompleto));
                    cmd.Parameters.Add(new SqlParameter("@NombreUsaurio", usuario.NombreUsaurio));
                    cmd.Parameters.Add(new SqlParameter("@Password", usuario.Password));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico", usuario.CorreoElectronico));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    //inserted = await GetUsuarioByCedula(usuario.Cedula);

                    return;
                }
            }
        }

        public async Task UpdateUsuario(Usuario usuario)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_UpdateUsuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@TipoIdentificacion", usuario.TipoIdentificacion));
                    cmd.Parameters.Add(new SqlParameter("@Cedula", usuario.Cedula));
                    cmd.Parameters.Add(new SqlParameter("@NombreCompleto", usuario.NombreCompleto));
                    cmd.Parameters.Add(new SqlParameter("@NombreUsaurio", usuario.NombreUsaurio));
                    cmd.Parameters.Add(new SqlParameter("@Password", usuario.Password));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico", usuario.CorreoElectronico));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        public async Task DeleteUduarioById(int Id)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_DeleteUsuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                    return;
                }
            }
        }

        private Usuario MapToUsuario(SqlDataReader reader)
        {
            return new Usuario()
            {
                IdUsuario = (int)reader["IdUsuario"],
                TipoIdentificacion = (bool)reader["TipoIdentificacion"],
                Cedula = reader["Cedula"].ToString(),
                NombreCompleto = reader["NombreCompleto"].ToString(),
                NombreUsaurio = reader["NombreUsaurio"].ToString(),
                Password = reader["Password"].ToString(),
                CorreoElectronico = reader["CorreoElectronico"].ToString()
            };
        }

        // -----------------------------------------------------------------------------------------------------

        public async Task<List<HabilidadBlanda>> GetHabilidadesByIdUsuario(int Id)
        {
            using (SqlConnection sql = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = new SqlCommand("test_SelectHabilidadesBlandasXUsuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    var response = new List<HabilidadBlanda>();
                    await sql.OpenAsync();
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(MapToHabilidades(reader));
                        }
                    }
                    return response;
                }
            }
        }

        private HabilidadBlanda MapToHabilidades(SqlDataReader reader)
        {
            return new HabilidadBlanda()
            {
                IdHabilidad = (int)reader["IdHabilidad"],
                Habilidad = reader["Habilidad"].ToString()
            };
        }

    }
}
