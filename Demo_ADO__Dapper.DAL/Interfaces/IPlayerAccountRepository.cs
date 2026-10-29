using Demo_ADO__Dapper.DAL.Entities;

namespace Demo_ADO__Dapper.DAL.Interfaces
{
    public interface IPlayerAccountRepository
    {
        // CRUD
        int Create(PlayerAccountEntity data);
        PlayerAccountEntity? GetById(int id);
        PlayerAccountEntity? GetWithCommentById(int id);
        IEnumerable<PlayerAccountEntity> GetAll(int offset = 0, int limit = 5);
        IEnumerable<PlayerAccountEntity> GetByName(string name);
        bool Update(int id, PlayerAccountEntity data);
        bool Delete(int id);
    }
}
