USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 30/12/2020 21:17:36 ******/
CREATE DATABASE [MusicOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MusicOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MusicOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MusicOnline] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicOnline] SET  MULTI_USER 
GO
ALTER DATABASE [MusicOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicOnline] SET QUERY_STORE = OFF
GO
USE [MusicOnline]
GO
/****** Object:  Table [dbo].[TagsForSongsTBL]    Script Date: 30/12/2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsForSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[typeId] [int] NULL,
 CONSTRAINT [PK_TagsForSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsForArticlesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsForArticlesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_TagsForArticlesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[image] [varchar](max) NULL,
	[searchings] [bigint] NULL,
 CONSTRAINT [PK_SingersTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_ArtistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOfTagsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfTagsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_TypesOfTagsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AllTags]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[AllTags]
AS
select id, type, name, tagType from (
select tfs.id, 'song' AS type, tfs.name ,tft.name as tagType
from TagsForSongsTBL as tfs join TypesOfTagsTBL as tft on tft.id=tfs.typeId
union
select s.id, 'singer' AS type, s.name,null As tagType
from SingersTBL as s
union
select tfa.id, 'article' AS type, tfa.name,null As tagType
from TagsForArticlesTBL as tfa
where  tfa.name not in(
select s.name from SingersTBL as s)
and tfa.name not in(
select a.name from ArtistsTBL as a)
union
select a.id, 'artist' AS type, a.name,null As tagType
from ArtistsTBL as a
where a.name not in(
select s.name from SingersTBL as s)
) as X
GO
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsTBL](
	[id] [int] IDENTITY(50,1) NOT NULL,
	[name] [varchar](100) NULL,
	[file_location] [varchar](max) NULL,
	[type] [varchar](50) NULL,
	[date] [datetime] NULL,
	[count_like] [bigint] NULL,
	[count_views] [bigint] NULL,
	[albumId] [int] NULL,
	[title] [varchar](150) NULL,
	[subtitle] [varchar](max) NULL,
	[image_location] [varchar](max) NULL,
	[content] [varchar](max) NULL,
	[isPerformance] [bit] NULL,
	[lastViewingDate] [datetime] NULL,
 CONSTRAINT [PK_SongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NULL,
	[subtitle] [varchar](max) NULL,
	[dateHebrew] [varchar](50) NULL,
	[date] [datetime] NULL,
	[content] [varchar](max) NULL,
	[image] [varchar](max) NULL,
	[credit] [varchar](max) NULL,
	[count_views] [bigint] NULL,
	[count_like] [bigint] NULL,
	[lastViewingDate] [datetime] NULL,
 CONSTRAINT [PK_ArticlesBTL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommitsToArticlesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitsToArticlesTBL](
	[id] [int] IDENTITY(45,1) NOT NULL,
	[articleId] [int] NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[tested] [bit] NULL,
 CONSTRAINT [PK_ResponsesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommitsToSongsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitsToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[name] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[tested] [bit] NULL,
 CONSTRAINT [PK_ResponsesToSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Commits]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Commits]
AS
select id, type, name, date, topic, topicId, title_res, content_res, tested from (
select r.id, 'song' AS type, r.name, r.date, s.title as topic, s.id as topicId, r.title as title_res, r.content as content_res,
tested
from CommitsToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic, a.id as topicId, r.title as title_res, r.content as content_res,
tested
from CommitsToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X
GO
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[songId] [int] NULL,
	[message] [varchar](max) NULL,
	[status] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_ReportsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[reportView]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[reportView]
as
select r.*,s.name as 'songName'
from ReportsTBL r join SongsTBL s
on r.songId=s.id
GO
/****** Object:  View [dbo].[latestResponses]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[latestResponses]
AS
select top 20 id, type, name, date, topic, topicId, title_res, content_res, tested from (
select r.id, 'song' AS type, r.name, r.date, s.title as topic, s.id as topicId, r.title as title_res, r.content as content_res,
tested
from CommitsToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic, a.id as topicId, r.title as title_res, r.content as content_res,
tested
from CommitsToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X order by date desc
GO
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[tagId] [int] NULL,
 CONSTRAINT [PK_TagsToSongs_TBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[lastViews]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[lastViews]
AS
select top 20 * from (
select id, title, subtitle, date, lastViewingDate, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsForSongsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL so
union
select id, title, subtitle, date, lastViewingDate, image, 'article' AS type from ArticlesTBL
) as X order by lastViewingDate desc, date desc
GO
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsToArticlesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[articleId] [int] NULL,
	[tagId] [int] NULL,
 CONSTRAINT [PK_TagsToArticles_TBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistsToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[artistId] [int] NULL,
	[jobId] [int] NULL,
 CONSTRAINT [PK_JobsToArtistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingersToSongsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[singerId] [int] NULL,
 CONSTRAINT [PK_SingersToSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[itemsByParameter]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[itemsByParameter] (@parameter varchar(50))
RETURNS table 
AS
RETURN 
  (
	select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsForSongsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join SingersToSongsTBL sts
on so.id = sts.songId join SingersTBL as si
on sts.singerId = si.id where si.name = @parameter
union
select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsForSongsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join TagsToSongsTBL as tts
on so.id = tts.songId join TagsForSongsTBL as t on tts.tagId = t.id where t.name = @parameter
union
select so.id, title, subtitle, date, null as dateHebrew, image_location as image,
CASE WHEN isPerformance = 'true' THEN 'performance'
WHEN EXISTS (SELECT * FROM SongsTBL as song join TagsToSongsTBL as tagts
on song.id = tagts.songId join TagsForSongsTBL as tag on tag.id = tagts.tagId
Where song.id = so.id and tag.name = 'קליפ') THEN 'clip'
ELSE 'song' END AS type
from SongsTBL as so join ArtistsToSongsTBL as ats
on so.id = ats.songId join ArtistsTBL as a on ats.artistId = a.id where a.name = @parameter
union
select a.id, title, subtitle, date, dateHebrew, image, 'article' as type
from ArticlesTBL as a
join TagsToArticlesTBL as tta on a.id = tta.articleId join TagsForArticlesTBL as t on tta.tagId = t.id 
	where t.name = @parameter
  )
GO
/****** Object:  View [dbo].[GetNewSong]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetNewSong]
as
	select top 15 * from [dbo].[SongsTBL]
	order by date desc
GO
/****** Object:  View [dbo].[getFavoriteSongs]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[getFavoriteSongs]
as
select top 10 * 
from SongsTBL
where date > DATEADD(year,-1,GETDATE())
order by count_like desc
GO
/****** Object:  View [dbo].[songsDetails]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[songsDetails]
as
select so.id, so.name, so.file_location, so.type, so.date,
si.name as'singerName' ,so.count_like,so.count_views, so.albumId,so.title,so.subtitle,so.image_location,so.content
from SongsTBL so join SingersToSongsTBL sts on so.id = sts.songId
join SingersTBL si on sts.singerId = si.id
GO
/****** Object:  UserDefinedFunction [dbo].[itemByName]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[itemByName] (@item varchar(50))
RETURNS table 
AS
RETURN 
  (
  select top 1 id, name, image from (
select id, name, image from SingersTBL where name = @item
union
select id, name, null as image from ArtistsTBL where name = @item
union
select id, name, null as image from TagsForArticlesTBL where name = @item
union
select id, name, null as image from TagsForSongsTBL where name = @item) as X)
GO
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_AlbumsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteSongsToUserTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteSongsToUserTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[songId] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_FavoriteSongsToUserTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowUpTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[mail] [varchar](100) NULL,
	[songId] [int] NULL,
	[articleId] [int] NULL,
 CONSTRAINT [PK_FollowUpTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_JobTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParadeTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParadeTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year] [varchar](50) NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
	[image] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_ParadeTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistsTBL](
	[id] [int] IDENTITY(25,1) NOT NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](max) NULL,
	[count_views] [bigint] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_PlaylistsSystemTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingerSearchingToUserTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[singerId] [int] NULL,
	[count_searching] [bigint] NULL,
	[last_date] [datetime] NULL,
 CONSTRAINT [PK_SingerSearchingToUserTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingersToArticlesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersToArticlesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[articleId] [int] NULL,
	[singerId] [int] NULL,
 CONSTRAINT [PK_SingersToArticlesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingersToParadeTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersToParadeTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paradeId] [int] NULL,
	[singerId] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_SingersToSurveyTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongsToParadeTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsToParadeTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[count] [int] NULL,
	[paradeId] [int] NULL,
 CONSTRAINT [PK_SurveyTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsToPlaylistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistId] [int] NULL,
	[songId] [int] NULL,
 CONSTRAINT [PK_SongsToPlaylistsSystemTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongsToUserPlaylistsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsToUserPlaylistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistId] [int] NULL,
	[songId] [int] NULL,
 CONSTRAINT [PK_SongsToPlaylistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[singerId] [int] NULL,
 CONSTRAINT [PK_SubscriptionTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NULL,
	[subtitle] [varchar](150) NULL,
	[href] [varchar](max) NULL,
	[icon] [varchar](50) NULL,
 CONSTRAINT [PK_TopicsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdatesTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdatesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](200) NULL,
	[message] [nvarchar](max) NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_UpdatesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPlaylistsTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPlaylistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_PlaylistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[newsletter] [bit] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_UsersTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotingsToParadeTBL]    Script Date: 30/12/2020 21:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotingsToParadeTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paradeId] [int] NULL,
	[mail] [varchar](50) NULL,
 CONSTRAINT [PK_VotingsToParadeTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlbumsTBL] ON 

INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (1, N'מחשב מסלול מחדש')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (2, N'מאמין בניסים')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (3, N'קולות')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (4, N'MUSICA')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (5, N'אלבום החתונה')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (6, N'על הבמה')
SET IDENTITY_INSERT [dbo].[AlbumsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticlesTBL] ON 

INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (1, N'צפו: גדולי הזמר על במה אחת בסוכות', N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'כ"ח תשרי התשע"ט', CAST(N'2018-10-07T10:14:00.000' AS DateTime), NULL, N'for_articles/162576_tumb_750Xauto.jpg', NULL, 8, 7, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (2, N'אחים ושרים: ראיון משולש עם חיים ישראל, איציק ואבישי אשל', N'שלושה יוצרים נושאים את המוזיקה המזרחית חסידית על הגב שלהם, כל הדרך מתימן לפולין ובחזרה. התוצאה: תחייה רוחנית לז''אנר שחשב ללכת לאיבוד. חיים ישראל, איציק אשל, אבישי אשל - אחים ממשפחה טובה. הם דיברו ושרו וניגנו. ''בקהילה'' לחצו על ''פליי'' ומביאים את סיפורם', N'ב'' כסלו התשע"ה', CAST(N'2014-11-24T08:29:00.000' AS DateTime), N'articles_content/אחים-ושרים-הידברות.txt', N'for_articles/46849_tumb_750Xauto.jpg', N'ברוך טולדנו / בקהילה', 32, 3, CAST(N'2020-12-03T17:56:13.083' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (3, N'הרגע ששבר את פיני איינהורן בתהלוכת המרפסות בירושלים • צפו והאזינו', N' ביוזמתו של ראש עיריית ירושלים משה ליאון יצאה היום ''משאית השמחה'' שתטייל בשכונות ובהמשך גם בכל הארץ, היום היא היתה בבית וגן והיו עליה הזמר פיני איינהורן לצד אמן הקלידים איציק ויינגרטן ששימחו את התושבים, ב''זמן אוויר'' סיפר פיני על הרגע הכי מרגש במהלך ההופעה הניידת', N'כ״ז באדר תש״פ', CAST(N'2020-03-23T16:30:00.000' AS DateTime), NULL, N'for_articles/‏‏פיני-איינהורן-במשאית-השמחה-בירושלים.PNG', NULL, 14, 5, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (4, N'כשאברהם פריד הפתיע מהבידוד: "אף אחד לא מעז לומר לנו שאסור לשיר"', N'הזמר האהוב אברהם פריד הצליח להפתיע את הגולשים כשהעלה את הסרטון הזה מביתו. מה יש לו לומר לכם מהבידוד, ולמה אתם לא באמת לבד כשאתם בביתכם?', N'כ'' אייר התש"פ', CAST(N'2020-05-14T14:07:00.000' AS DateTime), NULL, N'for_articles/221607_tumb_750Xauto.jpg', NULL, 78, 12, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (5, N'יעקב שוואקי מבקש שתשירו איתו בבית, אל תצאו החוצה', N'"נשארים בבית", מבקש יעקב שווקאי במסר מיוחד לגולשי הידברות, וגם - האזינו לשיר שהוא מגיש עם ברכת ישועות ונחמות לעם ישראל', N'ד'' ניסן התש"פ', CAST(N'2020-03-29T21:20:00.000' AS DateTime), NULL, N'for_articles/216402_tumb_750Xauto.jpg', NULL, 65, 9, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (6, N'
"חמישיה מנצחת" האזינו לפינה וצפו בתוצאות>>>', N'
לאחר אלפי הצבעות, החמישיה המנצחת לפניכם.', N'
כ״ח בתשרי תשפ״א 
', CAST(N'2020-10-16T15:42:00.000' AS DateTime), NULL, N'for_articles/לוגו-חמישיה.png', NULL, 126, 37, CAST(N'2020-12-03T19:44:37.757' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (7, N'ענק: כששוואקי פרץ את החומות של חיים ישראל • שווה האזנה', N'אמש שחרר יעקב שוואקי את השיר "לדוד ה'' אורי וישעי", אותו הלחין יצהר ויינברג לפני הרבה שנים, בתוכנית ''זמן אוויר'' עם מנחם טוקר במסגרת הפינה הידועה ''המלחימים'' ובעריכה משעשעת הראה עורך אתר ''קול חי'' דוד קליגר לטוקר כיצד ''פרץ'' יעקב שואקי את ''חומות של תקווה'' שירו של חיים ישראל • שווה האזנה', N'ג׳ באלול תש״פ', CAST(N'2020-08-23T18:05:00.000' AS DateTime), NULL, N'for_articles/יעקב-שוואקי-על-החומות-840x494c.jpg', N'אתר קול חי בהגשת מנחם טוקר ובעריכת דוד קליגר', 86, 25, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (8, N'קליפ מרהיב: שמחת בית השואבה בחדר האוכל של ישיבת חברון', N'ישיבת חברון המשמשת כמלונית קורונה לכלל עולם התורה והישיבות חגגה את שמחת בית השואבה המרכזית בחדר האוכל לחולים יחד עם הקלידן יואלי דיקמן והזמר שלמה כהן בריקודים סוחפים אל תוך הלילה. צפו בוידאו של הצלם יהודה רוזן', N'כ'' תשרי תשפ"א', CAST(N'2020-10-08T22:52:00.000' AS DateTime), NULL, N'for_articles/7948cc984ba5daec55f3.jpg', NULL, 142, 34, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (9, N'צפו: משה קליין וישראל סוסנה במופע לצרפתים', N'במהלך חול המועד סוכות הופיע הזמר משה קליין במופע מיוחד שנועד לקהל הצרפתי בארץ ובעולם בליווי תזמורתו של ישראל סוסנה. צפו בקטע נבחר מתוך המופע', N'ל'' תשרי תשפ"א', CAST(N'2020-10-18T09:24:00.000' AS DateTime), NULL, N'for_articles/44627d09e5908bf6978f.jpg', NULL, 77, 11, CAST(N'2020-12-03T18:51:59.920' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (10, N'מאחורי הקלעים של המוזיקה: יואלי דיקמן בהצצה נדירה לאולפן', N'אם שאלתם את עצמכם איך נוצר שיר? איך מופק אלבום? ומה מתחולל בתוככי האולפנים הסגורים? יואלי דיקמן מנפיק טעימה מתוך הקלטות שמבוצעות בימים אלה עבור גדולי הזמר החסידי: מרדכי בן דוד, זאנוויל וינברגר ואברהם פריד שיראו אור בקרוב • צפו', N'יג'' תשרי תשפ"א', CAST(N'2020-10-01T14:10:00.000' AS DateTime), NULL, N'for_articles/ad3d30daf911afb494dc.jpg', NULL, 89, 18, CAST(N'2020-12-03T17:11:50.200' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (11, N'מאיר גרין בגרסת קורונה ל"שבט אחים ואחיות"', N'הזמר והיוצר מאיר גרין משעשע בקאבר סאטירי ללהיט "שבט אחים ואחיות", במילים חדשות שכתב על תקופת הקורונה • על העיבוד עדי נתנאלי והמקצבים שלו', N'א'' חשון התשפ"א', CAST(N'2020-10-19T13:16:00.000' AS DateTime), NULL, N'for_articles/87m8uj97__w658h439q95.jpg', N'יאיר פרידמן מ''בחזית המדיה''', 133, 42, CAST(N'2020-12-03T17:11:57.280' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (12, N'ישי ריבו, ליפא שמעלצר, משה דוויק ו''ידידים''', N'מתכנת המוזיקה עדי נתנאלי מארח את גדולי הזמר החסידי בקליפ הדגמה חדש לאורגני YAMAHA • צפו במחרוזת הייחודית של ישי ריבו, ליפא שמעלצר משה דוויק ו''ידידים''', N'י"ז אלול התש"פ', CAST(N'2020-09-06T18:38:00.000' AS DateTime), N'articles_content/עדי-נתנאלי-מדגים.txt', N'for_articles/באולפן-של-עדי-נתנאלי.jpg', NULL, 87, 15, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (13, N'יעקב שוואקי בקליפ תמיכה בנשיא טראמפ', N'יעקב שוואקי נותן כתף במערכת הבחירות לנשיאות ארצות הברית ומשחרר קליפ אולפני בו הוא מכריז על תמיכתו בנשיא דונלד טראמפ לכהונה נוספת: We Love America', N'כ"ה אב התש"פ', CAST(N'2020-08-15T22:48:00.000' AS DateTime), NULL, N'for_articles/maxresdefault-2020-08-16T225547.470.jpg', N'יאיר פרידמן מ''בחזית המדיה''', 92, 9, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (14, N'"יהודים מתכוננים לשבת קודש" – ואיך עושה אברהם פריד? • צפו', N'בסרטון התדמית המפתיע נראה פריד עורך קניות ומתכונן לשבת כשברקע מתנגן שירו המפורסם, בלחנו של יו"ט הערליך "יהודים מתכוננים לשבת קודש", ובסיומו הוא נראה יושב בסלון ביתו ומתכונן לשבת בלימוד מתוך הספר החדש', N'ט׳ במרחשון תשפ״א', CAST(N'2020-10-27T15:22:00.000' AS DateTime), N'articles_content/יהודים-מתכוננים-לשבת-קודש-אברהם-פריד.txt', N'for_articles/F111121MS02-1-724x481.jpg', NULL, 71, 4, CAST(N'2020-12-03T19:47:54.810' AS DateTime))
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [image], [credit], [count_views], [count_like], [lastViewingDate]) VALUES (15, N'אבי אילסון ל''המחדש מיוזיק'': "חתונות, זה החמצן שלי"', N'
הזמר אבי אילסון בראיון מיוחד לאתר המחדש על המוזיקה, ההופעות, הקליפים המושקעים ועוד>>>', NULL, CAST(N'2020-08-15T23:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, CAST(N'2020-12-03T23:30:27.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[ArticlesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArtistsTBL] ON 

INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (1, N'אלי קליין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (2, N'איצי ברי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (3, N'אלי קליין & איצי ברי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (4, N'אלחנן אלחדד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (5, N'ארי היל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (6, N'בנצי שטיין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (7, N'יאיר שובל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (8, N'שולי רנד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (9, N'יאיר שריקי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (10, N'מאיר יזדי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (11, N'ישי לפידות')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (12, N'שימי עזר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (13, N'דוד ביתן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (14, N'אלי קשת')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (15, N'עציון מוסאי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (16, N'רביב בן מנחם')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (17, N'איצי וולדנר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (18, N'איציק דדיה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (19, N'יוחנן אורי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (20, N'שמחה פרידמן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (21, N'גיל עקיביוב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (22, N'מוטי רוטלר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (23, N'יובל סטופל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (24, N'וסרמן הפקות')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (25, N'דניאל זמיר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (26, N'יוני אליאב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (27, N'פנחס בן נעים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (28, N'משה זגורי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (29, N'בני לאופר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (30, N'ישי ריבו')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (31, N'מאור שושן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (32, N'שמואל יפת')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (33, N'דוד איכילביץ׳')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (34, N'אברומי ברקו')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (35, N'יוסי גיספן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (36, N'תומר הדדי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (37, N'פליימאסטר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (38, N'שלמה חיים רבקין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (39, N'בני פרידמן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (40, N'תמיר צור')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (41, N'דורון אלימלך')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (42, N'מאט דאב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (43, N'שלמה ברונר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (44, N'משה ביטון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (45, N'מידד טסה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (46, N'שרולי ברונכר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (47, N'מאיר גרין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (48, N'שמעון יחיא')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (49, N'יעקב מנשה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (50, N'מרדכי שפירא')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (51, N'יאן פרייטור')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (52, N' מרים ישראלי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (53, N'שרון אבילחק')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (54, N'אודי דויד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (55, N'ליאור אברמוב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (56, N'אודי דמארי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (57, N'מרדכי בן דוד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (58, N'ראובן הורביץ')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (59, N'חיה נויהאוז')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (60, N'דניאל קפלר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (61, N'הראל טל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (62, N'ישראל סוסנה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (63, N'לירן שושן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (64, N'דוד פדידה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (65, N'רמי לב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (66, N'דניאל חן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (67, N'ערן כרמי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (68, N'יניב רם')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (69, N'אורי אבני')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (70, N'עמי כהן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (71, N'חיים פלאם')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (72, N'איציק וינגרטן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (73, N'אריאל דהן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (74, N'יהונתן אבידני')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (75, N'עוזיה צדוק')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (76, N'הקינדערלך')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (77, N'מקהלת ידידים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (78, N'רובי בנט')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (79, N'רמי רבא')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (80, N'אפרים קמיסר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (81, N'קובי ברומר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (82, N'מקהלת מלכות')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (83, N'אהרל''ה נחשוני')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (84, N'גיל ישראלוב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (85, N'מוטי גרינבוים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (86, N'מנחם טוקר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (87, N'פיני איינהורן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (88, N'אבי אילסון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (89, N'וגשלובין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (90, N'אייל שריקי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (91, N'אביעד גיל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (92, N'עידו נמר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (93, N'עדי כבירי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (94, N'גד אלבז')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (95, N'שרון דוד קושניר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (96, N'נהוראי אריאלי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (97, N'עדי נתנאלי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (98, N'אורי דמארי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (99, N'עמירן דביר')
GO
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (100, N'מקהלת נרננה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (101, N'אהרל''ה סאמט')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (102, N'יצחק הרץ')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (103, N'יואלי דיקמן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (104, N'משה לוין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (105, N'שוקי סלומון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (106, N'שלום וגשל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (107, N'אברמי בלטי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (108, N'אידיש נחת')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (109, N'ר'' שמשון ניימן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (110, N'המנגנים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (111, N'יונתן שיינפלד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (112, N'FDD פרודקשיין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (113, N'מרטין וידרקר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (114, N'מנחם בריסטובסקי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (115, N'עמי מיימון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (116, N'קובי שמעוני')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (117, N'חזי שקד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (118, N'הרב שמשון סגל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (119, N'אבישי אשל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (120, N'אלעד שער')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (121, N'יניב בן משיח')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (122, N'מוטי שטיינמץ')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (123, N'אלכסנדר מיטלמן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (124, N'ישראל לובין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (125, N'עמוס כהן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (126, N'יואלי וייס')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (127, N'יונה ליפשיטץ')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (128, N'אלי גרסטנר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (129, N'מוטי גרינבוים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (130, N'חיים ישראל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (131, N'עציון מוסאי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (132, N'ערן קאש')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (133, N'קובי פרץ')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (134, N' שירת הים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (135, N'אלי פרידמן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (136, N'ג''ין פול')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (137, N'יונתן וייס')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (138, N'יונתן שינפלד')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (139, N'אבי טל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (140, N'מאיר מסוארי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (141, N'אילן לב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (142, N'נתנאל ישראל')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (143, N'טל שגב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (144, N'יעקב למאי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (145, N'נמואל הרוש')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (146, N'מירי ישראלי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (147, N'רביד קשתי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (148, N'לייזר לעווי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (149, N'נפתלי קמפה')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (150, N'יאיר גדסי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (151, N'אלדד רצון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (152, N'רון תיכון')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (153, N'אלי שוואב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (154, N'דודי אינהורן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (155, N'מנדי ג''רופי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (156, N'יוסי גרינבוים')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (157, N'נדב כהן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (158, N'דייויד טויב')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (159, N'גרשון פריישטט')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (160, N'ר'' פייטל לוין')
SET IDENTITY_INSERT [dbo].[ArtistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] ON 

INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (1, 68, 5, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (2, 68, 6, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (4, 67, 2, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (6, 67, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (7, 66, 7, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (9, 66, 8, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (10, 71, 9, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (11, 71, 10, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (12, 71, 10, 6)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (13, 75, 11, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (14, 75, 12, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (15, 75, 13, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (16, 75, 13, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (17, 77, 3, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (18, 77, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (19, 78, 14, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (20, 78, 15, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (21, 78, 16, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (22, 78, 14, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (23, 80, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (24, 81, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (25, 82, 18, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (26, 82, 19, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (27, 83, 30, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (28, 83, 30, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (29, 83, 31, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (30, 84, 22, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (32, 84, 23, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (33, 85, 1, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (35, 85, 24, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (36, 86, 25, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (42, 86, 26, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (43, 87, 1, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (44, 87, 2, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (45, 87, 27, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (46, 88, 27, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (47, 88, 27, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (48, 88, 29, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (49, 88, 28, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (50, 89, 30, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (51, 89, 31, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (52, 90, 32, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (53, 90, 30, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (54, 90, 33, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (55, 91, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (56, 91, 34, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (57, 92, 35, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (58, 92, 36, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (59, 92, 37, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (60, 92, 38, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (61, 93, 39, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (62, 93, 2, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (63, 56, 18, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (65, 56, 40, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (66, 57, 2, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (67, 57, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (68, 58, 4, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (70, 58, 4, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (71, 58, 41, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (72, 59, 42, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (73, 59, 42, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (74, 60, 43, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (75, 60, 43, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (76, 61, 43, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (77, 62, 4, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (78, 62, 9, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (79, 63, 4, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (80, 63, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (81, 64, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (82, 64, 40, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (83, 65, 6, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (84, 65, 23, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (85, 65, 44, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (86, 70, 45, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (87, 70, 46, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (88, 72, 47, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (89, 72, 48, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (90, 73, 30, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (91, 73, 31, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (92, 74, 49, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (93, 74, 41, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (94, 76, 50, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (95, 76, 51, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (96, 79, 52, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (97, 79, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (98, 79, 17, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (99, 94, 53, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (100, 94, 47, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (101, 94, 53, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (102, 94, 53, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (103, 95, 47, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (104, 95, 55, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (105, 96, 56, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (106, 97, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (107, 98, 57, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (108, 98, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (109, 99, 30, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (110, 99, 31, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (111, 100, 30, 8)
GO
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (112, 100, 30, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (113, 100, 31, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (114, 101, 58, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (115, 101, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (116, 102, 17, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (117, 102, 60, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (118, 102, 59, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (119, 102, 51, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (120, 103, 61, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (121, 104, 3, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (122, 104, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (123, 105, 29, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (124, 106, 62, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (125, 107, 4, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (126, 107, 63, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (127, 108, 2, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (128, 108, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (129, 110, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (130, 109, 65, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (131, 109, 65, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (132, 109, 66, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (133, 109, 66, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (134, 111, 65, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (135, 111, 67, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (136, 112, 68, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (137, 112, 69, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (138, 113, 65, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (139, 113, 67, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (140, 114, 70, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (141, 115, 71, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (142, 116, 72, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (143, 116, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (144, 117, 72, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (145, 117, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (146, 119, 72, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (147, 119, 29, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (148, 120, 74, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (149, 122, 18, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (150, 122, 75, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (153, 122, 76, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (154, 122, 77, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (155, 123, 64, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (156, 123, 78, 13)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (157, 123, 79, 13)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (158, 123, 80, 14)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (159, 124, 81, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (160, 124, 82, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (161, 124, 83, 15)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (162, 124, 84, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (163, 124, 85, 16)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (164, 124, 86, 14)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (165, 125, 87, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (166, 125, 88, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (167, 125, 64, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (168, 125, 89, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (169, 125, 70, 13)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (170, 125, 80, 14)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (171, 72, 63, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (172, 76, 60, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (173, 102, 60, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (174, 71, 90, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (175, 62, 90, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (176, 126, 91, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (177, 118, 92, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (178, 118, 93, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (179, 131, 1, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (180, 131, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (181, 118, 94, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (182, 118, 95, 18)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (183, 127, 96, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (184, 127, 46, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (185, 127, 97, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (186, 128, 96, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (187, 128, 97, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (188, 129, 56, 20)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (189, 129, 98, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (190, 130, 99, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (191, 130, 100, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (192, 132, 101, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (193, 132, 2, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (194, 132, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (195, 134, 102, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (196, 134, 103, 21)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (197, 135, 1, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (198, 135, 104, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (199, 135, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (200, 135, 3, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (201, 135, 46, 22)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (202, 136, 105, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (203, 136, 11, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (204, 136, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (205, 136, 46, 23)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (206, 137, 96, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (207, 137, 97, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (208, 138, 96, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (209, 138, 97, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (210, 139, 1, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (211, 139, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (212, 139, 3, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (213, 140, 3, 2)
GO
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (214, 140, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (215, 140, 106, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (216, 141, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (217, 141, 106, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (218, 142, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (219, 142, 47, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (220, 143, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (221, 144, 99, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (222, 144, 46, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (223, 145, 81, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (224, 145, 83, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (225, 145, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (226, 146, 3, 24)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (227, 146, 107, 25)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (228, 146, 57, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (229, 146, 108, 26)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (230, 146, 106, 27)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (231, 147, 109, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (232, 147, 110, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (233, 148, 111, 27)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (234, 148, 85, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (235, 148, 3, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (236, 148, 112, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (237, 148, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (238, 149, 113, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (239, 149, 114, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (240, 150, 115, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (241, 150, 116, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (242, 150, 117, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (243, 150, 56, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (244, 150, 56, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (245, 151, 118, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (246, 151, 9, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (247, 152, 119, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (248, 152, 45, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (249, 152, 120, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (250, 56, 121, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (251, 90, 122, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (252, 155, 123, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (253, 155, 124, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (254, 157, 125, 21)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (255, 154, 126, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (256, 154, 77, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (257, 158, 127, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (258, 158, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (259, 158, 106, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (260, 159, 4, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (261, 159, 20, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (262, 159, 4, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (263, 159, 56, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (264, 161, 111, 27)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (265, 162, 128, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (266, 162, 128, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (267, 162, 103, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (268, 162, 103, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (269, 163, 103, 24)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (270, 163, 85, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (272, 164, 103, 24)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (273, 164, 102, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (274, 165, 130, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (275, 165, 67, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (276, 166, 15, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (277, 116, 132, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (278, 166, 133, 11)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (279, 167, 134, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (280, 167, 135, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (281, 167, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (282, 167, 136, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (283, 168, 137, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (284, 168, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (285, 169, 138, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (286, 169, 1, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (287, 169, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (288, 170, 139, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (289, 170, 140, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (290, 170, 139, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (291, 171, 139, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (292, 171, 140, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (293, 172, 140, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (294, 172, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (295, 173, 65, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (296, 173, 141, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (297, 174, 142, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (298, 174, 143, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (299, 174, 144, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (300, 175, 145, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (301, 175, 146, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (302, 175, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (303, 176, 56, 24)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (304, 177, 3, 24)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (305, 177, 64, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (306, 178, 106, 17)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (307, 178, 17, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (308, 178, 146, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (309, 178, 147, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (310, 178, 148, 28)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (311, 179, 1, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (312, 179, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (313, 179, 149, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (314, 180, 46, 29)
GO
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (315, 181, 105, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (316, 181, 111, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (317, 181, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (318, 182, 150, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (319, 182, 151, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (320, 183, 62, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (321, 183, 152, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (322, 184, 1, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (323, 184, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (324, 184, 3, 19)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (325, 185, 153, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (326, 185, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (327, 186, 111, 27)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (328, 186, 154, 30)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (329, 187, 72, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (330, 187, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (331, 188, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (332, 189, 81, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (333, 190, 105, 8)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (334, 190, 130, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (335, 190, 105, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (336, 191, 77, 12)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (337, 191, 155, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (338, 191, 156, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (339, 192, 157, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (340, 192, 110, 15)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (341, 192, 106, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (342, 193, 23, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (343, 193, 22, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (344, 194, 158, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (345, 194, 105, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (346, 195, 67, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (347, 195, 3, 7)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (348, 195, 130, 5)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (349, 196, 3, 9)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (350, 197, 62, 29)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (351, 198, 64, 10)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (352, 198, 159, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (353, 198, 160, 2)
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[CommitsToArticlesTBL] ON 

INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (45, 1, N'לא ידוע', N'אהבתי', N'שילוב מדהיםםם של זמרים!!', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (46, 2, N'חסוי', N'כל הכבוד להם!!', N'איך הם מפרגנים אחד לשני... כל כך יפה לראות את זה', CAST(N'2019-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (48, 3, N'מישהו לענין :)', N'לייק', NULL, CAST(N'2020-09-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (49, 2, N'אורגניסט', N'באמת שאפו', NULL, CAST(N'2020-09-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (50, 3, N'בני ברקי', N'ממש מחזק.', N'כל הכבוד להם! באמת!!!', CAST(N'2018-10-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (51, 1, N'משהו שאכפת לו', N'באמת יפה', NULL, CAST(N'2019-06-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (53, 1, N'מוזיקאליייי', N'חמוווווד. נמואל הרוש זמר ענקקקקק!', N'', CAST(N'2020-10-01T12:15:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (54, 1, N'מתופף', N'גם שלוימי גרטנר זמר עם קול טוב לא פחות', N'❤❤❤', CAST(N'2020-10-01T12:32:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (55, 4, N'מוזיקאליייי', N'אין כמו אברהם פריד!!!!', N'זמר ענקקק כל שיר שלו להיטטט 👍', CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (56, 4, N'יאיר', N'מגניבבבבב', N'', CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToArticlesTBL] ([id], [articleId], [name], [title], [content], [date], [tested]) VALUES (57, 6, N'מוזיקאליייי', N'נושא תפילה של איציק דדיה צריך להיות מקום ראשון!!!', N'מכניס בכיס הקטן את ככככככל השירים ששמעתי עד היוםםם', CAST(N'2020-10-19T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CommitsToArticlesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[CommitsToSongsTBL] ON 

INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1, 58, N'מישהו שמבין', N'שיר מושלם', N'ברמה אחרת מכל השירים שלו עד היום.', CAST(N'2018-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (2, 59, N'חסוי', N'שיר מרגש ממש', N'שומע אותו בלופ. נדיררר!', CAST(N'2020-08-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (3, 59, N'אוהב מוזיקה!', N'זמר ענקקקק עם שיר מושלםםםם!!!', N'סוג של כישרון להוציא להיטים אחד אחרי השני.', CAST(N'2020-09-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (5, 65, N'מישהו', N'שיר אופטימי ושמח :)', N'לא מרגיש לכם שאוטוטו המשיח מגיע אחרי כזה שיר?? אהבתיייי', CAST(N'2020-09-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (6, 65, N'המגיב השלישי :)', N'איזה שיררר. תודה למיוזיק אונליין שהעלו אותו', N'מדהיםםםם', CAST(N'2020-09-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (7, 61, N'נ נח נחמ נחמן מאומן', N'אין כמו שיר על רבי נחמן!', N'שיר אלוףףף!!! תמשיך להוציא כאלו שירים יפיםםםם.', CAST(N'2020-09-23T19:02:54.000' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (8, 63, N'אוהב מוזיקה', N'ווווווווווואו איזה שיר מדליקקקק!!!', N'אבי אילסון זמר ענקקקק! כל שיר שלו טיללל.', CAST(N'2020-09-23T20:16:47.147' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (9, 57, N'המגיבה הראשונה!!', N'שיר להיטטטטטט', N'תזכרו שאמרתי. זה יהיה להיט חזק!', CAST(N'2020-09-23T20:58:46.887' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (10, 57, N'מבין בלהיטים', N'נחיה ונראה... לא כ"כ חושב אבל זה שיר יפה ללא ספק.', NULL, CAST(N'2020-09-23T21:10:35.447' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (11, 62, N'יאיר', N'שיר מושלםםםםם!!!!!!!! אחלה שיר, אחלה זמר!', N'כל כך מתאים לתקופה ולגמרי רלוונטי.
נהנה לשמוע שוב ושוב ושוב... ולא נמאס בכללל!', CAST(N'2020-09-24T00:53:51.840' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (12, 62, N'חסוי', N'וווווואו!! תפתחו >', N'חשבתי שיהיה קשה לשחזר את ההצלחה של השיר נכספתי... הייתי בטווווח שכל שיר שיוציאו אחריו לא יהיה ברמה שלו כי נכספתי באמתתת שיר טיללללל וההפקה שלו כל כך מקצועית ומדהימההה.
אבל חשבתי! כי השיר הזה פשוט אלוףףףףףף!!!!!', CAST(N'2020-09-24T01:09:28.160' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (13, 62, N'מישהווווו', N'ממש מחזק בתקופה הזו', N'תודה רבה על השיר המחזק.
נותן לי כוח בתקופה הזו של הקורונה שבעזרת ה'' תעבוררר, אמן!', CAST(N'2020-09-24T01:36:25.337' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (14, 66, N'משה', N'כמה חיכינו שקובי ברומר יוציא שיר.. והנה זה בא!', N'שיר שכייףףף לשמוע!', CAST(N'2020-09-24T01:39:40.323' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (15, 66, N'אוהב מוזיקה', N'שילוב מוצלח של קובי ברומר עם שולי רנד, תצליחו! :)', NULL, CAST(N'2020-09-24T01:42:04.427' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (16, 70, N'תימני', N'שיר חמודדד', N'זמר גדולללל.
אוהב את השירים שלו!', CAST(N'2020-09-24T01:59:05.773' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (17, 60, N'מישהווווו', N'שיר טיל!!!! ממש אהבתי', NULL, CAST(N'2020-09-24T02:07:47.927' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (18, 60, N'חסוי', N'מישהו יודע מתי הוא מוציא את האלבום הרביעי?', N'מזמן כתבו שהוא עומד לצאת... ', CAST(N'2020-09-24T02:10:03.530' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (19, 60, N'מאיר', N'נראה לי אחרי החגים', NULL, CAST(N'2020-09-24T02:11:25.800' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (20, 60, N'חסוי', N'למאיר - תודה :)', NULL, CAST(N'2020-09-24T02:15:23.620' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (21, 64, N'מעריץ של שוואקי', N'איזה זמררר איזה שיר!!', N'אגב - מזל טוב לחתונת הבת :)
שיר ממש יפה', CAST(N'2020-09-24T02:18:17.477' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (22, 64, N'אוהב מוזיקה', N'חמודדד!', N'שיר קליל וחמוד', CAST(N'2020-09-24T02:22:05.953' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (23, 63, N'משה', N'שיר חמוד!', N'דומה קצת לסגנון של שוואקי', CAST(N'2020-09-24T02:27:39.627' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (24, 63, N'קלידן מקצועי', N'תגובה למשה', N'וואי נכון!
באמת מזכיר אותו קצת בקול ובסגנון של השיר.', CAST(N'2020-09-24T02:30:21.607' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (25, 56, N'מוזיקאי', N'שיר חזק זמרים גדוליםםם!', NULL, CAST(N'2020-09-24T02:35:47.307' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (26, 56, N'נתיבותניק', N'שיר כ"כ מרגששש', N'כייף לשיר אותו! לחן מדהיםםם.', CAST(N'2020-09-24T02:44:42.867' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (27, 56, N'עוד נתיבותניק ;)', N'כמה עוצמה ורגש שיש בשיר הזהההה!!', NULL, CAST(N'2020-09-24T02:49:06.613' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (28, 56, N'ירושלמי', N'שמתי לב שזה הולך פה לפי ערים... זורם אתכם ;)', N'שיר מוצלחחח. שאפו לזמרים המוכשרים!', CAST(N'2020-09-24T02:51:25.513' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (29, 59, N'חסוי', N'וואו שילוב טוב!', NULL, CAST(N'2020-12-20T03:39:00.377' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (30, 71, N'אלוףףףףף!!!!!', N'איזה שיררררררררר פשוט שלמוווווווותתתתתתתתת', N'שיר טיללללל, זמר ענקקקקקקק וקליפ מדהיםםםםםםםםםםםםם = להיט!', CAST(N'2020-09-25T02:04:00.317' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (31, 71, N'יוווווווואאאאו מדהיםםם', N'סופסוףףףףף קליפ מושקע ולא רק קליפ מילים...!', N'קליפ מושקע ומדהיםםםם', CAST(N'2020-09-25T02:07:43.243' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (32, 71, N'מוזיקאי ;)', N'יש לו פשוט קול נדירררררר', N'שימישיך להוציא עוד המון שירים כאלו מושקעים ואלופים', CAST(N'2020-09-25T02:09:25.167' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (33, 71, N'אחד', N'וואו איזה שיר מלא ברגש! כ"כ מתאים לתקופה', N'יישר כוח!!!!', CAST(N'2020-09-25T02:10:38.483' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (34, 71, N'מישהווווו', N'למוזיקאי - מסכים איתך בהחלט!! :)', N'נדירררררר ברמות אחרות!!', CAST(N'2020-09-25T02:14:28.473' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1040, 72, N'דוד ל.', N'וואו שיר יפההה!', N'אהבתי. תמשיך להוציא כאלו שרים יפים עם קליפים מושקעיםםם', CAST(N'2020-09-30T21:41:14.400' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1041, 72, N'מוזיקאליייי', N'מגניבבבבב', NULL, CAST(N'2020-09-30T21:44:09.243' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1042, 71, N'מוזיקאליייי', N'מדהיםםםםםםםםםםםםםםםםםםםםםםם', N'פצצה של שיררררררר
טיללללל!!!!!!!!!!', CAST(N'2020-09-30T21:48:10.707' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1043, 71, N'חיפאי', N'מגניבבבבב', N'קליפ מושקע חבלזזזזזז', CAST(N'2020-09-30T21:48:58.953' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1044, 71, N'יאיר', N'וווווווואו וואו וואו! ענקקקק!', N'❤❤❤', CAST(N'2020-09-30T22:38:03.317' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1045, 81, N'מוזיקאליייי', N'מגניבבבבב!!!!', NULL, CAST(N'2020-11-04T22:16:28.750' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1046, 81, N'אוהב מוזיקה', N'יש ליעקב שוואקי שירים עם סטייל אמריקאי', N'אוהב את כללללל השירים של הזמר הזה!!', CAST(N'2020-11-04T22:18:12.603' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1047, 81, N'גיטריסט אלוףףף', N'וווואו!!! יותר יפה מהמקורי. תמשיך להוציא עוד שירים כאלו יפים', N'מחכים לשירים חדשיםםםם', CAST(N'2020-11-04T22:20:49.173' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1048, 81, N'amazing', N'wow!! so beautifull', N'big like 🖤🖤🖤', CAST(N'2020-11-04T22:27:52.830' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1049, 154, N'שיר חזקקקקק', N'וואו זה הולך להיות להיט ללא ספק', N'הביצוע הזה עולה בהרבה על הביצוע המקורי!!
שילוב מנצח של חיים ישראל עם מקהלת ידידים. מדהיםםםם', CAST(N'2020-11-05T02:52:22.373' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1051, 154, N'יהודה', N'צודקקק. לשמוע אותו עושה לי אווירה של קומזיץ טובבבב', N'שיר מדהיםםםםם מרגש
ומכניס לאווירה. כייף לשמועעע שאפו!', CAST(N'2020-11-05T02:54:23.257' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1052, 154, N'קלרינט', N'ווווואווו וואו!! הביצוע הזה מקפיץ את השיר הזה בכמה רמות', N'לא נראה לי הכירו את השיר הזה כמו שעכשיו
פשוט מדהיםםםם ולגמרי שילוב מנצח לשיר הזה', CAST(N'2020-11-05T02:56:52.840' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1053, 154, N'אחד', N'יפההה', N'ממש אהבתי!', CAST(N'2020-11-05T02:57:13.253' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1054, 149, N'מגיב לאב הרחמים', N'מרגששש. תודה!', NULL, CAST(N'2020-11-05T02:58:18.287' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1055, 149, N'יאיר', N'כ"כ מכניס לאווירה', N'תודההה', CAST(N'2020-11-05T02:58:49.500' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1056, 148, N'אחד', N'שיהיה לעילוי נשמתו, אמן!', N'תנוחמו מן השמים', CAST(N'2020-11-05T02:59:54.153' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1057, 148, N'חיפאי', N'שאפו על היוזמה ובשורות טובות', NULL, CAST(N'2020-11-05T03:00:21.057' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1058, 67, N'מבין במוזיקה', N'יפההה!! תמשיך להוציא כאלו שירים מושקעים', NULL, CAST(N'2020-11-13T01:38:03.087' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1059, 189, N'מוזיקאליייי', N'מדהיםםםםםםםםםםםםםםםםםםםםםםם שיר סוחף!', NULL, CAST(N'2020-11-24T03:47:37.973' AS DateTime), NULL)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1060, 189, N'אוהב מוזיקה', N'וואו שיר יפההה! ', N'אי אפשר לשמוע אותו בלי לרקוד!!! לגמרי סוחף..', CAST(N'2020-11-24T03:51:10.163' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1061, 189, N'חיים', N'וווווווואו וואו וואו! ענקקקק!', N'תמשיכו להוציא כאלו שיריםםם', CAST(N'2020-11-24T03:51:47.047' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1062, 198, N'ממש יפה', N'סגנון של יעקב שוואקי', N'שיר יפההה', CAST(N'2020-12-01T01:54:53.650' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1063, 198, N'מוזיקאליייי', N'שיר יפהההה!!', N'לזה שאמר שהסגנון דומה לשוואקי - יש בזה משהו..', CAST(N'2020-12-01T01:57:11.473' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1064, 174, N'מוזיקאליייי', N'שיר חמוד', N'ללא ספק הזמר שמוציא הכי הרבה שירים בשנה,
בפרט השנה :)', CAST(N'2020-12-03T17:03:02.500' AS DateTime), 1)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1065, 71, N'יהודה', N'שיר מהמםםםםםם!', N'השיר והקליפ מהממיםםםם 🖤👍', CAST(N'2020-12-17T17:18:52.113' AS DateTime), 0)
INSERT [dbo].[CommitsToSongsTBL] ([id], [songId], [name], [title], [content], [date], [tested]) VALUES (1067, 190, N'ח. מ.', N'שיר יפהההההה!!', N'אבל למה צילמו את הקליפ בשום מקום הזה?
יש מקומות הרבה יותר יפים בדובאי', CAST(N'2020-12-21T22:07:47.407' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CommitsToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteSongsToUserTBL] ON 

INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (1, 1, 56, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (2, 1, 57, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (3, 2, 58, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (5, 2, 59, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (6, 1, 60, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (7, 2, 61, NULL)
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (8, 10, 71, CAST(N'2020-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (9, 10, 68, CAST(N'2020-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (10, 10, 188, CAST(N'2020-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (11, 10, 162, CAST(N'2020-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (12, 10, 187, CAST(N'2020-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteSongsToUserTBL] ([id], [userId], [songId], [date]) VALUES (13, 10, 99, CAST(N'2020-08-29T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[FavoriteSongsToUserTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[FollowUpTBL] ON 

INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (3, NULL, N'bsd.odaya@gmail.com', 62, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1005, NULL, N'bsd.odaya@gmail.com', 71, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1006, NULL, N'bsd.odaya@gmail.com', NULL, 4)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1007, 8, NULL, NULL, 14)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1008, 8, NULL, 162, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1009, 10, NULL, 71, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1011, 10, NULL, 150, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1020, 8, NULL, 198, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1021, 10, NULL, NULL, 2)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1022, 10, NULL, NULL, 7)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1023, 10, NULL, NULL, 11)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1024, 10, NULL, NULL, 14)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1025, 10, NULL, NULL, 6)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1026, 10, NULL, 80, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1027, 10, NULL, 134, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1028, 10, NULL, 135, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1029, 10, NULL, 162, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1030, 10, NULL, 164, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1031, 10, NULL, 172, NULL)
SET IDENTITY_INSERT [dbo].[FollowUpTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTBL] ON 

INSERT [dbo].[JobTBL] ([id], [name]) VALUES (1, N'כותב')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (2, N'מלחין')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (3, N'עיבוד')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (4, N'דואט')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (5, N'צילום')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (6, N'עריכת וידאו')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (7, N'הפקה מוזיקאלית')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (8, N'כותב ומלחין')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (9, N'עיבוד והפקה מוזיקאלית')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (10, N'הפקה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (11, N'זמר אורח')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (12, N'מקהלה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (13, N'ליווי מוזיקאלי')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (14, N'מנחה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (15, N'תזמורת')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (16, N'ילד פלא')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (17, N'הפקה והגשה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (18, N'פסנתר')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (19, N'מיקס ומאסטרינג')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (20, N'כתב, הלחין, עיבד והפיק מוזיקאלית')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (21, N'מלחין ומעבד')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (22, N'בימוי ועריכה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (23, N'עריכה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (24, N'לחן, עיבוד והפקה')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (25, N'קלרינט')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (26, N'מקהלת ילדים')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (27, N'כותב, מלחין ומפיק מוזיקאלית')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (28, N'עריכה ומיקס')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (29, N'עיבוד ומיקס')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (30, N'מנהל המקהלה')
SET IDENTITY_INSERT [dbo].[JobTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ParadeTBL] ON 

INSERT [dbo].[ParadeTBL] ([id], [year], [dateStart], [dateEnd], [image], [isActive]) VALUES (1, N'2020', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-12-30T00:00:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[ParadeTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] ON 

INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (25, N'מזרחי', N'מיטב השירים המזרחיים', 460, N'for_playlists/musical-percussion-instrument-drum-bongo_169016-302.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (26, N'שירי נשמה', N'מיטב שירי הרגש לנשמה', 471, N'for_playlists/acoustic-guitar-tree_1426-614.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (27, N'להיטים', N'להיטים בכל הסגנונות', 283, N'for_playlists/alphacolor-66JMudIjDTw-unsplash.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (28, N'על הקצב', N'כנסו לקצב ותתחילו לרקוד :)', 545, N'for_playlists/drums.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (29, N'על הדרך', N'נוסעים לטיול? הפלייליסט בדיוק בשבילכם', 602, N'for_playlists/colorful-bicycle-with-guitar-meadow_1150-7721.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (30, N'חתונה', N'פלייליסט לחתן וכלה במזל"ט', 302, N'for_playlists/jeremy-wong-304240-1024x684.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (31, N'על הבוקר', N'פלייליסט לבוקר על רגל ימין', 527, N'for_playlists/abstract-photo-music-piano-jazz-music_136559-247.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (32, N'ימי הספירה', N'מיטב השירים הווקאליים', 127, N'for_playlists/microphone-conference_1232-1150.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (33, N'Top 10', N'10 השירים האהובים - אתם קבעתם!', 503, N'for_playlists/small-red-paper-heart-piano-keys_123211-602.jpg')
INSERT [dbo].[PlaylistsTBL] ([id], [name], [title], [count_views], [image]) VALUES (34, N'חדש על המדף', N'15 השירים החדשים ביותר', 412, N'for_playlists/dark-rider-JmVaNyemtN8-unsplash.jpg')
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportsTBL] ON 

INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status], [date]) VALUES (1, N'איציק דדיה', NULL, NULL, NULL, NULL, 2, CAST(N'2020-10-29T20:33:15.000' AS DateTime))
INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status], [date]) VALUES (2, N'עצבני', NULL, NULL, NULL, NULL, 1, CAST(N'2020-11-05T21:30:00.000' AS DateTime))
INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status], [date]) VALUES (3, N'אלי הרצליך', N'bsd.odaya@gmail.com', N'052-7689868', 149, N'אשמח שזה יעבוד בס"ד', 3, CAST(N'2020-12-20T12:15:00.000' AS DateTime))
INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status], [date]) VALUES (4, N'מני ישראל', N'dasi1020@gmail.com', N'054-8502773', 187, N'שלום וברכה,
בעקבות היותי האמרגן של הזמר איציק וינגרטן הנני בעל הזכויות של שיר זה.
על כן אבקש ששיר זה יוסר מאחר והוא מיועד למכירה בלבד!
תודה, מני ישראל מנהל MY Live.', 1, CAST(N'2020-12-21T21:44:15.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] ON 

INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (1, 1, 1, 1, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (2, 1, 2, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (3, 10, 4, 5, CAST(N'2020-11-25T19:54:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (4, 10, 10, 7, CAST(N'2020-11-25T20:04:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersTBL] ON 

INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (1, N'אברהם פריד', N'singers/אברהם-פריד.bmp', 415)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (2, N'יעקב שוואקי', N'singers/יעקב-שוואקי.jpg', 418)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (3, N'מרדכי בן דוד', N'singers/מרדכי-בן-דוד.jpg', 423)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (4, N'איציק דדיה', N'singers/219332_tumb_730Xauto.jpg', 394)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (5, N'פיני איינהורן', N'singers/פיני-איינהורן.jpg', 127)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (6, N'בני פרידמן', N'singers/בני-פרידמן.png', 204)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (7, N'מידד טסה', N'singers/מידד-טסה.jpg', 223)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (8, N'שלמה כהן', N'singers/שלמה-כהן.jpg', 214)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (9, N'שלוימי גרטנר', N'singers/שלוימי-גרטנר.jpg', 142)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (10, N'חיים ישראל', N'singers/חיים-ישראל.jpg', 376)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (11, N'רולי דיקמן', N'singers/רולי-דיקמן.jpg', 117)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (12, N'יואלי דיקמן', N'singers/Yoel_dikman.1.jpg', 79)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (13, N'אבי אילסון', N'singers/אבי-אילסון.jpg', 102)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (14, N'שלום ברנהולץ', N'singers/שלום-ברנהולץ.jpg', 27)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (15, N'גד אלבז', N'singers/גד-אלבז2.jpg', 321)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (16, N'יניב בן משיח', N'singers/Yaniv_ben_mashich.jpg', 157)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (17, N'שמחה פרידמן', N'singers/שמחה-פרידמן.jpg', 86)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (18, N'אייל טויטו', N'singers/אייל-טויטו.jpg', 63)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (19, N'איציק אשל', N'singers/איציק-אשל.jpg', 46)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (20, N'איציק אורלב', N'singers/איציק-אורלב.jpg', 37)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (21, N'שמילי אונגר', N'singers/שמילי-אונגר.jpeg', 28)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (22, N'אהרן רזאל', N'singers/אהרן-רזאל.jpeg', 124)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (23, N'יונתן רזאל', N'singers/יונתן-רזאל.jpg', 103)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (24, N'אלעד שער', N'singers/אלעד-שער.jpg', 54)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (25, N'אלי פרידמן', N'singers/אלי-פרידמן.jpg', 37)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (26, N'הקינדרלעך', N'singers/הקינדרלעך.jpg', 172)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (27, N'נמואל הרוש', N'singers/נמואל-הרוש.jpeg', 143)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (28, N'עוזיה צדוק', N'singers/BAR_4249.jpg', 247)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (29, N'ישי ריבו', N'singers/ישי-ריבו1.jpg', 381)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (30, N'מוטי שטיינמץ', N'singers/מוטי-שטיינמץ-1.jpg', 287)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (31, N'אריק דביר', N'singers/אריק-דביר.jpg', 34)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (32, N'עמירן דביר', N'singers/עמירן-דביר.jpg', 57)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (33, N'ליפא שמעלצר', N'singers/Lipa.jpg', 69)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (34, N'אלי הרצליך', N'singers/אלי-הרצליך.jpg', 84)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (35, N'מאיר מסוארי', N'singers/מאיר-מסוארי.jpg', 51)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (36, N'מאיר גרין', N'singers/מאיר-גרין.jpg', 135)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (37, N'אבי מן', N'singers/אבי-מן.jpg', 52)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (38, N'אודי דמארי', N'singers/אודי-דמארי.jpg', 15)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (39, N'אוהד מושקוביץ', N'singers/אוהד-מושקוביץ.jpg', 58)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (40, N'בערי וובר', N'singers/בערי-וובר.jpg', 18)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (41, N'יוסי גרין', N'singers/יוסי-גרין.jpg', 65)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (42, N'ישי לפידות', N'singers/ישי-לפידות.jpg', 86)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (43, N'משה קליין', N'singers/משה-קליין.jpg', 97)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (44, N'קובי ברומר', N'singers/קובי-ברומר.jpg', 83)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (45, N'יונתן שיינפלד', N'singers/יונתן-שיינפלד.jpg', 78)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (46, N'יוסף חיים שוואקי', N'singers/יוסף-חיים-שוואקי.jpg', 29)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (47, N'יובל טייב', N'singers/יובל-טייב.jpg', 47)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (48, N'מרדכי שפירא', N'singers/מרדכי-שפירא.png', 103)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (49, N'נפתלי קמפה', N'singers/נפתלי-קמפה.jpg', 42)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (50, N'אבישי אשל', N'singers/אבישי-אשל.jpeg', 37)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (51, N'שוקי סלומון', N'singers/שוקי-סלומון.jpg', 114)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (52, N'מנדי ג''רופי', N'singers/מנדי-גרופי.jpg', 109)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (53, N'איציק וינגרטן', NULL, 21)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (54, N'נהוראי אריאלי', NULL, 56)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (55, N'אברימי רוט', NULL, NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (56, N'ארי היל', NULL, 49)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (57, N'ישראל סוסנה', NULL, NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (58, N'נחמן גולדברג', NULL, 34)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (59, N'שימי עזר', NULL, 1)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (60, N'אורי דמארי', NULL, 0)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (61, N'אהרל''ה סאמט', NULL, 19)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (62, N'עמי מיימון', NULL, 15)
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersToParadeTBL] ON 

INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (2, 1, 2, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (3, 1, 3, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (4, 1, 4, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (5, 1, 5, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (6, 1, 6, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (7, 1, 7, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (8, 1, 8, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (9, 1, 9, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (10, 1, 10, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (11, 1, 11, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (12, 1, 12, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (13, 1, 13, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (14, 1, 14, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (15, 1, 15, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (16, 1, 16, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (17, 1, 17, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (18, 1, 18, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (19, 1, 19, NULL)
INSERT [dbo].[SingersToParadeTBL] ([id], [paradeId], [singerId], [count]) VALUES (20, 1, 20, NULL)
SET IDENTITY_INSERT [dbo].[SingersToParadeTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersToSongsTBL] ON 

INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (1, 56, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (2, 57, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (3, 58, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (4, 59, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (5, 60, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (6, 61, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (7, 62, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (8, 63, 13)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (9, 64, 2)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (10, 65, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (11, 66, 44)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (12, 67, 13)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (13, 68, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (14, 69, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (15, 70, 7)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (16, 71, 4)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (17, 72, 36)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (18, 73, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (19, 74, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (20, 75, 19)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (21, 76, 48)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (22, 77, 31)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (23, 78, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (24, 79, 2)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (25, 80, 2)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (26, 81, 2)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (27, 82, 15)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (28, 83, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (29, 84, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (30, 85, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (31, 86, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (32, 87, 37)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (33, 88, 37)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (34, 89, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (35, 90, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (36, 91, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (37, 92, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (38, 93, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (39, 94, 36)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (40, 95, 36)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (41, 96, 34)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (42, 97, 49)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (43, 98, 3)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (44, 99, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (45, 100, 29)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (46, 101, 5)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (47, 102, 48)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (48, 103, 42)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (49, 104, 43)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (50, 105, 43)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (51, 106, 14)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (52, 107, 14)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (53, 108, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (54, 109, 50)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (55, 110, 45)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (56, 111, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (57, 112, 15)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (58, 113, 50)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (59, 114, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (60, 115, 36)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (61, 116, 53)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (62, 117, 53)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (63, 118, 15)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (64, 119, 43)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (65, 120, 43)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (66, 121, 33)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (67, 122, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (68, 123, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (69, 124, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (70, 125, 34)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (71, 126, 7)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (72, 127, 54)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (73, 128, 54)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (74, 129, 38)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (75, 130, 31)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (76, 131, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (77, 132, 5)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (78, 133, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (79, 134, 12)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (80, 135, 11)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (81, 136, 51)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (82, 137, 54)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (83, 138, 54)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (84, 139, 11)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (85, 140, 30)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (86, 141, 49)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (87, 142, 55)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (88, 143, 49)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (89, 144, 32)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (90, 145, 44)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (91, 146, 3)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (92, 147, 3)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (93, 148, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (94, 149, 34)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (95, 150, 38)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (96, 151, 14)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (97, 152, 19)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (98, 153, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (99, 154, 10)
GO
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (100, 155, 34)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (101, 156, 6)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (102, 157, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (103, 158, 9)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (104, 159, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (105, 160, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (106, 161, 45)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (107, 162, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (108, 163, 12)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (109, 164, 12)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (110, 165, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (111, 166, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (112, 167, 25)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (113, 168, 45)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (114, 169, 45)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (115, 170, 35)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (116, 171, 35)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (117, 172, 35)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (118, 173, 16)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (119, 174, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (120, 175, 27)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (121, 176, 38)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (122, 177, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (123, 178, 9)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (124, 179, 1)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (125, 180, 32)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (126, 181, 45)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (127, 182, 7)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (128, 183, 26)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (129, 184, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (130, 185, 39)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (131, 186, 26)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (132, 187, 53)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (133, 188, 49)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (134, 189, 44)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (135, 190, 10)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (136, 191, 18)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (137, 192, 34)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (138, 193, 17)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (139, 194, 11)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (140, 195, 56)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (141, 196, 43)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (142, 197, 57)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (143, 198, 58)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (144, 68, 56)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (145, 75, 42)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (146, 75, 59)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (147, 129, 60)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (148, 130, 32)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (149, 132, 61)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (150, 136, 42)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (151, 150, 62)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (152, 152, 50)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (153, 152, 7)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (154, 152, 24)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (155, 56, 16)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (156, 90, 30)
INSERT [dbo].[SingersToSongsTBL] ([id], [songId], [singerId]) VALUES (157, 179, 49)
SET IDENTITY_INSERT [dbo].[SingersToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (56, N'אלוקי נשמה', N'איציק-דדיה\אלוקי-נשמה-I-איציק-דדיה-ויניב-בן-משיח-Elokay-Neshama-I-Itzik-Dadya-Yaniv-Ben-Mashiach-I.mp4', N'video', CAST(N'2018-10-11T00:00:00.000' AS DateTime), 19, 64, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'for_songs/איציק-דדיה/אלוקי-נשמה-יוטיוב-560x316.jpeg', N'songs_content/איציק-דדיה/איציק-דדיה-ויניב-בן-משיח–אלוקי-נשמה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (57, N'האמונה בוערת', N'איציק-דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17T00:00:00.000' AS DateTime), 9, 57, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'for_songs/איציק-דדיה/53646183_2533434770004335_7805584894150574080_o-560x315.jpg', N'songs_content/איציק-דדיה/האמונה-בוערת.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (58, N'נכספתי', N'איציק-דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09T00:00:00.000' AS DateTime), 50, 104, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'for_songs/איציק-דדיה/211576_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/נכספתי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (59, N'אנא', N'איציק-דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30T00:00:00.000' AS DateTime), 11, 69, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'for_songs/איציק-דדיה/223388_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/אנא.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (60, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12T00:00:00.000' AS DateTime), 15, 74, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', N'כמידי שנה בשנה, בהתקרב חודש אלול והימים הנוראים מוציא איציק דדיה שיר "ברסלבי" חדש. לפני שנתיים כבש איציק את עולם המוזיקה היהודית עם הלהיט "רבי נחמן" שצבר מיליוני צפיות ביוטיוב, בשנה שעברה הוא עשה זאת שוב עם "אין ייאוש בעולם" וכעת ההיסטריה עומדת לחזור על עצמה עם להיט חדש בשם "בדרך לאומן".
', N'for_songs/איציק-דדיה/cover-27-560x373.jpg', N'songs_content/איציק-דדיה/בדרך-לאומן.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (61, N'בדרך לאומן - קליפ', N'איציק-דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26T00:00:00.000' AS DateTime), 27, 86, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', N'כמידי שנה בשנה, בהתקרב חודש אלול והימים הנוראים מוציא איציק דדיה שיר "ברסלבי" חדש. לפני שנתיים כבש איציק את עולם המוזיקה היהודית עם הלהיט "רבי נחמן" שצבר מיליוני צפיות ביוטיוב, בשנה שעברה הוא עשה זאת שוב עם "אין ייאוש בעולם" וכעת ההיסטריה עומדת לחזור על עצמה עם להיט חדש בשם "בדרך לאומן".

', N'for_songs/איציק-דדיה/da-560x321.png', N'songs_content/איציק-דדיה/איציק-דדיה-בדרך-לאומן-הקליפ-הרשמי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (62, N'כוכבים', N'איציק-דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23T12:13:00.000' AS DateTime), 45, 234, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'for_songs/איציק-דדיה/‏‏file.jpg', N'songs_content/איציק-דדיה/כוכבים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (63, N'תן לי אור', N'אבי-אילסון\c4a4df0ee8211d9c960d75aa53323e32.mp4', N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), 21, 78, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'for_songs/אבי-אילסון/עטיפה-תן-לי-אור-724x483.jpg', N'songs_content/אבי-אילסון/תן-לי-אור.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (64, N'מסיני בא', N'יעקב-שוואקי\יעקב שוואקי - מסיני בא.mp4', N'video', CAST(N'2020-02-11T12:08:00.000' AS DateTime), 12, 143, NULL, N'יעקב שוואקי בסינגל לקראת חתונת בתו: "מסיני בא"', N'יעקב שוואקי הלחין את המילים שכותב רש"י לפרשת יתרו בשם מכילתא, לכבוד חתונתה של בתו. האזינו', N'for_songs/יעקב-שוואקי/211577_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/מסיני-בא.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (65, N'אוטוטו', N'אברהם-פריד\אברהם-פריד-אוטוטו-Avraham-Fried-OhToToh.mp4', N'video', CAST(N'2020-08-23T22:31:00.000' AS DateTime), 54, 305, NULL, N'שיר ראשון מתוך אלבום חסידי חדש: אברהם פריד עם "אוטוטו"', N'אברהם פריד מתקרב סופסוף להשקת האלבום החסידי החדש שלו, שיצא לאור בעז"ה אחרי החגים. בינתיים הוא מגיש סינגל ראשון מתוכו: "אוטוטו". צפו בקליפ המילים', N'for_songs/אברהם-פריד/234162_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אוטוטו.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (66, N'כמה טוב ה''', N'קובי-ברומר\כמה-טוב-ה-I-קובי-ברומר-Kama-Tov-Hashem-I-Kobi-Brummer.mp4', N'audio', CAST(N'2020-08-15T00:00:00.000' AS DateTime), 3, 35, NULL, N'קובי ברומר בסינגל חדש – כמה טוב ה''', N'הזמר קובי ברומר מוציא סינגל חדש בשם ''כמה טוב ה" מתוך אלבום בכורה שיצא בקרוב.', N'for_songs/קובי-ברומר/‏‏כמה-טוב-ה.PNG', N'songs_content/קובי-ברומר/כמה-טוב-ה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (67, N'שיבוא', N'אבי-אילסון\אבי אילסון - שיבוא.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), 11, 87, NULL, N'אבי אילסון פותח את הקיץ: "שיבוא"', N'בעיצומה של המערכה השניה של מערכת הבחירות רוויית הקיטוב בין הזרמים בעם, מגיש הזמר אבי אילסון שיר רווי אמונה בציפיה למשיח שיבוא.', N'for_songs/אבי-אילסון/שיבוא.jpg', N'songs_content/אבי-אילסון/‏‏שיבוא.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (68, N'אבא', N'אברהם-פריד\אברהם פריד & ארי היל - אבא.mp3', N'audio', CAST(N'2019-06-05T14:45:00.000' AS DateTime), 32, 415, NULL, N'אברהם פריד בדואט נפלא עם ארי היל: "אבא"', N'את השיר "אבא" כתב והלחין בנצי שטיין, וכאשר שמע את ארי היל שר אותו, הציע לאברהם פריד להפוך אותו לדואט. התוצאה נפלאה', N'for_songs/אברהם-פריד/189747_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אבא.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (69, N'בידיים טובות', N'בני-פרידמן\בני-פרידמן-בידיים-טובות-ווקאלי.mp3', N'audio', CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, 24, NULL, N'בני פרידמן – בידיים טובות – ווקאלי', N'לאחר צאת אלבומו הווקאלי "לחישות הלב", משחרר הזמר בני פרידמן סינגל מתוך הדיסק – בידיים טובות.', N'for_songs/בני-פרידמן/בני-פרידמן-בידיים-טובות-ווקאלי.jpg', N'songs_content/בני-פרידמן/בידיים-טובות.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (70, N'נעשה שמח', N'מידד-טסה\מידד טסה - נעשה שמח.mp4', N'video', CAST(N'2020-08-12T11:37:00.000' AS DateTime), 7, 36, NULL, N'מידד טסה בפרק חדש בחיים המוסיקליים: "נעשה שמח"', N'מידד טסה בסינגל חדש ומקפיץ, עם קליפ תואם: "נעשה שמח". צפו', N'for_songs/מידד-טסה/232760_tumb_750Xauto.jpg', N'songs_content/מידד-טסה/נעשה-שמח.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (71, N'נושא תפילה', N'איציק-דדיה\איציק-דדיה-נושא-תפילה-Itzik-Dadya-Nose-Tfila (1).mp4', N'video', CAST(N'2020-09-23T12:28:00.000' AS DateTime), 55, 359, NULL, N'איציק דדיה בסינגל תפילה חדש: "נושא תפילה"', N'איציק דדיה מחדש את השיר המוכר "נושאת תפילה" בגרסה מיוחדת, שמתאימה במיוחד לימים המורכבים הללו. צפו גם בקליפ', N'for_songs/איציק-דדיה/נושא-תפילה-1920-960x540.jpg', N'songs_content/איציק-דדיה/נושא-תפילה.txt', 0, CAST(N'2020-12-24T04:36:49.640' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (72, N'ימי הרחמים', N'מאיר-גרין\מאיר-גרין-ימי-רחמים5.mp4', N'video', CAST(N'2020-08-30T00:21:00.000' AS DateTime), 41, 333, NULL, N'מאיר גרין בסינגל קליפ חדש – "ימי רחמים"', N'צפו בזמר והיוצר מאיר גרין בסינגל קליפ - חדש - אשר אותו כתב יחד עם הרב שלו - הרב חיים הורביץ על תקופת ימי הרחמים והסליחות', N'for_songs/מאיר-גרין/מאיר-גרין-ימי-הרחמים.PNG', N'songs_content/מאיר-גרין/ימי-הרחמים-מאיר-גרין.txt', 0, CAST(N'2020-12-24T00:31:09.880' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (73, N'כתר מלוכה', N'ישי-ריבו\ישי ריבו - כתר מלוכה.mp3', N'audio', CAST(N'2020-04-01T13:03:00.000' AS DateTime), 62, 470, NULL, N'ישי ריבו זועק את זעקתה של התקופה בשיר חדש: "כתר מלוכה"', N'בימים שבהם אנחנו מופרדים ומתרחקים, וגם לומדים להתקרב בדרכים אחרות, ישי ריבו זועק את זעקת הימים בכנות פשוטה ובקריאה של קרבה לבורא עולם. האזינו', N'for_songs/ישי-ריבו/236650_tumb_750Xauto.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (74, N'לא לפחד', N'שמחה-פרידמן\שמחה פרידמן - לא לפחד.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), 13, 243, NULL, N'שמחה פרידמן בסינגל חדש: "לא לפחד"', N'אחרי מספר להיטים בראשם הלהיט ''יתגדל'' מגיש הזמר שמחה פרידמן סינגל נוסף ''לא לפחד''', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-לא-לפחד.jpg', N'songs_content/שמחה-פרידמן/לא-לפחד.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (75, N'סוכה ולולב', N'איציק-אשל\1231.mp4', N'video', CAST(N'2020-10-04T00:00:00.000' AS DateTime), 5, 39, NULL, N'
איציק אשל וישי לפידות מגישים: "סוכה ולולב"', N'מתוך הסדרה החדשה - "איציק אשל וחברים שרים לכבוד החגים"', N'for_songs/איציק-אשל/סוכה-ולולב-איציק-אשל-וישי-לפידות.PNG', N'songs_content/איציק-אשל/סוכה-ולולב.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (76, N'אין עוד מלבדו', N'מרדכי-שפירא\1215.mp4', N'video', CAST(N'2020-09-29T00:00:00.000' AS DateTime), 13, 75, NULL, N'מרדכי שפירא בסינגל - קליפ חדש: "אין עוד מלבדו"', N'כוכב הזמר החסידי מרדכי שפירא מגיש סינגל חדש ומקפיץ: "אין עוד מלבדו"', N'for_songs/מרדכי-שפירא/אין-עוד-מלבדו-מרדכי-שפירא.PNG', N'songs_content/מרדכי-שפירא/אין-עוד-מלבדו.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (77, N'נרקוד', N'אריק-דביר\אריק דביר - נרקוד.mp3', N'audio', CAST(N'2018-08-12T09:47:00.000' AS DateTime), 12, 81, NULL, N'אריק דביר בסינגל בכורה אחרי 13 שנים של הופעות: "נרקוד"', N'אריק דביר כבר מופיע על במות שונות בישראל זה 13 שנה, אך כעת הוא מוציא סוף כל סוף את הסינגל הראשון שלו, "נרקוד". האזינו', N'for_songs/אריק-דביר/157438_tumb_750Xauto.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (78, N'טעיתי', N'חיים-ישראל\חיים ישראל - טעיתי.mp3', N'audio', CAST(N'2018-08-28T00:00:00.000' AS DateTime), 52, 281, NULL, N'חיים ישראל בסינגל חדש לימים הנוראים: "טעיתי"', N'הזמר והיוצר חיים ישראל משיק סינגל חדש בשם "טעיתי", בלדה מרגשת וסוחפת, שאת מילותיו כתבו אלי קשת ועציון מוסאי, הלחן של רביב בן מנחם. העיבוד וההפקה המוסיקלית של אלי קשת', N'for_songs/חיים-ישראל/טעיתי-חיים-ישראל.PNG', N'songs_content/חיים-ישראל/טעיתי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (79, N'ישתבח שמו', N'יעקב-שוואקי\ישתבח שמו.mp3', N'audio', CAST(N'2018-05-31T00:00:00.000' AS DateTime), 85, 386, 4, N'יעקב שוואקי בשיר חדש: "ישתבח שמו"', N'יעקב שוואקי חוגג אלבום פלטינה, ומשיק היום את הוידאו קליפ "ישתבח שמו" מהלהיטים הבולטים באלבומו האחרון MUSICA.
המילים של מרים ישראלי, לחן והפקה מוזיקלית איצי וולדנר, והעיבוד תמיר צור.', N'for_songs/יעקב-שוואקי/PIC-8-1-560x373.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (80, N'א ב ג', N'יעקב-שוואקי\Shwekey.mp4', N'video', CAST(N'2018-05-02T11:07:00.000' AS DateTime), 14, 344, 4, N'השיר הראשון שאתם צריכים לשמוע בל"ג בעומר: "אלף-בית-גימל"', N'יעקב שוואקי פותח את יום ל"ג בעומר בשיר חדש ומקפיץ: "אלף-בית-גימל". צפו בקליפ המילים', N'for_songs/יעקב-שוואקי/146812_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/א-ב-ג.txt', 0, CAST(N'2020-12-29T00:11:23.733' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (81, N'I Can Be', N'יעקב-שוואקי\911.mp4', N'video', CAST(N'2020-06-15T13:59:00.000' AS DateTime), 65, 415, NULL, N'יעקב שוואקי בעיבוד חדש ומרענן לשירו "I Can Be"', N'את העיבוד החדש מגיש שוואקי לקראת אירוע לייב עבור הסנטר לילדים מיוחדים. האזינו לגרסה החדשה', N'for_songs/יעקב-שוואקי/225464_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/I-Can-Be.txt', 0, CAST(N'2020-12-30T15:43:26.423' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (82, N'אבאלה', N'גד-אלבז\גד אלבז - אבאלה.mp3', N'video', CAST(N'2019-06-27T00:00:00.000' AS DateTime), 70, 406, NULL, N'איציק דדיה הלחין, גד אלבז שר "אבאלה"', N'הזמר גד אלבז בסינגל חדש וקיצבי "אבאלה", את הלחן לשיר כתב הזמר איציק דדיה, העיבוד האלקטרוני של יוחנן אורי.', N'for_songs/גד-אלבז/אבאלה.jpg', N'songs_content/גד-אלבז/אבאלה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (83, N'הלב שלי', N'ישי-ריבו\הלב שלי.mp4', N'video', CAST(N'2019-08-12T11:26:00.000' AS DateTime), 89, 417, NULL, N'ישראל סוסנה ותזמורתו מארחים את דוד אסרף בשירו של ישי ריבו, "הלב שלי"', N'מוצאי תשעה באב תשע"ט, ולקראת אלבום נעימות חדש, ישראל סוסנה ותזמורתו מארחים את אמן הסקסופון דוד אסרף, לביצוע קסום ומרגש לשירו של ישי ריבו, "הלב שלי". האזינו', N'for_songs/ישי-ריבו/הלב-שלי.jpg', N'songs_content/ישי-ריבו/הלב-שלי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (84, N'חתן כלה', N'שמחה-פרידמן\שמחה פרידמן - חתן כלה .mp4', N'video', CAST(N'2017-06-01T00:00:00.000' AS DateTime), 38, 227, NULL, N'שמחה פרידמן בלהיט חתונות חדש – "חתן כלה"', N'אחרי הלהיט ''בקרוב (יתגדל)'', והסינגל הישראלי ''עבור מישהו אחר'', חוזר אלינו הזמר החסידי שמחה פרידמן עם שיר חסידי אותנטי, שנכתב במיוחד עבור רחבות הריקודים של החתונות: ''חתן כלה''', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-חתן-כלה.jpg', N'songs_content/שמחה-פרידמן/חתן-כלה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (85, N'עוד יבוא יום', N'שמחה-פרידמן\שמחה פרידמן - עוד יבוא היום .mp4', N'video', CAST(N'2020-02-06T00:00:00.000' AS DateTime), 21, 142, NULL, N'שמחה פרידמן משיק סינגל חדש: "עוד יבוא היום"', N'הזמר החסידי שמחה פרידמן משיק היום סינגל חדש, שביעי במספר, מתוך אלבום הבכורה שלו, המתקרב ובא. שם הסינגל הינו "עוד יבוא היום"', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-עוד-יבוא-היום.jpg', N'songs_content/שמחה-פרידמן/עוד-יבוא-היום.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (86, N'בקרוב (יתגדל)', N'שמחה-פרידמן\שמחה פרידמן - בקרוב (יתגדל)  .mp4', N'video', CAST(N'2016-06-09T00:00:00.000' AS DateTime), 32, 240, NULL, N'בכורה: להיט חדש לזמר שמחה פרידמן – "בקרוב"', N'מילות השיר מדברות על הצורך להקדיש בכל יום כמה דקות של רגעי תפילה וחיבור לבורא, ומעניקות פרשנות ייחודית למילים הידועות מהקדיש: "יתגדל ויתקדש שמיה רבא"!', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-בקרוב.jpg', N'songs_content/שמחה-פרידמן/בקרוב.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (87, N'לשמח כלה', N'אבי-מן\לשמח כלה.mp4', N'video', CAST(N'2017-06-12T09:10:00.000' AS DateTime), 29, 148, NULL, N'"לשמח כלה": להיט החתונות לקיץ הקרוב', N'אבי מן הוא זמר ומוסיקאי שכבר הופיע על מאות במות בחתונות, דינרים ואירועים מכל הסוגים. כעת הוא יוצא עם סינגל ראשון שעשוי להפוך להיות להיט החתונות הבא, בזכות הקצב הנהדר והלחן של אלי קליין, והיכולות הווקאליות של אבי מן. הסינגל בחסות המפיק פנחס בן נאים. האזינו', N'for_songs/אבי-מן/לשמח-כלה.jpg', N'songs_content/אבי-מן/לשמח-כלה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (88, N'השבעתי', N'אבי-מן\השבעתי.mp4', N'video', CAST(N'2020-01-20T11:54:00.000' AS DateTime), 21, 103, NULL, N'אבי מן בסינגל מלא ערגה: "השבעתי"', N'אבי מן מגיש סינגל חדש ומרגש, המדבר על הגלות ועל הציפייה לגאולה, בלחן של האמרגן פנחס בן נאים. צפו גם בקליפ המושקע', N'for_songs/אבי-מן/השבעתי.jpg', N'songs_content/אבי-מן/השבעתי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (89, N'לשוב הביתה', N'ישי-ריבו\לשוב הביתה.mp4', N'video', CAST(N'2017-11-29T14:39:00.000' AS DateTime), 35, 224, NULL, N'ישי ריבו בסינגל חדש - "לשוב הביתה"', N'בדרך לאלבום השלישי, ואחרי הצלחה גדולה עם הסינגל הראשון "הנה ימים באים", הזמר האהוב מסתער על הפלייליסט עם שיר חדש, מפתיע ומרגש – "לשוב הביתה". האלבום המלא ייצא במהלך החורף הקרוב', N'for_songs/ישי-ריבו/לשוב-הביתה.jpg', N'songs_content/ישי-ריבו/לשוב-הביתה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (90, N'נפשי', N'ישי-ריבו\נפשי.mp4', N'video', CAST(N'2018-06-10T10:16:00.000' AS DateTime), 49, 295, NULL, N'דואט נדיר וראשון מסוגו של שטיינמץ וריבו', N'מוטי שטיינמץ וישי ריבו בשיר מרגש במיוחד, "נפשי". זהו מפגש בין שני עולמות דומים מאד ושונים מאד. האזינו', N'for_songs/ישי-ריבו/נפשי.jpg', N'songs_content/ישי-ריבו/נפשי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (91, N'מיי דיר ראבע', N'בני-פרידמן\מיי דיר ראבע.mp4', N'video', CAST(N'2020-04-12T00:00:00.000' AS DateTime), 9, 78, NULL, N'בני פרידמן ואיצי וואלדנר בקליפ חדש: "מיי דיר ראבע"', N'הזמר בני פרידמן מארח את המלחין איצי וואלדנר בקליפ חדש "מיי דיר ראבע" (הרבי היקר שלי), השיר מוקדש למורים בתלמודי התורה. המילים של מירי ישראלי, העיבוד של אברימי ברקו. צפו', N'for_songs/בני-פרידמן/מיי-דיר-ראבע.png', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (92, N'הריני מקבל', N'בני-פרידמן\הריני מקבל.mp4', N'video', CAST(N'2019-09-05T12:04:00.000' AS DateTime), 12, 101, NULL, N'בני פרידמן בסינגל חדש: "הריני מקבל"', N'בני פרידמן יוצא בסינגל חדש שמדבר כולו על אהבת ישראל. האזינו', N'for_songs/בני-פרידמן/הריני-מקבל.jpg', N'songs_content/בני-פרידמן/הריני-מקבל.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (93, N'חארשו', N'בני-פרידמן\חארשו.mp4', N'video', CAST(N'2020-08-03T08:12:00.000' AS DateTime), 67, 258, NULL, N'"חראשו" של בני פרידמן, עכשיו בגרסת הרמיקס הרשמית', N'השיר "חראשו", להיט במגוון שפות של בני פרידמן, זוכה לעיבוד רמיקס של די.ג''יי נדב ביטון. האזינו', N'for_songs/בני-פרידמן/חארשו.jpg', N'songs_content/בני-פרידמן/חארשו.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (94, N'כי אני יהודי', N'מאיר-גרין\כי אני יהודי.mp4', N'video', CAST(N'2019-03-04T13:01:00.000' AS DateTime), 67, 319, NULL, N'מאיר גרין בסינגל חדש ומקפיץ: "כי אני יהודי"', N'מאיר גרין בסינגל על האתגר שלנו, להתגבש ולשמור על אחדות העם, עם קליפ מגוון ומדויק. צפו', N'for_songs/מאיר-גרין/כי-אני-יהודי.jpg', N'songs_content/מאיר-גרין/כי-אני-יהודי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (95, N'עוד אבינו חי', N'מאיר-גרין\עוד אבינו חי.mp4', N'video', CAST(N'2020-01-12T14:14:00.000' AS DateTime), 46, 145, NULL, N'מאיר גרין בסינגל חדש ומקפיץ: "עוד אבינו חי"', N'מאיר גרין יוצא בסינגל חדש אחרי כמה הצלחות קודמות, הפעם עם השיר האמוני "עוד אבינו חי". צפו גם בקליפ המילים', N'for_songs/מאיר-גרין/עוד-אבינו-חי.jpg', N'songs_content/מאיר-גרין/עוד-אבינו-חי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (96, N'רק לתת', N'אלי-הרצליך\רק לתת.mp4', N'video', CAST(N'2020-08-18T13:52:00.000' AS DateTime), 18, 117, NULL, N'אלי הרצליך בסינגל קליפ חדש: "רק לתת"', N'אלי הרצליך מגיש סינגל חדש המדבר על החשיבות הגדולה של הנתינה ושל הצדקה. צפו בקליפ המושקע', N'for_songs/אלי-הרצליך/רק-לתת.jpg', N'songs_content/אלי-הרצליך/רק-לתת.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (97, N'עמך עמי', N'נפתלי-קמפה\עמך עמי.mp4', N'video', CAST(N'2020-01-27T10:45:00.000' AS DateTime), 65, 102, NULL, N'נפתלי קמפה בסינגל חדש לקראת האלבום המתקרב: "עמך עמי"', N'אלבומו השני של נפתלי קמפה עתיד לצאת בט"ו בשבט הקרוב, ועד אז הוא משחרר סינגל נוסף מתוך האלבום, "עמך עמי", למילים מתוך מגילת רות. האזינו', N'for_songs/נפתלי-קמפה/עמך-עמי.jpg', N'songs_content/נפתלי-קמפה/עמך-עמי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (98, N'דיייי', N'מרדכי-בן-דוד\די.mp4', N'video', CAST(N'2020-05-12T09:30:00.000' AS DateTime), 95, 245, NULL, N'מרדכי בן דוד בשיר חדש לל"ג בעומר: "דיייייי"', N'את השיר הלחין מרדכי בן דוד לפני כשלושה שבועות, בעיצומה של מגיפת הקורונה. כעת הוא משחרר אותו בתפילה לרפואה שלמה לכל החולים. האזינו', N'for_songs/מרדכי-בן-דוד/דיייי.jpg', N'songs_content/מרדכי-בן-דוד/די.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (99, N'סדר העבודה', N'ישי-ריבו\סדר העבודה.mp4', N'video', CAST(N'2020-09-02T13:26:00.000' AS DateTime), 86, 104, NULL, N'ישי ריבו בסינגל נוסף מהאלבום המתקרב: "סדר העבודה" בלייב', N'שיר נוסף מהאלבום שיצא בשבוע הבא, והפעם "סדר העבודה" בביצוע לייב שהוקלט במשכן לאומנויות הבמה. צפו', N'for_songs/ישי-ריבו/סדר-העבודה.jpg', N'songs_content/ישי-ריבו/סדר-העבודה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (100, N'אלול תשע"ט', N'ישי-ריבו\אלול תשעט.mp4', N'video', CAST(N'2019-09-15T12:49:00.000' AS DateTime), 34, 265, NULL, N'ישי ריבו משחרר את אלבומו המצופה. האזינו ל"אלול תשע"ט"', N'ישי ריבו משחרר היום את אלבומו, שרבים ציפו לו, "אלול תשע"ט". האזינו לשיר הנושא של האלבום', N'for_songs/ישי-ריבו/אלול-תשעט.jpg', N'songs_content/ישי-ריבו/אלול-תשעט.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (101, N'לא רעב ללחם', N'פיני-איינהורן\לא רעב ללחם.mp4', N'video', CAST(N'2019-09-25T10:45:00.000' AS DateTime), 61, 201, NULL, N'פיני איינהורן בסינגל מתוך האלבום הקרב: "לא רעב ללחם"', N'באווירת ימי הרחמים והסליחות, ולקראת אלבום הבכורה "פיני" שיצא לאור במוצאי שבת בראשית, משחרר פיני איינהורן סינגל מרגש ואקטואלי: "לא רעב ללחם". האזינו', N'for_songs/פיני-איינהורן/לא-רעב-ללחם.jpg', N'songs_content/פיני-איינהורן/לא-רעב-ללחם.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (102, N'הכל משמים', N'מרדכי-שפירא\הכל משמים.mp4', N'video', CAST(N'2019-06-13T13:22:00.000' AS DateTime), 75, 298, NULL, N'מרדכי שפירא מציג אלבום שלישי: "הכל משמים"', N'לאחר שני אלבומים קודמים, משיק מרדכי שפירא את אלבומו השלישי, הכולל שירים בעברית ובאנגלית. האזינו לשיר הנושא מתוך האלבום', N'for_songs/מרדכי-שפירא/הכל-משמים.PNG', N'songs_content/מרדכי-שפירא/הכל-משמים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (103, N'בקש עבדך', N'ישי-לפידות\בקש עבדך.mp4', N'video', CAST(N'2020-07-22T14:13:00.000' AS DateTime), 107, 468, NULL, N'"בקש עבדך" - ישי לפידות בסינגל חדש • האזינו', N'ישי לפידות, מגדולי הזמרים והמלחינים, משיק הערב, מוצאי ראש השנה, סינגל חדש - "בקש עבדך", אותו כתב והלחין הראל טל, וחושף מה עומד מאחורי השיר החדש (מוזיקה)', N'for_songs/ישי-לפידות/בקש-עבדך.jpg', N'songs_content/ישי-לפידות/בקש-עבדך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (104, N'ברכו את ה''', N'משה-קליין\ברכו את ה.mp4', N'video', CAST(N'2018-02-19T09:00:00.000' AS DateTime), 26, 128, NULL, N'משה קליין בסינגל קצבי חדש: "ברכו את ה''"', N'בימים שבהם מרבים שמחה, יוצא משה קליין בסינגל חדש שכולו שמחה והודאה לה''. האזינו', N'for_songs/משה-קליין/ברכו-את-ה.jpg', N'songs_content/משה-קליין/ברכו-את-ה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (105, N'נס', N'משה-קליין\נס.mp4', N'video', CAST(N'2019-06-13T13:24:00.000' AS DateTime), 45, 135, NULL, N'משה קליין מודה על הנס שנעשה לו, בשיר "נס"', N'לפני כחודש עלה רכבו של משה קליין באש. הזמר ניצל מהשריפה בנס – וכך גם תיק התפילין שלו. מיד לאחר מכן פנה קליין למלחין אלחנן אלדד, ויצר את השיר האופטימי הזה. האזינו', N'for_songs/משה-קליין/נס.jpg', N'songs_content/משה-קליין/נס.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (106, N'הזמן של השמחה', N'שלום-ברנהולץ\הזמן של השמחה.mp4', N'video', CAST(N'2019-08-15T11:33:00.000' AS DateTime), 57, 274, NULL, N'שלום ברנהולץ בסינגל בכורה: "הזמן של השמחה"', N'אחרי שנים של הופעות באירועים, שלום ברנהולץ משחרר סינגל בכורה מקפיץ במיוחד לעונת החתונות, "הזמן של השמחה". האזינו', N'for_songs/שלום-ברנהולץ/הזמן-של-השמחה.png', N'songs_content/שלום-ברנהולץ/הזמן-של-השמחה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (107, N'אתה קרוב', N'שלום-ברנהולץ\אתה קרוב.mp4', N'video', CAST(N'2020-02-02T20:51:00.000' AS DateTime), 23, 125, NULL, N'שלום ברנהולץ בסינגל נוסף לקראת אלבום הבכורה: "אתה קרוב"', N'שלום ברנהולץ בשיר חדש המעצים את ההכרה במציאות הקרובה של הקב"ה, עם מילות תפילה מרגשות. האזינו', N'for_songs/שלום-ברנהולץ/אתה-קרוב.jpg', N'songs_content/שלום-ברנהולץ/אתה-קרוב.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (108, N'נשמח עם החתן', N'אוהד-מושקוביץ\נשמח עם החתן.mp4', N'video', CAST(N'2017-08-07T17:56:00.000' AS DateTime), 31, 267, NULL, N'אוהד מושקוביץ חוזר לשנות השבעים עם "נשמח עם החתן"', N'עונות החתונות נפתחה, ואוהד מושקוביץ משחרר את הסינגל החדש שלו, ''נשמח עם החתן'' - להיט חתונות מקפיץ. השיר נכתב ועובד בסגנון וינטג'', עם עיבוד מיוחד בסגנון שנות ה-70', N'for_songs/אוהד-מושקוביץ/נשמח-עם-החתן.jpeg', N'songs_content/אוהד-מושקוביץ/נשמח-עם-החתן.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (109, N'מחילה', N'אבישי-אשל\אבישי-אשל-מחילה.mp4', N'video', CAST(N'2020-09-08T14:06:00.000' AS DateTime), 14, 92, NULL, N'אבישי אשל בסינגל חדש ומרגש לימי הרחמים והסליחות: "מחילה"', N'אבישי אשל בסינגל שנוצר מתוך רצון לאהבה ולסליחה, מתוך אמונה שהמסר יחלחל ללבבות ויגרום לאהבת ישראל בין כולנו. האזינו', N'for_songs/אבישי-אשל/237055_tumb_750Xauto.jpg', N'songs_content/אבישי-אשל/מחילה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (110, N'אבקש פניך', N'יונתן-שיינפלד\יונתן שינפלד - אבקש פניך.mp3', N'audio', CAST(N'2020-09-03T00:00:00.000' AS DateTime), 7, 64, NULL, N'
יונתן שינפלד בסינגל חדש ''אבקש פניך''', N'יונתן שינפלד בסינגל חדש לקראת הימים הנוראים – "אבקש פניך"', N'for_songs/יונתן-שיינפלד/אבקש-פניך.jpeg', N'songs_content/יונתן-שיינפלד/אבקש-פניך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (111, N'מתנות החיים', N'חיים-ישראל\חיים ישראל - מתנות חיים.mp3', N'audio', CAST(N'2020-08-18T00:00:00.000' AS DateTime), 13, 86, NULL, N'סינגל חדש: חיים ישראל – מתנות החיים', N'"מתנות החיים" - סינגל חדש ואישי ביותר של חיים ישראל שמדבר על יחסי אב ובנו, צמיחתו של הבן ו"ארגז הכלים" שנותן אבא לבן', N'for_songs/חיים-ישראל/מתנות-חיים.jpg', N'songs_content/חיים-ישראל/מתנות-החיים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (112, N'בשובך', N'גד-אלבז\בשובך.mp4', N'video', CAST(N'2020-08-07T22:07:00.000' AS DateTime), 29, 167, NULL, N'גד אלבז מחדש את "בשובך"', N'בעקבות המצב, מחדש גד אלבז את שירו ''בשובך'' מתוך האלבום מילים של רוח.', N'for_songs/גד-אלבז/בשובך.jpg', N'songs_content/גד-אלבז/בשובך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (113, N'אבא טוב', N'אבישי-אשל\אבישי-אשל-אבא-טוב.mp4', N'video', CAST(N'2020-05-25T14:55:00.000' AS DateTime), 34, 185, NULL, N'אבישי אשל בבלדה מרגשת: "אבא טוב"', N'שירו של אבישי אשל, "אבא טוב", הוא דיאלוג בין האדם הקטן לגדלותו ולחסדו של הבורא. האזינו', N'for_songs/אבישי-אשל/אבישי-אשל-אבא-טוב.jpg', N'songs_content/אבישי-אשל/אבא-טוב.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (114, N'מחרוזת לג בעומר עם בני פרידמן', N'בני-פרידמן\מחרוזת-לג-בעומר.mp4', N'video', CAST(N'2020-05-12T09:27:00.000' AS DateTime), 23, 204, NULL, N'עמי כהן ובני פרידמן במחרוזת ל"ג בעומר', N'עמי כהן ובני פרידמן, יחד עם מקהלת "מלכות", במחרוזת שתגרום לכם להרגיש כאילו גם אתם הייתם במירון. האזינו', N'for_songs/בני-פרידמן/מחרוזת-לג-בעומר.jpg', N'songs_content/בני-פרידמן/מחרוזת-לג-בעומר.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (115, N'עוד אבינו חי - גרסת אקפלה', N'מאיר-גרין\עוד אבינו חי - גרסת אקפלה.mp4', N'video', CAST(N'2020-04-22T13:54:00.000' AS DateTime), 19, 143, NULL, N'מאיר גרין בגרסה ווקאלית לשירו "עוד אבינו חי"', N'מאיר גרין מגיש גרסה מיוחדת לימי ספירת העומר לשירו המוכר "עוד אבינו חי". האזינו', N'for_songs/מאיר-גרין/עוד-אבינו-חי-ווקאלי.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (116, N'בזכות הצדיק', N'איציק-וינגרטן\בזכות הצדיק.mp4', N'video', CAST(N'2020-05-12T21:56:00.000' AS DateTime), 13, 68, NULL, N'איציק וינגרטן בסינגל-קליפ בכורה: "בזכות הצדיק"', N'איציק וינגרטן, אמן צעיר חדש במוסיקה החסידית, יוצא בסינגל בכורה אנרגטי לכבוד ל"ג בעומר. צפו גם בקליפ', N'for_songs/איציק-וינגרטן/בזכות-הצדיק.jpg', N'songs_content/איציק-וינגרטן/בזכות-הצדיק.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (117, N'שמח תמיד', N'איציק-וינגרטן\שמח תמיד.mp4', N'video', CAST(N'2020-08-13T10:44:00.000' AS DateTime), 15, 87, NULL, N'איציק וינגרטן בקליפ שיגרום לכל אחד להיות "שמח תמיד"', N'איציק וינגרטן בסינגל שמח ומקפיץ למילותיו של ר'' נחמן מברסלב, עם קליפ מקורי ותוסס. צפו', N'for_songs/איציק-וינגרטן/שמח-תמיד.jpg', N'songs_content/איציק-וינגרטן/שמח-תמיד.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (118, N'שלום אדון עולם', N'גד-אלבז\גד אלבז - שלום אדון עולם.mp3', N'audio', CAST(N'2020-10-13T17:15:00.000' AS DateTime), 27, 94, NULL, N'גד אלבז מרגש בסינגל חדש: "אדון עולם"', N'גד אלבז משיק סינגל חדש ומרגש במיוחד "שלום אדון עולם". השיר נכתב כחיזוק לתקופה הלא פשוטה שכולנו עוברים .', N'for_songs/גד-אלבז/שלום-אדון-עולם.PNG', N'songs_content/גד-אלבז/שלום-אדון-עולם.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (119, N'וקולו נשמע', N'משה-קליין\וקולו נשמע.mp4', N'video', CAST(N'2017-10-16T09:10:00.000' AS DateTime), 26, 87, NULL, N'משה קליין בסינגל חדש: "וקולו נשמע"', N'משה קליין יוצא בסינגל חדש, הפעם שקט ומרגש בקולו הנעים. האזינו
', N'for_songs/משה-קליין/וקולו-נשמע.jpg', N'songs_content/משה-קליין/וקולו-נשמע.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (120, N'משאפ יהודי ישראלי', N'משה-קליין\משה קליין & קובי ברומר - משאפ יהודי ישראלי.mp4', N'video', CAST(N'2019-09-04T09:33:00.000' AS DateTime), 23, 142, NULL, N'קובי ברומר ומשה קליין במשאפ יהודי ישראלי ראשון', N'המשאפ הראשון במוסיקה היהודית – קובי ברומר ומשה קליין מגישים משאפ של מגוון שירים יהודיים וישראליים. האזינו', N'for_songs/משה-קליין/משאפ-יהודי-ישראלי.jpg', N'songs_content/משה-קליין/משאפ-יהודי-ישראלי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (121, N'געוואלדיג', N'ליפא-שמעלצר\גיוועלדיג.mp4', N'video', CAST(N'2019-02-07T00:00:00.000' AS DateTime), 37, 186, NULL, N'ליפא שמעלצר - "געוואלדיג"', N'צפו בלהיט מהאלבום החדש של ליפא שמעלצר "געוואלדיג געוואלדיג"', NULL, N'songs_content/ליפא-שמעלצר/', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (122, N'אוהד מושקוביץ וחברים במחרוזת להיטים', N'אוהד-מושקוביץ\oh01.mp4', N'video', CAST(N'2018-03-12T00:00:00.000' AS DateTime), 14, 79, NULL, N'אוהד מושקוביץ וחברים במחרוזת להיטים', N'אוהד מושקוביץ בקליפ חדש עם מחרוזת מלהיטי התקופה שבה הוא מארח את איציק דדיה, להקת קינדרלעך ועוזיה צדוק ובליווי מקהלת ''ידידים''.', N'for_songs/אוהד-מושקוביץ/הופעה-מחרוזת-להיטים.PNG', N'songs_content/אוהד-מושקוביץ/אוהד-מושקוביץ-במחרוזת-להיטים.txt', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (123, N'צפו: הבמה המרכזית • מופע סיום בין הזמנים עם חיים ישראל', N'חיים-ישראל\e2ad134dd83f2f0715c919e59c426292.mp4', N'video', CAST(N'2020-08-20T17:55:00.000' AS DateTime), 37, 156, NULL, N'צפו: הבמה המרכזית • מופע סיום בין הזמנים עם חיים ישראל', N'סדרת "קיץ חי", מיזם הקיץ הגדול בתולדות המוזיקה היהודית של "קול חי", "קול חי מיוזיק" ודוד פדידה – הגיעה אמש אל סיומה בהופעה מלאה של ענקי הזמר חיים ישראל ומוטי שטיינמץ בליווי מוזיקלי של רובי בנט ורמי רבא. לצד מופע פתיחה של יואלי קליין והופעה מיוחדת של אמן אורח הפסנתרן והיוצר אחיה אשר כהן-אלורו.', N'for_songs/חיים-ישראל/קיץ-חי-חיים-ישראל-צילום-קובי-הרשברג-840x494c.jpg', N'songs_content/חיים-ישראל/הופעה-חג-בסוכות.txt', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (124, N'אוהד מושקוביץ אירח את גדולי הזמר לשמחת חג • צפו', N'אוהד-מושקוביץ\1d391b3aac3d6fabd890ec56e3ea7516.mp4', N'video', CAST(N'2020-10-11T20:48:00.000' AS DateTime), 24, 115, NULL, N'אוהד מושקוביץ אירח את גדולי הזמר לשמחת חג • צפו', N'במסגרת שמחת בית השואבה ששודרה לכל בית בארץ ובעולם ובהפקת ענק של ''קול חי'' ועיריית ירושלים ממגדל דוד. אירח גדול הזמר אוהד מושקוביץ את הזמר קובי ברומר בליווי מקהלת ''מלכות'' ותזמורתו של המאסטרו אהרל''ה נחשוני. זמר אורח: גיל ישראלוב. ילד הפלא: מוטי גרינבוים', N'for_songs/אוהד-מושקוביץ/WhatsApp-Image-2020-10-08-at-00.33.58-e1602438198818-840x494c.jpeg', N'songs_content/אוהד-מושקוביץ/הופעת-חג-בסוכות.txt', 1, CAST(N'2020-12-03T16:04:01.473' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (125, N'הבמה המרכזית • צפו בשידור חוזר: אלי הרצליך מארח את פיני איינהורן ואבי אילסון', N'אלי-הרצליך\763d068fe1ea6193fc71acda9e1fe625.mp4', N'video', CAST(N'2020-08-18T18:45:00.000' AS DateTime), 31, 127, NULL, N'הבמה המרכזית • צפו בשידור חוזר: אלי הרצליך מארח את פיני איינהורן ואבי אילסון', N'בסדרת "קיץ חי", מיזם הקיץ הגדול בתולדות המוזיקה היהודית של "קול חי", "קול חי מיוזיק" ודוד פדידה – הערב בהפקת וגשלובין הופיע אלי הרצליך עם מיטב הלהיטים ואירח את פיני איינהורן ואבי אילסון בליווי מוזיקלי של עמי כהן ותזמורתו. הנחה: אפרים קמיסר • צפו בשידור חוזר', N'for_songs/אלי-הרצליך/WhatsApp-Image-2020-08-18-at-11.24.24-1-e1597765462499-840x494c.jpeg', N'songs_content/אלי-הרצליך/הופעה-אלי-הרצליך-פיני-איינהורן-ואבי-אילסון-סוכות.txt', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (126, N'והריני עבד', N'מידד-טסה\מידד טסה - והריני עבד.mp4', N'video', CAST(N'2019-10-22T21:34:00.000' AS DateTime), 15, 72, NULL, N'מידד טסה בסינגל חדש: "והריני עבד"', N'מידד טסה משחרר את השיר שהתמודד בתחרות המלחינים עם מנחם טוקר ברדיו קול חי, ובוצע בגמר התחרות. לחן: יהודה יחזקאל. האזינו', N'for_songs/מידד-טסה/הריני-עבד.jpg', N'songs_content/מידד-טסה/והריני-עבד.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (127, N'מודה אני', N'נהוראי-אריאלי\נהוראי-אריאלי-מודה-אני.mp3', N'audio', CAST(N'2020-10-18T01:27:00.000' AS DateTime), 11, 67, NULL, N'הסינגל החדש של נהוראי אריאלי – "מודה אני"', N'הזמר והיוצר הצעיר נהוראי אריאלי לא נח לרגע ומשיק כעת סינגל נוסף - "מודה אני".', N'for_songs/נהוראי-אריאלי/עטיפת-הסינגל-1-724x483.jpg', N'songs_content/נהוראי-אריאלי/מודה-אני.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (128, N'צועד קדימה', N'נהוראי-אריאלי\צועד.mp4', N'video', CAST(N'2020-06-24T00:00:00.000' AS DateTime), 18, 89, NULL, N'"צועד קדימה": נהוראי אריאלי עם סינגל קליפ חדש', N'אחרי שלושה סינגלים מקוריים ומחרוזת חפלה, משחרר הכוכב נהוראי אריאלי שהתארס לפני כחודש סינגל רביעי – "צועד קדימה".', N'for_songs/נהוראי-אריאלי/עטיפת-הסינגל.jpg', N'songs_content/נהוראי-אריאלי/צועד-קדימה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (129, N'מתנה', N'אודי-דמארי\אודי-ואורי-דמארי-מתנה-Udi-ori-Gift.mp3', N'audio', CAST(N'2020-10-19T13:41:00.000' AS DateTime), 17, 56, NULL, N'אודי דמארי מארח את בנו אורי לדואט חדש - "מתנה"', N'הזמר והיוצר אודי דמארי מארח את בנו אורי לדואט מיוחד בסינגל חדש אותו כתב, הלחין, עיבד והפיק מוזיקלית בעצמו • האזנה עריבה', N'for_songs/אודי-דמארי/אודי-ואורי-דמארי-מתנה-Udi-ori-Gift.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (130, N'עמירן דביר, אריק דביר ו''נרננה'' בקומזיץ סוחף', N'אריק-דביר\אריק-ועמירן-דביר-ומקהלת-נרננה-קומזיץ-אלול-תש״פ-Arik-Amiran-Dvir-And-Neranena-Choir-LIVE.mp4', N'video', CAST(N'2020-09-13T03:00:00.000' AS DateTime), 47, 184, NULL, N'עמירן דביר, אריק דביר ו''נרננה'' בקומזיץ סוחף', N'צמד האחים המוזיקאים עמירן ואריק דביר בקליפ מתוך קומזיץ לבחורי ישיבות, שם הופיעו יחד עם חברי מקהלת נרננה • צפו והיכנסו לאווירת הימים הנוראים', N'for_songs/אריק-דביר/קומזיץ-סוחף.jpg', NULL, 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (131, N'לבקש רחמים', N'אברהם-פריד\אברהם-פריד-לבקש-רחמים-Avraham-Fried-Levakesh-Rachamim.mp3', N'audio', CAST(N'2020-09-13T02:10:00.000' AS DateTime), 39, 157, NULL, N'אברהם פריד מרגש בסינגל חדש לימים הנוראים - "לבקש רחמים"', N'ענק הזמר החסידי אברהם פריד משחרר סינגל חדש ברוח התקופה, פרי לחנו של אלי קליין, שגם אחראי על העיבוד יחד עם איצי ברי • האזינו ל"לבקש רחמים"', N'for_songs/אברהם-פריד/לבקש-רחמים.jpg', N'songs_content/אברהם-פריד/לבקש-רחמים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (132, N'והרווח לנו', N'פיני-איינהורן\פיני-איינהורן-אהרלה-סמט-והרוח-לנו-Ahrele-Samet-Pini-Einhorn-Veharvach-Lanu.mp4', N'video', CAST(N'2020-08-28T00:55:00.000' AS DateTime), 14, 72, NULL, N'פיני איינהורן ואהרל''ה סאמט בדואט מרגש - "והרווח לנו"', N'הזמרים פיני איינהורן ואהרל''ה סאמט בסינגל חדש, פרי לחנו של איצי ברי, שגם אחראי על העיבוד יחד עם אלי קליין, למילות ברכת המזון • צפו בקליפ מילים', N'for_songs/פיני-איינהורן/maxresdefault-2020-08-28T005628.981.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (133, N'אברהם פריד עם ניגון ההתעוררות מזלוטשוב - מרגש עד דמעות', N'אברהם-פריד\אברהם-פריד-ניגון-התעוררות-מר-מיכל-מזלוטשוב-Avraham-Fried-Reb-Michel-Zlotchover-Niggun.mp4', N'video', CAST(N'2020-08-24T09:33:00.000' AS DateTime), 46, 204, NULL, N'אברהם פריד עם ניגון ההתעוררות מזלוטשוב - מרגש עד דמעות', N'ענק הזמר החסידי אברהם פריד בביצוע חי ודומע לניגון ההתעוררות העתיק המיוחס לר'' מיכל מזלוטשוב זי"ע, מתוך ההתוועדות המרכזית של יום ההילולא כ'' אב • צפו', N'for_songs/אברהם-פריד/אברהם-פריד-ניגון-התעוררות-מר-מיכל-מזלוטשוב-Avraham-Fried-Reb-Michel-Zlotchover-Niggun.jpg', NULL, 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (134, N'נושם שלמות', N'יואלי-דיקמן\יואלי-דיקמן-נושם-שלמות-Yoeli-Dikman-Noshem-Shlemut.mp4', N'video', CAST(N'2020-08-15T22:43:00.000' AS DateTime), 8, 71, NULL, N'יואלי דיקמן "נושם שלמות" בסינגל חדש שהלחין', N'המפיק והמעבד המוזיקלי יואלי דיקמן משחרר שיר נוסף מתוך פרויקט הסולו שלו ''Number 1'', שכמו קודמיו, גם הוא פרי לחנו ועיבודו. המילים של יצחק הרץ • קליפ מילים', N'for_songs/יואלי-דיקמן/תמונת-יחצ.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (135, N'ימים יפים', N'רולי-דיקמן\רולי-דיקמן-ימים-יפים-1.mp4', N'video', CAST(N'2020-08-10T22:13:00.000' AS DateTime), 24, 112, NULL, N'לפני כולם: הקליפ הנוסטלגי של רולי דיקמן', N'הזמר והיוצר רולי דיקמן חוזר במנהרת הזמן אל הימים היפים של הדור שאינו, ומגיש לכם קליפ בטעם של פעם, עם מסר לדור ההווה ומוזיקה חדשנית של דור העתיד • צפו', N'for_songs/רולי-דיקמן/WhatsApp-Image-2020-08-10-at-21.54.51.jpeg', N'songs_content/רולי-דיקמן/ימים-יפים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (136, N'שיר השמחה', N'שוקי-סלומון\שוקי-סלומון-וישי-לפידות-שיר-השמחה.mp3', N'audio', CAST(N'2020-08-10T18:09:00.000' AS DateTime), 46, 253, NULL, N'שוקי סלומון מארח את ישי לפידות לקליפ חדש', N'היוצר וכוכב הרשת שוקי סלומון משחרר סינגל חדש בשם ''שיר השמחה'' שכתב והלחין בעצמו, כשאל הביצוע הוא צירף אליו את הכוכב הבלתי מעורער ישי לפידות • האזינו', N'for_songs/שוקי-סלומון/שיר-השמחה.jpg', N'songs_content/שוקי-סלומון/שיר-השמחה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (137, N'תתחיל לחייך', N'נהוראי-אריאלי\תתחיל לחייך.mp4', N'video', CAST(N'2020-03-23T01:06:00.000' AS DateTime), 23, 82, NULL, N'נהוראי אריאלי בסינגל חדש: "תתחיל לחייך"', N'הזמר והיוצר נהוראי אריאלי יוצא בסינגל שלישי, קצבי וקליט, אותו כתב והלחין בעצמו. האזינו', N'for_songs/נהוראי-אריאלי/215717_tumb_750Xauto.jpg', N'songs_content/נהוראי-אריאלי/תתחיל-לחייך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (138, N'לעשות שמח', N'נהוראי-אריאלי\נהוראי-אריאלי-לעשות-שמח.mp3', N'audio', CAST(N'2019-08-13T10:00:00.000' AS DateTime), 16, 71, NULL, N'נהוראי אריאלי בסינגל שני: "לעשות שמח"', N'נהוראי אריאלי רק בן 18 וחצי, וכבר מופיע באירועים רבים. לפני חודשיים השיק את סינגל הבכורה שלו, "הכל מובן", וכעת הוא יוצא בסינגל שני. האזינו', N'for_songs/נהוראי-אריאלי/עטיפת-הסינגל-768x432.jpg', N'songs_content/נהוראי-אריאלי/לעשות-שמח.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (139, N'אתה תמיד מרים אותי', N'רולי-דיקמן\רולי דיקמן - מרים אותי תמיד.mp3', N'audio', CAST(N'2019-07-02T10:58:00.000' AS DateTime), 18, 101, NULL, N'רולי דיקמן בסינגל חדש: "אתה מרים אותי תמיד"', N'רולי דיקמן יוצא בסינגל חדש, שכמו מרבית שיריו, מתאפיין בסגנון מחזק ורווי תקווה. האזינו', N'for_songs/רולי-דיקמן/192011_tumb_750Xauto.jpg', N'songs_content/רולי-דיקמן/אתה-תמיד-מרים-אותי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (140, N'בזכות התורה', N'מוטי-שטיינמץ\בזכות התורה מוטי שטיינמץ בסיומי השס של דירשו _ Motty Steinmetz In Dirshu Bizchut.mp4', N'video', CAST(N'2020-05-17T13:20:00.000' AS DateTime), 76, 324, NULL, N'מוטי שטיינמץ שר "בזכות התורה" בסיומי הש"ס', N'מוטי שטיינמץ משחרר קליפ מהופעותיו בסיומי הש"ס שהתקיימו בתחילת השנה, עם השיר "בזכות התורה". צפו', N'for_songs/מוטי-שטיינמץ/221787_tumb_750Xauto.jpg', N'songs_content/מוטי-שטיינמץ/בזכות-התורה.txt', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (141, N'לב נשבר', N'נפתלי-קמפה\videoplayback-1.mp4', N'video', CAST(N'2019-11-25T13:37:00.000' AS DateTime), 31, 214, NULL, N'נפתלי קמפה בשיר חדש מתוך האלבום המתקרב: "לב נשבר"', N'נפתלי קמפה מתכונן ליציאה של אלבומו השני, ומגיש סינגל מרגש בלחנו האישי למילותיו של ר'' נחמן מברסלב. האזינו', N'for_songs/נפתלי-קמפה/LEV-768x432.jpeg', N'songs_content/נפתלי-קמפה/לב-נשבר.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (142, N'חסד שבחסד', N'אברמי-רוט\videoplayback-3-1.mp4', N'video', CAST(N'2020-06-07T13:38:00.000' AS DateTime), 21, 103, NULL, N'אברימי רוט שר לרגל בר המצווה של בנו בכורו: "חסד שבחסד"', N'אברימי רוט חגג בר מצווה לבנו, לו המתין במשך 11 שנה. במקום השמחה הגדולה ומרובת המשתתפים, הפכה הקורונה את בר המצווה לאירוע קטן – אך ההודיה לה'' לא נפסקת. האזינו', N'for_songs/אברמי-רוט/224114_tumb_750Xauto.jpg', N'songs_content/אברמי-רוט/חסד-שבחסד.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (143, N'כל הנחלים', N'נפתלי-קמפה\כל-הנחלים-נפתלי-קמפה-בהופעה-Naftali-Kempeh-Kol-Hanechalim-LIVE.mp4', N'video', CAST(N'2019-02-21T12:05:00.000' AS DateTime), 42, 247, NULL, N'נפתלי קמפה בהופעה חיה עם "כל הנחלים הולכים לים"', N'צפו בנפתלי קמפה מבצע את "כל הנחלים הולכים לים", במסגרת מופע ההשקה לאלבום הבכורה שלו, "ליחדא שמא"', N'for_songs/נפתלי-קמפה/179084_tumb_750Xauto.jpg', N'songs_content/נפתלי-קמפה/כל-הנחלים.txt', 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (144, N'סול מי', N'עמירן-דביר\עמירן-דביר-סול-מי.mp4', N'video', CAST(N'2020-08-05T13:02:00.000' AS DateTime), 28, 104, NULL, N'עמירן דביר בשיר חדש לעונת החתונות: "סול מי"', N'עמירן דביר במילים חדשות ללחן איטלקי, ובשיר מקפיץ שמתאים בדיוק לעונת החתונות. האזינו', N'for_songs/עמירן-דביר/231863_tumb_750Xauto.jpg', N'songs_content/עמירן-דביר/סול-מי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (145, N'נטיעות', N'קובי-ברומר\קובי-ברומר-נטיעות.mp4', N'video', CAST(N'2020-02-01T13:05:00.000' AS DateTime), 7, 54, NULL, N'קובי ברומר בסינגל חדש לט"ו בשבט – "נטיעות"', N'ימים ספורים לפני ט"ו בשבט מוציא הזמר קובי ברומר סינגל חדש בשם ''נטיעות'' העוסק במילות הגמ'' המפורסמות "אילן אילן במה אברכך.."', N'for_songs/קובי-ברומר/נטיעות-גרפיקה.jpg', N'songs_content/קובי-ברומר/נטיעות.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (146, N'כדאי הוא רבי שמעון', N'מרדכי-בן-דוד\mbd.mp3', N'audio', CAST(N'2019-05-22T14:05:00.000' AS DateTime), 29, 210, NULL, N'מרדכי בן דוד בלהיט אש: ״כְּדַאי הוּא רַבִּי שִׁמְעוֹן" • האזינו', N'סינגל חדש ומיוחד לכבוד הילולת התנא האלוקי רבי שמעון בר יוחאי יוצא בדקות אלו מאולפני אלי קליין & איצי ברי שאחראים ללחן (יחד עם MBD), העיבוד וההפקה. על פעלולי הקלרינט הופקד אמן הנשיפה אברמי בלטי.', N'for_songs/מרדכי-בן-דוד/mbd-cover-353x500.jpeg', N'songs_content/מרדכי-בן-דוד/כדאי-הוא-רבי-שמעון.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (147, N'אל תשליכני', N'מרדכי-בן-דוד\מרדכי-בן-דוד-המנגנים-שירה-אל-תשליכני-MBD-Hamenagnim-Shira-Al-Tashlicheini.mp4', N'video', CAST(N'2019-10-10T13:47:00.000' AS DateTime), 32, 213, NULL, N'מרדכי בן דוד בשיר וקליפ תפילה חדש: "אל תשליכני"', N'ערב יום כיפור הקדוש והנורא, גדול הזמר החסידי מרדכי בן דוד בשיר וקליפ תפילה חדש: "אל תשליכני"', N'for_songs/מרדכי-בן-דוד/WhatsApp-Image-2019-10-08-at-14.32.09-1.jpeg', N'songs_content/מרדכי-בן-דוד/אל-תשליכני.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (148, N'תינוקות של בית רבן', N'אוהד-מושקוביץ\dda9d619490a161499c25c5de6a186ea.mp4', N'video', CAST(N'2020-09-23T16:18:00.000' AS DateTime), 12, 98, NULL, N'אוהד מושקוביץ בסינגל חדש לזכר הנפטר • ''תינוקות של בית רבן''', N'ענק הזמר החסידי אוהד מושקוביץ בסינגל חדש בשם ''תינוקות של בית רבן'' לזכרו של יצחק פדידה ז"ל. מילים, לחן והפקה מוזיקלית של יונתן שינפלד. סולן אורח: מוטי גרינבוים • האזינו:', N'for_songs/אוהד-מושקוביץ/תינוקות-של-בית-רבן-גרפיקה-724x483.jpeg', N'songs_content/אוהד-מושקוביץ/תינוקות-של-בית-רבן.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (149, N'אב הרחמים', N'אלי-הרצליך\d7ec82338823304975d951a79a7e9952.mp4', N'video', CAST(N'2020-09-22T10:38:00.000' AS DateTime), 14, 87, NULL, N'פותחים את עשרת ימי תשובה עם תפילת אב הרחמים בלחן חדש ומרגש', N'עם סיומם של ימי ראש השנה ותחילת עשרת ימי תשובה והשנה החדשה, משיק המלחין מרטין וידרקר שיר חדש למילות תפילת אב הרחמים בלחן עוצמתי סוחף ומרגש', N'for_songs/אלי-הרצליך/אב-הרחמים-גרפיקה-724x483.jpg', N'songs_content/אלי-הרצליך/אב-הרחמים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (150, N'יום גדול', N'אודי-דמארי\ce6d2b0d72034cf1e6745b440d1db1c5.mp4', N'video', CAST(N'2020-09-29T09:27:00.000' AS DateTime), 25, 111, NULL, N'עמי מימון ואודי דמארי בשיר חדש ''יום גדול''', N'היום הגדול הגיע • עוד שיתוף פעולה מבורך בין המפיק המוזיקלי אודי דמארי לבין שר השמחה עמי מימון • בתקופה מאתגרת כזו שכלל עם ישראל נמצא בין בידוד לסגר והחלטות ממשלה שמשתנות כל חמש דקות החליטו שני המאסטרים לשחרר את הלחץ עם שיר מקפיץ וקליפ שיעשה לכולם טוב.', N'for_songs/אודי-דמארי/IMG-20200928-WA0030-724x483.jpg', N'songs_content/אודי-דמארי/יום-גדול.txt', 0, CAST(N'2020-12-03T17:41:15.810' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (151, N'שמעה תפילתי', N'שלום-ברנהולץ\45ad9a9a20b599fb6c475f6c397dac66.mp4', N'video', CAST(N'2020-08-22T23:08:00.000' AS DateTime), 9, 65, NULL, N'הדוד הלחין ושלום ברנהולץ מבצע: "שמעה תפילתי"', N'לאחר ההצלחה של הסינגלים הקודמים "הזמן של השמחה" ו"אתה קרוב", הזמר שלום ברנהולץ פותח את חודש אלול עם סינגל חדש ומרגש.

', N'for_songs/שלום-ברנהולץ/WhatsApp-Image-2020-08-22-at-22.25.13-724x483.jpeg', N'songs_content/שלום-ברנהולץ/שמעה-תפילתי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (152, N'איש המידות', N'איציק-אשל\אמנים שרים הרב שלמה קורח זיעא - איש המידות _ Singing Artists Harav Shlomo Korach', N'video', CAST(N'2020-11-01T00:24:00.000' AS DateTime), 23, 78, NULL, N'לרגל יום השנה: אמנים שרים הרב שלמה קורח זצ"ל – "איש המידות"', N'במלאות שנתיים להסתלקותו אל גנזי מרומים של הרב שלמה קורח זצ"ל - מחשובי וזקני רבני יהדות תימן, והרב הראשי ואב"ד של בני-ברק, רואה אור שיר חדש המוקדש לזכרו בביצוע מיטב הזמרים בני העדה התימנית.', N'for_songs/איציק-אשל/אמנים-שרים-הרב-שלמה-קורח-איש-המידות-mp3-image.jpg', N'songs_content/איציק-אשל/איש-המידות.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (153, N'בר אלעאי', N'אוהד-מושקוביץ\בר אלעאי I אוהד & שמילי Bar Ilu I OHAD & Shmueli', N'video', CAST(N'2020-11-01T00:11:00.000' AS DateTime), 11, 57, NULL, N'''בר אלעאי'': אוהד מושקוביץ, שמואלי אונגר בדואט', N'אוהד מושקוביץ ושמילי אונגר פותחים את עונת החורף עם דואט חדש ואנרגטי בשם ''בר אלעאי''', N'for_songs/אוהד-מושקוביץ/בר-אלעאי.PNG', N'songs_content/אוהד-מושקוביץ/בר-אלעאי.txt', 0, CAST(N'2020-12-03T16:54:41.840' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (154, N'שפכי כמים ליבך', N'חיים-ישראל\חיים-ישראל-ומקהלת-ידידים-העולמית-שפכי-כמים-ליבך.mp4', N'video', CAST(N'2019-09-25T12:46:00.000' AS DateTime), 34, 152, NULL, N'
חיים ישראל ומקהלת ''ידידים'': ''שפכי כמים ליבך''', N'גדול הזמר המזרחי חיים ישראל ממשיך להפתיע עם שילובים מפתיעים והפעם, שיתוף פעולה עם מקהלת ידידים העולמית לשיר "שפכי כמים ליבך" שיר שפורט על נימי הלב במיוחד בימים מיוחדים וקדושים אלו "ימי הרחמים והסליחות".', N'for_songs/חיים-ישראל/ללחתיא-שם-560x315.png', N'songs_content/חיים-ישראל/שפכי-כמים-ליבך.txt', 0, NULL)
GO
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (155, N'נשמת', N'אלי-הרצליך\aa49e146b5fb2bf8fd58ebeed7619a5b.mp4', N'video', CAST(N'2019-11-19T09:36:00.000' AS DateTime), 22, 124, NULL, N'אלי הרצליך מגיש: הקליפ הרשמי לשיר "נשמת"', N'החידוש המיוחד של השיר "נשמת", כעת מלווה בקליפ מושקע של אלי הרצליך. צפו', N'for_songs/אלי-הרצליך/אלי-הרצליך-נשמת-הפרונט-500x500.jpg', N'songs_content/אלי-הרצליך/נשמת.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (156, N'כולם שרים', N'בני-פרידמן\ed82632657cb5905bcbc8454b36f815a.mp4', N'video', CAST(N'2017-10-15T09:19:00.000' AS DateTime), 31, 137, NULL, N'בני פרידמן והבובות בקליפ מיוחד: ''כולם שרים''', N'קליפ חדש מתוך האלבום האחרון של בני פרידמן, בשיתוף עם חבורת הבובות. קליפ משעשע ושיר נפלא. צפו', N'for_songs/בני-פרידמן/WhatsApp-Image-2017-10-14-at-22.50.47.jpeg', N'songs_content/בני-פרידמן/כולם-שרים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (157, N'פסיעותיי', N'חיים-ישראל\videoplayback-6-1.mp4', N'video', CAST(N'2019-12-10T14:51:00.000' AS DateTime), 6, 98, NULL, N'חיים ישראל בסינגל חדש ומרגש: "פסיעותיי', N'הזמר חיים ישראל ממשיך להפתיע, והפעם סינגל חדש ומרגש במיוחד "פסיעותיי" למילותיה של קטרין ברכה לצד לחן ועיבוד מוסיקלי של עמוס כהן.', N'for_songs/חיים-ישראל/1880.jpg', N'songs_content/חיים-ישראל/פסיעותיי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (158, N'רבי ר'' אלימלך', N'שלומי-גרטנר\6d877ffd2a8ff41680ab7e9e303fd3ba.mp4', N'video', CAST(N'2020-03-16T22:28:00.000' AS DateTime), 9, 102, NULL, N'"רבי ר'' אלימלך": שלוימי גרטנר בסינגל חדש ליום ההילולא', N'לכבוד יום דהילולא של רבינו רבי אלימלך מליזענסק החל הערב כ"א אדר ועקב מגפת הקורונה שגרמה לביטול הילולא ההמונית בליזענסק, החליט שלוימי גרטנר לשתף את עם ישראל בשיר חדש מתוך האלבום החדש שלו שמוקלט בתקופה האחרונה', N'for_songs/שלומי-גרטנר/רבי-אלימלך.jpeg', N'songs_content/שלומי-גרטנר/רבי-ר-אלימלך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (159, N'ה'' ישמרך', N'שמחה-פרידמן\שמחה פרידמן - השם ישמרך _ .mp4', N'video', CAST(N'2020-03-19T02:17:00.000' AS DateTime), 14, 98, NULL, N'שמחה פרידמן בסינגל חדש: "השם ישמרך"', N'האם גם אתם חיפשתם את השיר שיתנגן לנו באוזן בזמן הקרוב, שיכניס לנו קצת מצב רוח ויעניק לנו עידוד במקום בידוד? – "השם ישמרך" מגיע אלינו בדיוק בזמן', N'for_songs/שמחה-פרידמן/השם-ישמרך-מרובע.jpg', N'songs_content/שמחה-פרידמן/ה-ישמרך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (160, N'ידיד נפש', N'אברהם-פריד\אברהם פריד והסימפונית - מחרוזת ידיד נפש _ Avraham Fried - Yedid Nefesh Medley - Live.mp4', N'video', CAST(N'2020-03-23T01:01:00.000' AS DateTime), 35, 294, NULL, N'אברהם פריד והסימפונית במחרוזת "ידיד נפש"', N'בצל הימים המתוחים העוברים עלינו בכל אתר ואתר מגיש פריד, ביצוע מיוחד לפסקול שירי הרגש הגדולים שלו מכל השנים, ובהם: ''ידיד נפש'', ''שוועת עניים'', ''וניקיתי'', ''אחינו'', ''ישימך'' ו''שערי דמעות''. מופע "פריד והסימפונית", התקיים בחול המועד סוכות האחרון, באמפי לייב ראשל"צ, בליווי התזמורת הסימפונית הישראלית ראשל"צ', N'for_songs/אברהם-פריד/פריד-והסימפונית-2020-צילום-מנדי-הכטמן.jpg', NULL, 1, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (161, N'רפא נא', N'יונתן-שיינפלד\רפא נא I יונתן שינפלד Refa Na I Yonatan Shainfeld I.mp4', N'video', CAST(N'2020-03-30T00:17:00.000' AS DateTime), 12, 82, NULL, N'רפא נא – יונתן שינפלד שר לרגל המצב', N'לאחר שבועות ארוכים בהם עם ישראל נצור בביתו בשל מגיפת הקורונה, מוציא הזמר והיוצר יונתן שינפלד את ''רפא נא'', שיר תפילה חדש שכתב בעקבות המצב • הפקה: דוד פדידה • מילים, לחן והפקה מוזיקלית: יונתן שינפלד', N'for_songs/יונתן-שיינפלד/רפא-נא-גרפיקה.jpeg', N'songs_content/יונתן-שיינפלד/רפא-נא.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (162, N'חסד ומשפט', N'אברהם-פריד\אברהם-פריד-חסד-ומשפט1.mp3', N'audio', CAST(N'2020-11-05T09:41:00.000' AS DateTime), 26, 148, NULL, N'"חסד ומשפט": אברהם פריד עם סינגל חדש', N'אברהם פריד מגיש סינגל חדש אותו הלחין אלי גרסטנר • על העיבוד עמד יואלי דיקמן שגם מלווה קולית עם גיל ישראלוב ויעקב רוטבלט', N'for_songs/אברהם-פריד/IMG_20201105_002327_280-1.jpg', N'songs_content/אברהם-פריד/חסד-ומשפט.txt', 0, CAST(N'2020-12-03T22:59:24.883' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (163, N'שעת רחמים', N'יואלי-דיקמן\videoplayback-3-4.mp4', N'video', CAST(N'2020-03-22T13:51:00.000' AS DateTime), 21, 117, NULL, N'יואלי דיקמן מארח את ילד הפלא מוטי גרינבוים – "שעת רחמים"', N'בימים אלו כשהעולם כולו גועש בעקבות הנגיף ועם ישראל זקוק ומצפה לשעת רחמים מבורא עולם, משחרר המאסטרו יואלי דיקמן להיט יחד עם ילד הפלא מוטי גרינבוים – "שעת רחמים".', N'for_songs/יואלי-דיקמן/ללא-שם-9-560x251.png', N'songs_content/יואלי-דיקמן/שעת-רחמים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (164, N'חיבור חזק', N'יואלי-דיקמן\videoplayback-5-1.mp4', N'video', CAST(N'2020-05-20T20:30:00.000' AS DateTime), 14, 87, NULL, N'יואלי דיקמן בסינגל קליפ חדש: "חיבור חזק"', N'רגע לפני שאלבום הביכורים שלו, number 1 יורד אל הדפוס, משחרר המאסטרו יואלי דיקמן סינגל נוסף בוידאו קליפ.', N'for_songs/יואלי-דיקמן/חיבור-חזק.jpeg', N'songs_content/יואלי-דיקמן/חיבור-חזק.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (165, N'מתוך תמימות', N'חיים-ישראל\חיים ישראל - מתוך תמימות.mp4', N'video', CAST(N'2020-03-15T14:32:00.000' AS DateTime), 32, 113, NULL, N'חיים ישראל בסינגל חדש: "מתוך תמימות"', N'הזמר והיוצר חיים ישראל ממשיך להפתיע, והפעם "מתוך תמימות" - יצירת מופת, מרגשת ומיוחדת שכתב עמי אשר והלחין חיים ישראל, לצד עיבוד של ערן כרמי.', N'for_songs/חיים-ישראל/מתוך-תמימות.jpg', N'songs_content/חיים-ישראל/מתוך-תמימות.txt', 0, CAST(N'2020-12-02T12:15:00.000' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (166, N'ה'' כל יכול', N'חיים-ישראל\קובי-פרץ-וחיים-ישראל-הכל-יכול.mp4', N'video', CAST(N'2020-09-08T16:09:00.000' AS DateTime), 31, 108, NULL, N'קובי פרץ וחיים ישראל בדואט מרגש: "ה'' כל יכול"', N'רגע לפני ראש השנה ועשרת ימי תשובה, הזמר חיים ישראל יחד עם קובי פרץ משתפים פעולה בדואט חדש – תפילה מרגשת - "ה'' כל יכול".', N'for_songs/חיים-ישראל/2020-09-08-6.png', N'songs_content/חיים-ישראל/ה-כל-יכול.txt', 0, CAST(N'2020-12-03T16:14:57.920' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (167, N'מרכבות פרעה', N'אלי-פרידמן\b959d79c83a8a7df5d9a1776740cf079.mp4', N'video', CAST(N'2017-08-02T14:05:00.000' AS DateTime), 38, 112, NULL, N'אלי פרידמן בלהיט היפ הופ חדש חדש: "מרכבות פרעה"', N'אלי פרידמן הנחשב לאחת הדמויות הצבעוניות והססגוניות שידעה המוסיקה החסידית מפתיע שוב עם להיט קיץ קופצני ושמח בשם "מרכבות פרעה" שילוב נפלא של היפ-הופ וראפ כאשר על הלחן מופקד הזמר והיוצר בעצמו', N'for_songs/אלי-פרידמן/אלי-פרידמן.-צילום-יואל-ארלנגר-560x373.jpg', N'songs_content/אלי-פרידמן/מרכבות-פרעה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (168, N'ה'' העלית', N'יונתן-שיינפלד\Hashem-Helita.mp3', N'audio', CAST(N'2019-06-13T15:31:00.000' AS DateTime), 31, 147, NULL, N'יונתן שינפלד בסינגל חדש: ה'' העלית', N'הזמר יונתן שינפלד מחדש בקולו המיוחד את הלהיט הותיק ''ה'' העלית'' שכבש את רחבות הריקודים בשנות התשעים. הלחן של ר'' יונתן וייס, העיבוד המחודש של אלי קליין & איצי ברי.', N'for_songs/יונתן-שיינפלד/ה-העלית-מרובע-768x768.jpg', N'songs_content/יונתן-שיינפלד/ה-העלית.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (169, N'באתי לגני', N'יונתן-שיינפלד\באתי-לגני.mp3', N'audio', CAST(N'2019-04-01T09:12:00.000' AS DateTime), 40, 257, NULL, N'יונתן שינפלד חוזר עם סינגל חדש: ''באתי לגני''', N'לרגל חתונתו, מוציא ילד הפלא לשעבר יונתן שינפלד סינגל חדש שהלחין יחד עם אלי קליין. הסינגל הינו סנונית ראשונה לקראת חזרתו של יונתן אל עולם המוזיקה.', N'for_songs/יונתן-שיינפלד/באתי-לגני-גרפיקה-768x432.jpg', N'songs_content/יונתן-שיינפלד/באתי-לגני.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (170, N'מחר', N'מאיר-מסוארי\videoplayback-2-2.mp4', N'video', CAST(N'2020-03-15T23:01:00.000' AS DateTime), 28, 95, NULL, N'מאיר מסוארי משיק סינגל קליפ חדש – "מחר"', N'הזמר והיוצר מאיר מסוארי משיק סינגל חדש ברוח הימים הללו – "מחר".', N'for_songs/מאיר-מסוארי/9138_tumb_750X480.jpg', N'songs_content/מאיר-מסוארי/מחר.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (171, N'היום בו נולדת', N'מאיר-מסוארי\haiom.mp4', N'video', CAST(N'2019-02-25T11:47:00.000' AS DateTime), 31, 102, NULL, N'מאיר מסוארי בסינגל שני מרגש: "היום בו נולדת"', N' לאחר הצלחת סינגל הבכורה "בזמן הזה" שזכה להשמעות רבות ולאהדה בקרב המבקרים והמאזינים , משחרר מאיר מסוארי את "היום בו נולדת" - סינגל שני במספר בדרך לאלבום הבכורה שלו.', N'for_songs/מאיר-מסוארי/מאיר-מסוארי-היום-בו-נולדת-תמונה.jpg', N'songs_content/מאיר-מסוארי/היום-בו-נולדת.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (172, N'בזמן הזה', N'מאיר-מסוארי\hd975ed540278ee723ffba2111aaf8819.mp4', N'video', CAST(N'2018-11-25T16:47:00.000' AS DateTime), 26, 82, NULL, N'מאיר מסוארי מודה על הניסים ש''בזמן הזה''', N'מאיר מסוארי מביא עימו ניחוח חדש ומרענן לנוף המוסיקה היהודית. ועל הפורקן... בימים ההם בזמן הזה.." בצירוף מילים מקוריות אותן כתב, כשהוא חתום גם על הלחן.', N'for_songs/מאיר-מסוארי/img871914.jpg', N'songs_content/מאיר-מסוארי/בזמן-הזה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (173, N'שבוע טוב', N'יניב-בן-משיח\יניב בן משיח - שבוע טוב _ Yaniv Ben Mashiach - Shavua Tov.mp4', N'video', CAST(N'2015-06-02T23:09:00.000' AS DateTime), 41, 257, NULL, N'יניב בן משיח שר – שבוע טוב', N'הזמר האנרגטי והמצליח, יניב בן משיח, משחרר סינגל קצבי ועממי שהלחין – ״שבוע טוב״.', N'for_songs/יניב-בן-משיח/cover-14.jpg', N'songs_content/יניב-בן-משיח/שבוע-טוב.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (174, N'שפיות', N'חיים-ישראל\videoplayback-1.mp4', N'video', CAST(N'2020-11-11T14:21:00.000' AS DateTime), 12, 69, NULL, N'חיים ישראל בסינגל חדש ומרגש – "שפיות"', N'הזמר והיוצר חיים ישראל בסינגל חדש ומרגש "שפיות"', N'for_songs/חיים-ישראל/שפיות.jpg', N'songs_content/חיים-ישראל/שפיות.txt', 0, CAST(N'2020-12-03T16:59:53.290' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (175, N'אלוקים', N'נמואל-הרוש\נמואל-אלוקים-הקליפ-הרשמי-Nemouel-Elokim-Official-Music-Video.mp4', N'video', CAST(N'2020-06-13T19:04:00.000' AS DateTime), 37, 132, NULL, N'נמואל הרוש בסינגל קליפ חדש – "אלוקים"', N'הזמר נמואל הרוש ממשיך בסינגל חדש, הסינגל השיר הראשון אותו הוא גם הלחין - "אלוקים".', N'for_songs/נמואל-הרוש/14-06-2020-10-51-21-נמואל.jpg', N'songs_content/נמואל-הרוש/אלוקים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (176, N'רק 1 קובע', N'אודי-דמארי\videoplayback-1-1.mp4', N'video', CAST(N'2020-03-04T21:14:00.000' AS DateTime), 19, 86, NULL, N'הזמר והיוצר אודי דמארי בסינגל חדש: "רק 1 קובע"', N'"רק 1 קובע" הסינגל השמיני מתוך הפרויקט של הזמר והיוצר אודי דמארי', N'for_songs/אודי-דמארי/רק-1-קובע.jpg', N'songs_content/אודי-דמארי/רק-1-קובע.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (177, N'לבדו', N'אוהד-מושקוביץ\ddce8e05aaff64479e5ca6cb3c501b19.mp4', N'video', CAST(N'2018-05-15T10:05:00.000' AS DateTime), 27, 118, NULL, N'אוהד מושקוביץ בסינגל חדש ומקפיץ – ''לבדו''', N'הזמר אוהד מושקוביץ בסינגל חדש מתוך אלבומו השישי שיצא בקרוב. ''לבדו'' הוא שיר חסידי מקפיץ, באווירה קיצית וסוחפת שלא תשאיר אתכם אדישים. את השיר חשף אוהד לראשונה במהלך המופע ''Jerusalem In New York'' שנערך באולם בניו יורק לפני מספר חודשים, והאלפים שישבו בקהל הגיבו בהתלהבות.', N'for_songs/אוהד-מושקוביץ/256.jpg', N'songs_content/אוהד-מושקוביץ/לבדו.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (178, N'היי זה הזמן', N'שלומי-גרטנר\שלוימי-גרטנר-היי-זה-הזמן-Hey-Zeh-Hazman-Shloime-Gertner.mp4', N'video', CAST(N'2018-07-23T22:16:00.000' AS DateTime), 42, 141, NULL, N'שלומי גרטנר עם להיט קיצי מקפיץ: "היי זה הזמן"', N'שלום וגשל מגיש: לא עברו חודשיים מאז השקת אלבומו Serenity, והכוכב הלונדוני שלומי גרטנר משחרר גרסה עברית לוהטת ומקפיצה לאחת הרצועות המושמעות באלבומו – "ידיים באוויר".', N'for_songs/שלומי-גרטנר/ezgif-2-5f089daa60-1.jpg', N'songs_content/שלומי-גרטנר/היי-זה-הזמן.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (179, N'אשרי תלמיד חכם', N'אברהם-פריד\videoplayback-14.mp4', N'video', CAST(N'2020-07-02T12:01:00.000' AS DateTime), 28, 169, NULL, N'פריד וקמפה שרים למסיימים הרמב״ם היומי: ״אשרי תלמיד חכם״', N'לקראת סיום המחזור של סדר לימוד הרמב"ם היומי ותחילת המחזור החדש, נחשף כעת הלהיט שילווה את המעמדים שיתקיימו הפעם במתכונת שונה ותחת מגבלות הקורונה.', N'for_songs/אברהם-פריד/WhatsApp-Image-2020-07-01-at-22.02.25.jpeg', N'songs_content/אברהם-פריד/אשרי-תלמיד-חכם.txt', 0, CAST(N'2020-12-03T17:44:27.723' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (180, N'שיר הקורונה', N'עמירן-דביר\videoplayback-4.mp4', N'video', CAST(N'2020-03-07T10:35:00.000' AS DateTime), 12, 87, NULL, N'עמירן דביר עם סינגל חדש לפורים: "שיר הקורונה"', N'בתקופה זו של בהלת הקורונה, בתקופה שמצווים אנחנו להרבות בשמחה ובמיוחד בפורים, הזמר עמירן דביר בסינגל חדש ״שיר הקורונה״.', N'for_songs/עמירן-דביר/שיר-הקורונה.jpg', N'songs_content//עמירן-דביר/שיר-הקורונה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (181, N'אהבת חינם', N'יונתן-שיינפלד\12ff3e8eeaa3caa4d05ac24f6b8dd22a.mp4', N'video', CAST(N'2019-10-11T11:24:00.000' AS DateTime), 31, 123, NULL, N'יונתן שינפלד בקליפ חדש - אהבת חינם', N'רגע לאחר יום כיפור, ובאווירת ימי ערב החג, מוציא יונתן שינפלד סינגל חדש בשם ׳אהבת חינם׳. את המילים כתב כוכב הרשת שוקי סלומון שגם הצטרף אל יונתן להלחנת השיר.', N'for_songs/יונתן-שיינפלד/יונתן-שוקי.png', N'songs_content/יונתן-שיינפלד/אהבת-חינם.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (182, N'לך אלי', N'מידד-טסה\מידד-טסה-לך-אלי-MP3.mp3', N'audio', CAST(N'2020-09-22T16:45:00.000' AS DateTime), 5, 67, NULL, N'מידד טסה מרגש עם סינגל חדש: "לך אלי"', N'הביצוע המוזיקלי הראשון לשנת תשפ"א, מפתיחת היום הקדוש - מידד טסה שר:  לְךָ אֵלִי תְּשׁוּקָתִי. בְּךָ חֶשְׁקִי וְאַהֲבָתִי. לְךָ לִבִּי וְכִלְיותַי. לְךָ רוּחִי וְנִשְׁמָתִי. הֲשִׁיבֵנִי וְאָשׁוּבָה. וְתִרְצֶה אֶת תְּשׁוּבָתִי.', N'for_songs/מידד-טסה/לך-אלי-724x483.jpg', N'songs_content/מידד-טסה/לך-קלי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (183, N'רוצים לשמוח', N'הקינדרלעך\רוצים-לשמוח-I-קינדרלעך-Rotzim-Lismoach-I-Kinderlach-I.mp4', N'video', CAST(N'2018-07-24T21:03:00.000' AS DateTime), 37, 145, NULL, N'רוצים לשמוח –''קינדרלעך'' בסינגל מתוך אלבום חדש', N'להקת הילדים של ישראל – ''קינדרלעך'' בסינגל חדש מתוכם אלבומם הרביעי שיוצא בימים אלו לחנויות. מילים ולחן של ישראל סוסנה, על ההפקה המוזיקלית, רון תיכון.', N'for_songs/הקינדרלעך/רוצים-לשמוח-גרפיקה-560x315.jpg', N'songs_content/הקינדרלעך/רוצים-לשמוח.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (184, N'מלך עוזר', N'חיים-ישראל\חיים-ישראל-מלך-עוזר.mp3', N'audio', CAST(N'2020-05-12T10:24:00.000' AS DateTime), 21, 98, NULL, N'חיים ישראל חוזר לשגרה עם להיט חדש: "מלך עוזר"', N'הזמר והיוצר חיים ישראל ממשיך לחדש – והפעם: "מלך עוזר" סינגל חדש שמח וקיצבי במיוחד, בימים אלה שאנו חוזרים לשגרה "מלך עוזר מושיע ומגן מלך שומר על כל עם ישראל"', N'for_songs/חיים-ישראל/מלך-עוזר.jpg', N'songs_content/חיים-ישראל/מלך-עוזר.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (185, N'כשאתם מתפללים', N'אוהד-מושקוביץ\82a1ae8c7b1a13edce838f712218f561.mp4', N'video', CAST(N'2018-08-28T12:30:00.000' AS DateTime), 16, 113, NULL, N'אוהד מושקוביץ בסינגל חדש – ''כשאתם מתפללים''', N'אוהד מושקוביץ מוציא בימים אלו את אלבומו השישי הנקרא ''בשעה טובה'', ומתוכו יוצא כעת סינגל חדש, יצירה מרגשת בשם ''כשאתם מתפללים'' בלחנו של היוצר האמריקאי אלי שוואב.', N'for_songs/אוהד-מושקוביץ/כשאתם-מתפללים.jpg', N'songs_content/אוהד-מושקוביץ/כשאתם-מתפללים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (186, N'ברכני', N'הקינדרלעך\Barcheni-MP3.mp3', N'audio', CAST(N'2019-11-26T10:45:00.000' AS DateTime), 28, 134, NULL, N'קינדרלעך שרים לחתני בר המצווה – ''ברכני''', N'להקת הילדים של ישראל בסינגל חדש בשם ''ברכני'' המוקדש לחתני בר המצווה. יונתן שינפלד כתב הלחין והפיק מוזיקלית ולהקת ''קינדרלעך'' מגישה ביצוע אלגנטי ומיוחד', N'for_songs/הקינדרלעך/ברכני-גרפיקה.jpeg', N'songs_content/הקינדרלעך/ברכני.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (187, N'נגינתי', N'איציק-וינגרטן\איציק-וינגרטן-נגינתי.mp3', N'audio', CAST(N'2020-11-17T18:18:00.000' AS DateTime), 11, 70, NULL, N'איציק וינגרטן בסינגל חדש: "נגינתי"', N'אחרי הלהיט הקצבי "שמח תמיד", הזמר איציק וינגרטן ממשיך ליצור חומרים מוזיקליים חדשים ומשיק סינגל חדש  - "נגינתי"', N'for_songs/איציק-וינגרטן/3183.jpg', N'songs_content/איציק-וינגרטן/נגינתי.txt', 0, CAST(N'2020-12-21T02:02:41.953' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (188, N'להודות', N'נפתלי-קמפה\videoplayback-10.mp4', N'video', CAST(N'2020-06-17T14:15:00.000' AS DateTime), 0, 0, NULL, N'נפתלי קמפה בסינגל חדש ברוח התקופה: "להודות"', N'בעקבות התקופה המורכבת שאנו עוברים בימים אלה, משחרר נפתלי קמפה סינגל חדש, למילותיו של הרמב"ם שהן "מרשם להתמודדות עם כאב". האזינו', N'for_songs/נפתלי-קמפה/WhatsApp-Image-2020-06-17-at-13.53.23.jpeg', N'songs_content/נפתלי-קמפה/להודות.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (189, N'יאללה לרקוד', N'קובי-ברומר\videoplayback-5.mp4', N'video', CAST(N'2017-12-29T12:43:00.000' AS DateTime), 1, 4, NULL, N'"יאללה לרקוד": קובי ברומר בסינגל חדש', N'הזמר האנרגטי מצליח להפתיע גם הפעם עם סינגל בלתי שגרתי שידליק לכם את החורף, בהפקה אלקטרונית ומושקעת במיוחד.  נראה אתכם לא רוקדים !', N'for_songs/קובי-ברומר/עטיפת-הסינגל--560x315.jpg', N'songs_content/קובי-ברומר/יאללה-לרקוד.txt', 0, CAST(N'2020-12-03T17:07:39.060' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (190, N'שירת הבקשות', N'חיים-ישראל\videoplayback-4-1.mp4', N'video', CAST(N'2020-11-21T19:15:00.000' AS DateTime), 3, 10, NULL, N'שוקי סלומון וחיים ישראל שרים בדובאי: ''שירת הבקשות''', N'הזמר והיוצר שוקי סלומון משיק סינגל חדש בשם ''שירת הבקשות'' יחד עם מלך המוזיקה המזרחית חיים ישראל.', N'for_songs/חיים-ישראל/__צילום-מסך-270-2048x1152.png', N'songs_content/חיים-ישראל/שירת-הבקשות.txt', 0, CAST(N'2020-12-21T22:06:08.640' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (191, N'מיד נגאלים', N'אייל-טויטו\ff2edc285413b7613acd72974e119367.mp4', N'video', CAST(N'2020-04-05T22:54:00.000' AS DateTime), 0, 0, NULL, N'אייל טויטו מארח את מנדי ג''רופי – "מיד נגאלים"', N'בעיצומו של חודש ניסן וימים ספורים לפני חג הגאולה – פסח. משיק הזמר אייל טויטו סינגל חדש בו הוא מארח את ידידו הקרוב מנדי ג''רופי', N'for_songs/אייל-טויטו/WhatsApp-Image-2020-04-06-at-11.40.38.jpeg', N'songs_content/אייל-טויטו/מיד-נגאלים.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (192, N'המלאך', N'אלי-הרצליך\96d0acc255a491ce794f9db57be56d77.mp4', N'video', CAST(N'2020-06-06T22:34:00.000' AS DateTime), 0, 0, NULL, N'אלי הרצליך בקליפ וידיאו חדש – המלאך', N'אלי הרצליך בקליפ וידיאו חדש יחד עם שירה עוצמתית ואדירה של רבבות משתתפי סיום הש"ס של דרשו ביד אליהו, ובליווי תזמורת המנגנים המורחבת בניצוחו של מוישי רוט, ומקהלת מלכות בניצוחו של פנחס ביכלר,', N'for_songs/אלי-הרצליך/אלי-הרצליך-תמונה.jpeg', N'songs_content/אלי-הרצליך/המלאך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (193, N'יברכך', N'שמחה-פרידמן\שמחה פרידמן - יברכך _ Simche Friedman - Yevorechecho.mp4', N'video', CAST(N'2020-05-28T12:15:00.000' AS DateTime), 0, 0, NULL, N'"יברכך": שמחה הכהן פרידמן מברך אתכם עם שיר חדש', N'בסינגל חדש – "יברכך" חוזר פרידמן אל הטעם הישן והמתוק מבית אבא, והתוצאה: שיר חסידי אותנטי, בהברה אשכנזית ובניחוח נוסטלגי ואהוב', N'for_songs/שמחה-פרידמן/עטיפה-יברכך-ליוטיוב-scaled.jpg', N'songs_content/שמחה-פרידמן/יברכך.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (194, N'שירת הנשמה ', N'רולי-דיקמן\90f7faf02f7afd8254b4ae2a99dc78ac.mp4', N'video', CAST(N'2020-09-22T19:29:00.000' AS DateTime), 0, 0, NULL, N'שירת הנשמה – שוקי סלומון & דיוויד טויב מארחים את רולי דיקמן', N'הזמר והיוצר שוקי סלומון משיק פרויקט חדש בשם ''שירת הנשמה'' יחד עם המפיק המוסיקלי דיוויד טויב. לקראת חגי תשרי תשפ"א והימים הנוראים מוציאים השניים את החלק הראשון בפרויקט בו הם מארחים את הזמר רולי דיקמן למחרוזת שירי נשמה נפלאים. המחרוזת יוצאת בליווי קליפ מיוחד שצולם ב''יקבי ציון'' המחודשים בליווי נגנים וחברים לדרך. צפו בביצוע המרגש.', N'for_songs/רולי-דיקמן/צילום-בצלאל-כהן-724x483.jpg', N'songs_content/רולי-דיקמן/שירת-הנשמה.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (195, N'אבא איתי', N'ארי-היל\02a494e2686eb681b838fb8917802ce2.mp4', N'video', CAST(N'2020-04-06T19:54:00.000' AS DateTime), 0, 0, NULL, N'אבא איתי – ארי היל וחיים ישראל', N'כשמוטי החמוד בן ה - 8 מהמחלקה האנקולוגית בתל השומר שאל את שימי גשייד לפשר הבידוד העצוב בה הוא וחבריו נמצאים? כך התבשל הדואט הכובש של אמן הנשמה החסידי ארי היל לצד גדול הזמר המזרחי חיים ישראל שהתאחדו בקאבר ללחנו של האומן הצעיר בנצי שטיין שגם כתב את המילים, כי בכל מצב שהוא "אבא" איתנו!', N'for_songs/ארי-היל/WhatsApp-Image-2020-04-05-at-17.45.43.jpeg', N'songs_content/ארי-היל/אבא-איתי.txt', 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (196, N'בליבי', N'משה-קליין\videoplayback.mp4', N'video', CAST(N'2020-07-31T16:03:00.000' AS DateTime), 0, 0, NULL, N'משה קליין שר: בליבי', N'הזמר משה קליין שר את ''ליבי'' בביצוע מרגש בערוץ הכנסת בתכנית שבת המלכה.', N'for_songs/משה-קליין/משה-קליין-זמר-724x483.jpg', NULL, 0, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (197, N'אליהו הנביא זכור לטוב', N'ישראל-סוסנה\37914aaabfff4f0886ea94cd466a5dd0.mp4', N'video', CAST(N'2020-07-13T21:20:00.000' AS DateTime), 0, 0, NULL, N'היצירה הווקאלית שנוצרה בבידוד: אליהו הנביא זכור לטוב', N'מסתבר שיש גם דברים טובים בקורונה. המעבד ישראל סוסנה שנאלץ לשהות שבוע בבידוד, החליט להעשיר את אוצר המוזיקה הווקאלית ביצירה נוספת "זכור לטוב" שמצטרפת ליצירותיו הווקאליות הקודמות "נצור לשונך" ו"נקדש".', N'for_songs/ישראל-סוסנה/400041100062_118307.jpg', NULL, 0, CAST(N'2020-05-01T12:32:00.000' AS DateTime))
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance], [lastViewingDate]) VALUES (198, N'אמר ה'' ליעקב', N'נחמן-גולדברג\אמר-ה-ליעקב-נחמן-גולדברג.mp3', N'audio', CAST(N'2020-11-29T21:52:00.000' AS DateTime), 9, 27, NULL, N'נחמן גולדברג בסינגל חדש: ''אמר ה'' ליעקב''', N'הזמר נחמן גולדברג מוציא סינגל חדש בשם ''אמר ה'' ליעקב'' מתוך אלבום ''קולות הנשמה'' מלחני המלחין החב"די ר'' פייטל לוין ובהפקתו של דוד פדידה. עיבוד מוסיקלי: גרשון פריישטט.', N'for_songs/נחמן-גולדברג/3217.jpg', N'songs_content/נחמן-גולדברג/אמר-ה-ליעקב.txt', 0, CAST(N'2020-12-24T00:30:55.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsToParadeTBL] ON 

INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (1, 140, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (2, 157, 5, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (3, 128, 5, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (4, 116, 4, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (5, 113, 6, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (6, 109, 6, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (7, 110, 6, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (8, 62, 8, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (9, 96, 7, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (10, 135, 7, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (11, 164, 7, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (12, 66, 6, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (13, 63, 5, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (14, 64, 3, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (15, 65, 3, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (16, 70, 4, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (17, 71, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (18, 98, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (19, 184, NULL, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (20, 181, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (21, 179, NULL, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (22, 175, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (23, 176, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (24, 170, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (25, 182, NULL, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (26, 121, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (27, 144, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (28, 134, 3, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (29, 136, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (30, 132, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (31, 112, 2, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (32, 111, NULL, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (33, 107, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (34, 95, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (35, 91, NULL, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (36, 88, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (37, 85, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (38, 69, 1, 1)
INSERT [dbo].[SongsToParadeTBL] ([id], [songId], [count], [paradeId]) VALUES (39, 59, 1, 1)
SET IDENTITY_INSERT [dbo].[SongsToParadeTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] ON 

INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (1, 25, 78)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (2, 25, 109)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (3, 25, 111)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (4, 25, 113)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (5, 25, 157)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (6, 25, 165)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (7, 25, 166)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (8, 27, 68)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (9, 27, 79)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (10, 27, 83)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (11, 27, 90)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (12, 27, 136)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (13, 27, 143)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (14, 27, 140)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (15, 26, 71)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (16, 26, 73)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (17, 26, 78)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (18, 26, 82)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (19, 26, 83)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (20, 26, 90)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (21, 26, 97)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (22, 26, 101)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (23, 26, 104)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (24, 26, 107)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (25, 26, 112)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (26, 26, 132)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (27, 26, 143)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (28, 26, 148)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (29, 26, 154)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (30, 26, 164)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (31, 26, 165)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (32, 28, 61)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (33, 28, 63)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (34, 28, 67)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (35, 28, 70)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (36, 28, 74)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (37, 28, 76)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (38, 28, 79)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (39, 28, 86)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (40, 28, 92)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (41, 28, 94)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (42, 28, 95)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (43, 28, 117)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (44, 28, 126)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (45, 28, 128)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (46, 29, 61)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (47, 29, 65)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (48, 29, 67)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (49, 29, 96)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (50, 29, 102)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (51, 29, 117)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (52, 29, 135)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (53, 29, 139)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (54, 29, 150)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (55, 30, 64)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (56, 30, 77)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (57, 30, 87)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (58, 30, 106)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (59, 30, 108)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (60, 30, 138)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (61, 31, 58)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (62, 31, 66)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (63, 31, 80)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (64, 31, 83)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (65, 30, 84)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (66, 31, 97)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (67, 31, 101)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (68, 31, 110)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (69, 31, 129)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (70, 31, 135)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (71, 31, 150)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (72, 31, 145)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (73, 31, 165)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (74, 32, 69)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (75, 32, 115)
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsToUserPlaylistsTBL] ON 

INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (4, 8, 71)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (5, 11, 187)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (6, 8, 169)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (7, 8, 164)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (8, 9, 143)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (9, 10, 94)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (10, 10, 106)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (11, 10, 121)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (12, 10, 96)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (13, 11, 111)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (14, 8, 58)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (15, 11, 78)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (16, 11, 112)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (17, 12, 109)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (18, 12, 71)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (19, 12, 145)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (20, 12, 72)
INSERT [dbo].[SongsToUserPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (21, 9, 101)
SET IDENTITY_INSERT [dbo].[SongsToUserPlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] ON 

INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (1, 1, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (2, 2, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (3, 3, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (4, 3, 2)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (7, 8, 58)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (8, 10, 5)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (9, 10, 10)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (10, 9, 4)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (11, 1, 4)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (12, 2, 4)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (13, 2, 36)
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsForArticlesTBL] ON 

INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (1, N'אברהם פריד')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (2, N'איך נוצר שיר?')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (3, N'אילן לב')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (4, N'איצי וולדנר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (5, N'בידוד')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (6, N'דוד איכילביץ''')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (7, N'דוד קליגר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (8, N'המלחימים')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (9, N'זאנוויל וינברגר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (10, N'זמן אוויר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (11, N'חג')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (12, N'חול המועד')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (13, N'חומות של תקווה')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (14, N'חיים ישראל')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (15, N'חסידי')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (16, N'טראמפ')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (17, N'ידידים')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (18, N'יהודה רוזן')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (19, N'יואלי דיקמן')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (20, N'יענקי רובין')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (21, N'יעקב שוואקי')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (22, N'יצהר ויינברג')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (23, N'ישי ריבו')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (24, N'ישיבת חברון')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (25, N'ישראל בסר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (26, N'ישראל סוסנה')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (27, N'לדוד')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (28, N'ליפא שמעלצר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (29, N'מאחורי הקלעים')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (30, N'מאיר גרין')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (31, N'מזרחי')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (32, N'מלונית קורונה')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (33, N'מנחם טוקר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (34, N'מרדכי בן דוד')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (35, N'משה דוויק')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (36, N'משה קליין')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (37, N'נתנאל מנת')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (38, N'סוכות')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (39, N'סינטי מיוזיק')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (40, N'עדי נתנאלי')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (41, N'צרפתים')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (42, N'קאבר')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (43, N'קורונה')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (44, N'שבט אחים ואחיות')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (45, N'שלמה כהן')
INSERT [dbo].[TagsForArticlesTBL] ([id], [name]) VALUES (46, N'שמחת בית השואבה')
SET IDENTITY_INSERT [dbo].[TagsForArticlesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsForSongsTBL] ON 

INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (1, N'מזרחי', 1)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (2, N'חסידי', 1)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (3, N'ישראלי', 1)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (4, N'שקט', 2)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (5, N'שירי נשמה', 2)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (6, N'קצבי', 2)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (7, N'טראנס', 2)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (8, N'ירושלים', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (9, N'שבת', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (10, N'חתונה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (11, N'סוכות', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (12, N'ימים נוראים', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (13, N'פורים', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (14, N'חנוכה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (15, N'ל"ג בעומר', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (16, N'שמחת בית השואבה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (17, N'תפילה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (18, N'קורונה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (19, N'ט"ו בשבט', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (20, N'פסח', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (21, N'ווקאלי', 4)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (22, N'פופ', 5)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (23, N'ניגון', 5)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (24, N'פיוט', 5)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (25, N'רמיקס', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (26, N'קאבר', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (27, N'סינגל', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (28, N'קליפ', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (29, N'אנגלית', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (30, N'דואט', 6)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (31, N'אלקטרוני', 5)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (32, N'בר מצוה', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (33, N'בידוד', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (34, N'ר'' נחמן', 3)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (35, N'הרב שלמה קורח', 7)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (36, N'זלוטשוב', 7)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (37, N'ר׳ שלום מרדכי רובשקין', 7)
INSERT [dbo].[TagsForSongsTBL] ([id], [name], [typeId]) VALUES (38, N'רבי שמעון בר יוחאי', 3)
SET IDENTITY_INSERT [dbo].[TagsForSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] ON 

INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (1, 1, 38)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (2, 1, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (3, 1, 46)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (4, 2, 31)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (5, 4, 15)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (6, 4, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (7, 4, 5)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (8, 4, 43)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (9, 5, 21)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (10, 5, 43)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (11, 5, 15)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (12, 8, 45)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (13, 8, 19)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (14, 8, 24)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (15, 8, 43)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (16, 8, 32)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (17, 8, 18)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (18, 8, 46)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (19, 9, 36)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (20, 9, 26)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (21, 9, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (22, 9, 38)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (23, 9, 41)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (24, 10, 19)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (25, 10, 29)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (26, 10, 34)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (27, 10, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (28, 10, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (29, 10, 2)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (30, 7, 21)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (31, 7, 27)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (32, 7, 22)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (33, 7, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (34, 7, 33)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (35, 7, 14)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (36, 7, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (37, 7, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (38, 7, 13)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (39, 11, 30)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (40, 11, 40)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (41, 11, 44)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (42, 11, 43)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (43, 11, 42)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (44, 12, 40)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (45, 12, 39)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (46, 12, 23)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (47, 12, 28)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (48, 12, 6)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (49, 12, 20)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (50, 12, 35)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (51, 12, 17)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (52, 12, 37)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (53, 12, 3)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (54, 13, 21)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (55, 13, 16)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (56, 13, 4)
INSERT [dbo].[TagsToArticlesTBL] ([id], [articleId], [tagId]) VALUES (57, 13, 25)
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] ON 

INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1, 56, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (2, 57, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (3, 58, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (4, 59, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (5, 60, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (6, 61, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (7, 62, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (8, 70, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (9, 71, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (10, 75, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (11, 78, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (12, 109, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (13, 111, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (14, 112, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (15, 113, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (16, 123, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (17, 137, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (18, 138, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (19, 157, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (20, 165, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (21, 166, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (22, 173, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (23, 174, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (24, 182, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (25, 184, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (26, 196, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (27, 63, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (28, 64, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (29, 65, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (30, 67, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (31, 68, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (32, 69, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (33, 72, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (34, 74, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (35, 76, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (36, 77, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (37, 79, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (38, 80, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (39, 81, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (40, 84, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (41, 85, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (42, 86, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (43, 87, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (44, 88, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (45, 90, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (46, 91, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (47, 92, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (48, 93, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (49, 97, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (50, 98, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (51, 101, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (52, 102, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (53, 104, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (54, 105, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (55, 106, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (56, 107, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (57, 108, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (58, 110, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (59, 114, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (60, 116, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (61, 117, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (62, 119, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (63, 124, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (64, 125, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (65, 126, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (66, 130, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (67, 131, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (68, 132, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (69, 133, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (70, 140, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (71, 142, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (72, 143, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (73, 146, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (74, 147, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (75, 148, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (76, 149, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (77, 151, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (78, 153, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (79, 154, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (80, 155, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (81, 156, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (82, 158, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (83, 159, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (84, 160, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (85, 161, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (86, 162, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (87, 163, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (88, 164, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (89, 168, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (90, 169, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (91, 175, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (92, 177, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (93, 178, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (94, 179, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (95, 180, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (96, 181, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (97, 185, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (98, 187, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (99, 188, 2)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (100, 189, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (101, 190, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (102, 191, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (103, 192, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (104, 193, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (105, 194, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (106, 195, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (107, 198, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (108, 66, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (109, 71, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (110, 73, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (111, 82, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (112, 83, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (113, 89, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (114, 94, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (115, 95, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (116, 99, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (117, 100, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (118, 103, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (119, 115, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (120, 118, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (121, 120, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (122, 127, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (123, 128, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (124, 129, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (125, 134, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (126, 135, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (127, 136, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (128, 139, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (129, 141, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (130, 144, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (131, 145, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (132, 150, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (133, 170, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (134, 171, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (135, 172, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (136, 176, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (137, 183, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (138, 186, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (139, 56, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (140, 58, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (141, 68, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (142, 69, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (143, 71, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (144, 72, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (145, 73, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (146, 78, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (147, 82, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (148, 83, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (149, 88, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (150, 90, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (151, 91, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (152, 97, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (153, 99, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (154, 101, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (155, 109, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (156, 110, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (157, 118, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (158, 119, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (159, 133, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (160, 134, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (161, 140, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (162, 141, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (163, 143, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (164, 145, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (165, 148, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (166, 149, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (167, 151, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (168, 152, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (169, 154, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (170, 157, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (171, 158, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (172, 160, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (173, 161, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (174, 162, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (175, 163, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (176, 164, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (177, 166, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (178, 169, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (179, 170, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (180, 174, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (181, 175, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (182, 181, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (183, 182, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (184, 185, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (185, 186, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (186, 187, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (187, 190, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (188, 192, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (189, 194, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (190, 195, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (191, 198, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (192, 56, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (193, 58, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (194, 62, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (195, 66, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (196, 68, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (197, 71, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (198, 72, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (199, 73, 5)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (200, 78, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (201, 82, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (202, 83, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (203, 88, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (204, 89, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (205, 90, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (206, 97, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (207, 98, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (208, 99, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (209, 100, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (210, 101, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (211, 107, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (212, 109, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (213, 110, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (214, 112, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (215, 113, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (216, 116, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (217, 117, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (218, 118, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (219, 119, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (220, 130, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (221, 131, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (222, 132, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (223, 133, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (224, 139, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (225, 140, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (226, 141, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (227, 142, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (228, 143, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (229, 145, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (230, 147, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (231, 148, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (232, 149, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (233, 151, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (234, 154, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (235, 157, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (236, 158, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (237, 159, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (238, 160, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (239, 161, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (240, 162, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (241, 163, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (242, 164, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (243, 165, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (244, 166, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (245, 167, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (246, 168, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (247, 169, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (248, 171, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (249, 172, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (250, 174, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (251, 175, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (252, 181, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (253, 185, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (254, 187, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (255, 192, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (256, 193, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (257, 194, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (258, 195, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (259, 198, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (260, 57, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (261, 59, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (262, 60, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (263, 61, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (264, 63, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (265, 64, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (266, 65, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (267, 67, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (268, 70, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (269, 74, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (270, 76, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (271, 77, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (272, 79, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (273, 80, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (274, 81, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (275, 84, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (276, 85, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (277, 86, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (278, 87, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (279, 89, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (280, 92, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (281, 93, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (282, 94, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (283, 95, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (284, 96, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (285, 98, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (286, 102, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (287, 103, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (288, 104, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (289, 105, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (290, 106, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (291, 107, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (292, 108, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (293, 111, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (294, 112, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (295, 113, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (296, 115, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (297, 116, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (298, 117, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (299, 126, 6)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (300, 127, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (301, 128, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (302, 129, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (303, 135, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (304, 136, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (305, 137, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (306, 138, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (307, 139, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (308, 140, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (309, 142, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (310, 144, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (311, 146, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (312, 150, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (313, 153, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (314, 155, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (315, 156, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (316, 159, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (317, 165, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (318, 167, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (319, 168, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (320, 171, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (321, 172, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (322, 173, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (323, 176, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (324, 177, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (325, 178, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (326, 179, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (327, 180, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (328, 183, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (329, 184, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (330, 188, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (331, 189, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (332, 191, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (333, 196, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (334, 197, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (335, 93, 7)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (336, 144, 7)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (337, 64, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (338, 77, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (339, 84, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (340, 87, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (341, 106, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (342, 108, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (343, 144, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (344, 153, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (345, 169, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (346, 189, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (347, 75, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (348, 123, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (349, 124, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (350, 125, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (351, 126, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (352, 194, 11)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (353, 72, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (354, 78, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (355, 88, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (356, 100, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (357, 101, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (358, 109, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (359, 130, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (360, 131, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (361, 149, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (362, 151, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (363, 182, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (364, 180, 13)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (365, 172, 14)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (366, 146, 15)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (367, 75, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (368, 71, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (369, 126, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (370, 131, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (371, 132, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (372, 141, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (373, 142, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (374, 147, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (375, 148, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (376, 149, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (377, 151, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (378, 158, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (379, 167, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (380, 168, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (381, 169, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (382, 185, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (383, 192, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (384, 193, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (385, 194, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (386, 195, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (387, 197, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (388, 73, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (389, 98, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (390, 112, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (391, 161, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (392, 163, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (393, 180, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (394, 145, 19)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (395, 191, 20)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (396, 69, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (397, 115, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (398, 197, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (399, 57, 22)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (400, 60, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (401, 61, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (402, 62, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (403, 96, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (404, 102, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (405, 103, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (406, 127, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (407, 128, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (408, 144, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (409, 167, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (410, 171, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (411, 172, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (412, 197, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (413, 133, 23)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (414, 182, 24)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (415, 194, 24)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (416, 93, 25)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (417, 114, 25)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (418, 120, 25)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (419, 122, 25)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (420, 71, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (421, 120, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (422, 195, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (423, 56, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (424, 58, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (425, 59, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (426, 60, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (427, 61, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (428, 62, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (429, 63, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (430, 64, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (431, 65, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (432, 66, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (433, 68, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (434, 71, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (435, 72, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (436, 74, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (437, 77, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (438, 78, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (439, 84, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (440, 86, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (441, 90, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (442, 92, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (443, 93, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (444, 94, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (445, 95, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (446, 96, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (447, 97, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (448, 98, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (449, 102, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (450, 103, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (451, 104, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (452, 105, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (453, 106, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (454, 107, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (455, 108, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (456, 109, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (457, 110, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (458, 111, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (459, 112, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (460, 113, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (461, 114, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (462, 115, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (463, 116, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (464, 117, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (465, 118, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (466, 122, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (467, 129, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (468, 140, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (469, 150, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (470, 175, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (471, 176, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (472, 189, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (473, 58, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (474, 59, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (475, 61, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (476, 62, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (477, 63, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (478, 64, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (479, 65, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (480, 70, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (481, 71, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (482, 72, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (483, 76, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (484, 81, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (485, 83, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (486, 87, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (487, 88, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (488, 92, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (489, 94, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (490, 95, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (491, 96, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (492, 99, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (493, 100, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (494, 101, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (495, 102, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (496, 106, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (497, 109, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (498, 112, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (499, 113, 28)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (500, 116, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (501, 117, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (502, 119, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (503, 126, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (504, 128, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (505, 135, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (506, 139, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (507, 142, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (508, 147, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (509, 150, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (510, 151, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (511, 153, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (512, 155, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (513, 158, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (514, 161, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (515, 171, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (516, 172, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (517, 173, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (518, 177, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (519, 179, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (520, 195, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (521, 196, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (522, 81, 29)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (523, 91, 29)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (524, 93, 29)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (525, 102, 29)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (526, 56, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (527, 59, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (528, 68, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (529, 75, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (530, 89, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (531, 90, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (532, 91, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (533, 114, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (534, 120, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (535, 132, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (536, 136, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (537, 150, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (538, 152, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (539, 153, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (540, 179, 30)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (541, 107, 31)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (542, 144, 31)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (543, 167, 31)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (544, 186, 32)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (545, 159, 33)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (546, 195, 33)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (547, 60, 34)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (548, 61, 34)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (549, 141, 34)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (550, 171, 34)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (551, 152, 35)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (552, 133, 36)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (553, 80, 37)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (554, 146, 38)
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TopicsTBL] ON 

INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (1, N'ראשי', NULL, N'home', N'dashboard')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (2, N'חדש במוזיקה', N'כל השירים והקליפים החדשים', N'song', N'headset')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (3, N'פלייליסטים', N'פלייליסטים בכל סגנון ולכל זמן', N'playlists', N'equalizer')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (4, N'מגזין', N'כל החדשות והסקופים המעניינים במוזיקה היהודית', N'magazine', N'queue_music')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (5, N'הופעות', N'מיטב ההופעות מכל הזמנים', N'performance', N'mic')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (6, N'המצעד', N'מצעד השירים השנתי של מיוזיק אונליין - הצביעו והשפיעו >>', N'parade', N'pie_chart')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [href], [icon]) VALUES (7, N'חיפוש', N'כאן תוכל לחפש שירים וכתבות, קליפים והופעות לפי כל פרמטר שתבחר', N'searching', N'search')
SET IDENTITY_INSERT [dbo].[TopicsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TypesOfTagsTBL] ON 

INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (1, N'ג''אנר')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (2, N'מקצב')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (3, N'נושא')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (4, N'אקפלה')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (5, N'סוג')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (6, N'כללי')
INSERT [dbo].[TypesOfTagsTBL] ([id], [name]) VALUES (7, N'אנשים')
SET IDENTITY_INSERT [dbo].[TypesOfTagsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPlaylistsTBL] ON 

INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (1, 1, N'שירים חדשים')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (2, 1, N'חסידי')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (3, 2, N'מזרחי')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (4, 2, N'אקפלה')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (5, 1, N'אקפלה')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (8, 10, N'שירים שאהבתי')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (9, 10, N'קומזיץ')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (10, 10, N'
הפלייליסט 
מזרחי טוב
')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (11, 10, N'הכי מקפיץ')
INSERT [dbo].[UserPlaylistsTBL] ([id], [userId], [name]) VALUES (12, 10, N'ימים נוראים')
SET IDENTITY_INSERT [dbo].[UserPlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (1, N'הודיה עזרן', N'0504117455h@gmail.com', N'123456', NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (2, N'אודיה אושרי', N'dasi1020@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (3, N'נרשם לרשימת תפוצה', N'abcde@gmail.com', NULL, 1, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (4, N'נרשם לאתר', N'fghij@gmail.com', N'gb4$4s&g01', NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (5, NULL, N'nhvgfh@gmail.com', NULL, 1, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (6, NULL, N'jhkhkhj@gmail.com', NULL, 1, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (7, N'רחל כהן', N'rachel@gmail.com', N'hhi544jk', 0, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (8, N'חיים', N'haim@gmail.com', N'5XBaN@c52gNsHiK', 0, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (9, N'אודיה', N'bsd.odaya@gmail.com', NULL, 1, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [newsletter], [image]) VALUES (10, N'איציק לוי', N'Itzik.levy@gmail.com', N'5XBaN@c52gNsHiK', 1, NULL)
SET IDENTITY_INSERT [dbo].[UsersTBL] OFF
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ArtistsToSongsTBL_ArtistsTBL] FOREIGN KEY([artistId])
REFERENCES [dbo].[ArtistsTBL] ([id])
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL] CHECK CONSTRAINT [FK_ArtistsToSongsTBL_ArtistsTBL]
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ArtistsToSongsTBL_JobTBL] FOREIGN KEY([jobId])
REFERENCES [dbo].[JobTBL] ([id])
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL] CHECK CONSTRAINT [FK_ArtistsToSongsTBL_JobTBL]
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ArtistsToSongsTBL_SongsTBL2] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[ArtistsToSongsTBL] CHECK CONSTRAINT [FK_ArtistsToSongsTBL_SongsTBL2]
GO
ALTER TABLE [dbo].[CommitsToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_ResponsesTBL_ArticlesBTL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[CommitsToArticlesTBL] CHECK CONSTRAINT [FK_ResponsesTBL_ArticlesBTL]
GO
ALTER TABLE [dbo].[CommitsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ResponsesToSongsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[CommitsToSongsTBL] CHECK CONSTRAINT [FK_ResponsesToSongsTBL_SongsTBL]
GO
ALTER TABLE [dbo].[FavoriteSongsToUserTBL]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteSongsToUserTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[FavoriteSongsToUserTBL] CHECK CONSTRAINT [FK_FavoriteSongsToUserTBL_SongsTBL]
GO
ALTER TABLE [dbo].[FavoriteSongsToUserTBL]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteSongsToUserTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[FavoriteSongsToUserTBL] CHECK CONSTRAINT [FK_FavoriteSongsToUserTBL_UsersTBL]
GO
ALTER TABLE [dbo].[FollowUpTBL]  WITH CHECK ADD  CONSTRAINT [FK_FollowUpTBL_ArticlesTBL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[FollowUpTBL] CHECK CONSTRAINT [FK_FollowUpTBL_ArticlesTBL]
GO
ALTER TABLE [dbo].[FollowUpTBL]  WITH CHECK ADD  CONSTRAINT [FK_FollowUpTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[FollowUpTBL] CHECK CONSTRAINT [FK_FollowUpTBL_SongsTBL]
GO
ALTER TABLE [dbo].[FollowUpTBL]  WITH CHECK ADD  CONSTRAINT [FK_FollowUpTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[FollowUpTBL] CHECK CONSTRAINT [FK_FollowUpTBL_UsersTBL]
GO
ALTER TABLE [dbo].[SingerSearchingToUserTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingerSearchingToUserTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SingerSearchingToUserTBL] CHECK CONSTRAINT [FK_SingerSearchingToUserTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SingerSearchingToUserTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingerSearchingToUserTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[SingerSearchingToUserTBL] CHECK CONSTRAINT [FK_SingerSearchingToUserTBL_UsersTBL]
GO
ALTER TABLE [dbo].[SingersToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToArticlesTBL_ArticlesTBL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToArticlesTBL] CHECK CONSTRAINT [FK_SingersToArticlesTBL_ArticlesTBL]
GO
ALTER TABLE [dbo].[SingersToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToArticlesTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToArticlesTBL] CHECK CONSTRAINT [FK_SingersToArticlesTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SingersToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToSurveyTBL_SingersTBL] FOREIGN KEY([paradeId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToParadeTBL] CHECK CONSTRAINT [FK_SingersToSurveyTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SingersToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToSongsTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToSongsTBL] CHECK CONSTRAINT [FK_SingersToSongsTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SingersToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToSongsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToSongsTBL] CHECK CONSTRAINT [FK_SingersToSongsTBL_SongsTBL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_AlbumsTBL] FOREIGN KEY([albumId])
REFERENCES [dbo].[AlbumsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_AlbumsTBL]
GO
ALTER TABLE [dbo].[SongsToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToParadeTBL_ParadeTBL] FOREIGN KEY([paradeId])
REFERENCES [dbo].[ParadeTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToParadeTBL] CHECK CONSTRAINT [FK_SongsToParadeTBL_ParadeTBL]
GO
ALTER TABLE [dbo].[SongsToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_SurveyTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToParadeTBL] CHECK CONSTRAINT [FK_SurveyTBL_SongsTBL]
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsSystemTBL_PlaylistsSystemTBL] FOREIGN KEY([playlistId])
REFERENCES [dbo].[PlaylistsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsSystemTBL_PlaylistsSystemTBL]
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsSystemTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsSystemTBL_SongsTBL]
GO
ALTER TABLE [dbo].[SongsToUserPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsTBL_PlaylistsTBL] FOREIGN KEY([playlistId])
REFERENCES [dbo].[UserPlaylistsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToUserPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsTBL_PlaylistsTBL]
GO
ALTER TABLE [dbo].[SongsToUserPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToUserPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsTBL_SongsTBL]
GO
ALTER TABLE [dbo].[SubscriptionTBL]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SubscriptionTBL] CHECK CONSTRAINT [FK_SubscriptionTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SubscriptionTBL]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[SubscriptionTBL] CHECK CONSTRAINT [FK_SubscriptionTBL_UsersTBL]
GO
ALTER TABLE [dbo].[TagsForSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsForSongsTBL_TypesOfTagsTBL] FOREIGN KEY([typeId])
REFERENCES [dbo].[TypesOfTagsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsForSongsTBL] CHECK CONSTRAINT [FK_TagsForSongsTBL_TypesOfTagsTBL]
GO
ALTER TABLE [dbo].[TagsToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToArticlesTBL_ArticlesTBL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToArticlesTBL] CHECK CONSTRAINT [FK_TagsToArticlesTBL_ArticlesTBL]
GO
ALTER TABLE [dbo].[TagsToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToArticlesTBL_TagsForArticlesTBL] FOREIGN KEY([tagId])
REFERENCES [dbo].[TagsForArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToArticlesTBL] CHECK CONSTRAINT [FK_TagsToArticlesTBL_TagsForArticlesTBL]
GO
ALTER TABLE [dbo].[TagsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToSongsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToSongsTBL] CHECK CONSTRAINT [FK_TagsToSongsTBL_SongsTBL]
GO
ALTER TABLE [dbo].[TagsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToSongsTBL_TagsForSongsTBL] FOREIGN KEY([tagId])
REFERENCES [dbo].[TagsForSongsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToSongsTBL] CHECK CONSTRAINT [FK_TagsToSongsTBL_TagsForSongsTBL]
GO
ALTER TABLE [dbo].[UserPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistsTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[UserPlaylistsTBL] CHECK CONSTRAINT [FK_PlaylistsTBL_UsersTBL]
GO
ALTER TABLE [dbo].[VotingsToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_VotingsToParadeTBL_ParadeTBL] FOREIGN KEY([paradeId])
REFERENCES [dbo].[ParadeTBL] ([id])
GO
ALTER TABLE [dbo].[VotingsToParadeTBL] CHECK CONSTRAINT [FK_VotingsToParadeTBL_ParadeTBL]
GO
/****** Object:  StoredProcedure [dbo].[ItemsToParade]    Script Date: 30/12/2020 21:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ItemsToParade]
@paradeId int
as
select * from (
select so.id, so.name, so.singerName as title, so.image_location as 'image', sotp.count, 'song' as type
from [dbo].[SongsToParadeTBL] sotp join [dbo].[songsDetails] so
on sotp.songId = so.id
where sotp.paradeId = @paradeId
union
select si.id, si.name, null as title, si.image, sitp.count, 'singer' as type
from [dbo].[SingersToParadeTBL] sitp join [dbo].[SingersTBL] si
on sitp.singerId = si.id
where sitp.paradeId = @paradeId
) as X
GO
USE [master]
GO
ALTER DATABASE [MusicOnline] SET  READ_WRITE 
GO
