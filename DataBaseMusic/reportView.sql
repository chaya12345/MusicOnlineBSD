
create VIEW [dbo].[Commits]
AS
select id, type, name, date, topic, topicId, title_res, content_res from (
select r.id, 'song' AS type, r.name, r.date, s.title as topic, s.id as topicId, r.title as title_res, r.content as content_res
from CommitsToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic, a.id as topicId, r.title as title_res, r.content as content_res
from CommitsToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X
GO
