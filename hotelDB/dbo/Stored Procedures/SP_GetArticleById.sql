
-- =============================================
-- Author:		G.S
-- Create date: 25 mars 2021
-- Description:	Chercher toutes les infos d'un article via l'ID
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetArticleById] 
	-- Add the parameters for the stored procedure here
@idArticle int
AS
BEGIN
SELECT dbo.ArticleBlog.IdArticleBlog, dbo.ArticleBlog.Titre, dbo.ArticleBlog.Photo, dbo.ArticleBlog.Date, dbo.ArticleBlog.Accroche, dbo.AuteurArticle.Nom, dbo.AuteurArticle.Prenom,
                      (SELECT COUNT(*) AS Expr1
                       FROM      dbo.CommentaireArticle
                       WHERE   (dbo.ArticleBlog.IdArticleBlog = IdArticleBlog)) AS NBComment, dbo.FN_GETTHEME(dbo.ArticleBlog.IdArticleBlog) AS Themes, dbo.ArticleBlog.TexteEvidence, dbo.ArticleBlog.Pargraphe1, dbo.ArticleBlog.Pargraphe2, 
                  dbo.ArticleBlog.Pargraphe3, dbo.ArticleBlog.Pargraphe4, dbo.AuteurArticle.Description, dbo.AuteurArticle.Photo AS PhotoAuteur
FROM     dbo.ArticleBlog LEFT OUTER JOIN
                  dbo.AuteurArticle ON dbo.ArticleBlog.IdAuteurArticle = dbo.AuteurArticle.IdAuteurArticle

WHERE dbo.ArticleBlog.IdArticleBlog = @idArticle
END