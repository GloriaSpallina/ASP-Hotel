CREATE TABLE [dbo].[CommentaireArticle]
(
	[IdCommentaireArticle] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Commentaire] NVARCHAR(MAX) NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [IdUser] INT NOT NULL, 
    [IdArticleBlog] INT NOT NULL, 
    CONSTRAINT [FK_CommentaireArticle_ToUser] FOREIGN KEY ([IdUser]) REFERENCES [User]([IdUser]), 
    CONSTRAINT [FK_CommentaireArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [ArticleBlog]([IdArticleBlog])
)
