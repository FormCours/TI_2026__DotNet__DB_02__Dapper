using Dapper;
using Demo_ADO__Dapper.DAL.Entities;
using Demo_ADO__Dapper.DAL.Interfaces;
using Microsoft.Data.SqlClient;
using static System.Net.Mime.MediaTypeNames;

namespace Demo_ADO__Dapper.DAL.Repositories
{
    public class PlayerAccountRepository : IPlayerAccountRepository
    {
        private string _ConnectionString = "Server=localhost;Database=Exemple_DB;Trusted_Connection=True;TrustServerCertificate=true;";

        // Exemple de récuperation
        public PlayerAccountEntity? GetById(int id)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            return connection.QuerySingleOrDefault<PlayerAccountEntity>(
                "SELECT Id, Username, Is_Banned AS IsBanned FROM [PlayerAccount] WHERE [Id] = @Id",
                new { Id = id }
            );
        }

        public IEnumerable<PlayerAccountEntity> GetAll(int offset = 0, int limit = 5)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            string sql = "SELECT Id, Username, Is_Banned AS IsBanned" +
                        " FROM [PlayerAccount]" +
                       $" ORDER BY Id OFFSET {offset} ROWS" +
                       $" FETCH NEXT {limit} ROWS ONLY;";

            return connection.Query<PlayerAccountEntity>(sql);
        }

        public IEnumerable<PlayerAccountEntity> GetByName(string name)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            string sql = "SELECT [Id], [Username], [Is_Banned] AS [IsBanned]" +
                        " FROM [PlayerAccount]" +
                        " WHERE CHARINDEX(@name, [Username]) > 0;";

            return connection.Query<PlayerAccountEntity>(sql, new { name });
        }

        // Exemple de modification
        public int Create(PlayerAccountEntity data)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            string sql = "INSERT INTO [PlayerAccount] (Username, Is_Banned)" +
                         " OUTPUT [inserted].[Id]" +
                         " VALUES (@Username, @IsBanned)";

            return connection.ExecuteScalar<int>(sql);
        }

        public bool Update(int id, PlayerAccountEntity data)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            string sql = "UPDATE [PlayerAccount]" +
                         " SET Username = @Username," +
                         "     Is_Banned = @IsBanned" +
                         " WHERE Id = @Id";

            int nbRow = connection.Execute(sql, new { Id = id, data.Username, data.IsBanned });
            return nbRow == 1;
        }

        public bool Delete(int id)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);
            string sql = "DELETE FROM [PlayerAccount] WHERE Id = @Id";

            int nbRow = connection.Execute(sql, new { Id = id });
            return nbRow == 1;
        }

        // Exemple de jointure
        public PlayerAccountEntity? GetWithCommentById(int id)
        {
            using SqlConnection connection = new SqlConnection(_ConnectionString);

            string sql = "SELECT [PA].[Id], [PA].Username, [PA].[Is_Banned] AS [IsBanned], " +
                         "       [C].[Id], [C].[Content], [C].[Create_At] AS [CreateAt] " +
                         "FROM [PlayerAccount] PA " +
                         " LEFT JOIN [Comment] C ON [PA].[Id] = [C].[Player_Id] " +
                         "WHERE [PA].[Id] = @Id";

            var result = connection.Query<PlayerAccountEntity, CommentEntity, PlayerAccountEntity>(
                sql,
                (playerAccount, comment) =>
                {
                    playerAccount.Comments = [comment];
                    return playerAccount;
                },
                new { Id = id }
            );

            return result.GroupBy(p => p.Id)
                         .Select(grp =>
                         {
                             PlayerAccountEntity player = grp.First();
                             player.Comments = grp.SelectMany(item => item.Comments)
                                                  .Where(comment => comment is not null)
                                                  .ToList();
                             return player;
                         })
                         .SingleOrDefault();
        }
    }
}
