create view reportView
as
select r.*,s.name as 'songName'
from ReportsTBL r join SongsTBL s
on r.songId=s.id
