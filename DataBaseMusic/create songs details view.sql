USE [MusicOnline]
GO

/****** Object:  View [dbo].[songsDetails]    Script Date: 23/09/2020 17:26:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[songsDetails]
as
select s1.id, s1.name, s1.file_location, s1.type, s1.date, s1.count_responses, 
s2.name as'singerName' ,s1.count_like,s1.count_views, s1.albumId,s1.title,s1.subtitle,s1.image_location,s1.content
from SongsTBL s1 join SingersTBL s2 on s1.singerId=s2.id
GO


