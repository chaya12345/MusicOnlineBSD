USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 23/11/2020 21:28:00 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
	[singerId] [int] NULL,
	[count_like] [bigint] NULL,
	[count_views] [bigint] NULL,
	[albumId] [int] NULL,
	[title] [varchar](150) NULL,
	[subtitle] [varchar](max) NULL,
	[image_location] [varchar](max) NULL,
	[content] [varchar](max) NULL,
	[isPerformance] [bit] NULL,
 CONSTRAINT [PK_SongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetNewSong]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetNewSong]
as
	select top 15 * from [dbo].[SongsTBL]
	order by date desc
GO
/****** Object:  View [dbo].[getFavoriteSongs]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
	[main_image] [varchar](max) NULL,
	[image1] [varchar](max) NULL,
	[image2] [varchar](max) NULL,
	[image3] [varchar](max) NULL,
	[audio1] [varchar](max) NULL,
	[audio2] [varchar](max) NULL,
	[video] [varchar](max) NULL,
	[credit] [varchar](max) NULL,
	[count_views] [bigint] NULL,
	[count_like] [bigint] NULL,
	[count_responses] [bigint] NULL,
 CONSTRAINT [PK_ArticlesBTL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsesToArticlesTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsesToArticlesTBL](
	[id] [int] IDENTITY(45,1) NOT NULL,
	[articleId] [int] NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_ResponsesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsesToSongsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsesToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[name] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_ResponsesToSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[latestResponses]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[latestResponses]
AS
select top 20 id, type, name, date, topic, topicId from (
select r.id, 'song' AS type, r.name, r.date, s.title as topic, s.id as topicId
from ResponsesToSongsTBL as r join SongsTBL as s on r.songId = s.id
union
select r.id, 'article' AS type, name, r.date, a.title as topic, a.id as topicId
from ResponsesToArticlesTBL as r join ArticlesTBL as a on r.articleId = a.id) as X order by date desc
GO
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[tagTypeId] [int] NULL,
	[isShow] [bit] NULL,
 CONSTRAINT [PK_TagName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsToArticlesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tagId] [int] NULL,
	[articleId] [int] NULL,
 CONSTRAINT [PK_TagsToArticleTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[tagId] [int] NULL,
 CONSTRAINT [PK_TagsToSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[itemsByParameter]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[itemsByParameter] (@singer varchar(50))
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
/****** Object:  View [dbo].[songsDetails]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[songsDetails]
as
select s1.id, s1.name, s1.file_location, s1.type, s1.date,
s2.name as'singerName' ,s1.count_like,s1.count_views, s1.albumId,s1.title,s1.subtitle,s1.image_location,s1.content
from SongsTBL s1 join SingersTBL s2 on s1.singerId=s2.id
GO
/****** Object:  UserDefinedFunction [dbo].[itemByName]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[FavoriteSongsToUserTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[ParadeTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParadeTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year] [nvarchar](max) NULL,
	[dateStart] [datetime] NULL,
	[dateEnd] [datetime] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_ParadeTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistsSystemTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistsSystemTBL](
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
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_PlaylistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
 CONSTRAINT [PK_ReportsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[SingersToParadeTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[SongsToParadeTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsSystemTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsToPlaylistsSystemTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistId] [int] NULL,
	[songId] [int] NULL,
 CONSTRAINT [PK_SongsToPlaylistsSystemTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsToPlaylistsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[playlistId] [int] NULL,
	[songId] [int] NULL,
 CONSTRAINT [PK_SongsToPlaylistsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[TagsTypesTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsTypesTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_TagsTypesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicsTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NULL,
	[subtitle] [varchar](150) NULL,
	[img] [varchar](max) NULL,
	[href] [varchar](max) NULL,
	[icon] [varchar](50) NULL,
 CONSTRAINT [PK_TopicsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdatesTBL]    Script Date: 23/11/2020 21:28:01 ******/
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
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 23/11/2020 21:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[type] [bit] NULL,
	[repeat] [bit] NULL,
	[coincidental] [bit] NULL,
	[newsletter] [bit] NULL,
	[saveLike] [bit] NULL,
	[image_location] [varchar](max) NULL,
 CONSTRAINT [PK_UsersTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ALTER TABLE [dbo].[PlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistsTBL_UsersTBL] FOREIGN KEY([userId])
REFERENCES [dbo].[UsersTBL] ([id])
GO
ALTER TABLE [dbo].[PlaylistsTBL] CHECK CONSTRAINT [FK_PlaylistsTBL_UsersTBL]
GO
ALTER TABLE [dbo].[ResponsesToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_ResponsesTBL_ArticlesBTL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[ResponsesToArticlesTBL] CHECK CONSTRAINT [FK_ResponsesTBL_ArticlesBTL]
GO
ALTER TABLE [dbo].[ResponsesToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ResponsesToSongsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[ResponsesToSongsTBL] CHECK CONSTRAINT [FK_ResponsesToSongsTBL_SongsTBL]
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
ALTER TABLE [dbo].[SingersToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToParadeTBL_ParadeTBL] FOREIGN KEY([paradeId])
REFERENCES [dbo].[ParadeTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToParadeTBL] CHECK CONSTRAINT [FK_SingersToParadeTBL_ParadeTBL]
GO
ALTER TABLE [dbo].[SingersToParadeTBL]  WITH CHECK ADD  CONSTRAINT [FK_SingersToSurveyTBL_SingersTBL] FOREIGN KEY([paradeId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SingersToParadeTBL] CHECK CONSTRAINT [FK_SingersToSurveyTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_AlbumsTBL] FOREIGN KEY([albumId])
REFERENCES [dbo].[AlbumsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_AlbumsTBL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_SingersTBL]
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
ALTER TABLE [dbo].[SongsToPlaylistsSystemTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsSystemTBL_PlaylistsSystemTBL] FOREIGN KEY([playlistId])
REFERENCES [dbo].[PlaylistsSystemTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsSystemTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsSystemTBL_PlaylistsSystemTBL]
GO
ALTER TABLE [dbo].[SongsToPlaylistsSystemTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsSystemTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsSystemTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsSystemTBL_SongsTBL]
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsTBL_PlaylistsTBL] FOREIGN KEY([playlistId])
REFERENCES [dbo].[PlaylistsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsTBL_PlaylistsTBL]
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsToPlaylistsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsToPlaylistsTBL] CHECK CONSTRAINT [FK_SongsToPlaylistsTBL_SongsTBL]
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
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagsTypesTBL] FOREIGN KEY([tagTypeId])
REFERENCES [dbo].[TagsTypesTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagsTypesTBL]
GO
ALTER TABLE [dbo].[TagsToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToArticleTBL_ArticlesTBL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToArticlesTBL] CHECK CONSTRAINT [FK_TagsToArticleTBL_ArticlesTBL]
GO
ALTER TABLE [dbo].[TagsToArticlesTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToArticleTBL_TagsTBL] FOREIGN KEY([tagId])
REFERENCES [dbo].[TagsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToArticlesTBL] CHECK CONSTRAINT [FK_TagsToArticleTBL_TagsTBL]
GO
ALTER TABLE [dbo].[TagsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToSongsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToSongsTBL] CHECK CONSTRAINT [FK_TagsToSongsTBL_SongsTBL]
GO
ALTER TABLE [dbo].[TagsToSongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsToSongsTBL_TagNameTBL] FOREIGN KEY([tagId])
REFERENCES [dbo].[TagsTBL] ([id])
GO
ALTER TABLE [dbo].[TagsToSongsTBL] CHECK CONSTRAINT [FK_TagsToSongsTBL_TagNameTBL]
GO
USE [master]
GO
ALTER DATABASE [MusicOnline] SET  READ_WRITE 
GO
