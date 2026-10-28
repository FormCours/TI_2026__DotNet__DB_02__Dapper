CREATE TABLE [dbo].[PlayerAccount]
(
	[Id] INT IDENTITY(1,1),
	[Username] NVARCHAR(50) NOT NULL,
	[Is_Banned] BIT DEFAULT 0,

	CONSTRAINT [PK_PlayerAccount] PRIMARY KEY([Id]),
	CONSTRAINT [UK_PlayerAccount_Username] UNIQUE([Username])
)
