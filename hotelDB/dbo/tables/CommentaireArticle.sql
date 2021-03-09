CREATE TABLE [dbo].[CommentaireArticle]
(
	[IdCommentaireArticle] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Commentaire] NVARCHAR(MAX) NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [IdClient] INT NOT NULL, 
    [IdArticleBlog] INT NOT NULL, 
    CONSTRAINT [FK_CommentaireArticle_ToClient] FOREIGN KEY ([IdClient]) REFERENCES [Client]([IdClient]), 
    CONSTRAINT [FK_CommentaireArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [ArticleBlog]([IdArticleBlog])
)
