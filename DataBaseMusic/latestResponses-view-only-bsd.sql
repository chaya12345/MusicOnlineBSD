USE [MusicOnline]
GO

/****** Object:  View [dbo].[latestResponses]    Script Date: 19/10/2020 12:06:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[latestResponses]
AS
select top 20 id, type, name, date, topic, topicId from (
select r.id, 'song' AS type, r.name, r.date, s.name as topic,s.id as topicId
from ResponsesToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic,a.id as topicId
from ResponsesToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X order by date desc
GO


