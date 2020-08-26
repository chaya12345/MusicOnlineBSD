USE [master]
GO
/****** Object:  Database [MusicOnline]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[SongsTBL]    Script Date: 26/08/2020 20:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsTBL](
	[id] [int] IDENTITY(50,1) NOT NULL,
	[name] [varchar](50) NULL,
	[file_location] [varchar](max) NULL,
	[type] [varchar](50) NULL,
	[date] [date] NULL,
	[count] [bigint] NULL,
	[singerId] [int] NULL,
	[liked] [int] NULL,
	[unliked] [int] NULL,
	[tagsId] [int] NULL,
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
/****** Object:  Table [dbo].[SingersTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchBySinger]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[AlbumsTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  UserDefinedFunction [dbo].[searchByAlbum]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getSongs]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[TagsTBL]    Script Date: 26/08/2020 20:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag1] [int] NULL,
	[tag2] [int] NULL,
	[tag3] [int] NULL,
	[tag4] [int] NULL,
	[tag5] [int] NULL,
	[tag6] [int] NULL,
	[tag7] [int] NULL,
	[tag8] [int] NULL,
	[tag9] [int] NULL,
	[tag10] [int] NULL,
	[tag11] [int] NULL,
	[tag12] [int] NULL,
	[tag13] [int] NULL,
	[tag14] [int] NULL,
	[tag15] [int] NULL,
	[tag16] [int] NULL,
	[tag17] [int] NULL,
	[tag18] [int] NULL,
	[tag19] [int] NULL,
	[tag20] [int] NULL,
 CONSTRAINT [PK_TagsTBL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getByTag]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[PlaylistsTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[SongsToPlaylistsTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  UserDefinedFunction [dbo].[getPlaylists]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[ArticlesBTL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[ReportsTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[ResponsesTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
/****** Object:  Table [dbo].[TagNameTBL]    Script Date: 26/08/2020 20:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagNameTBL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_TagName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTBL]    Script Date: 26/08/2020 20:03:52 ******/
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
SET IDENTITY_INSERT [dbo].[ArticlesBTL] ON 

INSERT [dbo].[ArticlesBTL] ([id], [title], [files], [content], [date], [tagsId]) VALUES (1, N'שמחת בית השואבה', NULL, NULL, NULL, NULL)
INSERT [dbo].[ArticlesBTL] ([id], [title], [files], [content], [date], [tagsId]) VALUES (2, N'הדלקת נרות חנוכה', NULL, NULL, NULL, NULL)
INSERT [dbo].[ArticlesBTL] ([id], [title], [files], [content], [date], [tagsId]) VALUES (3, N'מירון', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ArticlesBTL] OFF
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

INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (45, 1, N'לא ידוע', N'אהבתי', NULL, NULL)
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (46, 2, N'ממש מרוגש', N'מושללללללם', NULL, NULL)
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (47, 1, N'לא חשוב מה השם', N'באמת כתבה יפה', NULL, NULL)
INSERT [dbo].[ResponsesTBL] ([id], [articleId], [name], [title], [content], [date]) VALUES (48, 3, N'משהו לעינין', N'לייק', NULL, NULL)
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

INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (50, N'נצח ישראל', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (51, N'תפילת השל"ה', NULL, N'audio', NULL, NULL, 2, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (52, N'ישתבח שמו', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (53, N'שירת העשבים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (54, N'פשוט אנשים', NULL, N'audio', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (55, N'עם ישראל', NULL, N'audio', NULL, NULL, 2, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (56, N'אלוקי נשמה', N'src\songs\איציק דדיה\אלוקי נשמה.mp4', N'video', CAST(N'2018-10-11' AS Date), NULL, 4, NULL, NULL, 2, NULL, N'איציק דדיה ויניב בן משיח בדואט עוצמתי מלא נשמה – "אלוקי נשמה"', N'הסופר-סטארים המצליחים איציק דדיה ויניב בן משיח בסינגל חדש, בלדה יפה ומרגשת בשם ''אלוקי נשמה'' מתוך אלבומו הקרב של איציק דדיה. לחן: איציק דדיה, עיבוד והפקה מוזיקלית: תמיר צור', N'src\images\for_songs\איציק דדיה\אלוקי-נשמה-יוטיוב-560x316.jpeg', N'src\text\songs_content\איציק דדיה\איציק דדיה ויניב בן משיח – אלוקי נשמה.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (57, N'האמונה בוערת', N'src\songs\איציק דדיה\האמונה בוערת.mp3', N'audio', CAST(N'2019-03-17' AS Date), NULL, 4, NULL, NULL, 3, NULL, N'איציק דדיה בסינגל חדש ''האמונה בוערת''', N'את השיר כתב והלחין איצי ברי, ואל ההפקה המוזיקלית הוא צירף את החצי השני לצמד, אלי קליין', N'src\images\for_songs\איציק דדיה\53646183_2533434770004335_7805584894150574080_o-560x315.jpg', N'src\text\songs_content\איציק דדיה\איציק דדיה בסינגל חדש ''האמונה בוערת''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (58, N'נכספתי', N'src\songs\איציק דדיה\איציק דדיה - נכספתי.mp4', N'video', CAST(N'2020-02-09' AS Date), 64946, 4, 914, 22, 4, NULL, N'איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר: "נכספתי"', N'לאחר הפסקה של שנה, חוזר איציק דדיה עם סינגל חדש ובוגר, שכולו כיסופים לבורא עולם', N'src\images\for_songs\איציק דדיה\211576_tumb_750Xauto.jpg', N'src\text\songs_content\איציק דדיה\איציק דדיה חוזר במוסיקה מקורית ובוגרת יותר ''נכספתי''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (59, N'אנא', N'src\songs\איציק דדיה\מאט דאב & איציק דדיה - אנא.mp4', N'video', CAST(N'2020-05-30' AS Date), 99236, 4, 1498, 58, 5, NULL, N'מאט דאב ואיציק דדיה בדואט: "אנא"', N'מאט דאב מארח את איציק דדיה בדואט קצבי ייחודי: "אנא"', N'src\images\for_songs\איציק דדיה\211576_tumb_750Xauto.jpg', N'src\text\songs_content\איציק דדיה\מאט דאב ואיציק דדיה בדואט ''אנא''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (60, N'בדרך לאומן', N'src\songs\איציק דדיה\בדרך-לאומן.mp3', N'audio', CAST(N'2015-08-12' AS Date), NULL, 4, NULL, NULL, 6, NULL, N'איציק דדיה בלהיט חדש – "בדרך לאומן"', NULL, N'src\images\for_songs\איציק דדיה\cover-27-560x373.jpg', N'src\text\songs_content\איציק דדיה\איציק דדיה בלהיט חדש – ''בדרך לאומן''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (61, N'בדרך לאומן', N'src\songs\איציק דדיה\בדרך-לאומן-I-איציק-דדיה-I-הקליפ-הרשמי-Baderech-LUman-I-Itzik-Dadya-I-Official-Video.mp4', N'video', CAST(N'2015-08-26' AS Date), NULL, 4, NULL, NULL, 7, NULL, N'איציק דדיה בדרך לאומן – הקליפ הרשמי', NULL, N'src\images\for_songs\איציק דדיה\da-560x321.png', N'src\text\songs_content\איציק דדיה\איציק דדיה בדרך לאומן – הקליפ הרשמי.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (62, N'כוכבים', N'src\songs\איציק דדיה\47e1dbf051d404c3fda9f2219b2fa2b1.mp4', N'video', CAST(N'2020-08-23' AS Date), 5277, 4, 330, 3, 8, NULL, N'איציק דדיה בסינגל חדש: "כוכבים נופלים"', N'סינגל שלישי לאיציק דדיה, במתכונתו החדשה: הזמר והיוצר איציק דדיה מסתער עם להיט מובטח חדש במסגרת יצירה מוזיקלית מקורית ובוגרת יותר.', N'src\images\for_songs\איציק דדיה\2784.jpg', N'src\text\songs_content\איציק דדיה\איציק דדיה בסינגל חדש ''כוכבים נופלים''.txt')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (63, N'תן לי אור', N'src\songs\אבי אילסון\אבי אילסון - תן לי אור.mp3', N'video', CAST(N'2020-08-04' AS Date), 132462, 13, 1699, 239, 9, NULL, N'אבי אילסון בשיר חדש ומאיר עם קליפ מרהיב: "תן לי אור"', N'אבי אילסון בסינגל קליפ באיכות גבוהה, בסגנון פופ עם נגיעות ספרדיות והרבה אור ושמחה', N'src\images\for_songs\אבי אילסון\231862_tumb_750Xauto.jpg', N'https://youtu.be/pJMXeJRm7cg')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (64, N'מסיני בא', N'src\songs\', N'video', NULL, NULL, 2, NULL, NULL, 10, NULL, NULL, NULL, N'src\images\for_songs\', N'src\text\songs_content\')
INSERT [dbo].[SongsTBL] ([id], [name], [file_location], [type], [date], [count], [singerId], [liked], [unliked], [tagsId], [albumId], [title], [subtitle], [image_location], [content]) VALUES (65, N'תן לי אור', N'src\songs\', N'video', CAST(N'2020-08-04' AS Date), 132462, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[TagNameTBL] ON 

INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (1, N'סינגל')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (2, N'קצבי')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (3, N'שקט')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (4, N'שירי נשמה')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (5, N'דואט')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (6, N'רמיקס')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (7, N'אלקטרוני')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (8, N'מזרחי')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (9, N'חסידי')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (10, N'ווקאלי')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (11, N'שבת')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (12, N'חתונה')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (13, N'פורים')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (14, N'מירון')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (15, N'חנוכה')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (16, N'ישראלי')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (17, N'פופ')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (18, N'ר'' נחמן')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (19, N'טראנס')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (20, N'קאבר')
INSERT [dbo].[TagNameTBL] ([id], [name]) VALUES (21, N'קליפ')
SET IDENTITY_INSERT [dbo].[TagNameTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsTBL] ON 

INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (1, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (2, 4, 5, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (3, 8, 2, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (4, 1, 8, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (5, 1, 2, 4, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (6, 1, 2, 18, 19, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (7, 1, 2, 18, 19, 20, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (8, 1, 3, 4, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (9, 1, 2, 17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TagsTBL] ([id], [tag1], [tag2], [tag3], [tag4], [tag5], [tag6], [tag7], [tag8], [tag9], [tag10], [tag11], [tag12], [tag13], [tag14], [tag15], [tag16], [tag17], [tag18], [tag19], [tag20]) VALUES (10, 1, 2, 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TagsTBL] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTBL] ON 

INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike]) VALUES (1, N'הודיה עזרן', N'hodaya@gmail.com', N'12345', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[UsersTBL] ([id], [name], [mail], [password], [type], [repeat], [coincidental], [newsletter], [saveLike]) VALUES (2, N'אודיה אושרי', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL20] FOREIGN KEY([tag1])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL20]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL21] FOREIGN KEY([tag2])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL21]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL22] FOREIGN KEY([tag3])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL22]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL23] FOREIGN KEY([tag4])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL23]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL24] FOREIGN KEY([tag5])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL24]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL25] FOREIGN KEY([tag6])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL25]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL26] FOREIGN KEY([tag7])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL26]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL27] FOREIGN KEY([tag8])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL27]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL28] FOREIGN KEY([tag9])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL28]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL29] FOREIGN KEY([tag10])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL29]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL30] FOREIGN KEY([tag11])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL30]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL31] FOREIGN KEY([tag12])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL31]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL32] FOREIGN KEY([tag13])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL32]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL33] FOREIGN KEY([tag14])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL33]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL34] FOREIGN KEY([tag15])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL34]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL35] FOREIGN KEY([tag16])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL35]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL36] FOREIGN KEY([tag17])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL36]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL37] FOREIGN KEY([tag18])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL37]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL38] FOREIGN KEY([tag19])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL38]
GO
ALTER TABLE [dbo].[TagsTBL]  WITH CHECK ADD  CONSTRAINT [FK_TagsTBL_TagNameTBL39] FOREIGN KEY([tag20])
REFERENCES [dbo].[TagNameTBL] ([id])
GO
ALTER TABLE [dbo].[TagsTBL] CHECK CONSTRAINT [FK_TagsTBL_TagNameTBL39]
GO
USE [master]
GO
ALTER DATABASE [MusicOnline] SET  READ_WRITE 
GO
