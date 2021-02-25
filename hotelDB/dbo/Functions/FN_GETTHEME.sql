
CREATE FUNCTION [dbo].[FN_GETTHEME] 
(
	-- Add the parameters for the function here
	@ArticleBlogId INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	declare @Info NVARCHAR(MAX)
	SELECT @Info=SUBSTRING(
	(
	   select ', '+ t.Libelle AS 'data()'
	   FROM dbo.Theme t
	   inner join dbo.ThemeArticle ta
	   on t.IdTheme= ta.IdTheme
	   WHERE ta.IdArticleBlog=@ArticleBlogId
	   FOR XML PATH('')
	)	
	,2,9999)

	return @Info
END