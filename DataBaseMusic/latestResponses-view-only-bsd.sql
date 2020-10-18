USE [MusicOnline]
GO

/****** Object:  View [dbo].[LastResponses]    Script Date: 19/10/2020 01:53:03 ******/
SET ANSI_NULLS ON
GO
create VIEW latestResponses
AS
select top 20 id, type, name, date, topic from (
select r.id, 'song' AS type, r.name, r.date, s.name as topic
from ResponsesToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic
from ResponsesToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X order by date desc
GO

select * from latestResponses
