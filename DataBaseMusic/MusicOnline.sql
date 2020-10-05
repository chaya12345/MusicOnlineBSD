USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_SingersTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
	[count_responses] [bigint] NULL,
	[singerId] [int] NULL,
	[count_like] [bigint] NULL,
	[count_views] [bigint] NULL,
	[albumId] [int] NULL,
	[title] [varchar](150) NULL,
	[subtitle] [varchar](200) NULL,
	[image_location] [varchar](max) NULL,
	[content] [varchar](max) NULL,
 CONSTRAINT [PK_SongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[searchBySinger](@singerName varchar(50))
returns table
AS
return(
select * from SongsTBL 
where singerId=
(select top 1 id from SingersTBL si where si.name=@singerName)
)
GO
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[searchByAlbum]
(@albumName varchar(50))
returns table
as
return (
select * from SongsTBL where albumId = (
 select top 1 id from albumsTBL al where al.name = @albumName
)
)
GO
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSongs]()
returns table
AS
return(
select * from SongsTBL
)
GO
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getPlaylists](@userId int)
returns table
as
return(
select * from SongsToPlaylistsTBL
where playlistId in
(select id from PlaylistsTBL
where userId=@userId)
)
GO
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[ResponsesToArticlesTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  View [dbo].[LastResponses]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LastResponses]
AS
SELECT top 5 r.id as 'responsId', r.name,r.date,a.id as 'articleId',a.title
FROM ResponsesToArticlesTBL r join ArticlesTBL a on r.articleId=a.id
order by r.date desc
GO
/****** Object:  View [dbo].[songsDetails]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[PlaylistsSystemTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_ReportsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsesToSongsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[SearchingToSingerTBL]    Script Date: 05/10/2020 04:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchingToSingerTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[singerId] [int] NULL,
	[count_searching] [bigint] NULL,
 CONSTRAINT [PK_SearchingToSingerTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[SubscriptionTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[TagsTypesTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
/****** Object:  Table [dbo].[TopicsTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
 CONSTRAINT [PK_TopicsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 05/10/2020 04:55:30 ******/
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
GO
SET IDENTITY_INSERT [dbo].[ArticlesTBL] ON 

INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (1, N'צפו: גדולי הזמר על במה אחת בסוכות', N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'כ"ח תשרי התשע"ט', CAST(N'2018-10-07T10:14:00.000' AS DateTime), N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'for_articles/162576_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 7, 2)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (2, N'אחים ושרים: ראיון משולש עם חיים ישראל, איציק ואבישי אשל', N'שלושה יוצרים נושאים את המוזיקה המזרחית חסידית על הגב שלהם, כל הדרך מתימן לפולין ובחזרה. התוצאה: תחייה רוחנית לז''אנר שחשב ללכת לאיבוד. חיים ישראל, איציק אשל, אבישי אשל - אחים ממשפחה טובה. הם דיברו ושרו וניגנו. ''בקהילה'' לחצו על ''פליי'' ומביאים את סיפורם', N'ב'' כסלו התשע"ה', CAST(N'2014-11-24T08:29:00.000' AS DateTime), NULL, N'for_articles/46849_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 3, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (3, N'הרגע ששבר את פיני איינהורן בתהלוכת המרפסות בירושלים • צפו והאזינו', N' ביוזמתו של ראש עיריית ירושלים משה ליאון יצאה היום ''משאית השמחה'' שתטייל בשכונות ובהמשך גם בכל הארץ, היום היא היתה בבית וגן והיו עליה הזמר פיני איינהורן לצד אמן הקלידים איציק ויינגרטן ששימחו את התושבים, ב''זמן אוויר'' סיפר פיני על הרגע הכי מרגש במהלך ההופעה הניידת', N'כ״ז באדר תש״פ', CAST(N'2020-03-23T16:30:00.000' AS DateTime), NULL, N'for_articles/‏‏פיני-איינהורן-במשאית-השמחה-בירושלים.PNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 5, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (4, N'כשאברהם פריד הפתיע מהבידוד: "אף אחד לא מעז לומר לנו שאסור לשיר"', N'הזמר האהוב אברהם פריד הצליח להפתיע את הגולשים כשהעלה את הסרטון הזה מביתו. מה יש לו לומר לכם מהבידוד, ולמה אתם לא באמת לבד כשאתם בביתכם?', N'כ'' אייר התש"פ', CAST(N'2020-05-14T14:07:00.000' AS DateTime), NULL, N'for_articles/221607_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/avramfrid4.mp4', NULL, 78, 12, 2)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (5, N'יעקב שוואקי מבקש שתשירו איתו בבית, אל תצאו החוצה', N'"נשארים בבית", מבקש יעקב שווקאי במסר מיוחד לגולשי הידברות, וגם - האזינו לשיר שהוא מגיש עם ברכת ישועות ונחמות לעם ישראל', N'ד'' ניסן התש"פ', CAST(N'2020-03-29T21:20:00.000' AS DateTime), NULL, N'for_articles/216402_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/swkey-corona.mp4', NULL, 65, 9, NULL)
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
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (9, N'אייל ויאיר שריקי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (10, N'מאיר יזדי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (11, N'ישי לפידות')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (12, N'שימי עזר')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (13, N'דוד ביתן')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (14, N'אלי קשת')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (15, N'עציון מוסאי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (16, N'רביב בן מנחם')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (17, N'איצי וולדנר')
SET IDENTITY_INSERT [dbo].[ArtistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] ON 

INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (1, 68, 5, 4)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (2, 68, 6, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (3, 68, 6, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (4, 67, 2, 1)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (5, 67, 2, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (6, 67, 3, 3)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (7, 66, 7, 2)
INSERT [dbo].[ArtistsToSongsTBL] ([id], [songId], [artistId], [jobId]) VALUES (8, 66, 7, 1)
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
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[FollowUpTBL] ON 

INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (3, NULL, N'bsd.odaya@gmail.com', 62, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1005, NULL, N'bsd.odaya@gmail.com', 71, NULL)
INSERT [dbo].[FollowUpTBL] ([id], [userId], [mail], [songId], [articleId]) VALUES (1006, NULL, N'bsd.odaya@gmail.com', NULL, 4)
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
SET IDENTITY_INSERT [dbo].[JobTBL] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] ON 

INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (1, 1, N'שירים חדשים')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (2, 1, N'חסידי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (3, 2, N'מזרחי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (4, 2, N'אקפלה')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (5, 1, N'אקפלה')
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportsTBL] ON 

INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status]) VALUES (1, N'איציק דדיה', NULL, NULL, NULL, NULL, N'בטיפול')
INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status]) VALUES (2, N'עצבני', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ReportsTBL] OFF
GO
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
SET IDENTITY_INSERT [dbo].[ResponsesToArticlesTBL] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[SearchingToSingerTBL] ON 

INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (1, 1, 500)
INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (2, 2, 421)
INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (3, 3, 774)
SET IDENTITY_INSERT [dbo].[SearchingToSingerTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] ON 

INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (1, 1, 1, 1, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (2, 1, 2, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersTBL] ON 

INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (1, N'אברהם פריד', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (2, N'יעקב שוואקי', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (3, N'מרדכי בן דוד', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (4, N'איציק דדיה', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (5, N'פיני איינהורן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (6, N'בני פרידמן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (7, N'מידד טסה', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (8, N'שלמה כהן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (9, N'שלוימי גרטנר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (10, N'חיים ישראל', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (11, N'רולי דיקמן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (12, N'יואלי דיקמן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (13, N'אבי אילסון', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (14, N'שלום ברנהולץ', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (15, N'גד אלבז', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (16, N'יניב בן משיח', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (17, N'שמחה פרידמן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (18, N'אייל טויטו', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (19, N'איציק אשל', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (20, N'איציק אורלב', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (21, N'שמילי אונגר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (22, N'אהרן רזאל', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (23, N'יונתן רזאל', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (24, N'אלעד שער', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (25, N'אלי פרידמן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (26, N'הקינדרלעך', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (27, N'נמואל הרוש', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (28, N'עוזיה צדוק', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (29, N'ישי ריבו', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (30, N'מוטי שטיינמץ', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (31, N'אריק דביר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (32, N'עמירן דביר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (33, N'ליפא שמעלצר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (34, N'אלי הרצליך', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (35, N'מאיר מסוארי', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (36, N'מאיר גרין', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (37, N'אבי מן', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (38, N'אודי דוידי', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (39, N'אוהד מושקוביץ', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (40, N'בערי וובר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (41, N'יוסי גרין', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (42, N'ישי לפידות', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (43, N'משה קליין', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (44, N'קובי ברומר', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (45, N'יונתן שיינפלד', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (46, N'יוסף חיים ישראל', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (47, N'יובל טייב', NULL)
INSERT [dbo].[SingersTBL] ([id], [name], [image]) VALUES (48, N'מרדכי שפירא', NULL)
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (56, N'אלוקי נשמה', N'איציק-דדיה\אלוקי נשמה.mp4', N'video', CAST(N'2018-10-11T00:00:00.000' AS DateTime), NULL, 4, 19, 64, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'for_songs/איציק-דדיה/אלוקי-נשמה-יוטיוב-560x316.jpeg', N'songs_content/איציק-דדיה/איציק דדיה ויניב בן משיח – אלוקי נשמה.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (57, N'האמונה בוערת', N'איציק-דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17T00:00:00.000' AS DateTime), NULL, 4, 9, 57, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'for_songs/איציק-דדיה/53646183_2533434770004335_7805584894150574080_o-560x315.jpg', N'songs_content/איציק-דדיה/איציק דדיה בסינגל חדש ''האמונה בוערת''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (58, N'נכספתי', N'איציק-דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09T00:00:00.000' AS DateTime), NULL, 4, 50, 104, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'for_songs/איציק-דדיה/211576_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר ''נכספתי''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (59, N'אנא', N'איציק-דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30T00:00:00.000' AS DateTime), NULL, 4, 11, 69, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'for_songs/איציק-דדיה/223388_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/מאט דאב ואיציק דדיה בדואט ''אנא''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (60, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12T00:00:00.000' AS DateTime), NULL, 4, 14, 74, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', NULL, N'for_songs/איציק-דדיה/cover-27-560x373.jpg', N'songs_content/איציק-דדיה/איציק דדיה בלהיט חדש – ''בדרך לאומן''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (61, N'בדרך לאומן - קליפ', N'איציק-דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26T00:00:00.000' AS DateTime), NULL, 4, 27, 86, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', NULL, N'for_songs/איציק-דדיה/da-560x321.png', N'songs_content/איציק-דדיה/איציק דדיה בדרך לאומן – הקליפ הרשמי.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (62, N'כוכבים', N'איציק-דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23T12:13:00.000' AS DateTime), NULL, 4, 45, 234, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'for_songs/איציק-דדיה/‏‏file.jpg', N'songs_content/איציק-דדיה/איציק דדיה בסינגל חדש ''כוכבים נופלים''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (63, N'תן לי אור', N'אבי-אילסון\אבי אילסון - תן לי אור.mp3', N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), NULL, 13, 21, 78, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'for_songs/אבי-אילסון/231862_tumb_750Xauto.jpg', N'songs_content/אבי-אילסון/אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב ''תן לי אור''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (64, N'מסיני בא', N'יעקב-שוואקי\יעקב שוואקי - מסיני בא.mp4', N'video', CAST(N'2020-02-11T12:08:00.000' AS DateTime), NULL, 2, 12, 143, NULL, N'יעקב שוואקי בסינגל לקראת חתונת בתו: "מסיני בא"', N'יעקב שוואקי הלחין את המילים שכותב רש"י לפרשת יתרו בשם מכילתא, לכבוד חתונתה של בתו. האזינו', N'for_songs/יעקב-שוואקי/211577_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/מסיני-בא.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (65, N'אוטוטו', N'אברהם-פריד\אברהם-פריד-אוטוטו-Avraham-Fried-OhToToh.mp4', N'video', CAST(N'2020-08-23T22:31:00.000' AS DateTime), NULL, 1, 54, 305, NULL, N'שיר ראשון מתוך אלבום חסידי חדש: אברהם פריד עם "אוטוטו"', N'אברהם פריד מתקרב סופסוף להשקת האלבום החסידי החדש שלו, שיצא לאור בעז"ה אחרי החגים. בינתיים הוא מגיש סינגל ראשון מתוכו: "אוטוטו". צפו בקליפ המילים', N'for_songs/אברהם-פריד/234162_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אוטוטו.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (66, N'כמה טוב ה''', N'קובי-ברומר\כמה-טוב-ה-I-קובי-ברומר-Kama-Tov-Hashem-I-Kobi-Brummer.mp4', N'audio', CAST(N'2020-08-15T00:00:00.000' AS DateTime), NULL, 44, 3, 35, NULL, N'קובי ברומר בסינגל חדש – כמה טוב ה''', N'הזמר קובי ברומר מוציא סינגל חדש בשם ''כמה טוב ה" מתוך אלבום בכורה שיצא בקרוב.', N'for_songs/קובי-ברומר/‏‏כמה-טוב-ה.PNG', N'songs_content/קובי-ברומר/כמה-טוב-ה.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (67, N'שיבוא', N'אבי-אילסון\אבי אילסון - שיבוא.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), NULL, 13, 11, 87, NULL, N'אבי אילסון פותח את הקיץ: "שיבוא"', N'בעיצומה של המערכה השניה של מערכת הבחירות רוויית הקיטוב בין הזרמים בעם, מגיש הזמר אבי אילסון שיר רווי אמונה בציפיה למשיח שיבוא.', N'for_songs/אבי-אילסון/שיבוא.PNG', N'songs_content/אבי-אילסון/‏‏שיבוא.PNG')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (68, N'אבא', N'אברהם-פריד\אברהם פריד & ארי היל - אבא.mp3', N'audio', CAST(N'2019-06-05T14:45:00.000' AS DateTime), NULL, 1, 32, 415, NULL, N'אברהם פריד בדואט נפלא עם ארי היל: "אבא"', N'את השיר "אבא" כתב והלחין בנצי שטיין, וכאשר שמע את ארי היל שר אותו, הציע לאברהם פריד להפוך אותו לדואט. התוצאה נפלאה', N'for_songs/אברהם-פריד/189747_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אבא.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (69, N'בידיים טובות', N'בני-פרידמן\בני-פרידמן-בידיים-טובות-ווקאלי.mp3', N'audio', CAST(N'2020-04-30T00:00:00.000' AS DateTime), NULL, 6, 1, 24, NULL, N'בני פרידמן – בידיים טובות – ווקאלי', N'לאחר צאת אלבומו הווקאלי "לחישות הלב", משחרר הזמר בני פרידמן סינגל מתוך הדיסק – בידיים טובות.', N'for_songs/בני-פרידמן/בני-פרידמן-בידיים-טובות-ווקאלי.jpg', N'songs_content/בני-פרידמן/בידיים-טובות.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (70, N'נעשה שמח', N'מידד-טסה\מידד טסה - נעשה שמח.mp4', N'video', CAST(N'2020-08-12T11:37:00.000' AS DateTime), NULL, 7, 7, 36, NULL, N'מידד טסה בפרק חדש בחיים המוסיקליים: "נעשה שמח"', N'מידד טסה בסינגל חדש ומקפיץ, עם קליפ תואם: "נעשה שמח". צפו', N'for_songs/מידד-טסה/232760_tumb_750Xauto.jpg', N'songs_content/מידד-טסה/נעשה-שמח.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (71, N'נושא תפילה', N'איציק-דדיה\איציק-דדיה-נושא-תפילה-Itzik-Dadya-Nose-Tfila (1).mp4', N'video', CAST(N'2020-09-23T12:28:00.000' AS DateTime), NULL, 4, 55, 214, NULL, N'איציק דדיה בסינגל תפילה חדש: "נושא תפילה"', N'איציק דדיה מחדש את השיר המוכר "נושאת תפילה" בגרסה מיוחדת, שמתאימה במיוחד לימים המורכבים הללו. צפו גם בקליפ', N'for_songs/איציק-דדיה/240204_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/240204_tumb_750Xauto.jpg')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (72, N'ימי הרחמים', N'מאיר-גרין\מאיר-גרין-ימי-רחמים5.mp4', N'video', CAST(N'2020-08-30T00:21:00.000' AS DateTime), NULL, 36, 41, 330, NULL, N'מאיר גרין בסינגל קליפ חדש – "ימי רחמים"', N'צפו בזמר והיוצר מאיר גרין בסינגל קליפ - חדש - אשר אותו כתב יחד עם הרב שלו - הרב חיים הורביץ על תקופת ימי הרחמים והסליחות', N'for_songs/מאיר-גרין/מאיר-גרין-ימי-הרחמים.PNG', N'songs_content/מאיר-גרין/ימי הרחמים - מאיר גרין.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (73, N'כתר מלוכה', N'ישי-ריבו\ישי ריבו - כתר מלוכה.mp3', N'audio', CAST(N'2020-04-01T13:03:00.000' AS DateTime), NULL, 29, 62, 470, NULL, N'ישי ריבו זועק את זעקתה של התקופה בשיר חדש: "כתר מלוכה"', N'בימים שבהם אנחנו מופרדים ומתרחקים, וגם לומדים להתקרב בדרכים אחרות, ישי ריבו זועק את זעקת הימים בכנות פשוטה ובקריאה של קרבה לבורא עולם. האזינו', N'for_songs/ישי-ריבו/236650_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (74, N'לא לפחד', N'שמחה-פרידמן\שמחה פרידמן - לא לפחד.mp3', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), NULL, 17, 13, 243, NULL, N'שמחה פרידמן בסינגל חדש: "לא לפחד"', N'אחרי מספר להיטים בראשם הלהיט ''יתגדל'' מגיש הזמר שמחה פרידמן סינגל נוסף ''לא לפחד''', N'for_songs/שמחה-פרידמן/שמחה פרידמן - לא לפחד.jpg', N'songs_content/שמחה-פרידמן/לא לפחד.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (75, N'סוכה ולולב', N'איציק-אשל\1231.mp4', N'video', CAST(N'2020-10-04T00:00:00.000' AS DateTime), NULL, 19, 5, 39, NULL, N'

איציק אשל וישי לפידות מגישים: "סוכה ולולב"', N'מתוך הסדרה החדשה - "איציק אשל וחברים שרים לכבוד החגים"', N'for_songs/איציק-אשל/סוכה-ולולב-איציק-אשל-וישי-לפידות.PNG', N'songs_content/איציק-אשל/סוכה-ולולב.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (76, N'אין עוד מלבדו', N'מרדכי-שפירא\1215.mp4', N'video', CAST(N'2020-09-29T00:00:00.000' AS DateTime), NULL, 48, 13, 75, NULL, N'מרדכי שפירא בסינגל - קליפ חדש: "אין עוד מלבדו"', N'כוכב הזמר החסידי מרדכי שפירא מגיש סינגל חדש ומקפיץ: "אין עוד מלבדו"', N'for_songs/מרדכי-שפירא/אין-עוד-מלבדו-מרדכי-שפירא.PNG', N'songs_content/מרדכי-שפירא/אין-עוד-מלבדו.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (77, N'נרקוד', N'אריק-דביר\אריק דביר - נרקוד.mp3', N'audio', CAST(N'2018-08-12T09:47:00.000' AS DateTime), NULL, 31, 12, 81, NULL, N'אריק דביר בסינגל בכורה אחרי 13 שנים של הופעות: "נרקוד"', N'אריק דביר כבר מופיע על במות שונות בישראל זה 13 שנה, אך כעת הוא מוציא סוף כל סוף את הסינגל הראשון שלו, "נרקוד". האזינו', N'for_songs/אריק-דביר/157438_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (78, N'טעיתי', N'חיים-ישראל\חיים ישראל - טעיתי.mp3', N'audio', CAST(N'2018-08-28T00:00:00.000' AS DateTime), NULL, 10, 52, 281, NULL, N'חיים ישראל בסינגל חדש לימים הנוראים: "טעיתי"', NULL, N'for_songs/חיים-ישראל/טעיתי-חיים-ישראל.PNG', N'songs_content/חיים-ישראל/טעיתי.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (79, N'ישתבח שמו', N'יעקב-שוואקי\ישתבח שמו.mp3', N'audio', CAST(N'2018-05-31T00:00:00.000' AS DateTime), NULL, 2, 85, 386, 4, N'יעקב שוואקי בשיר חדש: "ישתבח שמו"', NULL, N'for_songs/יעקב-שוואקי/PIC-8-1-560x373.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (80, N'א ב ג', N'יעקב-שוואקי\Shwekey.mp4', N'video', CAST(N'2018-05-02T11:07:00.000' AS DateTime), NULL, 2, 14, 342, 4, N'השיר הראשון שאתם צריכים לשמוע בל"ג בעומר: "אלף-בית-גימל"', N'יעקב שוואקי פותח את יום ל"ג בעומר בשיר חדש ומקפיץ: "אלף-בית-גימל". צפו בקליפ המילים', N'for_songs/יעקב-שוואקי/146812_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/א-ב-ג.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (81, N'I Can Be', N'יעקב-שוואקי\', NULL, CAST(N'2020-06-15T13:59:00.000' AS DateTime), NULL, 2, 64, 407, NULL, N'יעקב שוואקי בעיבוד חדש ומרענן לשירו "I Can Be"', N'את העיבוד החדש מגיש שוואקי לקראת אירוע לייב עבור הסנטר לילדים מיוחדים. האזינו לגרסה החדשה', N'for_songs/יעקב-שוואקי/225464_tumb_750Xauto.jpg', N'songs_content/יעקב-שוואקי/I-Can-Be.txt')
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] ON 

INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (1, 1, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (2, 2, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (3, 3, 1)
INSERT [dbo].[SubscriptionTBL] ([id], [userId], [singerId]) VALUES (4, 3, 2)
SET IDENTITY_INSERT [dbo].[SubscriptionTBL] OFF
GO
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
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1033, N'אנגלית', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
GO
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
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] OFF
GO
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
INSERT [dbo].[TagsToSongsTBL] ([id], [songId], [tagId]) VALUES (1070, 73, 1027)
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
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[TopicsTBL] ON 

INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href]) VALUES (1, N'חדש במוזיקה', N'כל השירים והקליפים החדשים', N'for_topics/3782176.jpg', N'song')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href]) VALUES (2, N'הפלייליסטים', N'פלייליסטים בכל סגנון ולכל זמן', N'for_topics/piano-keys-made-with-black-white-paper-yellow-backdrop_23-2147926855.jpg', N'playlists')
INSERT [dbo].[TopicsTBL] ([id], [title], [subtitle], [img], [href]) VALUES (3, N'מגזין', N'כל החדשות והסקופים המעניינים במוזיקה היהודית', N'for_topics/magazines2.png', N'magazine')
SET IDENTITY_INSERT [dbo].[TopicsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (1, N'הודיה עזרן', N'hodaya@gmail.com', N'12345', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (2, N'אודיה אושרי', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (3, N'נרשם לרשימת תפוצה', N'abcde@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (4, N'נרשם לאתר', N'fghij@gmail.com', N'5541', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (5, NULL, N'nhvgfh@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (6, NULL, N'jhkhkhj@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
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
ALTER TABLE [dbo].[ReportsTBL]  WITH CHECK ADD  CONSTRAINT [FK_ReportsTBL_SongsTBL] FOREIGN KEY([songId])
REFERENCES [dbo].[SongsTBL] ([id])
GO
ALTER TABLE [dbo].[ReportsTBL] CHECK CONSTRAINT [FK_ReportsTBL_SongsTBL]
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
ALTER TABLE [dbo].[SearchingToSingerTBL]  WITH CHECK ADD  CONSTRAINT [FK_SearchingToSingerTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SearchingToSingerTBL] CHECK CONSTRAINT [FK_SearchingToSingerTBL_SingersTBL]
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
