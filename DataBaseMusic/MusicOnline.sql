USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsTBL](
	[id] [int] IDENTITY(50,1) NOT NULL,
	[name] [varchar](50) NULL,
	[fileLocation] [varchar](max) NULL,
	[type] [varchar](50) NULL,
	[date] [date] NULL,
	[count] [bigint] NULL,
	[singerId] [int] NULL,
	[liked] [int] NULL,
	[unliked] [int] NULL,
	[tagsId] [int] NULL,
	[albumId] [int] NULL,
 CONSTRAINT [PK_SongsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_albumsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingersTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_SingersTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSongs]
()
returns table
as
return (
 select * from SongsTBL
)
GO
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tag1] [varchar](50) NULL,
	[Tag2] [varchar](50) NULL,
	[Tag3] [varchar](50) NULL,
	[Tag4] [varchar](50) NULL,
	[Tag5] [varchar](50) NULL,
	[Tag6] [varchar](50) NULL,
	[Tag7] [varchar](50) NULL,
	[Tag8] [varchar](50) NULL,
	[Tag9] [varchar](50) NULL,
	[Tag10] [varchar](50) NULL,
	[Tag11] [varchar](50) NULL,
	[Tag12] [varchar](50) NULL,
	[Tag13] [varchar](50) NULL,
	[Tag14] [varchar](50) NULL,
	[Tag15] [varchar](50) NULL,
	[Tag16] [varchar](50) NULL,
	[Tag17] [varchar](50) NULL,
	[Tag18] [varchar](50) NULL,
	[Tag19] [varchar](50) NULL,
	[Tag20] [varchar](50) NULL,
 CONSTRAINT [PK_TagsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getByTag]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getByTag]
(@tag varchar(50))
returns table
as
return (
 select * from SongsTBL where tagsId = (
   select id from TagsTBL t where @tag
    in(t.Tag1, t.Tag2, t.Tag3, t.Tag4, t.Tag5, t.Tag6,
	t.Tag7, t.Tag8, t.Tag9, t.Tag10, t.Tag11, t.Tag12,
	t.Tag13, t.Tag14, t.Tag15, t.Tag16, t.Tag17, t.Tag18, t.Tag19, t.Tag20)
   )
)
GO
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getPlaylists]
(@userId int)
returns table
as
return(
 select * from SongsToPlaylistsTBL where playlistId in
 (select id from PlaylistsTBL where userId = @userId)
 )
GO
/****** Object:  UserDefinedFunction [dbo].[getTagsOfSong]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getTagsOfSong]
(@songId int)
returns table
as
return (
 select * from TagsTBL where id =
 (select top 1 tagsId from SongsTBL s where s.id = @songId)
)
GO
/****** Object:  UserDefinedFunction [dbo].[getSingers]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getSingers]
()
returns table
return (select name from SingersTBL)
GO
/****** Object:  Table [dbo].[ArticlesBTL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlesBTL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[files] [varchar](max) NULL,
	[content] [varchar](max) NULL,
	[date] [date] NULL,
	[tagsId] [int] NULL,
 CONSTRAINT [PK_ArticlesBTL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 05/08/2020 20:35:35 ******/
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
/****** Object:  Table [dbo].[ResponsesTBL]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsesTBL](
	[id] [int] IDENTITY(45,1) NOT NULL,
	[articleId] [int] NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_ResponsesTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 05/08/2020 20:35:35 ******/
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
 CONSTRAINT [PK_UsersTBL] PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[AlbumsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticlesBTL] ON 

