USE [MusicOnline]
GO

/****** Object:  UserDefinedFunction [dbo].[itemsByName]    Script Date: 26/10/2020 19:26:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[itemByName] (@item varchar(50))
RETURNS table 
AS
RETURN 
  (
  select top 1 id, name, image from (
select id, name, image from SingersTBL where name = @item
union
select id, name, null as image from ArtistsTBL where name = @item
union
select id, name, null as image from TagsTBL where name = @item) as X)
GO


