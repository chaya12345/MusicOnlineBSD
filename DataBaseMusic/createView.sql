USE [MusicOnline]
GO

/****** Object:  View [dbo].[LastResponses]    Script Date: 09/09/2020 19:29:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LastResponses]
AS
SELECT top 5 r.id as 'responsId', r.name,r.date,a.id as 'articleId',a.title
FROM ResponsesTBL r join ArticlesTBL a on r.articleId=a.id
order by r.date desc
GO


