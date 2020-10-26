
create FUNCTION itemsByName (@item varchar(50))
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
