USE [MusicOnline]
GO

/****** Object:  UserDefinedFunction [dbo].[itemsBySinger]    Script Date: 21/10/2020 13:24:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[itemsBySinger] (@singer varchar(50))
RETURNS table 
AS
RETURN 
  (
	select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join SingersTBL as si
on so.singerId = si.id where si.name = @singer
union
select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join TagsToSongsTBL as tts
on so.id = tts.songId join TagsTBL as t on tts.tagId = t.id where t.name = @singer
union
select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join ArtistsToSongsTBL as ats
on so.id = ats.songId join ArtistsTBL as a on ats.artistId = a.id where a.name = @singer
union
select a.id, title, subtitle, date, dateHebrew, main_image as image, 'article' as type
from ArticlesTBL as a
join TagsToArticlesTBL as tta on a.id = tta.articleId join TagsTBL as t on tta.tagId = t.id 
	where t.name = @singer
  )
GO


