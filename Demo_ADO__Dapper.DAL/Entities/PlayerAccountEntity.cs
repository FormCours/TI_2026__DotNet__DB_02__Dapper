namespace Demo_ADO__Dapper.DAL.Entities
{
    public class PlayerAccountEntity
    {
        public required int Id { get; set; }
        public required string Username { get; set; }
        public required bool IsBanned { get; set; }
        public IEnumerable<CommentEntity> Comments { get; set; } = [];
    }
}