INSERT [dbo].[ArticlesBTL] ([id], [title], [files], [content], [date], [tagsId]) VALUES (1, N'שמחת בית השואבה', N'src/text', N'השתתפו כ-1500 איש', CAST(N'2020-02-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ArticlesBTL] OFF
GO
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] ON 

INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (1, 1, N'חדש')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (2, 1, N'חסידי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (3, 2, N'מזרחי')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (4, 2, N'חדש')
INSERT [dbo].[PlaylistsTBL] ([id], [userId], [name]) VALUES (7, 3, N'מקפיץ')
SET IDENTITY_INSERT [dbo].[PlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ResponsesTBL] ON 

INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (46, 1, N'דוד', N'חזק!', N'אהבתי', CAST(N'2020-01-02' AS Date))
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (47, 1, N'אבי', N'עעע', N'hh', CAST(N'2020-01-02' AS Date))
SET IDENTITY_INSERT [dbo].[ResponsesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersTBL] ON 

INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (1, N'אברהם פריד')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (2, N'יעקב שוואקי')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (3, N'מרדכי בן דוד')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (4, N'שלמה כהן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (5, N'איציק דדיה')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (6, N'רולי דיקמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (7, N'עוזיה צדוק')
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (50, N'נצח ישראל', NULL, N'audio', CAST(N'2019-07-01' AS Date), 103, 2, 84, 0, NULL, 4)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (51, N'תפילת השל"ה', NULL, N'audio', CAST(N'2019-07-01' AS Date), 97, 2, 52, 1, 1, 4)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (52, N'ישתבח שמו', NULL, N'audio', CAST(N'2019-07-01' AS Date), 122, 2, 95, 0, NULL, 4)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (53, N'שירת העשבים', NULL, N'audio', CAST(N'2019-06-05' AS Date), 250, 1, 174, 5, NULL, 1)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (54, N'פשוט אנשים', NULL, N'audio', CAST(N'2019-06-05' AS Date), 235, 1, 142, 12, NULL, 1)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (55, N'עם ישראל', NULL, N'audio', CAST(N'2014-04-15' AS Date), 536, 2, 420, 6, NULL, 3)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (1051, N'מלחמות', N'src\songs\איציק דדיה\מלחמות.mp3', N'audio', CAST(N'2013-07-15' AS Date), 700, 5, 645, 22, 2, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [fileLocation], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId]) VALUES (1052, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] ON 

INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (1, 1, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (2, 2, 51)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (3, 2, 52)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (4, 1, 53)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (5, 1, 52)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (6, 2, 55)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (7, 3, 54)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (8, 3, 55)
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsTBL] ON 

INSERT [dbo].[TagsTBL] ([id], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [Tag6], [Tag7], [Tag8], [Tag9], [Tag10], [Tag11], [Tag12], [Tag13], [Tag14], [Tag15], [Tag16], [Tag17], [Tag18], [Tag19], [Tag20]) VALUES (1, N'שקט', N'חסידי', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [Tag1], [Tag2], [Tag3], [Tag4], [Tag5], [Tag6], [Tag7], [Tag8], [Tag9], [Tag10], [Tag11], [Tag12], [Tag13], [Tag14], [Tag15], [Tag16], [Tag17], [Tag18], [Tag19], [Tag20]) VALUES (2, N'מזרחי', N'שקט', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter]) VALUES (1, N'Yossi', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter]) VALUES (2, N'Avi', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter]) VALUES (3, N'Benny', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UsersTBL] OFF
GO
ALTER TABLE [dbo].[ArticlesBTL]  WITH CHECK ADD  CONSTRAINT [FK_ArticlesBTL_TagsTBL] FOREIGN KEY([tagsId])
REFERENCES [dbo].[TagsTBL] ([id])
GO
ALTER TABLE [dbo].[ArticlesBTL] CHECK CONSTRAINT [FK_ArticlesBTL_TagsTBL]
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
ALTER TABLE [dbo].[ResponsesTBL]  WITH CHECK ADD  CONSTRAINT [FK_ResponsesTBL_ArticlesBTL] FOREIGN KEY([articleId])
REFERENCES [dbo].[ArticlesBTL] ([id])
GO
ALTER TABLE [dbo].[ResponsesTBL] CHECK CONSTRAINT [FK_ResponsesTBL_ArticlesBTL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_albumsTBL] FOREIGN KEY([albumId])
REFERENCES [dbo].[AlbumsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_albumsTBL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_SingersTBL] FOREIGN KEY([singerId])
REFERENCES [dbo].[SingersTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_SingersTBL]
GO
ALTER TABLE [dbo].[SongsTBL]  WITH CHECK ADD  CONSTRAINT [FK_SongsTBL_TagsTBL] FOREIGN KEY([tagsId])
REFERENCES [dbo].[TagsTBL] ([id])
GO
ALTER TABLE [dbo].[SongsTBL] CHECK CONSTRAINT [FK_SongsTBL_TagsTBL]
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
/****** Object:  StoredProcedure [dbo].[addResponse]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addResponse]
(@articleId int, @name varchar(50), @title varchar(50), @content varchar(MAX), @date dateTime)
as
begin
insert into ResponsesTBL values(@articleId, @name, @title, @content, @date)
end
GO
/****** Object:  StoredProcedure [dbo].[addSinger]    Script Date: 05/08/2020 20:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addSinger]
(@name varchar(50))
as
begin
insert into SingersTBL values(@name)
end
GO
USE [master]
GO
ALTER DATABASE [MusicOnline] SET  READ_WRITE 
GO
