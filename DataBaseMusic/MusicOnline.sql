USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 15/10/2020 04:38:04 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 15/10/2020 04:38:04 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ResponsesToArticlesTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  View [dbo].[LastResponses]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  View [dbo].[songsDetails]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[FollowUpTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[PlaylistsSystemTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[ResponsesToSongsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[SubscriptionTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[TagsToArticlesTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[TagsTypesTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[TopicsTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[UpdatesTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 15/10/2020 04:38:05 ******/
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
