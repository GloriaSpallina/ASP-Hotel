CREATE TABLE [dbo].[ThemeArticle] (
    [IdThemeArticle] INT IDENTITY (1, 1) NOT NULL,
    [IdTheme]        INT NOT NULL,
    [IdArticleBlog]  INT NOT NULL,
    CONSTRAINT [PK__tmp_ms_x__3F0195F0B820DE57] PRIMARY KEY CLUSTERED ([IdThemeArticle] ASC),
    CONSTRAINT [FK_ThemeArticle_ToArticleBlog] FOREIGN KEY ([IdArticleBlog]) REFERENCES [dbo].[ArticleBlog] ([IdArticleBlog]),
    CONSTRAINT [FK_ThemeArticle_ToTheme] FOREIGN KEY ([IdTheme]) REFERENCES [dbo].[Theme] ([IdTheme])
);


