
-- =============================================
-- Author:		Gloria
-- Create date: 25 mars 2021
-- Description:	Récupération des commentaires d'un article en particulier.
-- =============================================
Create PROCEDURE SP_GetCommentsByArticle 
	-- Add the parameters for the stored procedure here
	@idArticle int
AS
BEGIN
				  SELECT TOP (100) PERCENT dbo.Client.Nom, dbo.Client.Prenom, dbo.Client.Photo, CommentaireArticle.Commentaire, CommentaireArticle.[Date], CommentaireArticle.IdArticleBlog
FROM     dbo.ArticleBlog INNER JOIN
                  dbo.CommentaireArticle ON dbo.ArticleBlog.IdArticleBlog = CommentaireArticle.IdArticleBlog INNER JOIN
                  dbo.Client ON CommentaireArticle.IdClient = dbo.Client.IdClient
WHERE CommentaireArticle.IdArticleBlog = @idArticle
ORDER BY dbo.ArticleBlog.Date DESC
END