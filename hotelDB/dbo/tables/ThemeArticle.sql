CREATE TABLE [dbo].[ThemeArticle]
(
	[IdThemeArticle] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdTheme] INT NOT NULL, 
    [IdArticleBlog] INT NOT NULL, 
    CONSTRAINT [FK_ThemeArticle_ToTheme] FOREIGN KEY ([IdTheme]) REFERENCES [Theme]([IdTheme]), 
    CONSTRAINT [FK_ThemeArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [ArticleBlog]([IdArticleBlog])
)
