USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 29/10/2020 19:07:24 ******/
CREATE DATABASE [MusicOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
	[subtitle] [varchar](300) NULL,
	[image_location] [varchar](max) NULL,
	[content] [varchar](max) NULL,
	[isPerformance] [bit] NULL,
 CONSTRAINT [PK_SongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[ResponsesToArticlesTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[ResponsesToSongsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  View [dbo].[latestResponses]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[itemsByParameter]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  View [dbo].[songsDetails]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  UserDefinedFunction [dbo].[itemByName]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[PlaylistsSystemTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
	[tagId] [int] NULL,
 CONSTRAINT [PK_PlaylistsSystemTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[SubscriptionTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[SurveyTBL]    Script Date: 29/10/2020 19:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyTBL](
	[id] [int] NOT NULL,
	[songId] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_SurveyTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsTypesTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[TopicsTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[UpdatesTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 29/10/2020 19:07:24 ******/
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
SET IDENTITY_INSERT [dbo].[AlbumsTBL] ON 

INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (1, N'מחשב מסלול מחדש')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (2, N'מאמין בניסים')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (3, N'קולות')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (4, N'MUSICA')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (5, N'אלבום החתונה')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (6, N'על הבמה')
SET IDENTITY_INSERT [dbo].[AlbumsTBL] OFF
SET IDENTITY_INSERT [dbo].[ArticlesTBL] ON 

INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (1, N'צפו: גדולי הזמר על במה אחת בסוכות', N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'כ"ח תשרי התשע"ט', CAST(N'2018-10-07T10:14:00.000' AS DateTime), NULL, N'for_articles/162576_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 7, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (2, N'אחים ושרים: ראיון משולש עם חיים ישראל, איציק ואבישי אשל', N'שלושה יוצרים נושאים את המוזיקה המזרחית חסידית על הגב שלהם, כל הדרך מתימן לפולין ובחזרה. התוצאה: תחייה רוחנית לז''אנר שחשב ללכת לאיבוד. חיים ישראל, איציק אשל, אבישי אשל - אחים ממשפחה טובה. הם דיברו ושרו וניגנו. ''בקהילה'' לחצו על ''פליי'' ומביאים את סיפורם', N'ב'' כסלו התשע"ה', CAST(N'2014-11-24T08:29:00.000' AS DateTime), N'articles_content/אחים-ושרים.txt', N'for_articles/46849_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'ברוך טולדנו / בקהילה', 27, 3, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (3, N'הרגע ששבר את פיני איינהורן בתהלוכת המרפסות בירושלים • צפו והאזינו', N' ביוזמתו של ראש עיריית ירושלים משה ליאון יצאה היום ''משאית השמחה'' שתטייל בשכונות ובהמשך גם בכל הארץ, היום היא היתה בבית וגן והיו עליה הזמר פיני איינהורן לצד אמן הקלידים איציק ויינגרטן ששימחו את התושבים, ב''זמן אוויר'' סיפר פיני על הרגע הכי מרגש במהלך ההופעה הניידת', N'כ״ז באדר תש״פ', CAST(N'2020-03-23T16:30:00.000' AS DateTime), NULL, N'for_articles/‏‏פיני-איינהורן-במשאית-השמחה-בירושלים.PNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 5, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (4, N'כשאברהם פריד הפתיע מהבידוד: "אף אחד לא מעז לומר לנו שאסור לשיר"', N'הזמר האהוב אברהם פריד הצליח להפתיע את הגולשים כשהעלה את הסרטון הזה מביתו. מה יש לו לומר לכם מהבידוד, ולמה אתם לא באמת לבד כשאתם בביתכם?', N'כ'' אייר התש"פ', CAST(N'2020-05-14T14:07:00.000' AS DateTime), NULL, N'for_articles/221607_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/avramfrid4.mp4', NULL, 78, 12, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (5, N'יעקב שוואקי מבקש שתשירו איתו בבית, אל תצאו החוצה', N'"נשארים בבית", מבקש יעקב שווקאי במסר מיוחד לגולשי הידברות, וגם - האזינו לשיר שהוא מגיש עם ברכת ישועות ונחמות לעם ישראל', N'ד'' ניסן התש"פ', CAST(N'2020-03-29T21:20:00.000' AS DateTime), NULL, N'for_articles/216402_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/swkey-corona.mp4', NULL, 65, 9, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (6, N'
"חמישיה מנצחת" האזינו לפינה וצפו בתוצאות>>>', N'
לאחר אלפי הצבעות, החמישיה המנצחת לפניכם.', N'
כ״ח בתשרי תשפ״א 
', CAST(N'2020-10-16T15:42:00.000' AS DateTime), NULL, N'for_articles/החמשיה-המנצחת.jpg', NULL, NULL, NULL, N'for_articles/החמשיה-המנצחת.mp3', NULL, NULL, NULL, 124, 37, 1)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (7, N'ענק: כששוואקי פרץ את החומות של חיים ישראל • שווה האזנה', N'אמש שחרר יעקב שוואקי את השיר "לדוד ה'' אורי וישעי", אותו הלחין יצהר ויינברג לפני הרבה שנים, בתוכנית ''זמן אוויר'' עם מנחם טוקר במסגרת הפינה הידועה ''המלחימים'' ובעריכה משעשעת הראה עורך אתר ''קול חי'' דוד קליגר לטוקר כיצד ''פרץ'' יעקב שואקי את ''חומות של תקווה'' שירו של חיים ישראל • שווה האזנה', N'ג׳ באלול תש״פ', CAST(N'2020-08-23T18:05:00.000' AS DateTime), NULL, N'for_articles/יעקב-שוואקי-על-החומות-840x494c.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/9b1acf0ba589500a16df7250da0d425f.mp4', N'אתר קול חי בהגשת מנחם טוקר ובעריכת דוד קליגר', 86, 25, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (8, N'קליפ מרהיב: שמחת בית השואבה בחדר האוכל של ישיבת חברון', N'ישיבת חברון המשמשת כמלונית קורונה לכלל עולם התורה והישיבות חגגה את שמחת בית השואבה המרכזית בחדר האוכל לחולים יחד עם הקלידן יואלי דיקמן והזמר שלמה כהן בריקודים סוחפים אל תוך הלילה. צפו בוידאו של הצלם יהודה רוזן', N'כ'' תשרי תשפ"א', CAST(N'2020-10-08T22:52:00.000' AS DateTime), NULL, N'for_articles/7948cc984ba5daec55f3.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/0_mrgmoz6z_0_w5ygeeua_2.mp4', NULL, 142, 34, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (9, N'צפו: משה קליין וישראל סוסנה במופע לצרפתים', N'במהלך חול המועד סוכות הופיע הזמר משה קליין במופע מיוחד שנועד לקהל הצרפתי בארץ ובעולם בליווי תזמורתו של ישראל סוסנה. צפו בקטע נבחר מתוך המופע', N'ל'' תשרי תשפ"א', CAST(N'2020-10-18T09:24:00.000' AS DateTime), NULL, N'for_articles/44627d09e5908bf6978f.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/klayin1810.mp4', NULL, 76, 11, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (10, N'מאחורי הקלעים של המוזיקה: יואלי דיקמן בהצצה נדירה לאולפן', N'אם שאלתם את עצמכם איך נוצר שיר? איך מופק אלבום? ומה מתחולל בתוככי האולפנים הסגורים? יואלי דיקמן מנפיק טעימה מתוך הקלטות שמבוצעות בימים אלה עבור גדולי הזמר החסידי: מרדכי בן דוד, זאנוויל וינברגר ואברהם פריד שיראו אור בקרוב • צפו', N'יג'' תשרי תשפ"א', CAST(N'2020-10-01T14:10:00.000' AS DateTime), NULL, N'for_articles/ad3d30daf911afb494dc.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/dikman0110.mp4', NULL, 87, 18, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (11, N'מאיר גרין בגרסת קורונה ל"שבט אחים ואחיות"', N'הזמר והיוצר מאיר גרין משעשע בקאבר סאטירי ללהיט "שבט אחים ואחיות", במילים חדשות שכתב על תקופת הקורונה • על העיבוד עדי נתנאלי והמקצבים שלו', N'א'' חשון התשפ"א', CAST(N'2020-10-19T13:16:00.000' AS DateTime), NULL, N'for_articles/87m8uj97__w658h439q95.jpg', NULL, NULL, NULL, N'for_articles/מאיר-גרין-שבט-אחים-ואחיות-קורונה.mp3', NULL, NULL, N'יאיר פרידמן מ''בחזית המדיה''', 131, 42, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (12, N'ישי ריבו, ליפא שמעלצר, משה דוויק ו''ידידים''', N'מתכנת המוזיקה עדי נתנאלי מארח את גדולי הזמר החסידי בקליפ הדגמה חדש לאורגני YAMAHA • צפו במחרוזת הייחודית של ישי ריבו, ליפא שמעלצר משה דוויק ו''ידידים''', N'י"ז אלול התש"פ', CAST(N'2020-09-06T18:38:00.000' AS DateTime), N'articles_content/עדי-נתנאלי-מדגים.txt', N'for_articles/באולפן-של-עדי-נתנאלי.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/עדי-נתנאלי-ומיטב-האמנים-בהדגמה-לאורגני-YAMAHA-ישי-ריבו-ליפא-שמלצר-מקהלת-ידידים-משה-דוואק-1.mp4', NULL, 87, 15, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (13, N'יעקב שוואקי בקליפ תמיכה בנשיא טראמפ', N'יעקב שוואקי נותן כתף במערכת הבחירות לנשיאות ארצות הברית ומשחרר קליפ אולפני בו הוא מכריז על תמיכתו בנשיא דונלד טראמפ לכהונה נוספת: We Love America', N'כ"ה אב התש"פ', CAST(N'2020-08-15T22:48:00.000' AS DateTime), NULL, N'for_articles/maxresdefault-2020-08-16T225547.470.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/Shwekey-We-Love-America.mp4', N'יאיר פרידמן מ''בחזית המדיה''', 92, 9, NULL)
SET IDENTITY_INSERT [dbo].[ArticlesTBL] OFF
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
SET IDENTITY_INSERT [dbo].[ArtistsTBL] OFF
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
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[FollowUpTBL] ON 

INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (3, NULL, N'bsd.odaya@gmail.com', 62, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1005, NULL, N'bsd.odaya@gmail.com', 71, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1006, NULL, N'bsd.odaya@gmail.com', NULL, 4)
SET IDENTITY_INSERT [dbo].[FollowUpTBL] OFF
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
SET IDENTITY_INSERT [dbo].[JobTBL] OFF
SET IDENTITY_INSERT [dbo].[PlaylistsSystemTBL] ON 

INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (25, N'מזרחי', N'מיטב השירים המזרחיים', 460, N'for_playlists/musical-percussion-instrument-drum-bongo_169016-302.jpg', 8)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (26, N'שירי נשמה', N'מיטב שירי הרגש לנשמה', 471, N'for_playlists/acoustic-guitar-tree_1426-614.jpg', 4)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (27, N'להיטים', N'להיטים בכל הסגנונות', 283, N'for_playlists/alphacolor-66JMudIjDTw-unsplash.jpg', 22)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (28, N'על הקצב', N'כנסו לקצב ותתחילו לרקוד :)', 545, N'for_playlists/drums-cymbals-hi-hat-beautiful-recording-studio_169016-3801.jpg', 2)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (29, N'על הדרך', N'נוסעים לטיול? הפלייסט בדיוק בשבילכם', 602, N'for_playlists/colorful-bicycle-with-guitar-meadow_1150-7721.jpg', 26)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (30, N'חתונה', N'פלייליסט לחתן וכלה במזל"ט', 302, N'for_playlists/flower-wedding-event_1150-5631.jpg', 12)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (31, N'על הבוקר', N'פלייליסט לבוקר על רגל ימין', 527, N'for_playlists/abstract-photo-music-piano-jazz-music_136559-247.jpg', 1030)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (32, N'ימי הספירה', N'מיטב השירים הווקאליים', 127, N'for_playlists/microphone-conference_1232-1150.jpg', 10)
SET IDENTITY_INSERT [dbo].[PlaylistsSystemTBL] OFF
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] ON 

INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (1, 1, N'שירים חדשים')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (2, 1, N'חסידי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (3, 2, N'מזרחי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (4, 2, N'אקפלה')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (5, 1, N'אקפלה')
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] OFF
SET IDENTITY_INSERT [dbo].[ReportsTBL] ON 

INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status]) VALUES (1, N'איציק דדיה', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status]) VALUES (2, N'עצבני', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ReportsTBL] OFF
SET IDENTITY_INSERT [dbo].[ResponsesToArticlesTBL] ON 

INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (45, 1, N'לא ידוע', N'אהבתי', N'שילוב מדהיםםם של זמרים!!', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (46, 2, N'ממש מרוגש!', N'מושללללללם', NULL, CAST(N'2019-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (47, 1, N'לא חשוב מה השם', N'באמת כתבה יפה', NULL, CAST(N'2019-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (48, 3, N'מישהו לענין :)', N'לייק', NULL, CAST(N'2020-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (49, 2, N'אורגניסט', N'שיר חזק!!!!', NULL, CAST(N'2020-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (50, 3, N'בני ברקי', N'ממש מחזק.', N'כל הכבוד להם! באמת!!!', CAST(N'2018-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (51, 1, N'משהו שאכפת לו', N'באמת יפה', NULL, CAST(N'2019-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (53, 1, N'מוזיקאליייי', N'חמוווווד. נמואל הרוש זמר ענקקקקק!', N'', CAST(N'2020-10-01T12:15:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (54, 1, N'מתופף', N'גם שלוימי גרטנר זמר עם קול טוב לא פחות', N'❤❤❤', CAST(N'2020-10-01T12:32:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (55, 4, N'מוזיקאליייי', N'אין כמו אברהם פריד!!!!', N'זמר ענקקק כל שיר שלו להיטטט 👍', CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (56, 4, N'יאיר', N'מגניבבבבב', N'', CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (57, 6, N'מוזיקאליייי', N'נושא תפילה של איציק דדיה צריך להיות מקום ראשון!!!', N'מכניס בכיס הקטן את ככככככל השירים ששמעתי עד היוםםם', CAST(N'2020-10-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ResponsesToArticlesTBL] OFF
SET IDENTITY_INSERT [dbo].[ResponsesToSongsTBL] ON 

INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1, 58, N'מישהו שמבין', N'שיר מושלם', N'ברמה אחרת מכל השירים שלו עד היום.', CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (2, 59, N'חסוי', N'שיר מרגש ממש', N'שומע אותו בלופ. נדיררר!', CAST(N'2020-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (3, 59, N'אוהב מוזיקה!', N'זמר ענקקקק עם שיר מושלםםםם!!!', N'סוג של כישרון להוציא להיטים אחד אחרי השני.', CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (4, 65, N'אוהב את אברהם פריד!', N'מלךךך הזמר הזה', N'איך תמיד הוא יודע להוציא שיר להיט? כל שיר שלו תופס חזק ולא שוכחים אותו כל כך מהר. איןןןן כמו אברהם פריד הוא משהו מיוחד! הרבה הצלחה', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (5, 65, N'מישהו', N'שיר אופטימי ושמח :)', N'לא מרגיש לכם שאוטוטו המשיח מגיע אחרי כזה שיר?? אהבתיייי', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (6, 65, N'המגיב השלישי :)', N'איזה שיררר. תודה למיוזיק אונליין שהעלו אותו', N'מדהיםםםם', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (7, 61, N'נ נח נחמ נחמן מאומן', N'אין כמו שיר על רבי נחמן!', N'שיר אלוףףף!!! תמשיך להוציא כאלו שירים יפיםםםם.', CAST(N'2020-09-23T19:02:54.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (8, 63, N'אוהב מוזיקה', N'ווווווווווואו איזה שיר מדליקקקק!!!', N'אבי אילסון זמר ענקקקק! כל שיר שלו טיללל.', CAST(N'2020-09-23T20:16:47.147' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (9, 57, N'המגיבה הראשונה!!', N'שיר להיטטטטטט', N'תזכרו שאמרתי. זה יהיה להיט חזק!', CAST(N'2020-09-23T20:58:46.887' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (10, 57, N'מבין בלהיטים', N'נחיה ונראה... לא כ"כ חושב אבל זה שיר יפה ללא ספק.', NULL, CAST(N'2020-09-23T21:10:35.447' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (11, 62, N'יאיר', N'שיר מושלםםםםם!!!!!!!! אחלה שיר, אחלה זמר!', N'כל כך מתאים לתקופה ולגמרי רלוונטי.
נהנה לשמוע שוב ושוב ושוב... ולא נמאס בכללל!', CAST(N'2020-09-24T00:53:51.840' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (12, 62, N'חסוי', N'וווווואו!! תפתחו >', N'חשבתי שיהיה קשה לשחזר את ההצלחה של השיר נכספתי... הייתי בטווווח שכל שיר שיוציאו אחריו לא יהיה ברמה שלו כי נכספתי באמתתת שיר טיללללל וההפקה שלו כל כך מקצועית ומדהימההה.
אבל חשבתי! כי השיר הזה פשוט אלוףףףףףף!!!!!', CAST(N'2020-09-24T01:09:28.160' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (13, 62, N'מישהווווו', N'ממש מחזק בתקופה הזו', N'תודה רבה על השיר המחזק.
נותן לי כוח בתקופה הזו של הקורונה שבעזרת ה'' תעבוררר, אמן!', CAST(N'2020-09-24T01:36:25.337' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (14, 66, N'משה', N'כמה חיכינו שקובי ברומר יוציא שיר.. והנה זה בא!', N'שיר שכייףףף לשמוע!', CAST(N'2020-09-24T01:39:40.323' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (15, 66, N'אוהב מוזיקה', N'שילוב מוצלח של קובי ברומר עם שולי רנד, תצליחו! :)', NULL, CAST(N'2020-09-24T01:42:04.427' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (16, 70, N'תימני', N'שיר חמודדד', N'זמר גדולללל.
אוהב את השירים שלו!', CAST(N'2020-09-24T01:59:05.773' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (17, 60, N'מישהווווו', N'שיר טיל!!!! ממש אהבתי', NULL, CAST(N'2020-09-24T02:07:47.927' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (18, 60, N'חסוי', N'מישהו יודע מתי הוא מוציא את האלבום הרביעי?', N'מזמן כתבו שהוא עומד לצאת... ', CAST(N'2020-09-24T02:10:03.530' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (19, 60, N'מאיר', N'נראה לי אחרי החגים', NULL, CAST(N'2020-09-24T02:11:25.800' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (20, 60, N'חסוי', N'למאיר - תודה :)', NULL, CAST(N'2020-09-24T02:15:23.620' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (21, 64, N'מעריץ של שוואקי', N'איזה זמררר איזה שיר!!', N'אגב - מזל טוב לחתונת הבת :)
שיר ממש יפה', CAST(N'2020-09-24T02:18:17.477' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (22, 64, N'אוהב מוזיקה', N'חמודדד!', N'שיר קליל וחמוד', CAST(N'2020-09-24T02:22:05.953' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (23, 63, N'משה', N'שיר חמוד!', N'דומה קצת לסגנון של שוואקי', CAST(N'2020-09-24T02:27:39.627' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (24, 63, N'קלידן מקצועי', N'תגובה למשה', N'וואי נכון!
באמת מזכיר אותו קצת בקול ובסגנון של השיר.', CAST(N'2020-09-24T02:30:21.607' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (25, 56, N'מוזיקאי', N'שיר חזק זמרים גדוליםםם!', NULL, CAST(N'2020-09-24T02:35:47.307' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (26, 56, N'נתיבותניק', N'שיר כ"כ מרגששש', N'כייף לשיר אותו! לחן מדהיםםם.', CAST(N'2020-09-24T02:44:42.867' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (27, 56, N'עוד נתיבותניק ;)', N'כמה עוצמה ורגש שיש בשיר הזהההה!!', NULL, CAST(N'2020-09-24T02:49:06.613' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (28, 56, N'ירושלמי', N'שמתי לב שזה הולך פה לפי ערים... זורם אתכם ;)', N'שיר מוצלחחח. שאפו לזמרים המוכשרים!', CAST(N'2020-09-24T02:51:25.513' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (29, 59, N'חסוי', N'וואו שילוב טוב!', NULL, CAST(N'2020-09-24T03:39:00.377' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (30, 71, N'אלוףףףףף!!!!!', N'איזה שיררררררררר פשוט שלמוווווווותתתתתתתתת', N'שיר טיללללל, זמר ענקקקקקקק וקליפ מדהיםםםםםםםםםםםםם = להיט!', CAST(N'2020-09-25T02:04:00.317' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (31, 71, N'יוווווווואאאאו מדהיםםם', N'סופסוףףףףף קליפ מושקע ולא רק קליפ מילים...!', N'קליפ מושקע ומדהיםםםם', CAST(N'2020-09-25T02:07:43.243' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (32, 71, N'מוזיקאי ;)', N'יש לו פשוט קול נדירררררר', N'שימישיך להוציא עוד המון שירים כאלו מושקעים ואלופים', CAST(N'2020-09-25T02:09:25.167' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (33, 71, N'אחד', N'וואו איזה שיר מלא ברגש! כ"כ מתאים לתקופה', N'יישר כוח!!!!', CAST(N'2020-09-25T02:10:38.483' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (34, 71, N'מישהווווו', N'למוזיקאי - מסכים איתך בהחלט!! :)', N'נדירררררר ברמות אחרות!!', CAST(N'2020-09-25T02:14:28.473' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1040, 72, N'דוד ל.', N'וואו שיר יפההה!', N'אהבתי. תמשיך להוציא כאלו שרים יפים עם קליפים מושקעיםםם', CAST(N'2020-09-30T21:41:14.400' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1041, 72, N'מוזיקאליייי', N'מגניבבבבב', NULL, CAST(N'2020-09-30T21:44:09.243' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1042, 71, N'מוזיקאליייי', N'מדהיםםםםםםםםםםםםםםםםםםםםםםם', N'פצצה של שיררררררר
טיללללל!!!!!!!!!!', CAST(N'2020-09-30T21:48:10.707' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1043, 71, N'חיפאי', N'מגניבבבבב', N'קליפ מושקע חבלזזזזזז', CAST(N'2020-09-30T21:48:58.953' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1044, 71, N'יאיר', N'וווווווואו וואו וואו! ענקקקק!', N'❤❤❤', CAST(N'2020-09-30T22:38:03.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[ResponsesToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] ON 

INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (1, 1, 1, 1, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (2, 1, 2, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] OFF
SET IDENTITY_INSERT [dbo].[SingersTBL] ON 

INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (1, N'אברהם פריד', N'singers/אברהם-פריד.bmp', 415)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (2, N'יעקב שוואקי', N'singers/יעקב-שוואקי.jpg', 418)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (3, N'מרדכי בן דוד', N'singers/מרדכי-בן-דוד.jpg', 423)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (4, N'איציק דדיה', N'singers/איציק-דדיה.jpg', 394)
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
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (15, N'גד אלבז', N'singers/גד-אלבז.jpg', 321)
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
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (28, N'עוזיה צדוק', N'singers/עוזיה-צדוק.jpg', 247)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (29, N'ישי ריבו', N'singers/ישי-ריבו.jpg', 381)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (30, N'מוטי שטיינמץ', N'singers/מוטי-שטיינמץ.jpg', 287)
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
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (53, N'איציק-וינגרטן', NULL, 21)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (54, N'נהוראי אריאלי', NULL, 56)
INSERT [dbo].[SingersTBL] ([id], [name], [image], [searchings]) VALUES (55, N'אברימי רוט', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (56, N'אלוקי נשמה', N'איציק-דדיה\אלוקי נשמה.mp4', N'video', CAST(N'2018-10-11T00:00:00.000' AS DateTime), 4, 19, 64, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'for_songs/איציק-דדיה/אלוקי-נשמה-יוטיוב-560x316.jpeg', N'songs_content/איציק-דדיה/איציק-דדיה-ויניב-בן-משיח–אלוקי-נשמה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (57, N'האמונה בוערת', N'איציק-דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17T00:00:00.000' AS DateTime), 4, 9, 57, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'for_songs/איציק-דדיה/53646183_2533434770004335_7805584894150574080_o-560x315.jpg', N'songs_content/איציק-דדיה/איציק-דדיה-בסינגל חדש-''האמונה-בוערת''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (58, N'נכספתי', N'איציק-דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09T00:00:00.000' AS DateTime), 4, 50, 104, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'for_songs/איציק-דדיה/211576_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/איציק-דדיה-חוזר-במוסיקה-מקורית-ובוגרת-יותר-''נכספתי''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (59, N'אנא', N'איציק-דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30T00:00:00.000' AS DateTime), 4, 11, 69, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'for_songs/איציק-דדיה/223388_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/מאט-דאב-ואיציק-דדיה-בדוא-''אנא''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (60, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12T00:00:00.000' AS DateTime), 4, 14, 74, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', N'כמידי שנה בשנה, בהתקרב חודש אלול והימים הנוראים מוציא איציק דדיה שיר "ברסלבי" חדש. לפני שנתיים כבש איציק את עולם המוזיקה היהודית עם הלהיט "רבי נחמן" שצבר מיליוני צפיות ביוטיוב, בשנה שעברה הוא עשה זאת שוב עם "אין ייאוש בעולם" וכעת ההיסטריה עומדת לחזור על עצמה עם להיט חדש בשם "בדרך לאומן".

', N'for_songs/איציק-דדיה/cover-27-560x373.jpg', N'songs_content/איציק-דדיה/איציק-דדיה-בלהיט-חדש–''בדרך-לאומן''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (61, N'בדרך לאומן - קליפ', N'איציק-דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26T00:00:00.000' AS DateTime), 4, 27, 86, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', N'כמידי שנה בשנה, בהתקרב חודש אלול והימים הנוראים מוציא איציק דדיה שיר "ברסלבי" חדש. לפני שנתיים כבש איציק את עולם המוזיקה היהודית עם הלהיט "רבי נחמן" שצבר מיליוני צפיות ביוטיוב, בשנה שעברה הוא עשה זאת שוב עם "אין ייאוש בעולם" וכעת ההיסטריה עומדת לחזור על עצמה עם להיט חדש בשם "בדרך לאומן".

', N'for_songs/איציק-דדיה/da-560x321.png', N'songs_content/איציק-דדיה/איציק-דדיה-בדרך-לאומן–הקליפ-הרשמי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (62, N'כוכבים', N'איציק-דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23T12:13:00.000' AS DateTime), 4, 45, 234, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'for_songs/איציק-דדיה/‏‏file.jpg', N'songs_content/איציק-דדיה/איציק-דדיה-בסינגל-חדש-''כוכבים-נופלים''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (63, N'תן לי אור', N'אבי-אילסון\אבי אילסון - תן לי אור.mp3', N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), 13, 21, 78, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'for_songs/אבי-אילסון/231862_tumb_750Xauto.jpg', N'songs_content/אבי-אילסון/אבי-אילסון-בשיר-חדש-ומאיר-עם-קליפ-מרהיב-''תן-לי-אור''.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (64, N'מסיני בא', N'יעקב-שוואקי\יעקב שוואקי - מסיני בא.mp4', N'video', CAST(N'2020-02-11T12:08:00.000' AS DateTime), 2, 12, 143, NULL, N'יעקב שוואקי בסינגל לקראת חתונת בתו: "מסיני בא"', N'יעקב שוואקי הלחין את המילים שכותב רש"י לפרשת יתרו בשם מכילתא, לכבוד חתונתה של בתו. האזינו', N'for_songs/יעקב-שוואקי/211577_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/מסיני-בא.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (65, N'אוטוטו', N'אברהם-פריד\אברהם-פריד-אוטוטו-Avraham-Fried-OhToToh.mp4', N'video', CAST(N'2020-08-23T22:31:00.000' AS DateTime), 1, 54, 305, NULL, N'שיר ראשון מתוך אלבום חסידי חדש: אברהם פריד עם "אוטוטו"', N'אברהם פריד מתקרב סופסוף להשקת האלבום החסידי החדש שלו, שיצא לאור בעז"ה אחרי החגים. בינתיים הוא מגיש סינגל ראשון מתוכו: "אוטוטו". צפו בקליפ המילים', N'for_songs/אברהם-פריד/234162_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אוטוטו.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (66, N'כמה טוב ה''', N'קובי-ברומר\כמה-טוב-ה-I-קובי-ברומר-Kama-Tov-Hashem-I-Kobi-Brummer.mp4', N'audio', CAST(N'2020-08-15T00:00:00.000' AS DateTime), 44, 3, 35, NULL, N'קובי ברומר בסינגל חדש – כמה טוב ה''', N'הזמר קובי ברומר מוציא סינגל חדש בשם ''כמה טוב ה" מתוך אלבום בכורה שיצא בקרוב.', N'for_songs/קובי-ברומר/‏‏כמה-טוב-ה.PNG', N'songs_content/קובי-ברומר/כמה-טוב-ה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (67, N'שיבוא', N'אבי-אילסון\אבי אילסון - שיבוא.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), 13, 11, 87, NULL, N'אבי אילסון פותח את הקיץ: "שיבוא"', N'בעיצומה של המערכה השניה של מערכת הבחירות רוויית הקיטוב בין הזרמים בעם, מגיש הזמר אבי אילסון שיר רווי אמונה בציפיה למשיח שיבוא.', N'for_songs/אבי-אילסון/שיבוא.jpg', N'songs_content/אבי-אילסון/‏‏שיבוא.PNG', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (68, N'אבא', N'אברהם-פריד\אברהם פריד & ארי היל - אבא.mp3', N'audio', CAST(N'2019-06-05T14:45:00.000' AS DateTime), 1, 32, 415, NULL, N'אברהם פריד בדואט נפלא עם ארי היל: "אבא"', N'את השיר "אבא" כתב והלחין בנצי שטיין, וכאשר שמע את ארי היל שר אותו, הציע לאברהם פריד להפוך אותו לדואט. התוצאה נפלאה', N'for_songs/אברהם-פריד/189747_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אבא.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (69, N'בידיים טובות', N'בני-פרידמן\בני-פרידמן-בידיים-טובות-ווקאלי.mp3', N'audio', CAST(N'2020-04-30T00:00:00.000' AS DateTime), 6, 1, 24, NULL, N'בני פרידמן – בידיים טובות – ווקאלי', N'לאחר צאת אלבומו הווקאלי "לחישות הלב", משחרר הזמר בני פרידמן סינגל מתוך הדיסק – בידיים טובות.', N'for_songs/בני-פרידמן/בני-פרידמן-בידיים-טובות-ווקאלי.jpg', N'songs_content/בני-פרידמן/בידיים-טובות.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (70, N'נעשה שמח', N'מידד-טסה\מידד טסה - נעשה שמח.mp4', N'video', CAST(N'2020-08-12T11:37:00.000' AS DateTime), 7, 7, 36, NULL, N'מידד טסה בפרק חדש בחיים המוסיקליים: "נעשה שמח"', N'מידד טסה בסינגל חדש ומקפיץ, עם קליפ תואם: "נעשה שמח". צפו', N'for_songs/מידד-טסה/232760_tumb_750Xauto.jpg', N'songs_content/מידד-טסה/נעשה-שמח.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (71, N'נושא תפילה', N'איציק-דדיה\איציק-דדיה-נושא-תפילה-Itzik-Dadya-Nose-Tfila (1).mp4', N'video', CAST(N'2020-09-23T12:28:00.000' AS DateTime), 4, 55, 342, NULL, N'איציק דדיה בסינגל תפילה חדש: "נושא תפילה"', N'איציק דדיה מחדש את השיר המוכר "נושאת תפילה" בגרסה מיוחדת, שמתאימה במיוחד לימים המורכבים הללו. צפו גם בקליפ', N'for_songs/איציק-דדיה/240204_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/240204_tumb_750Xauto.jpg', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (72, N'ימי הרחמים', N'מאיר-גרין\מאיר-גרין-ימי-רחמים5.mp4', N'video', CAST(N'2020-08-30T00:21:00.000' AS DateTime), 36, 41, 330, NULL, N'מאיר גרין בסינגל קליפ חדש – "ימי רחמים"', N'צפו בזמר והיוצר מאיר גרין בסינגל קליפ - חדש - אשר אותו כתב יחד עם הרב שלו - הרב חיים הורביץ על תקופת ימי הרחמים והסליחות', N'for_songs/מאיר-גרין/מאיר-גרין-ימי-הרחמים.PNG', N'songs_content/מאיר-גרין/ימי-הרחמים-מאיר-גרין.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (73, N'כתר מלוכה', N'ישי-ריבו\ישי ריבו - כתר מלוכה.mp3', N'audio', CAST(N'2020-04-01T13:03:00.000' AS DateTime), 29, 62, 470, NULL, N'ישי ריבו זועק את זעקתה של התקופה בשיר חדש: "כתר מלוכה"', N'בימים שבהם אנחנו מופרדים ומתרחקים, וגם לומדים להתקרב בדרכים אחרות, ישי ריבו זועק את זעקת הימים בכנות פשוטה ובקריאה של קרבה לבורא עולם. האזינו', N'for_songs/ישי-ריבו/236650_tumb_750Xauto.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (74, N'לא לפחד', N'שמחה-פרידמן\שמחה פרידמן - לא לפחד.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), 17, 13, 243, NULL, N'שמחה פרידמן בסינגל חדש: "לא לפחד"', N'אחרי מספר להיטים בראשם הלהיט ''יתגדל'' מגיש הזמר שמחה פרידמן סינגל נוסף ''לא לפחד''', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-לא-לפחד.jpg', N'songs_content/שמחה-פרידמן/לא-לפחד.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (75, N'סוכה ולולב', N'איציק-אשל\1231.mp4', N'video', CAST(N'2020-10-04T00:00:00.000' AS DateTime), 19, 5, 39, NULL, N'

איציק אשל וישי לפידות מגישים: "סוכה ולולב"', N'מתוך הסדרה החדשה - "איציק אשל וחברים שרים לכבוד החגים"', N'for_songs/איציק-אשל/סוכה-ולולב-איציק-אשל-וישי-לפידות.PNG', N'songs_content/איציק-אשל/סוכה-ולולב.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (76, N'אין עוד מלבדו', N'מרדכי-שפירא\1215.mp4', N'video', CAST(N'2020-09-29T00:00:00.000' AS DateTime), 48, 13, 75, NULL, N'מרדכי שפירא בסינגל - קליפ חדש: "אין עוד מלבדו"', N'כוכב הזמר החסידי מרדכי שפירא מגיש סינגל חדש ומקפיץ: "אין עוד מלבדו"', N'for_songs/מרדכי-שפירא/אין-עוד-מלבדו-מרדכי-שפירא.PNG', N'songs_content/מרדכי-שפירא/אין-עוד-מלבדו.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (77, N'נרקוד', N'אריק-דביר\אריק דביר - נרקוד.mp3', N'audio', CAST(N'2018-08-12T09:47:00.000' AS DateTime), 31, 12, 81, NULL, N'אריק דביר בסינגל בכורה אחרי 13 שנים של הופעות: "נרקוד"', N'אריק דביר כבר מופיע על במות שונות בישראל זה 13 שנה, אך כעת הוא מוציא סוף כל סוף את הסינגל הראשון שלו, "נרקוד". האזינו', N'for_songs/אריק-דביר/157438_tumb_750Xauto.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (78, N'טעיתי', N'חיים-ישראל\חיים ישראל - טעיתי.mp3', N'audio', CAST(N'2018-08-28T00:00:00.000' AS DateTime), 10, 52, 281, NULL, N'חיים ישראל בסינגל חדש לימים הנוראים: "טעיתי"', N'הזמר והיוצר חיים ישראל משיק סינגל חדש בשם "טעיתי", בלדה מרגשת וסוחפת, שאת מילותיו כתבו אלי קשת ועציון מוסאי, הלחן של רביב בן מנחם. העיבוד וההפקה המוסיקלית של אלי קשת', N'for_songs/חיים-ישראל/טעיתי-חיים-ישראל.PNG', N'songs_content/חיים-ישראל/טעיתי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (79, N'ישתבח שמו', N'יעקב-שוואקי\ישתבח שמו.mp3', N'audio', CAST(N'2018-05-31T00:00:00.000' AS DateTime), 2, 85, 386, 4, N'יעקב שוואקי בשיר חדש: "ישתבח שמו"', N'יעקב שוואקי חוגג אלבום פלטינה, ומשיק היום את הוידאו קליפ "ישתבח שמו" מהלהיטים הבולטים באלבומו האחרון MUSICA.

המילים של מרים ישראלי, לחן והפקה מוזיקלית איצי וולדנר, והעיבוד תמיר צור.', N'for_songs/יעקב-שוואקי/PIC-8-1-560x373.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (80, N'א ב ג', N'יעקב-שוואקי\Shwekey.mp4', N'video', CAST(N'2018-05-02T11:07:00.000' AS DateTime), 2, 14, 342, 4, N'השיר הראשון שאתם צריכים לשמוע בל"ג בעומר: "אלף-בית-גימל"', N'יעקב שוואקי פותח את יום ל"ג בעומר בשיר חדש ומקפיץ: "אלף-בית-גימל". צפו בקליפ המילים', N'for_songs/יעקב-שוואקי/146812_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/א-ב-ג.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (81, N'I Can Be', N'יעקב-שוואקי\', NULL, CAST(N'2020-06-15T13:59:00.000' AS DateTime), 2, 64, 407, NULL, N'יעקב שוואקי בעיבוד חדש ומרענן לשירו "I Can Be"', N'את העיבוד החדש מגיש שוואקי לקראת אירוע לייב עבור הסנטר לילדים מיוחדים. האזינו לגרסה החדשה', N'for_songs/יעקב-שוואקי/225464_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/I-Can-Be.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (82, N'אבאלה', N'גד-אלבז\גד אלבז - אבאלה.mp3', N'video', CAST(N'2019-06-27T00:00:00.000' AS DateTime), 15, 69, 406, NULL, N'איציק דדיה הלחין, גד אלבז שר "אבאלה"', N'הזמר גד אלבז בסינגל חדש וקיצבי "אבאלה", את הלחן לשיר כתב הזמר איציק דדיה, העיבוד האלקטרוני של יוחנן אורי.', N'for_songs/גד-אלבז/אבאלה.jpg', N'songs_content/גד-אלבז/אבאלה', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (83, N'הלב שלי', N'ישי-ריבו\הלב שלי.mp4', N'video', CAST(N'2019-08-12T11:26:00.000' AS DateTime), 29, 89, 417, NULL, N'ישראל סוסנה ותזמורתו מארחים את דוד אסרף בשירו של ישי ריבו, "הלב שלי"', N'מוצאי תשעה באב תשע"ט, ולקראת אלבום נעימות חדש, ישראל סוסנה ותזמורתו מארחים את אמן הסקסופון דוד אסרף, לביצוע קסום ומרגש לשירו של ישי ריבו, "הלב שלי". האזינו', N'for_songs/ישי-ריבו/הלב-שלי.jpg', N'songs_content/ישי-ריבו/הלב-שלי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (84, N'חתן כלה', N'שמחה-פרידמן\שמחה פרידמן - חתן כלה .mp4', N'video', CAST(N'2017-06-01T00:00:00.000' AS DateTime), 17, 38, 227, NULL, N'שמחה פרידמן בלהיט חתונות חדש – "חתן כלה"', N'אחרי הלהיט ''בקרוב (יתגדל)'', והסינגל הישראלי ''עבור מישהו אחר'', חוזר אלינו הזמר החסידי שמחה פרידמן עם שיר חסידי אותנטי, שנכתב במיוחד עבור רחבות הריקודים של החתונות: ''חתן כלה''', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-חתן-כלה.jpg', N'songs_content/שמחה-פרידמן/חתן-כלה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (85, N'עוד יבוא יום', N'שמחה-פרידמן\שמחה פרידמן - עוד יבוא היום .mp4', N'video', CAST(N'2020-02-06T00:00:00.000' AS DateTime), 17, 21, 142, NULL, N'שמחה פרידמן משיק סינגל חדש: "עוד יבוא היום"', N'הזמר החסידי שמחה פרידמן משיק היום סינגל חדש, שביעי במספר, מתוך אלבום הבכורה שלו, המתקרב ובא. שם הסינגל הינו "עוד יבוא היום"', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-עוד-יבוא-היום.jpg', N'songs_content/שמחה-פרידמן/עוד-יבוא-היום.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (86, N'בקרוב (יתגדל)', N'שמחה-פרידמן\שמחה פרידמן - בקרוב (יתגדל)  .mp4', N'video', CAST(N'2016-06-09T00:00:00.000' AS DateTime), 17, 32, 240, NULL, N'בכורה: להיט חדש לזמר שמחה פרידמן – "בקרוב"', N'מילות השיר מדברות על הצורך להקדיש בכל יום כמה דקות של רגעי תפילה וחיבור לבורא, ומעניקות פרשנות ייחודית למילים הידועות מהקדיש: "יתגדל ויתקדש שמיה רבא"!', N'for_songs/שמחה-פרידמן/שמחה-פרידמן-בקרוב.jpg', N'songs_content/שמחה-פרידמן/בקרוב.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (87, N'לשמח כלה', N'אבי-מן\לשמח כלה.mp4', N'video', CAST(N'2017-06-12T09:10:00.000' AS DateTime), 37, 29, 148, NULL, N'"לשמח כלה": להיט החתונות לקיץ הקרוב', N'אבי מן הוא זמר ומוסיקאי שכבר הופיע על מאות במות בחתונות, דינרים ואירועים מכל הסוגים. כעת הוא יוצא עם סינגל ראשון שעשוי להפוך להיות להיט החתונות הבא, בזכות הקצב הנהדר והלחן של אלי קליין, והיכולות הווקאליות של אבי מן. הסינגל בחסות המפיק פנחס בן נאים. האזינו', N'for_songs/אבי-מן/לשמח-כלה.jpg', N'songs_content/אבי-מן/לשמח-כלה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (88, N'השבעתי', N'אבי-מן\השבעתי.mp4', N'video', CAST(N'2020-01-20T11:54:00.000' AS DateTime), 37, 21, 103, NULL, N'אבי מן בסינגל מלא ערגה: "השבעתי"', N'אבי מן מגיש סינגל חדש ומרגש, המדבר על הגלות ועל הציפייה לגאולה, בלחן של האמרגן פנחס בן נאים. צפו גם בקליפ המושקע', N'for_songs/אבי-אילסון/השבעתי.jpg', N'songs_content/אבי-מן/השבעתי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (89, N'לשוב הביתה', N'ישי-ריבו\לשוב הביתה.mp4', N'video', CAST(N'2017-11-29T14:39:00.000' AS DateTime), 29, 35, 247, NULL, N'ישי ריבו בסינגל חדש - "לשוב הביתה"', N'בדרך לאלבום השלישי, ואחרי הצלחה גדולה עם הסינגל הראשון "הנה ימים באים", הזמר האהוב מסתער על הפלייליסט עם שיר חדש, מפתיע ומרגש – "לשוב הביתה". האלבום המלא ייצא במהלך החורף הקרוב', N'for_songs/ישי-ריבו/לשוב-הביתה.jpg', N'songs_content/ישי-ריבו/לשוב-הביתה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (90, N'נפשי', N'ישי-ריבו\נפשי.mp4', N'video', CAST(N'2018-06-10T10:16:00.000' AS DateTime), 29, 76, 407, NULL, N'דואט נדיר וראשון מסוגו של שטיינמץ וריבו', N'מוטי שטיינמץ וישי ריבו בשיר מרגש במיוחד, "נפשי". זהו מפגש בין שני עולמות דומים מאד ושונים מאד. האזינו', N'for_songs/ישי-ריבו/נפשי.jpg', N'songs_content/ישי-ריבו/נפשי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (91, N'מיי דיר ראבע', N'בני-פרידמן\מיי דיר ראבע.mp4', N'video', CAST(N'2020-04-12T00:00:00.000' AS DateTime), 6, 85, 102, NULL, N'בני פרידמן ואיצי וואלדנר בקליפ חדש: "מיי דיר ראבע"', N'הזמר בני פרידמן מארח את המלחין איצי וואלדנר בקליפ חדש "מיי דיר ראבע" (הרבי היקר שלי), השיר מוקדש למורים בתלמודי התורה. המילים של מירי ישראלי, העיבוד של אברימי ברקו. צפו', N'for_songs/בני-פרידמן/מיי-דיר-ראבע.png', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (92, N'הריני מקבל', N'בני-פרידמן\הריני מקבל.mp4', N'video', CAST(N'2019-09-05T12:04:00.000' AS DateTime), 6, 45, 231, NULL, N'בני פרידמן בסינגל חדש: "הריני מקבל"', N'בני פרידמן יוצא בסינגל חדש שמדבר כולו על אהבת ישראל. האזינו', N'for_songs/בני-פרידמן/הריני-מקבל.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (93, N'חארשו', N'בני-פרידמן\חארשו.mp4', N'video', CAST(N'2020-08-03T08:12:00.000' AS DateTime), 6, 67, 258, NULL, N'"חראשו" של בני פרידמן, עכשיו בגרסת הרמיקס הרשמית', N'השיר "חראשו", להיט במגוון שפות של בני פרידמן, זוכה לעיבוד רמיקס של די.ג''יי נדב ביטון. האזינו', N'for_songs/בני-פרידמן/חארשו.jpg', N'songs_content/בני-פרידמן/חארשו.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (94, N'כי אני יהודי', N'מאיר-גרין\כי אני יהודי.mp4', N'video', CAST(N'2019-03-04T13:01:00.000' AS DateTime), 36, 67, 319, NULL, N'מאיר גרין בסינגל חדש ומקפיץ: "כי אני יהודי"', N'מאיר גרין בסינגל על האתגר שלנו, להתגבש ולשמור על אחדות העם, עם קליפ מגוון ומדויק. צפו', N'for_songs/מאיר-גרין/כי-אני-יהודי.jpg', N'songs_content/מאיר-גרין/כי-אני-יהודי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (95, N'עוד אבינו חי', N'מאיר-גרין\עוד אבינו חי.mp4', N'video', CAST(N'2020-01-12T14:14:00.000' AS DateTime), 36, 46, 145, NULL, N'מאיר גרין בסינגל חדש ומקפיץ: "עוד אבינו חי"', N'מאיר גרין יוצא בסינגל חדש אחרי כמה הצלחות קודמות, הפעם עם השיר האמוני "עוד אבינו חי". צפו גם בקליפ המילים', N'for_songs/מאיר-גרין/עוד-אבינו-חי.jpg', N'songs_content/מאיר-גרין/עוד-אבינו-חי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (96, N'רק לתת', N'אלי-הרצליך\רק לתת.mp4', N'video', CAST(N'2020-08-18T13:52:00.000' AS DateTime), 34, 18, 117, NULL, N'אלי הרצליך בסינגל קליפ חדש: "רק לתת"', N'אלי הרצליך מגיש סינגל חדש המדבר על החשיבות הגדולה של הנתינה ושל הצדקה. צפו בקליפ המושקע', N'for_songs/אלי-הרצליך/רק-לתת.jpg', N'songs_content/אלי-הרצליך/רק-לתת.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (97, N'עמך עמי', N'נפתלי-קמפה\עמך עמי.mp4', N'video', CAST(N'2020-01-27T10:45:00.000' AS DateTime), 49, 65, 102, NULL, N'נפתלי קמפה בסינגל חדש לקראת האלבום המתקרב: "עמך עמי"', N'אלבומו השני של נפתלי קמפה עתיד לצאת בט"ו בשבט הקרוב, ועד אז הוא משחרר סינגל נוסף מתוך האלבום, "עמך עמי", למילים מתוך מגילת רות. האזינו', N'for_songs/נפתלי-קמפה/עמך-עמי.jpg', N'songs_content/נפתלי-קמפה/עמך-עמי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (98, N'דיייי', N'מרדכי-בן-דוד\די.mp4', N'video', CAST(N'2020-05-12T09:30:00.000' AS DateTime), 3, 95, 245, NULL, N'מרדכי בן דוד בשיר חדש לל"ג בעומר: "דיייייי"', N'את השיר הלחין מרדכי בן דוד לפני כשלושה שבועות, בעיצומה של מגיפת הקורונה. כעת הוא משחרר אותו בתפילה לרפואה שלמה לכל החולים. האזינו', N'for_songs/מרדכי-בן-דוד/דיייי.jpg', N'songs_content/מרדכי-בן-דוד/די.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (99, N'סדר העבודה', N'ישי-ריבו\סדר העבודה.mp4', N'video', CAST(N'2020-09-02T13:26:00.000' AS DateTime), 29, 86, 104, NULL, N'ישי ריבו בסינגל נוסף מהאלבום המתקרב: "סדר העבודה" בלייב', N'שיר נוסף מהאלבום שיצא בשבוע הבא, והפעם "סדר העבודה" בביצוע לייב שהוקלט במשכן לאומנויות הבמה. צפו', N'for_songs/ישי-ריבו/סדר-העבודה.jpg', N'songs_content/ישי-ריבו/סדר-העבודה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (100, N'אלול תשע"ט', N'ישי-ריבו\אלול תשעט.mp4', N'video', CAST(N'2019-09-15T12:49:00.000' AS DateTime), 29, 103, 420, NULL, N'ישי ריבו משחרר את אלבומו המצופה. האזינו ל"אלול תשע"ט"', N'ישי ריבו משחרר היום את אלבומו, שרבים ציפו לו, "אלול תשע"ט". האזינו לשיר הנושא של האלבום', N'for_songs/ישי-ריבו/אלול-תשעט.jpg', N'songs_content/ישי-ריבו/אלול-תשעט.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (101, N'לא רעב ללחם', N'פיני-איינהורן\לא רעב ללחם.mp4', N'video', CAST(N'2019-09-25T10:45:00.000' AS DateTime), 5, 61, 201, NULL, N'פיני איינהורן בסינגל מתוך האלבום הקרב: "לא רעב ללחם"', N'באווירת ימי הרחמים והסליחות, ולקראת אלבום הבכורה "פיני" שיצא לאור במוצאי שבת בראשית, משחרר פיני איינהורן סינגל מרגש ואקטואלי: "לא רעב ללחם". האזינו', N'for_songs/פיני-איינהורן/לא-רעב-ללחם.jpg', N'songs_content/פיני-איינהורן/לא-רעב-ללחם.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (102, N'הכל משמים', N'מרדכי-שפירא\הכל משמים.mp4', N'video', CAST(N'2019-06-13T13:22:00.000' AS DateTime), 48, 75, 298, NULL, N'מרדכי שפירא מציג אלבום שלישי: "הכל משמים"', N'לאחר שני אלבומים קודמים, משיק מרדכי שפירא את אלבומו השלישי, הכולל שירים בעברית ובאנגלית. האזינו לשיר הנושא מתוך האלבום', N'for_songs/מרדכי-שפירא/הכל-משמים.PNG', N'songs_content/מרדכי-שפירא/הכל-משמים.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (103, N'בקש עבדך', N'ישי-לפידות\בקש עבדך.mp4', N'video', CAST(N'2020-07-22T14:13:00.000' AS DateTime), 42, 107, 468, NULL, N'"בקש עבדך" - ישי לפידות בסינגל חדש • האזינו', N'ישי לפידות, מגדולי הזמרים והמלחינים, משיק הערב, מוצאי ראש השנה, סינגל חדש - "בקש עבדך", אותו כתב והלחין הראל טל, וחושף מה עומד מאחורי השיר החדש (מוזיקה)', N'for_songs/ישי-לפידות/בקש-עבדך.jpg', N'songs_content/ישי-לפידות/בקש-עבדך.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (104, N'ברכו את ה''', N'משה-קליין\ברכו את ה.mp4', N'video', CAST(N'2018-02-19T09:00:00.000' AS DateTime), 43, 26, 128, NULL, N'משה קליין בסינגל קצבי חדש: "ברכו את ה''"', N'בימים שבהם מרבים שמחה, יוצא משה קליין בסינגל חדש שכולו שמחה והודאה לה''. האזינו', N'for_songs/משה-קליין/ברכו-את-ה.jpg', N'songs_content/משה-קליין/ברכו-את-ה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (105, N'נס', N'משה-קליין\נס.mp4', N'video', CAST(N'2019-06-13T13:24:00.000' AS DateTime), 43, 45, 135, NULL, N'משה קליין מודה על הנס שנעשה לו, בשיר "נס"', N'לפני כחודש עלה רכבו של משה קליין באש. הזמר ניצל מהשריפה בנס – וכך גם תיק התפילין שלו. מיד לאחר מכן פנה קליין למלחין אלחנן אלדד, ויצר את השיר האופטימי הזה. האזינו', N'for_songs/משה-קליין/נס.jpg', N'songs_content/משה-קליין/נס.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (106, N'הזמן של השמחה', N'שלום-ברנהולץ\הזמן של השמחה.mp4', N'video', CAST(N'2019-08-15T11:33:00.000' AS DateTime), 14, 57, 274, NULL, N'שלום ברנהולץ בסינגל בכורה: "הזמן של השמחה"', N'אחרי שנים של הופעות באירועים, שלום ברנהולץ משחרר סינגל בכורה מקפיץ במיוחד לעונת החתונות, "הזמן של השמחה". האזינו', N'for_songs/שלום-ברנהולץ/הזמן-של-השמחה.png', N'songs_content/שלום-ברנהולץ/הזמן-של-השמחה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (107, N'אתה קרוב', N'שלום-ברנהולץ\אתה קרוב.mp4', N'video', CAST(N'2020-02-02T20:51:00.000' AS DateTime), 14, 23, 125, NULL, N'שלום ברנהולץ בסינגל נוסף לקראת אלבום הבכורה: "אתה קרוב"', N'שלום ברנהולץ בשיר חדש המעצים את ההכרה במציאות הקרובה של הקב"ה, עם מילות תפילה מרגשות. האזינו', N'for_songs/שלום-ברנהולץ/אתה-קרוב.jpg', N'songs_content/שלום-ברנהולץ/אתה-קרוב.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (108, N'נשמח עם החתן', N'אוהד-מושקוביץ\נשמח עם החתן.mp4', N'video', CAST(N'2017-08-07T17:56:00.000' AS DateTime), 39, 31, 267, NULL, N'אוהד מושקוביץ חוזר לשנות השבעים עם "נשמח עם החתן"', N'עונות החתונות נפתחה, ואוהד מושקוביץ משחרר את הסינגל החדש שלו, ''נשמח עם החתן'' - להיט חתונות מקפיץ. השיר נכתב ועובד בסגנון וינטג'', עם עיבוד מיוחד בסגנון שנות ה-70', N'for_songs/אוהד-מושקוביץ/נשמח-עם-החתן.jpeg', N'songs_content/אוהד-מושקוביץ/נשמח-עם-החתן.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (109, N'מחילה', N'אבישי-אשל\אבישי-אשל-מחילה.mp4', N'video', CAST(N'2020-09-08T14:06:00.000' AS DateTime), 50, 14, 92, NULL, N'אבישי אשל בסינגל חדש ומרגש לימי הרחמים והסליחות: "מחילה"', N'אבישי אשל בסינגל שנוצר מתוך רצון לאהבה ולסליחה, מתוך אמונה שהמסר יחלחל ללבבות ויגרום לאהבת ישראל בין כולנו. האזינו', N'for_songs/אבישי-אשל/237055_tumb_750Xauto.jpg', N'songs_content/אבישי-אשל/מחילה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (110, N'אבקש פניך', N'יונתן-שיינפלד\יונתן שינפלד - אבקש פניך.mp3', N'audio', CAST(N'2020-09-03T00:00:00.000' AS DateTime), 45, 7, 64, NULL, N'
יונתן שינפלד בסינגל חדש ''אבקש פניך''', N'יונתן שינפלד בסינגל חדש לקראת הימים הנוראים – "אבקש פניך"', N'for_songs/יונתן-שיינפלד/אבקש-פניך.jpeg', N'songs_content/יונתן-שיינפלד/אבקש-פניך.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (111, N'מתנות החיים', N'חיים-ישראל\חיים ישראל - מתנות חיים.mp3', N'audio', CAST(N'2020-08-18T00:00:00.000' AS DateTime), 10, 13, 86, NULL, N'סינגל חדש: חיים ישראל – מתנות החיים', N'"מתנות החיים" - סינגל חדש ואישי ביותר של חיים ישראל שמדבר על יחסי אב ובנו, צמיחתו של הבן ו"ארגז הכלים" שנותן אבא לבן', N'for_songs/חיים-ישראל/מתנות-חיים.jpg', N'songs_content/חיים-ישראל/מתנות-החיים.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (112, N'בשובך', N'גד-אלבז\בשובך.mp4', N'video', CAST(N'2020-08-07T22:07:00.000' AS DateTime), 15, 29, 167, NULL, N'גד אלבז מחדש את "בשובך"', N'בעקבות המצב, מחדש גד אלבז את שירו ''בשובך'' מתוך האלבום מילים של רוח.', N'for_songs/גד-אלבז/בשובך.jpg', N'songs_content/גד-אלבז/בשובך.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (113, N'אבא טוב', N'אבישי-אשל\אבישי-אשל-אבא-טוב.mp4', N'video', CAST(N'2020-05-25T14:55:00.000' AS DateTime), 50, 34, 185, NULL, N'אבישי אשל בבלדה מרגשת: "אבא טוב"', N'שירו של אבישי אשל, "אבא טוב", הוא דיאלוג בין האדם הקטן לגדלותו ולחסדו של הבורא. האזינו', N'for_songs/אבישי-אשל/אבישי-אשל-אבא-טוב.jpg', N'songs_content/אבישי-אשל/אבא-טוב.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (114, N'מחרוזת לג בעומר עם בני פרידמן', N'בני-פרידמן\מחרוזת-לג-בעומר.mp4', N'video', CAST(N'2020-05-12T09:27:00.000' AS DateTime), 6, 137, 204, NULL, N'עמי כהן ובני פרידמן במחרוזת ל"ג בעומר', N'עמי כהן ובני פרידמן, יחד עם מקהלת "מלכות", במחרוזת שתגרום לכם להרגיש כאילו גם אתם הייתם במירון. האזינו', N'for_songs/בני-פרידמן/מחרוזת-לג-בעומר.jpg', N'songs_content/בני-פרידמן/מחרוזת-לג-בעומר.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (115, N'עוד אבינו חי - גרסת אקפלה', N'מאיר-גרין\מאיר-גרין\עוד אבינו חי.mp4', N'video', CAST(N'2020-04-22T13:54:00.000' AS DateTime), 36, 68, 143, NULL, N'מאיר גרין בגרסה ווקאלית לשירו "עוד אבינו חי"', N'מאיר גרין מגיש גרסה מיוחדת לימי ספירת העומר לשירו המוכר "עוד אבינו חי". האזינו', N'for_songs/מאיר-גרין/עוד-אבינו-חי-ווקאלי.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (116, N'בזכות הצדיק', N'איציק-וינגרטן\בזכות הצדיק.mp4', N'video', CAST(N'2020-05-12T21:56:00.000' AS DateTime), 53, 13, 68, NULL, N'איציק וינגרטן בסינגל-קליפ בכורה: "בזכות הצדיק"', N'איציק וינגרטן, אמן צעיר חדש במוסיקה החסידית, יוצא בסינגל בכורה אנרגטי לכבוד ל"ג בעומר. צפו גם בקליפ', N'for_songs/איציק וינגרטן/בזכות-הצדיק.jpg', N'songs_content/איציק וינגרטן/בזכות-הצדיק.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (117, N'שמח תמיד', N'איציק-וינגרטן\שמח תמיד.mp4', N'video', CAST(N'2020-08-13T10:44:00.000' AS DateTime), 53, 15, 87, NULL, N'איציק וינגרטן בקליפ שיגרום לכל אחד להיות "שמח תמיד"', N'איציק וינגרטן בסינגל שמח ומקפיץ למילותיו של ר'' נחמן מברסלב, עם קליפ מקורי ותוסס. צפו', N'for_songs/איציק וינגרטן/שמח-תמיד.jpg', N'songs_content/איציק וינגרטן/שמח-תמיד.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (118, N'שלום אדון עולם', N'גד-אלבז\גד אלבז - שלום אדון עולם.mp3', N'audio', CAST(N'2020-10-13T17:15:00.000' AS DateTime), 15, 27, 94, NULL, N'גד אלבז מרגש בסינגל חדש: "אדון עולם"', N'גד אלבז משיק סינגל חדש ומרגש במיוחד "שלום אדון עולם". השיר נכתב כחיזוק לתקופה הלא פשוטה שכולנו עוברים .', N'for_songs/גד-אלבז/שלום-אדון-עולם.PNG', N'songs_content/גד-אלבז/שלום-אדון-עולם.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (119, N'וקולו נשמע', N'משה-קליין\וקולו נשמע.mp4', N'video', CAST(N'2017-10-16T09:10:00.000' AS DateTime), 43, 26, 87, NULL, N'משה קליין בסינגל חדש: "וקולו נשמע"', N'משה קליין יוצא בסינגל חדש, הפעם שקט ומרגש בקולו הנעים. האזינו
', N'for_songs/משה-קליין/וקולו-נשמע.jpg', N'songs_content/משה-קליין/וקולו-נשמע.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (120, N'משאפ יהודי ישראלי', N'משה-קליין\משה קליין & קובי ברומר - משאפ יהודי ישראלי.mp4', N'video', CAST(N'2019-09-04T09:33:00.000' AS DateTime), 43, 23, 142, NULL, N'קובי ברומר ומשה קליין במשאפ יהודי ישראלי ראשון', N'המשאפ הראשון במוסיקה היהודית – קובי ברומר ומשה קליין מגישים משאפ של מגוון שירים יהודיים וישראליים. האזינו', N'for_songs/משה-קליין/משאפ-יהודי-ישראלי.jpg', N'songs_content/משה-קליין/משאפ-יהודי-ישראלי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (121, N'געוואלדיג', N'ליפא-שמעלצר\גיוועלדיג.mp4', N'video', CAST(N'2019-02-07T00:00:00.000' AS DateTime), 33, 37, 186, NULL, N'ליפא שמעלצר - "געוואלדיג"', N'צפו בלהיט מהאלבום החדש של ליפא שמעלצר "געוואלדיג געוואלדיג"', N'for_songs/ליפא-שמעלצר/', N'songs_content/ליפא-שמעלצר/', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (122, N'אוהד מושקוביץ וחברים במחרוזת להיטים', N'אוהד-מושקוביץ\oh01.mp4', N'video', CAST(N'2018-03-12T00:00:00.000' AS DateTime), 39, 14, 79, NULL, N'אוהד מושקוביץ וחברים במחרוזת להיטים', N'אוהד מושקוביץ בקליפ חדש עם מחרוזת מלהיטי התקופה שבה הוא מארח את איציק דדיה, להקת קינדרלעך ועוזיה צדוק ובליווי מקהלת ''ידידים''.', N'for_songs/אוהד-מושקוביץ/הופעה-מחרוזת-להיטים.PNG', N'performance_content/אוהד-מושקוביץ/אוהד-מושקוביץ-במחרוזת-להיטים.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (123, N'צפו: הבמה המרכזית • מופע סיום בין הזמנים עם חיים ישראל', N'חיים-ישראל\e2ad134dd83f2f0715c919e59c426292.mp4', N'video', CAST(N'2020-08-20T17:55:00.000' AS DateTime), 10, 37, 156, NULL, N'צפו: הבמה המרכזית • מופע סיום בין הזמנים עם חיים ישראל', N'סדרת "קיץ חי", מיזם הקיץ הגדול בתולדות המוזיקה היהודית של "קול חי", "קול חי מיוזיק" ודוד פדידה – הגיעה אמש אל סיומה בהופעה מלאה של ענקי הזמר חיים ישראל ומוטי שטיינמץ בליווי מוזיקלי של רובי בנט ורמי רבא. לצד מופע פתיחה של יואלי קליין והופעה מיוחדת של אמן אורח הפסנתרן והיוצר אחיה אשר כהן-אלורו.', N'for_songs/חיים-ישראל/קיץ-חי-חיים-ישראל-צילום-קובי-הרשברג-840x494c.jpg', N'songs_content/חיים-ישראל/הופעה-חג-בסוכות.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (124, N'אוהד מושקוביץ אירח את גדולי הזמר לשמחת חג • צפו', N'אוהד-מושקוביץ\1d391b3aac3d6fabd890ec56e3ea7516.mp4', N'video', CAST(N'2020-10-11T20:48:00.000' AS DateTime), 39, 24, 114, NULL, N'אוהד מושקוביץ אירח את גדולי הזמר לשמחת חג • צפו', N'במסגרת שמחת בית השואבה ששודרה לכל בית בארץ ובעולם ובהפקת ענק של ''קול חי'' ועיריית ירושלים ממגדל דוד. אירח גדול הזמר אוהד מושקוביץ את הזמר קובי ברומר בליווי מקהלת ''מלכות'' ותזמורתו של המאסטרו אהרל''ה נחשוני. זמר אורח: גיל ישראלוב. ילד הפלא: מוטי גרינבוים', N'for_songs/אוהד-מושקוביץ/WhatsApp-Image-2020-10-08-at-00.33.58-e1602438198818-840x494c.jpeg', N'songs_content/אוהד-מושקוביץ/הופעת-חג-בסוכות.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (125, N'הבמה המרכזית • צפו בשידור חוזר: אלי הרצליך מארח את פיני איינהורן ואבי אילסון', N'אלי-הרצליך\763d068fe1ea6193fc71acda9e1fe625.mp4', N'video', CAST(N'2020-08-18T18:45:00.000' AS DateTime), 34, 31, 127, NULL, N'הבמה המרכזית • צפו בשידור חוזר: אלי הרצליך מארח את פיני איינהורן ואבי אילסון', N'בסדרת "קיץ חי", מיזם הקיץ הגדול בתולדות המוזיקה היהודית של "קול חי", "קול חי מיוזיק" ודוד פדידה – הערב בהפקת וגשלובין הופיע אלי הרצליך עם מיטב הלהיטים ואירח את פיני איינהורן ואבי אילסון בליווי מוזיקלי של עמי כהן ותזמורתו. הנחה: אפרים קמיסר • צפו בשידור חוזר', N'for_songs/אלי-הרצליך/WhatsApp-Image-2020-08-18-at-11.24.24-1-e1597765462499-840x494c.jpeg', N'songs_content/אלי-הרצליך/הופעה-אלי-הרצליך-פיני-איינהורן-ואבי-אילסון-סוכות.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (126, N'והריני עבד', N'מידד-טסה\מידד טסה - והריני עבד.mp4', N'video', CAST(N'2019-10-22T21:34:00.000' AS DateTime), 7, 15, 72, NULL, N'מידד טסה בסינגל חדש: "והריני עבד"', N'מידד טסה משחרר את השיר שהתמודד בתחרות המלחינים עם מנחם טוקר ברדיו קול חי, ובוצע בגמר התחרות. לחן: יהודה יחזקאל. האזינו', N'for_songs/מידד-טסה/הריני-עבד.jpg', N'songs_content/גד-אלבז/והריני-עבד.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (127, N'מודה אני', N'נהוראי-אריאלי\נהוראי-אריאלי-מודה-אני.mp3', N'audio', CAST(N'2020-10-18T01:27:00.000' AS DateTime), 54, 30, 67, NULL, N'הסינגל החדש של נהוראי אריאלי – "מודה אני"', N'הזמר והיוצר הצעיר נהוראי אריאלי לא נח לרגע ומשיק כעת סינגל נוסף - "מודה אני".', N'for_songs/נהוראי-אריאלי/עטיפת-הסינגל-1-724x483.jpg', N'songs_content/נהוראי-אריאלי/מודה-אני.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (128, N'צועד קדימה', N'נהוראי-אריאלי\צועד.mp4', N'video', CAST(N'2020-06-24T00:00:00.000' AS DateTime), 54, 28, 89, NULL, N'"צועד קדימה": נהוראי אריאלי עם סינגל קליפ חדש', N'אחרי שלושה סינגלים מקוריים ומחרוזת חפלה, משחרר הכוכב נהוראי אריאלי שהתארס לפני כחודש סינגל רביעי – "צועד קדימה".', N'for_songs/נהוראי-אריאלי/מתוך-הקליפ.jpg', N'songs_content/נהוראי-אריאלי/צועד-קדימה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (129, N'מתנה', N'אודי-דמארי\אודי-ואורי-דמארי-מתנה-Udi-ori-Gift.mp3', N'audio', CAST(N'2020-10-19T13:41:00.000' AS DateTime), 38, 17, 56, NULL, N'אודי דמארי מארח את בנו אורי לדואט חדש - "מתנה"', N'הזמר והיוצר אודי דמארי מארח את בנו אורי לדואט מיוחד בסינגל חדש אותו כתב, הלחין, עיבד והפיק מוזיקלית בעצמו • האזנה עריבה', N'for_songs/אודי-דמארי/אודי-ואורי-דמארי-מתנה-Udi-ori-Gift.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (130, N'עמירן דביר, אריק דביר ו''נרננה'' בקומזיץ סוחף', N'אריק-דביר\אריק-ועמירן-דביר-ומקהלת-נרננה-קומזיץ-אלול-תש״פ-Arik-Amiran-Dvir-And-Neranena-Choir-LIVE.mp4', N'video', CAST(N'2020-09-13T03:00:00.000' AS DateTime), 31, 47, 184, NULL, N'עמירן דביר, אריק דביר ו''נרננה'' בקומזיץ סוחף', N'צמד האחים המוזיקאים עמירן ואריק דביר בקליפ מתוך קומזיץ לבחורי ישיבות, שם הופיעו יחד עם חברי מקהלת נרננה • צפו והיכנסו לאווירת הימים הנוראים', N'for_songs/אריק-דביר/קומזיץ-סוחף.jpg', NULL, 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (131, N'לבקש רחמים', N'אברהם-פריד\אברהם-פריד-לבקש-רחמים-Avraham-Fried-Levakesh-Rachamim.mp3', N'audio', CAST(N'2020-09-13T02:10:00.000' AS DateTime), 1, 39, 157, NULL, N'אברהם פריד מרגש בסינגל חדש לימים הנוראים - "לבקש רחמים"', N'ענק הזמר החסידי אברהם פריד משחרר סינגל חדש ברוח התקופה, פרי לחנו של אלי קליין, שגם אחראי על העיבוד יחד עם איצי ברי • האזינו ל"לבקש רחמים"', N'for_songs/אברהם-פריד/לבקש-רחמים.jpg', N'songs_content/אברהם-פריד/לבקש-רחמים.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (132, N'והרווח לנו', N'פיני-איינהורן\פיני-איינהורן-אהרלה-סמט-והרוח-לנו-Ahrele-Samet-Pini-Einhorn-Veharvach-Lanu.mp4', N'video', CAST(N'2020-08-28T00:55:00.000' AS DateTime), 5, 14, 72, NULL, N'פיני איינהורן ואהרל''ה סאמט בדואט מרגש - "והרווח לנו"', N'הזמרים פיני איינהורן ואהרל''ה סאמט בסינגל חדש, פרי לחנו של איצי ברי, שגם אחראי על העיבוד יחד עם אלי קליין, למילות ברכת המזון • צפו בקליפ מילים', N'for_songs/פיני-איינהורן/maxresdefault-2020-08-28T005628.981.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (133, N'אברהם פריד עם ניגון ההתעוררות מזלוטשוב - מרגש עד דמעות', N'אברהם-פריד\אברהם-פריד-ניגון-התעוררות-מר-מיכל-מזלוטשוב-Avraham-Fried-Reb-Michel-Zlotchover-Niggun.mp4', N'video', CAST(N'2020-08-24T09:33:00.000' AS DateTime), 1, 46, 204, NULL, N'אברהם פריד עם ניגון ההתעוררות מזלוטשוב - מרגש עד דמעות', N'ענק הזמר החסידי אברהם פריד בביצוע חי ודומע לניגון ההתעוררות העתיק המיוחס לר'' מיכל מזלוטשוב זי"ע, מתוך ההתוועדות המרכזית של יום ההילולא כ'' אב • צפו', N'for_songs/אברהם-פריד/אברהם-פריד-ניגון-התעוררות-מר-מיכל-מזלוטשוב-Avraham-Fried-Reb-Michel-Zlotchover-Niggun.jpg', NULL, 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (134, N'נושם שלמות', N'יואלי-דיקמן\יואלי-דיקמן-נושם-שלמות-Yoeli-Dikman-Noshem-Shlemut.mp4', N'video', CAST(N'2020-08-15T22:43:00.000' AS DateTime), 12, 12, 71, NULL, N'יואלי דיקמן "נושם שלמות" בסינגל חדש שהלחין', N'המפיק והמעבד המוזיקלי יואלי דיקמן משחרר שיר נוסף מתוך פרויקט הסולו שלו ''Number 1'', שכמו קודמיו, גם הוא פרי לחנו ועיבודו. המילים של יצחק הרץ • קליפ מילים', N'for_songs/יואלי-דיקמן/תמונת-יחצ.jpg', NULL, 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (135, N'ימים יפים', N'רולי-דיקמן\רולי-דיקמן-ימים-יפים-1.mp4', N'video', CAST(N'2020-08-10T22:13:00.000' AS DateTime), 11, 24, 112, NULL, N'לפני כולם: הקליפ הנוסטלגי של רולי דיקמן', N'הזמר והיוצר רולי דיקמן חוזר במנהרת הזמן אל הימים היפים של הדור שאינו, ומגיש לכם קליפ בטעם של פעם, עם מסר לדור ההווה ומוזיקה חדשנית של דור העתיד • צפו', N'for_songs/רולי-דיקמן/WhatsApp-Image-2020-08-10-at-21.54.51.jpeg', N'songs_content/רולי-דיקמן/ימים-יפים.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (136, N'שיר השמחה', N'שוקי-סלומון\שוקי-סלומון-וישי-לפידות-שיר-השמחה.mp3', N'audio', CAST(N'2020-08-10T18:09:00.000' AS DateTime), 51, 37, 167, NULL, N'שוקי סלומון מארח את ישי לפידות לקליפ חדש', N'היוצר וכוכב הרשת שוקי סלומון משחרר סינגל חדש בשם ''שיר השמחה'' שכתב והלחין בעצמו, כשאל הביצוע הוא צירף אליו את הכוכב הבלתי מעורער ישי לפידות • האזינו', N'for_songs/שוקי-סלומון/שיר-השמחה.jpg', N'songs_content/שוקי-סלומון/שיר-השמחה.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (137, N'תתחיל לחייך', N'נהוראי-אריאלי\תתחיל לחייך.mp4', N'video', CAST(N'2020-03-23T01:06:00.000' AS DateTime), 54, 27, 58, NULL, N'נהוראי אריאלי בסינגל חדש: "תתחיל לחייך"', N'הזמר והיוצר נהוראי אריאלי יוצא בסינגל שלישי, קצבי וקליט, אותו כתב והלחין בעצמו. האזינו', N'for_songs/נהוראי-אריאלי/215717_tumb_750Xauto.jpg', N'songs_content/נהוראי-אריאלי/תתחיל-לחייך.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (138, N'לעשות שמח', N'נהוראי-אריאלי\נהוראי-אריאלי-לעשות-שמח.mp3', N'audio', CAST(N'2019-08-13T10:00:00.000' AS DateTime), 54, 36, 71, NULL, N'נהוראי אריאלי בסינגל שני: "לעשות שמח"', N'נהוראי אריאלי רק בן 18 וחצי, וכבר מופיע באירועים רבים. לפני חודשיים השיק את סינגל הבכורה שלו, "הכל מובן", וכעת הוא יוצא בסינגל שני. האזינו', N'for_songs/נהוראי-אריאלי/עטיפת-הסינגל-768x432.jpg', N'songs_content/נהוראי-אריאלי/לעשות-שמח.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (139, N'אתה תמיד מרים אותי', N'רולי-דיקמן\רולי דיקמן - מרים אותי תמיד.mp3', N'audio', CAST(N'2019-07-02T10:58:00.000' AS DateTime), 11, 67, 97, NULL, N'רולי דיקמן בסינגל חדש: "אתה מרים אותי תמיד"', N'רולי דיקמן יוצא בסינגל חדש, שכמו מרבית שיריו, מתאפיין בסגנון מחזק ורווי תקווה. האזינו', N'for_songs/רולי-דיקמן/192011_tumb_750Xauto.jpg', N'songs_content/רולי-דיקמן/אתה-תמיד-מרים-אותי.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (140, N'בזכות התורה', N'מוטי-שטיינמץ\בזכות התורה מוטי שטיינמץ בסיומי השס של דירשו _ Motty Steinmetz In Dirshu Bizchut.mp4', N'video', CAST(N'2020-05-17T13:20:00.000' AS DateTime), 30, 254, 324, NULL, N'מוטי שטיינמץ שר "בזכות התורה" בסיומי הש"ס', N'מוטי שטיינמץ משחרר קליפ מהופעותיו בסיומי הש"ס שהתקיימו בתחילת השנה, עם השיר "בזכות התורה". צפו', N'for_songs/מוטי-שטיינמץ/221787_tumb_750Xauto.jpg', N'songs_content/מוטי-שטיינמץ/בזכות-התורה.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (141, N'לב נשבר', N'נפתלי-קמפה\videoplayback-1.mp4', N'video', CAST(N'2019-11-25T13:37:00.000' AS DateTime), 49, 52, 67, NULL, N'נפתלי קמפה בשיר חדש מתוך האלבום המתקרב: "לב נשבר"', N'נפתלי קמפה מתכונן ליציאה של אלבומו השני, ומגיש סינגל מרגש בלחנו האישי למילותיו של ר'' נחמן מברסלב. האזינו', N'for_songs/נפתלי-קמפה/LEV-768x432.jpeg', N'songs_content/נפתלי-קמפה/לב-נשבר.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (142, N'חסד שבחסד', N'אברמי-רוט\videoplayback-3-1.mp4', N'video', CAST(N'2020-06-07T13:38:00.000' AS DateTime), 55, 50, 90, NULL, N'אברימי רוט שר לרגל בר המצווה של בנו בכורו: "חסד שבחסד"', N'אברימי רוט חגג בר מצווה לבנו, לו המתין במשך 11 שנה. במקום השמחה הגדולה ומרובת המשתתפים, הפכה הקורונה את בר המצווה לאירוע קטן – אך ההודיה לה'' לא נפסקת. האזינו', N'for_songs/אברמי-רוט/224114_tumb_750Xauto.jpg', N'songs_content/אברמי-רוט/חסד-שבחסד.txt', 0)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (143, N'כל הנחלים', N'נפתלי-קמפה\כל-הנחלים-נפתלי-קמפה-בהופעה-Naftali-Kempeh-Kol-Hanechalim-LIVE.mp4', N'video', CAST(N'2019-02-21T12:05:00.000' AS DateTime), 49, 83, 104, NULL, N'נפתלי קמפה בהופעה חיה עם "כל הנחלים הולכים לים"', N'צפו בנפתלי קמפה מבצע את "כל הנחלים הולכים לים", במסגרת מופע ההשקה לאלבום הבכורה שלו, "ליחדא שמא"', N'for_songs/נפתלי-קמפה/179084_tumb_750Xauto.jpg', N'songs_content/נפתלי-קמפה/כל-הנחלים.txt', 1)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content], [isPerformance]) VALUES (144, N'סול מי', N'עמירן-דביר\עמירן-דביר-סול-מי.mp4', N'video', CAST(N'2020-08-05T13:02:00.000' AS DateTime), 32, 168, 247, NULL, N'עמירן דביר בשיר חדש לעונת החתונות: "סול מי"', N'עמירן דביר במילים חדשות ללחן איטלקי, ובשיר מקפיץ שמתאים בדיוק לעונת החתונות. האזינו', N'for_songs/עמירן-דביר/231863_tumb_750Xauto.jpg', N'songs_content/עמירן-דביר/סול-מי.txt', 0)
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] ON 

INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (1, 1, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (2, 2, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (3, 3, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (4, 3, 2)
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsTBL] ON 

INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1, N'סינגל', 6, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (2, N'קצבי', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (3, N'שקט', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (4, N'שירי נשמה', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (5, N'דואט', 6, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (6, N'רמיקס', 7, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (7, N'אלקטרוני', 4, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (8, N'מזרחי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (9, N'חסידי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (10, N'ווקאלי', 3, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (11, N'שבת', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (12, N'חתונה', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (13, N'פורים', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (14, N'מירון', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (15, N'חנוכה', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (16, N'ישראלי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (17, N'פופ', 4, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (18, N'ר'' נחמן', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (19, N'טראנס', 4, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (20, N'קאבר', 7, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (21, N'קליפ', 6, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (22, N'להיט', 6, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (23, N'סוכות', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (24, N'חג', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (25, N'שמחת בית השואבה', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (26, N'על הדרך', 8, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (27, N'תפילה', 5, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (28, N'ימים נוראים', 5, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1027, N'אברהם פריד', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1028, N'בידוד', 9, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1029, N'קורונה', 9, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1030, N'על הבוקר', 8, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1031, N'יעקב שוואקי', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1032, N'ר׳ שלום מרדכי רובשקין', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1033, N'אנגלית', 4, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1034, N'עיריית ירושלים', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1035, N'מגדל דוד', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1036, N'שלמה כהן', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1037, N'יואלי דיקמן', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1038, N'ישיבת חברון', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1039, N'מלונית קורונה', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1040, N'יהודה רוזן', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1041, N'משה קליין', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1042, N'ישראל סוסנה', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1043, N'חול המועד', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1044, N'צרפתים', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1045, N'מאחורי הקלעים', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1046, N'מרדכי בן דוד', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1047, N'זאנוויל וינברגר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1048, N'איך נוצר שיר?', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1049, N'לדוד', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1050, N'יצהר ויינברג', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1051, N'זמן אוויר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1052, N'מנחם טוקר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1053, N'חיים ישראל', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1054, N'המלחימים', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1055, N'דוד קליגר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1056, N'חומות של תקווה', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1057, N'מאיר גרין', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1058, N'עדי נתנאלי', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1059, N'שבט אחים ואחיות', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1060, N'סינטי מיוזיק', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1061, N'ישי ריבו', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1062, N'ליפא שמעלצר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1063, N'דוד איכילביץ''', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1064, N'יענקי רובין', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1065, N'משה דוויק', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1066, N'ידידים', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1067, N'נתנאל מנת', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1068, N'אילן לב', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1069, N'קומזיץ', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1070, N'זלוטשוב', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1071, N'ניגון', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1072, N'טראמפ', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1073, N'איצי וולדנר', 9, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1074, N'ישראל בסר', 9, 0)
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] ON 

INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (1, 23, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (2, 24, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (3, 25, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (4, 8, 2)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (5, 9, 4)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (6, 1027, 4)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (7, 1028, 4)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (8, 1029, 4)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (9, 1031, 5)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (10, 1029, 5)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (11, 9, 5)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (12, 1036, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (13, 1037, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (14, 1038, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (15, 1029, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (16, 1039, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (17, 1040, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (18, 25, 8)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (19, 1041, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (20, 1042, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (21, 1043, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (22, 23, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (23, 1044, 9)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (24, 1037, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (25, 1045, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (26, 1046, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (27, 1047, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (28, 1027, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (29, 1048, 10)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (30, 1031, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (31, 1049, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (32, 1050, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (33, 1051, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (34, 1052, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (35, 1053, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (36, 1054, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (37, 1055, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (38, 1056, 7)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (39, 1057, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (40, 1058, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (41, 1059, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (42, 1029, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (43, 20, 11)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (44, 1058, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (45, 1060, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (46, 1061, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (47, 1062, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (48, 1063, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (49, 1064, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (50, 1065, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (51, 1066, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (52, 1067, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (53, 1068, 12)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (54, 1031, 13)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (55, 1072, 13)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (56, 1073, 13)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (57, 1074, 13)
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] ON 

INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1, 56, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (2, 56, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (3, 56, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (4, 56, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (5, 56, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (6, 57, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (7, 57, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (8, 57, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (9, 58, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (10, 58, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (11, 58, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (12, 58, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (13, 58, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (14, 59, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (15, 59, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (16, 59, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (17, 59, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (18, 59, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (19, 60, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (20, 60, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (21, 60, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (22, 60, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (23, 60, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (24, 61, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (25, 61, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (26, 61, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (27, 61, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (28, 61, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (29, 61, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (30, 62, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (31, 62, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (32, 62, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (33, 62, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (34, 62, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (35, 63, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (36, 63, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (37, 63, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (38, 63, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (39, 64, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (40, 64, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (41, 64, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (42, 64, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (43, 64, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (44, 65, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (45, 65, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (46, 65, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (47, 65, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (48, 66, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (49, 66, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (50, 66, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (51, 67, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (52, 67, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (53, 68, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (54, 68, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (55, 68, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (56, 68, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (57, 68, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (58, 68, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (59, 67, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (60, 69, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (61, 69, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (62, 69, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (63, 70, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (64, 70, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (65, 70, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (66, 71, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (67, 71, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (68, 71, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (69, 71, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (70, 71, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (71, 71, 20)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (72, 71, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (73, 71, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (74, 72, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (75, 72, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (76, 72, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (77, 72, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (78, 72, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (79, 72, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1066, 73, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1067, 73, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1068, 73, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1069, 73, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1070, 73, 1029)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1072, 74, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1073, 74, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1074, 74, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1075, 75, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1076, 75, 23)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1077, 75, 25)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1078, 75, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1079, 76, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1080, 76, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1081, 76, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1082, 77, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1083, 77, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1084, 77, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1085, 77, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1086, 76, 26)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1087, 78, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1088, 78, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1089, 78, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1090, 78, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1091, 78, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1092, 80, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1093, 80, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1094, 80, 1030)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1095, 80, 1032)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1096, 79, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1097, 79, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1098, 79, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1099, 79, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1100, 81, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1101, 81, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1102, 81, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1103, 81, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1104, 81, 1033)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1105, 82, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1106, 82, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1107, 82, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1108, 82, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1109, 86, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1110, 86, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1111, 86, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1112, 86, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1113, 84, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1114, 84, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1115, 84, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1116, 84, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1117, 84, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1118, 85, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1119, 85, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1120, 87, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1121, 87, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1122, 87, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1123, 87, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1124, 88, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1125, 88, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1126, 88, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1127, 88, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1128, 88, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1129, 89, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1130, 89, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1131, 89, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1132, 89, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1133, 83, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1134, 83, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1135, 83, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1136, 83, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1137, 90, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1138, 90, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1139, 90, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1140, 90, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1141, 90, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1142, 90, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1143, 91, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1144, 91, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1145, 91, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1146, 91, 1033)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1147, 92, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1148, 92, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1149, 92, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1150, 92, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1151, 92, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1152, 93, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1153, 93, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1154, 93, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1155, 93, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1156, 93, 19)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1157, 93, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1158, 93, 1033)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1159, 94, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1160, 94, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1161, 94, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1162, 94, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1163, 95, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1164, 95, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1165, 95, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1166, 95, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1167, 95, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1168, 96, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1169, 96, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1170, 96, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1171, 96, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1172, 96, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1173, 97, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1174, 97, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1175, 97, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1176, 97, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1177, 98, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1178, 98, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1179, 98, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1180, 98, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1181, 98, 1029)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1182, 99, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1183, 99, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1184, 99, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1185, 99, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1186, 99, 22)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1187, 140, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1188, 100, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1189, 100, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1190, 100, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1193, 100, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1195, 101, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1196, 101, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1197, 101, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1198, 101, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1199, 101, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1206, 102, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1207, 102, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1208, 102, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1209, 102, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1210, 102, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1211, 102, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1212, 102, 1033)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1213, 103, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1214, 103, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1215, 103, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1216, 103, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1217, 103, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1218, 104, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1219, 104, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1220, 104, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1221, 105, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1222, 105, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1223, 105, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1224, 106, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1225, 106, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1226, 106, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1227, 106, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1228, 106, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1229, 106, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1230, 107, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1231, 107, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1232, 107, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1233, 107, 7)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1234, 107, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1235, 108, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1236, 108, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1237, 108, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1238, 108, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1239, 109, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1240, 109, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1241, 109, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1242, 109, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1243, 109, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1244, 109, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1245, 110, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1246, 110, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1247, 110, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1248, 110, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1249, 111, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1250, 111, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1251, 111, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1252, 112, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1253, 112, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1254, 112, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1255, 112, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1256, 112, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1257, 112, 1029)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1258, 113, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1259, 113, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1260, 113, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1261, 113, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1262, 113, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1263, 114, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1264, 114, 24)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1265, 114, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1266, 114, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1267, 114, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1268, 114, 14)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1269, 115, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1270, 115, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1271, 115, 10)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1272, 115, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1273, 116, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1274, 116, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1275, 116, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1276, 116, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1277, 116, 14)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1278, 116, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1279, 117, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1280, 117, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1281, 117, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1282, 117, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1283, 117, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1284, 119, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1285, 119, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1286, 119, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1287, 119, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1288, 120, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1289, 120, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1290, 120, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1291, 120, 20)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1292, 122, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1293, 122, 6)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1294, 123, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1295, 123, 23)
GO
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1296, 124, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1297, 124, 23)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1298, 124, 1034)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1299, 124, 1035)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1300, NULL, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1301, 125, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1302, 125, 23)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1303, 126, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1304, NULL, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1305, 126, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1306, 126, 23)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1309, 126, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1310, 126, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1311, 118, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1312, 118, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1313, 118, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1314, 118, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1315, 127, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1316, 127, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1317, 127, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1318, 127, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1319, 128, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1320, 128, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1321, 128, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1322, 128, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1323, 129, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1324, 129, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1325, 129, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1326, 129, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1327, 130, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1328, 130, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1329, 130, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1331, 131, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1332, 131, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1333, 131, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1334, 131, 28)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1335, 132, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1336, 132, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1337, 132, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1338, 132, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1339, 130, 1069)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1340, 133, 1070)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1341, 133, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1342, 133, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1343, 133, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1344, 133, 1071)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1345, 134, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1346, 134, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1347, 134, 1030)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1348, 135, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1349, 135, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1350, 135, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1351, 135, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1352, 136, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1353, 136, 5)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1354, 136, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1355, 136, 26)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1356, 137, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1357, 137, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1358, 138, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1359, 138, 8)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1360, 139, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1361, 139, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1362, 139, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1363, 139, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1364, 139, NULL)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1365, 140, 1)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1366, 140, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1367, 140, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1368, NULL, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1369, 140, 22)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1370, 140, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1371, 141, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1372, 141, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1373, 141, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1374, 141, 18)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1375, 141, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1376, 142, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1377, 142, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1378, NULL, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1379, 142, 21)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1380, 142, 27)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1381, 142, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1382, 143, 3)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1383, 143, 4)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1384, NULL, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1385, 143, 9)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1386, 144, 2)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1387, 144, 7)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1388, 144, 12)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1389, 144, 16)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1390, 144, 17)
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1391, 144, 19)
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsTypesTBL] ON 

INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (1, N'ג''אנר')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (2, N'מקצב')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (3, N'ווקאלי')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (4, N'סגנון')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (5, N'נושא')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (6, N'מידע')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (7, N'עיבוד')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (8, N'פלייליסט')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (9, N'כתבות')
SET IDENTITY_INSERT [dbo].[TagsTypesTBL] OFF
SET IDENTITY_INSERT [dbo].[TopicsTBL] ON 

INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (1, N'ראשי', NULL, N'for_topics/3782176.jpg', N'home', N'dashboard')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (2, N'חדש במוזיקה', N'כל השירים והקליפים החדשים', N'for_topics/3782176.jpg', N'song', N'headset')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (3, N'פלייליסטים', N'פלייליסטים בכל סגנון ולכל זמן', N'for_topics/piano-keys-made-with-black-white-paper-yellow-backdrop_23-2147926855.jpg', N'playlists', N'equalizer')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (4, N'מגזין', N'כל החדשות והסקופים המעניינים במוזיקה היהודית', N'for_topics/magazines2.png', N'magazine', N'queue_music')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (5, N'הופעות', NULL, NULL, N'performance', N'mic')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href], [icon]) VALUES (6, N'חיפוש חכם', NULL, NULL, NULL, N'search')
SET IDENTITY_INSERT [dbo].[TopicsTBL] OFF
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (1, N'הודיה עזרן', N'hodaya@gmail.com', N'123456', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (2, N'אודיה אושרי', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (3, N'נרשם לרשימת תפוצה', N'abcde@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (4, N'נרשם לאתר', N'fghij@gmail.com', N'gb4$4s&g01', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (5, NULL, N'nhvgfh@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (6, NULL, N'jhkhkhj@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (7, N'רחל כהן', N'rachel@gmail.com', N'hhi544jk', 1, 0, 0, 0, 1, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (8, N'חיים', N'haim@gmail.com', N'5XBaN@c52gNsHiK', 1, 0, 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[UsersTBL] OFF
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
ALTER TABLE [dbo].[PlaylistsSystemTBL]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistsSystemTBL_TagsTBL] FOREIGN KEY([tagId])
REFERENCES [dbo].[TagsTBL] ([id])
GO
ALTER TABLE [dbo].[PlaylistsSystemTBL] CHECK CONSTRAINT [FK_PlaylistsSystemTBL_TagsTBL]
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
ALTER TABLE [dbo].[SurveyTBL]  WITH CHECK ADD  CONSTRAINT [FK_SurveyTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[SurveyTBL] CHECK CONSTRAINT [FK_SurveyTBL_SongsTBL]
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
