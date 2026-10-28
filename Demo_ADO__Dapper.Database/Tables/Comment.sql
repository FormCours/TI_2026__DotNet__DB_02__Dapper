CREATE TABLE [dbo].[Comment]
(
	[Id] INT IDENTITY(1,1),
	[Content] NVARCHAR(4000) NOT NULL,
	[Create_At] DATETIME2 NOT NULL,
	[Player_Id] INT NOT NULL,

	CONSTRAINT [PK_Comment] PRIMARY KEY([Id]),
	CONSTRAINT [FK_Comment__PlayerAccount] 
		FOREIGN KEY ([Player_Id]) 
		REFERENCES [PlayerAccount]([Id])
)
