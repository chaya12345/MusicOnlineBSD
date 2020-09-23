USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 23/09/2020 23:28:43 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[ResponsesToArticlesTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  View [dbo].[LastResponses]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  View [dbo].[similarSongs]    Script Date: 23/09/2020 23:28:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[similarSongs]
as
select s1.id, s1.name, s1.file_location, s1.type, s1.date, s1.count_responses, 
s2.name as'singerName' ,s1.count_like,s1.count_views, s1.albumId,s1.title,s1.subtitle,s1.image_location,s1.content
from SongsTBL s1 join SingersTBL s2 on s1.singerId=s2.id
GO
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[PlaylistsSystemTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[ResponsesToSongsTBL]    Script Date: 23/09/2020 23:28:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsesToSongsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[songId] [int] NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_ResponsesToSongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchingToSingerTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[TagsTypesTBL]    Script Date: 23/09/2020 23:28:44 ******/
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
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 23/09/2020 23:28:44 ******/
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

INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (1, N'צפו: גדולי הזמר על במה אחת בסוכות', N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'כ"ח תשרי התשע"ט', CAST(N'2018-10-07T10:14:00.000' AS DateTime), N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', N'for_articles/162576_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 7, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (2, N'אחים ושרים: ראיון משולש עם חיים ישראל, איציק ואבישי אשל', N'שלושה יוצרים נושאים את המוזיקה המזרחית חסידית על הגב שלהם, כל הדרך מתימן לפולין ובחזרה. התוצאה: תחייה רוחנית לז''אנר שחשב ללכת לאיבוד. חיים ישראל, איציק אשל, אבישי אשל - אחים ממשפחה טובה. הם דיברו ושרו וניגנו. ''בקהילה'' לחצו על ''פליי'' ומביאים את סיפורם', N'ב'' כסלו התשע"ה', CAST(N'2014-11-24T08:29:00.000' AS DateTime), NULL, N'for_articles/46849_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 3, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (3, N'הרגע ששבר את פיני איינהורן בתהלוכת המרפסות בירושלים • צפו והאזינו', N' ביוזמתו של ראש עיריית ירושלים משה ליאון יצאה היום ''משאית השמחה'' שתטייל בשכונות ובהמשך גם בכל הארץ, היום היא היתה בבית וגן והיו עליה הזמר פיני איינהורן לצד אמן הקלידים איציק ויינגרטן ששימחו את התושבים, ב''זמן אוויר'' סיפר פיני על הרגע הכי מרגש במהלך ההופעה הניידת', N'כ״ז באדר תש״פ', CAST(N'2020-03-23T16:30:00.000' AS DateTime), NULL, N'for_articles/‏‏פיני-איינהורן-במשאית-השמחה-בירושלים.PNG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 5, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (4, N'כשאברהם פריד הפתיע מהבידוד: "אף אחד לא מעז לומר לנו שאסור לשיר"', N'הזמר האהוב אברהם פריד הצליח להפתיע את הגולשים כשהעלה את הסרטון הזה מביתו. מה יש לו לומר לכם מהבידוד, ולמה אתם לא באמת לבד כשאתם בביתכם?', N'כ'' אייר התש"פ', CAST(N'2020-05-14T14:07:00.000' AS DateTime), NULL, N'for_articles/221607_tumb_750Xauto.jpg', NULL, NULL, NULL, NULL, NULL, N'for_articles/avramfrid4.mp4', NULL, 38, 12, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like], [count_responses]) VALUES (5, NULL, NULL, NULL, NULL, NULL, N'for_articles/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[ArtistsTBL] OFF
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
SET IDENTITY_INSERT [dbo].[ArtistsToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[JobTBL] ON 

INSERT [dbo].[JobTBL] ([id], [name]) VALUES (1, N'כותב')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (2, N'מלחין')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (3, N'מעבד מוזיקאלית')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (4, N'דואט')
SET IDENTITY_INSERT [dbo].[JobTBL] OFF
SET IDENTITY_INSERT [dbo].[PlaylistsSystemTBL] ON 

INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (25, N'מזרחי', N'מיטב השירים המזרחיים', 460, N'for_playlists/musical-percussion-instrument-drum-bongo_169016-302.jpg', 8)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (26, N'שירי נשמה', N'מיטב שירי הרגש לנשמה', 471, N'for_playlists/acoustic-guitar-tree_1426-614.jpg', 4)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (27, N'להיטים', N'להיטים בכל הסגנונות', 283, N'for_playlists/alphacolor-66JMudIjDTw-unsplash.jpg', 22)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (28, N'על הקצב', N'כנסו לקצב ותתחילו לרקוד :)', 545, N'for_playlists/drums-cymbals-hi-hat-beautiful-recording-studio_169016-3801.jpg', 2)
INSERT [dbo].[PlaylistsSystemTBL] ([id], [name], [title], [count_views], [image], [tagId]) VALUES (29, N'על הדרך', N'נוסעים לטיול? הפלייסט בדיוק בשבילכם', 602, N'for_playlists/colorful-bicycle-with-guitar-meadow_1150-7721.jpg', 26)
SET IDENTITY_INSERT [dbo].[PlaylistsSystemTBL] OFF
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] ON 

INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (1, 1, N'שירים חדשים')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (2, 1, N'חסידי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (3, 2, N'מזרחי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (4, 2, N'אקפלה')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (5, 1, N'אקפלה')
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] OFF
SET IDENTITY_INSERT [dbo].[ReportsTBL] ON 

INSERT [dbo].[ReportsTBL] ([id], [name], [mail], [phone], [songId], [message], [status]) VALUES (1, N'איציק דדיה', NULL, NULL, NULL, NULL, N'בטיפול')
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
INSERT [dbo].[ResponsesToArticlesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (52, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ResponsesToArticlesTBL] OFF
SET IDENTITY_INSERT [dbo].[ResponsesToSongsTBL] ON 

INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (1, 58, N'מישהו שמבין', N'שיר מושלם', N'ברמה אחרת מכל השירים שלו עד היום.', CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (2, 59, N'חסוי', N'שיר מרגש ממש', N'שומע אותו בלופ. נדיררר!', CAST(N'2020-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (3, 59, N'אוהב מוזיקה!', N'זמר ענקקקק עם שיר מושלםםםם!!!', N'סוג של כישרון להוציא להיטים אחד אחרי השני.', CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (4, 65, N'אוהב את אברהם פריד!', N'מלךךך הזמר הזה', N'איך תמיד הוא יודע להוציא שיר להיט? כל שיר שלו תופס חזק ולא שוכחים אותו כל כך מהר. איןןןן כמו אברהם פריד הוא משהו מיוחד! הרבה הצלחה', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (5, 65, N'מישהו', N'שיר אופטימי ושמח :)', N'לא מרגיש לכם שאוטוטו המשיח מגיע אחרי כזה שיר?? אהבתיייי', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (6, 65, N'המגיב השלישי :)', N'איזה שיררר. תודה למיוזיק אונליין שהעלו אותו', N'מדהיםםםם', CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ResponsesToSongsTBL] ([id], [songId], [name], [title], [content], [date]) VALUES (7, 65, N'אין דברים כאלה!!!', N'ואוווווווו ממש יפה', N'שיר מושלם!!', CAST(N'2020-09-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ResponsesToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[SearchingToSingerTBL] ON 

INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (1, 1, 500)
INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (2, 2, 421)
INSERT [dbo].[SearchingToSingerTBL] ([id], [singerId], [count_searching]) VALUES (3, 3, 774)
SET IDENTITY_INSERT [dbo].[SearchingToSingerTBL] OFF
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] ON 

INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (1, 1, 1, 1, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[SingerSearchingToUserTBL] ([id], [userId], [singerId], [count_searching], [last_date]) VALUES (2, 1, 2, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SingerSearchingToUserTBL] OFF
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
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (50, N'נצח ישראל', NULL, N'audio', NULL, 1, 2, 1, NULL, NULL, N'4', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (51, N'תפילת השל"ה', NULL, N'audio', NULL, 1, 2, 0, NULL, NULL, N'4', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (52, N'ישתבח שמו', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'4', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (53, N'שירת העשבים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, N'1', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (54, N'פשוט אנשים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, N'1', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (55, N'עם ישראל', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'3', NULL, N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (56, N'אלוקי נשמה', N'איציק-דדיה\אלוקי נשמה.mp4', N'video', CAST(N'2018-10-11T00:00:00.000' AS DateTime), NULL, 4, 18, 64, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'for_songs/איציק-דדיה/אלוקי-נשמה-יוטיוב-560x316.jpeg', N'songs_content/איציק-דדיה/איציק דדיה ויניב בן משיח – אלוקי נשמה.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (57, N'האמונה בוערת', N'איציק-דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17T00:00:00.000' AS DateTime), NULL, 4, 9, 57, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'for_songs/איציק-דדיה/53646183_2533434770004335_7805584894150574080_o-560x315.jpg', N'songs_content/איציק-דדיה/איציק דדיה בסינגל חדש ''האמונה בוערת''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (58, N'נכספתי', N'איציק-דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09T00:00:00.000' AS DateTime), 64946, 4, 49, 104, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'for_songs/איציק-דדיה/211576_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר ''נכספתי''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (59, N'אנא', N'איציק-דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30T00:00:00.000' AS DateTime), 99236, 4, 11, 69, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'for_songs/איציק-דדיה/223388_tumb_750Xauto.jpg', N'songs_content/איציק-דדיה/מאט דאב ואיציק דדיה בדואט ''אנא''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (60, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12T00:00:00.000' AS DateTime), NULL, 4, 14, 74, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', NULL, N'for_songs/איציק-דדיה/cover-27-560x373.jpg', N'songs_content/איציק-דדיה/איציק דדיה בלהיט חדש – ''בדרך לאומן''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (61, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26T00:00:00.000' AS DateTime), NULL, 4, 27, 86, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', NULL, N'for_songs/איציק-דדיה/da-560x321.png', N'songs_content/איציק-דדיה/איציק דדיה בדרך לאומן – הקליפ הרשמי.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (62, N'כוכבים', N'איציק-דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23T12:13:00.000' AS DateTime), 5277, 4, 45, 107, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'for_songs/איציק-דדיה/‏‏file.jpg', N'songs_content/איציק-דדיה/איציק דדיה בסינגל חדש ''כוכבים נופלים''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (63, N'תן לי אור', N'אבי-אילסון\אבי אילסון - תן לי אור.mp3', N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), 132462, 13, 21, 78, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'for_songs/אבי-אילסון/231862_tumb_750Xauto.jpg', N'songs_content/אבי-אילסון/אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב ''תן לי אור''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (64, N'מסיני בא', N'יעקב-שוואקי\יעקב שוואקי - מסיני בא.mp4', N'video', CAST(N'2020-02-11T12:08:00.000' AS DateTime), 9542, 2, 12, 84, NULL, N'יעקב שוואקי בסינגל לקראת חתונת בתו: "מסיני בא"', N'יעקב שוואקי הלחין את המילים שכותב רש"י לפרשת יתרו בשם מכילתא, לכבוד חתונתה של בתו. האזינו', N'for_songs/יעקב-שוואקי/211577_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (65, N'אוטוטו', N'אברהם-פריד\אברהם-פריד-אוטוטו-Avraham-Fried-OhToToh.mp4', N'video', CAST(N'2020-08-23T22:31:00.000' AS DateTime), 8575, 1, 53, 124, NULL, N'שיר ראשון מתוך אלבום חסידי חדש: אברהם פריד עם "אוטוטו"', N'אברהם פריד מתקרב סופסוף להשקת האלבום החסידי החדש שלו, שיצא לאור בעז"ה אחרי החגים. בינתיים הוא מגיש סינגל ראשון מתוכו: "אוטוטו". צפו בקליפ המילים', N'for_songs/אברהם-פריד/234162_tumb_750Xauto.jpg', N'songs_content/אברהם-פריד/אוטוטו.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (66, N'כמה טוב ה''', N'קובי-ברומר\כמה-טוב-ה-I-קובי-ברומר-Kama-Tov-Hashem-I-Kobi-Brummer.mp4', N'audio', CAST(N'2020-08-15T00:00:00.000' AS DateTime), 9720, 44, 3, 35, NULL, N'קובי ברומר בסינגל חדש – כמה טוב ה''', N'הזמר קובי ברומר מוציא סינגל חדש בשם ''כמה טוב ה" מתוך אלבום בכורה שיצא בקרוב.', N'for_songs/קובי-ברומר/‏‏כמה-טוב-ה.PNG', N'songs_content/קובי-ברומר/כמה-טוב-ה.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (67, N'שיבוא', N'אבי-אילסון\', N'audio', CAST(N'2019-08-12T00:00:00.000' AS DateTime), NULL, 13, 11, 87, NULL, N'אבי אילסון פותח את הקיץ: "שיבוא"', N'בעיצומה של המערכה השניה של מערכת הבחירות רוויית הקיטוב בין הזרמים בעם, מגיש הזמר אבי אילסון שיר רווי אמונה בציפיה למשיח שיבוא.', N'for_songs\default.jpg', N'songs_content/אבי-אילסון/שיבוא.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (68, N'אבא', N'אברהם-פריד\', N'audio', CAST(N'2019-06-05T14:45:00.000' AS DateTime), NULL, 1, 32, 121, NULL, N'אברהם פריד בדואט נפלא עם ארי היל: "אבא"', N'את השיר "אבא" כתב והלחין בנצי שטיין, וכאשר שמע את ארי היל שר אותו, הציע לאברהם פריד להפוך אותו לדואט. התוצאה נפלאה', N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (69, N'בידיים טובות', N'בני-פרידמן\', N'audio', NULL, NULL, 6, 1, 24, NULL, N'בני פרידמן – בידיים טובות – ווקאלי', N'לאחר צאת אלבומו הווקאלי "לחישות הלב", משחרר הזמר בני פרידמן סינגל מתוך הדיסק – בידיים טובות.', N'for_songs\default.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count_responses], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (70, N'נעשה שמח', N'מידד-טסה\', N'video', CAST(N'2020-08-12T11:37:00.000' AS DateTime), NULL, 7, 7, 36, NULL, N'מידד טסה בפרק חדש בחיים המוסיקליים: "נעשה שמח"', N'מידד טסה בסינגל חדש ומקפיץ, עם קליפ תואם: "נעשה שמח". צפו', N'for_songs/מידד-טסה/232760_tumb_750Xauto.jpg', N'songs_content/מידד-טסה/נעשה-שמח.txt')
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] ON 

INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (3, 1, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (4, 1, 51)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (5, 2, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (6, 2, 52)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (7, 3, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (8, 4, 55)
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsTBL] ON 

INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (1, N'סינגל', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (2, N'קצבי', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (3, N'שקט', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (4, N'שירי נשמה', 2, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (5, N'דואט', NULL, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (6, N'רמיקס', NULL, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (7, N'אלקטרוני', NULL, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (8, N'מזרחי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (9, N'חסידי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (10, N'ווקאלי', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (11, N'שבת', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (12, N'חתונה', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (13, N'פורים', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (14, N'מירון', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (15, N'חנוכה', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (16, N'ישראלי', 1, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (17, N'פופ', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (18, N'ר'' נחמן', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (19, N'טראנס', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (20, N'קאבר', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (21, N'קליפ', NULL, 0)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (22, N'להיט', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (23, N'סוכות', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (24, N'חג', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (25, N'שמחת בית השואבה', NULL, 1)
INSERT [dbo].[TagsTBL] ([id], [name], [tagTypeId], [isShow]) VALUES (26, N'על הדרך', NULL, 0)
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsToArticlesTBL] ON 

INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (1, 23, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (2, 24, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (3, 25, 1)
INSERT [dbo].[TagsToArticlesTBL] ([id], [tagId], [articleId]) VALUES (4, 8, 2)
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
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] OFF
SET IDENTITY_INSERT [dbo].[TagsTypesTBL] ON 

INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (1, N'ג''אנר')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (2, N'מקצב')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (3, N'ווקאלי')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (4, N'סגנון')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (5, N'נושא')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (6, N'מידע')
INSERT [dbo].[TagsTypesTBL] ([id], [name]) VALUES (7, N'עיבוד')
SET IDENTITY_INSERT [dbo].[TagsTypesTBL] OFF
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (1, N'הודיה עזרן', N'hodaya@gmail.com', N'12345', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (2, N'אודיה אושרי', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (3, N'נרשם לרשימת תפוצה', N'abcde@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (4, N'נרשם לאתר', N'fghij@gmail.com', N'5541', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (5, NULL, N'nhvgfh@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike], [image_location]) VALUES (6, NULL, N'jhkhkhj@gmail.com', NULL, 0, NULL, NULL, 1, NULL, NULL)
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
