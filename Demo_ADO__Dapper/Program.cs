using Demo_ADO__Dapper.DAL.Entities;
using Demo_ADO__Dapper.DAL.Interfaces;
using Demo_ADO__Dapper.DAL.Repositories;

IPlayerAccountRepository playerAccountRepository = new PlayerAccountRepository();

Console.WriteLine("Liste des joueurs :");
Console.WriteLine("*******************");
IEnumerable<PlayerAccountEntity> players = playerAccountRepository.GetAll();
foreach(PlayerAccountEntity player in players)
{
    Console.WriteLine($" - {player.Username} {(player.IsBanned ? "(Banni)" : "")}");
}
Console.WriteLine();

// --------------------------

PlayerAccountEntity? target = playerAccountRepository.GetWithCommentById(14);
if(target is not null)
{
    Console.WriteLine($"Commentaire de « {target.Username} »");
    foreach (CommentEntity comment  in target.Comments)
    {
        Console.WriteLine($" - {comment.Content}");
    }
}
else
{
    Console.WriteLine("Aucun compte trouvé !");
}
