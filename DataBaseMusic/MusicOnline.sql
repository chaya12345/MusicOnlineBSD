USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 05/09/2020 22:24:56 ******/
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
	[count] [bigint] NULL,
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
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 05/09/2020 22:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_TagName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getByTag]    Script Date: 05/09/2020 22:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[getByTag](@tag varchar(50))
returns table
as
return(
select * from SongsTBL
where tagsId =
(select id from TagsTBL t where @tag in(t.tag1,t.tag2,t.tag3,t.tag4,t.tag5,t.tag16,t.tag7,t.tag8,t.tag9,t.tag10,t.tag11,t.tag12,t.tag13,t.tag14,t.tag15,t.tag16,t.tag17,t.tag18,t.tag19,t.tag20))
)
GO
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[ArticlesTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
	[tagsId] [bigint] NULL,
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
 CONSTRAINT [PK_ArticlesBTL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[ArtistsToSongsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[JobTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[ResponsesTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[SearchingToSingerTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[SingerSearchingToUserTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[TagsToSongsTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 05/09/2020 22:24:57 ******/
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
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (5, N'אלבום החתונה')
INSERT [dbo].[AlbumsTBL] ([id], [name]) VALUES (6, N'על הבמה')
SET IDENTITY_INSERT [dbo].[AlbumsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticlesTBL] ON 

INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [tagsId], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like]) VALUES (1, N'צפו: גדולי הזמר על במה אחת בסוכות', NULL, NULL, NULL, NULL, N'גדולי הזמר שלוימי גרטנר, יידל ורדיגר, אלי הרצליך ונמואל הרוש על במה אחת, הרקידו את הציבור בשמחת בית השואבה', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [tagsId], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like]) VALUES (2, N'הדלקת נרות חנוכה', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ArticlesTBL] ([id], [title], [subtitle], [dateHebrew], [date], [tagsId], [content], [main_image], [image1], [image2], [image3], [audio1], [audio2], [video], [credit], [count_views], [count_like]) VALUES (3, N'מירון', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ArticlesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[ArtistsTBL] ON 

INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (1, N'אלי קליין')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (2, N'איצי ברי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (3, N'אלי קליין & איצי ברי')
INSERT [dbo].[ArtistsTBL] ([id], [name]) VALUES (4, N'אלחנן אלחדד')
SET IDENTITY_INSERT [dbo].[ArtistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTBL] ON 

INSERT [dbo].[JobTBL] ([id], [name]) VALUES (1, N'מלחין')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (2, N'כותב')
INSERT [dbo].[JobTBL] ([id], [name]) VALUES (3, N'מעבד מוזיקאלית')
SET IDENTITY_INSERT [dbo].[JobTBL] OFF
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
SET IDENTITY_INSERT [dbo].[ResponsesTBL] ON 

INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (45, 1, N'לא ידוע', N'אהבתי', NULL, CAST(N'2020-01-01' AS Date))
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (46, 2, N'ממש מרוגש', N'מושללללללם', NULL, CAST(N'2019-01-02' AS Date))
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (47, 1, N'לא חשוב מה השם', N'באמת כתבה יפה', NULL, CAST(N'2019-06-05' AS Date))
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (48, 3, N'משהו לעינין', N'לייק', NULL, NULL)
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (49, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ResponsesTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SingersTBL] ON 

INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (1, N'אברהם פריד')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (2, N'יעקב שוואקי')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (3, N'מרדכי בן דוד')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (4, N'איציק דדיה')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (5, N'פיני איינהורן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (6, N'בני פרידמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (7, N'מידד טסה')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (8, N'שלמה כהן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (9, N'שלוימי גרטנר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (10, N'חיים ישראל')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (11, N'רולי דיקמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (12, N'יואלי דיקמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (13, N'אבי אילסון')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (14, N'שלום ברנהולץ')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (15, N'גד אלבז')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (16, N'יניב בן משיח')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (17, N'שמחה פרידמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (18, N'אייל טויטו')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (19, N'איציק אשל')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (20, N'איציק אורלב')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (21, N'שמילי אונגר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (22, N'אהרן רזאל')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (23, N'יונתן רזאל')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (24, N'אלעד שער')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (25, N'אלי פרידמן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (26, N'הקינדרלעך')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (27, N'נמואל הרוש')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (28, N'עוזיה צדוק')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (29, N'ישי ריבו')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (30, N'מוטי שטיינמץ')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (31, N'אריק דביר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (32, N'עמירן דביר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (33, N'ליפא שמעלצר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (34, N'אלי הרצליך')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (35, N'מאיר מסוארי')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (36, N'מאיר גרין')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (37, N'אבי מן')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (38, N'אודי דוידי')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (39, N'אוהד מושקוביץ')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (40, N'בערי וובר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (41, N'יוסי גרין')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (42, N'ישי לפידות')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (43, N'משה קליין')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (44, N'קובי ברומר')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (45, N'יונתן שיינפלד')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (46, N'יוסף חיים ישראל')
INSERT [dbo].[SingersTBL] ([id], [name]) VALUES (47, N'יובל טייב')
SET IDENTITY_INSERT [dbo].[SingersTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsTBL] ON 

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (50, N'נצח ישראל', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (51, N'תפילת השל"ה', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (52, N'ישתבח שמו', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (53, N'שירת העשבים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (54, N'פשוט אנשים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (55, N'עם ישראל', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (56, N'אלוקי נשמה', N'איציק-דדיה\אלוקי נשמה.mp4', N'video', CAST(N'2018-10-11T00:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'for_songs/איציק-דדיה/אלוקי-נשמה-יוטיוב-560x316.jpeg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (57, N'האמונה בוערת', N'איציק-דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17T00:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'for_songs/איציק-דדיה/53646183_2533434770004335_7805584894150574080_o-560x315.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (58, N'נכספתי', N'איציק-דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09T00:00:00.000' AS DateTime), 64946, 4, 914, 22, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'for_songs/איציק-דדיה/211576_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (59, N'אנא', N'איציק-דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30T00:00:00.000' AS DateTime), 99236, 4, 1498, 58, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'for_songs/איציק-דדיה/223388_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (60, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12T00:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', NULL, N'for_songs/איציק-דדיה/cover-27-560x373.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (61, N'בדרך לאומן', N'איציק-דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26T00:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', NULL, N'for_songs/איציק-דדיה/da-560x321.png', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (62, N'כוכבים', N'איציק-דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23T00:00:00.000' AS DateTime), 5277, 4, 330, 3, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'for_songs/איציק-דדיה/2784.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (63, N'תן לי אור', N'אבי-אילסון\אבי אילסון - תן לי אור.mp3', N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), 132462, 13, 1699, 239, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'for_songs/אבי-אילסון/231862_tumb_750Xauto.jpg', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (64, N'מסיני בא', NULL, N'video', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, N'for_songs/', NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [count_like], [count_views], [albumId], [title], [subtitle], [image_location], [content]) VALUES (65, N'תן לי אור', NULL, N'video', CAST(N'2020-08-04T00:00:00.000' AS DateTime), 132462, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] ON 

INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (3, 1, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (4, 1, 51)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (5, 2, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (6, 2, 52)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (7, 3, 50)
INSERT [dbo].[SongsToPlaylistsTBL] ([id], [playlistId], [songId]) VALUES (8, 4, 55)
SET IDENTITY_INSERT [dbo].[SongsToPlaylistsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsTBL] ON 

INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (1, N'סינגל')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (2, N'קצבי')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (3, N'שקט')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (4, N'שירי נשמה')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (5, N'דואט')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (6, N'רמיקס')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (7, N'אלקטרוני')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (8, N'מזרחי')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (9, N'חסידי')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (10, N'ווקאלי')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (11, N'שבת')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (12, N'חתונה')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (13, N'פורים')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (14, N'מירון')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (15, N'חנוכה')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (16, N'ישראלי')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (17, N'פופ')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (18, N'ר'' נחמן')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (19, N'טראנס')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (20, N'קאבר')
INSERT [dbo].[TagsTBL] ([id], [name]) VALUES (21, N'קליפ')
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
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
SET IDENTITY_INSERT [dbo].[TagsToSongsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike]) VALUES (1, N'הודיה עזרן', N'hodaya@gmail.com', N'12345', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike]) VALUES (2, N'אודיה אושרי', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
REFERENCES [dbo].[ArticlesTBL] ([id])
GO
ALTER TABLE [dbo].[ResponsesTBL] CHECK CONSTRAINT [FK_ResponsesTBL_ArticlesBTL]
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
