USE [master]
GO
/****** Object:  Database [site15]    Script Date: 16/01/2019 12:11:39 ******/
CREATE DATABASE [site15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'site15_data', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\site15_394d06d01d9e4c5187ab35848b9eab94.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'site15_log', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\site15_6ca21257135c410dad452c5ccf5b2868.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [site15] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [site15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [site15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [site15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [site15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [site15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [site15] SET ARITHABORT OFF 
GO
ALTER DATABASE [site15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [site15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [site15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [site15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [site15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [site15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [site15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [site15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [site15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [site15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [site15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [site15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [site15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [site15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [site15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [site15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [site15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [site15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [site15] SET  MULTI_USER 
GO
ALTER DATABASE [site15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [site15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [site15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [site15] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [site15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [site15] SET QUERY_STORE = OFF
GO
USE [site15]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [site15]
GO
/****** Object:  User [site15]    Script Date: 16/01/2019 12:11:43 ******/
CREATE USER [site15] FOR LOGIN [site15] WITH DEFAULT_SCHEMA=[site15]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [site15]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [site15]
GO
ALTER ROLE [db_datareader] ADD MEMBER [site15]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [site15]
GO
/****** Object:  Schema [site15]    Script Date: 16/01/2019 12:11:44 ******/
CREATE SCHEMA [site15]
GO
/****** Object:  View [site15].[Comments_List]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [site15].[Comments_List]
AS
SELECT        CommentID, SongID, UserID, Comment, Username
FROM            site15.Comments
GO
/****** Object:  View [site15].[Playlist_Songs_list]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [site15].[Playlist_Songs_list]
AS
SELECT  * FROM Playlists_Songs 
GO
/****** Object:  View [site15].[Playlists_Images_List]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [site15].[Playlists_Images_List]
AS
SELECT * FROM Playlists_Images
GO
/****** Object:  View [site15].[Playlists_List]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [site15].[Playlists_List]
AS
SELECT        Playlist_ID AS PlaylistID, Playlist_Img_ID AS Playlist_ImgID, Playlist_Name AS PlaylistName, UserID
FROM            site15.Playlists
GO
/****** Object:  View [site15].[Songs_Likes_List]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [site15].[Songs_Likes_List]
AS
SELECT * FROM Users_Likes_Songs
GO
/****** Object:  View [site15].[Songs_List]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [site15].[Songs_List]
AS
SELECT        Song_ID, Song_Name, Song_File, Image, Likes
FROM            site15.Songs
GO
/****** Object:  Table [site15].[Comments]    Script Date: 16/01/2019 12:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[SongID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Comment] [nvarchar](120) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Comments__C3B4DFAA6FA9D4A9] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [site15].[Playlists]    Script Date: 16/01/2019 12:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Playlists](
	[Playlist_ID] [int] IDENTITY(1,1) NOT NULL,
	[Playlist_Img_ID] [int] NULL,
	[Playlist_Name] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK__Playlist__F5922DFF84D75EE0] PRIMARY KEY CLUSTERED 
(
	[Playlist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [site15].[Playlists_Images]    Script Date: 16/01/2019 12:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Playlists_Images](
	[Playlist_Img_ID] [int] IDENTITY(1,1) NOT NULL,
	[Playlist_Img_File] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Playlist_Img_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [site15].[Playlists_Songs]    Script Date: 16/01/2019 12:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Playlists_Songs](
	[SeqNumber] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistID] [int] NOT NULL,
	[SongID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeqNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [site15].[Songs]    Script Date: 16/01/2019 12:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Songs](
	[Song_ID] [int] IDENTITY(1,1) NOT NULL,
	[Song_Name] [nvarchar](50) NOT NULL,
	[Song_File] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Likes] [int] NULL,
 CONSTRAINT [1] PRIMARY KEY CLUSTERED 
(
	[Song_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [site15].[Users]    Script Date: 16/01/2019 12:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[UserEmail] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__Users__206D919067CF3F78] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [site15].[Users_Likes_Songs]    Script Date: 16/01/2019 12:11:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [site15].[Users_Likes_Songs](
	[UserID] [int] NOT NULL,
	[SongID] [int] NOT NULL,
	[LikeSong] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [site15].[Comments] ON 
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (1, 6, 2, N'שיר מצויין', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (3, 1, 2, N'אחלה שיר', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (4, 16, 1, N'This live version in much better than the album version!', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (5, 13, 6, N'מחזיר אותי אחורה', N'Lamed')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (6, 16, 3, N'Awesome, Jumping!', N'Shalom')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (7, 10, 1, N'I love this song', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (8, 10, 5, N'How is it feels?!!', N'kofiko')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (9, 17, 3, N'My mom used to blast this and scream the lyrics. i miss you everyday mom.', N'Shalom')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (10, 23, 20, N' This is easily lady gagas most underrated song﻿ ', N'Shiran')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (11, 23, 5, N' I didn''t like lady Gaga until she made this song...  FINALLY SOMETHING REAL...', N'kofiko')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (12, 16, 5, N'I miss him so much!!!', N'kofiko')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (13, 16, 1, N'Music needs somthing like INXS nowdays.', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (19, 13, 1, N'London Calling! The best album of The Clash', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (20, 8, 20, N'The begining sounds like Imagine from John Lennon', N'Shiran')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (21, 13, 23, N'What is calling? ...lol', N'Ronen')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (22, 11, 23, N'“Eternal anthem” for loners, misfits and outsiders', N'Ronen')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (23, 22, 23, N'What would I do without The Beatles', N'Ronen')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (24, 22, 23, N'Ringo !', N'Ronen')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (25, 22, 23, N'My little friend 🔥 ', N'Ronen')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (26, 10, 24, N'The rolling stone’s version is the best!', N'Roman')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (27, 10, 20, N'The boys did a great cover of aDylans song! 👍🏻', N'Shiran')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (28, 10, 25, N'Rolling Stones swang this version like they were born to do it...', N'Tiho')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (29, 10, 26, N'This cover just kinda fell in their lap. ', N'Alec')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (30, 10, 3, N'ROLLING STONES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!', N'Shalom')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (31, 10, 27, N'Hendrix, Stones, Green day. Is it possible to find a bad cover of this song?  🎸  🥁 ', N'my name is')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (32, 10, 11, N'The Nobel Prize Winner in literature !! Thanks Bob', N'Erez')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (33, 8, 2, N'Hi good songs

      Are the ones ', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (34, 10, 1, N'Years active:  1962–present', N'Lennon')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (35, 11, 3, N'People are still starnge Jim', N'Shalom')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (36, 11, 28, N'Nobody has voice like his.', N'Marshal')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (37, 8, 28, N'90s music forever! 🎶 ', N'Marshal')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (38, 8, 28, N'Mary Christmas and happy new years | 2019', N'Marshal')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (39, 10, 28, N'Stones do it 10x better', N'Marshal')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (40, 23, 29, N'Crazy! Love it!', N'Omer')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (41, 23, 29, N'Crazy enough for you ?!!', N'Omer')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (42, 23, 29, N'Wow try this comment', N'Omer')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (43, 17, 29, N'Sheryl Crow songs makes me happy 😊 ', N'Omer')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (44, 23, 1, N'It wasn’t hate also', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (45, 15, 2, N'Waw', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (46, 17, 1, N'Play it', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (47, 17, 1, N'👋 ', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (48, 17, 1, N'Hi 👋 ', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (49, 17, 1, N'Jackyl and hide', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (50, 16, 1, N'Its not rock & roll but its good', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (51, 8, 1, N'Look out 👀 ', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (52, 6, 1, N'Elf 🧝‍♂️ ', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (53, 15, 3, N'Go to bed not to sleep 🛏 ', N'Shalom')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (54, 15, 1, N'Hello good bye!', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (55, 15, 1, N'Hi 👋 ', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (56, 15, 1, N'Rggc', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (57, 11, 1, N'Hello', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (58, 11, 1, N'Hi o', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (59, 6, 2, N'Good song', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (60, 22, 1, N'Hello
', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (61, 22, 1, N'Why', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (62, 22, 1, N'Alon sup?', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (63, 22, 1, N'Good evening', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (64, 22, 1, N'We are', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (65, 6, 2, N'Hi h', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (66, 22, 1, N'Wow', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (67, 11, 1, N'The doors', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (68, 13, 1, N'Calling', N'Elad')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (69, 6, 2, N'Hi3', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (70, 16, 2, N'Good song', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (71, 14, 2, N'Cool song', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (72, 8, 2, N'Oo cool', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (73, 24, 2, N'Cool song', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (74, 16, 2, N'Great', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (75, 8, 2, N'Great', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (76, 12, 2, N'Cooooool', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (77, 8, 2, N'Sally can wait', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (78, 12, 2, N'Coooooool', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (79, 8, 2, N'Coooooooooooool', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (80, 12, 2, N'Jjjjjjjjjjj', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (81, 8, 2, N'Coooooolkkj', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (82, 6, 2, N'Hhhheello', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (83, 6, 2, N'Hggggg', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (84, 8, 2, N'Aaamaazing', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (85, 6, 2, N'Asfnmbvv', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (86, 6, 2, N'Hhlkbgv', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (87, 6, 2, N'Asdfh', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (88, 17, 30, N'Google', N'Daniel')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (89, 8, 2, N'Hi great', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (90, 12, 2, N'Amazing', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (91, 12, 2, N'Grrrreeeeaaat', N'Yaron')
GO
INSERT [site15].[Comments] ([CommentID], [SongID], [UserID], [Comment], [Username]) VALUES (92, 10, 2, N'I love this song', N'Yaron')
GO
SET IDENTITY_INSERT [site15].[Comments] OFF
GO
SET IDENTITY_INSERT [site15].[Playlists] ON 
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (1, 3, N'Rock on', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (2, 3, N'Pop on', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (3, 5, N'GYM music', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (8, NULL, N'surf music', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (9, NULL, N'GYM workout', 2)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (10, NULL, N'elad', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (11, NULL, N'try playlist', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (12, NULL, N'roccccck', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (13, NULL, N'Unamed playlist', 1)
GO
INSERT [site15].[Playlists] ([Playlist_ID], [Playlist_Img_ID], [Playlist_Name], [UserID]) VALUES (14, NULL, N'Unamed playlist', 1)
GO
SET IDENTITY_INSERT [site15].[Playlists] OFF
GO
SET IDENTITY_INSERT [site15].[Playlists_Images] ON 
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (1, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_1.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (2, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_2.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (3, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_3.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (4, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_4.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (5, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_5.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (6, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_6.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (7, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_7.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (8, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_8.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (9, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_9.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (10, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_10.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (11, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_11.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (12, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_12.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (13, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_13.jpg')
GO
INSERT [site15].[Playlists_Images] ([Playlist_Img_ID], [Playlist_Img_File]) VALUES (14, N'http://ruppinmobile.tempdomain.co.il/site15/WebService.asmx/playlist_images/playlist_14.jpg')
GO
SET IDENTITY_INSERT [site15].[Playlists_Images] OFF
GO
SET IDENTITY_INSERT [site15].[Playlists_Songs] ON 
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (1, 1, 8)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (2, 2, 10)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (3, 1, 1)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (4, 1, 14)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (5, 1, 10)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (6, 1, 12)
GO
INSERT [site15].[Playlists_Songs] ([SeqNumber], [PlaylistID], [SongID]) VALUES (7, 2, 23)
GO
SET IDENTITY_INSERT [site15].[Playlists_Songs] OFF
GO
SET IDENTITY_INSERT [site15].[Songs] ON 
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (1, N'U2 - I Still Haven''t Found What I''m Looking For', N'http://ruppinmobile.tempdomain.co.il/site15/songs/U2_istill.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/U2.png', 1)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (6, N'Oasis - Champagne Supernova', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Oasis_Champagne_Supernova.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Oasis.jpg', 1)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (8, N'Oasis - Don''t Look Back In Anger', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Oasis_Dont_Look_Back_In_Anger.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Oasis.jpg', 2)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (10, N'The Rolling Stones - Like A Rolling Stone', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Rolling_Stones_Like_A_Rolling_Stone.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Rolling_Stones_Stripped.jpg', 1)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (11, N'The Doors - People Are Strange', N'http://ruppinmobile.tempdomain.co.il/site15/songs/The_Doors_People_Are_Strange.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/The_Doors.jpg', 0)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (12, N'Smashing Pumpkins - Porcelina of the Vast Oceans', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Smashing_Pumpkins_Porcelina_of_the_Vast_Oceans.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Mellon_Collie_And_The_Infinite_Sadness.jpg', 1)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (13, N'The Clash - London Calling', N'http://ruppinmobile.tempdomain.co.il/site15/songs/The_Clash_London_Calling.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/London_Calling.jpg', 0)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (14, N'Pearl Jam - Jeremy', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Pearl_Jam_Jeremy.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/pearl_jam_jeremy.jpg', 2)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (15, N'Radiohead - Go To Sleep', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Radiohead_Go_To_Sleep.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Radiohead_hailtothetheif.jpg', NULL)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (16, N'INXS - New Sensation', N'http://ruppinmobile.tempdomain.co.il/site15/songs/INXS_New_Sensation.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/INXS_live_baby_live.jpg', 2)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (17, N'Sheryl Crow - If It Makes You Happy', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Sheryl_Crow_If_It_Makes_You_Happy.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Sheryl_Crow_album.jpg', 1)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (22, N'The Beatles - With A Little Help From My Friends', N'http://ruppinmobile.tempdomain.co.il/site15/songs/The_Beatles_With_A_Little_Help_From_My_Friends.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Sgt_Pepper.jpg', 0)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (23, N'Lady Gaga - Perfect Illusion', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Lady_Gaga_Perfect_Illusion.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Lady_Gaga_Perfect_Illusion.jpg', NULL)
GO
INSERT [site15].[Songs] ([Song_ID], [Song_Name], [Song_File], [Image], [Likes]) VALUES (24, N'Van Halen - Dance The Night Away', N'http://ruppinmobile.tempdomain.co.il/site15/songs/Van_Halen_Dance_The_Night_Away.mp3', N'http://ruppinmobile.tempdomain.co.il/site15/artists_images/Van_Halen_II.jpg', 1)
GO
SET IDENTITY_INSERT [site15].[Songs] OFF
GO
SET IDENTITY_INSERT [site15].[Users] ON 
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (1, N'Elad', N'eladhtn@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (2, N'Yaron', N'yaron2085@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (3, N'Shalom', N'shalom@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (4, N'DanielAmiko', N'Amiko@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (5, N'kofiko', N'elakof@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (6, N'Lamed', N'lamed@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (11, N'Erez', N'Erez@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (20, N'Shiran', N'shiran@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (21, N'אלעדו', N'eladdo@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (22, N'Alon', N'Alony@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (23, N'Ronen', N'Ronen@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (24, N'Roman', N'roman@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (25, N'Tiho', N'Tihu@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (26, N'Alec', N'alex@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (27, N'my name is', N'anonymous@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (28, N'Marshal', N'Erlpo@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (29, N'Omer', N'Omer@gmail.com', N'123')
GO
INSERT [site15].[Users] ([User_ID], [UserName], [UserEmail], [Password]) VALUES (30, N'Daniel', N'yaron2085454@gmail.com', N'dsad1212')
GO
SET IDENTITY_INSERT [site15].[Users] OFF
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 13, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 16, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 8, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 14, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 1, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (30, 17, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 12, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 10, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 24, 1)
GO
INSERT [site15].[Users_Likes_Songs] ([UserID], [SongID], [LikeSong]) VALUES (2, 6, 1)
GO
/****** Object:  Index [2]    Script Date: 16/01/2019 12:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [2] ON [site15].[Songs]
(
	[Song_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [3]    Script Date: 16/01/2019 12:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [3] ON [site15].[Songs]
(
	[Song_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [useremailx]    Script Date: 16/01/2019 12:12:04 ******/
ALTER TABLE [site15].[Users] ADD  CONSTRAINT [useremailx] UNIQUE NONCLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [usernamex]    Script Date: 16/01/2019 12:12:04 ******/
ALTER TABLE [site15].[Users] ADD  CONSTRAINT [usernamex] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [site15].[Comments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__SongID__0B5CAFEA] FOREIGN KEY([SongID])
REFERENCES [site15].[Songs] ([Song_ID])
GO
ALTER TABLE [site15].[Comments] CHECK CONSTRAINT [FK__Comments__SongID__0B5CAFEA]
GO
ALTER TABLE [site15].[Comments]  WITH CHECK ADD  CONSTRAINT [FK__Comments__UserID__0C50D423] FOREIGN KEY([UserID])
REFERENCES [site15].[Users] ([User_ID])
GO
ALTER TABLE [site15].[Comments] CHECK CONSTRAINT [FK__Comments__UserID__0C50D423]
GO
ALTER TABLE [site15].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK__Playlist__Playli__467D75B8] FOREIGN KEY([Playlist_Img_ID])
REFERENCES [site15].[Playlists_Images] ([Playlist_Img_ID])
GO
ALTER TABLE [site15].[Playlists] CHECK CONSTRAINT [FK__Playlist__Playli__467D75B8]
GO
ALTER TABLE [site15].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK__Playlist__UserID__477199F1] FOREIGN KEY([UserID])
REFERENCES [site15].[Users] ([User_ID])
GO
ALTER TABLE [site15].[Playlists] CHECK CONSTRAINT [FK__Playlist__UserID__477199F1]
GO
ALTER TABLE [site15].[Playlists_Songs]  WITH CHECK ADD  CONSTRAINT [FK__Playlists__Playl__5006DFF2] FOREIGN KEY([PlaylistID])
REFERENCES [site15].[Playlists] ([Playlist_ID])
GO
ALTER TABLE [site15].[Playlists_Songs] CHECK CONSTRAINT [FK__Playlists__Playl__5006DFF2]
GO
ALTER TABLE [site15].[Playlists_Songs]  WITH CHECK ADD FOREIGN KEY([SongID])
REFERENCES [site15].[Songs] ([Song_ID])
GO
/****** Object:  StoredProcedure [site15].[Add_Comment]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Add_Comment]
@UserId int,
@SongId int,
@Username nvarchar (30),
@FreeText nvarchar(120)
AS
BEGIN
DECLARE @temp table (
Comment_Id int )
DECLARE @CommentId int
INSERT INTO [Comments] ([SongID],[UserID],[Username], [Comment])
OUTPUT INSERTED.CommentId INTO @temp
VALUES (@SongId, @UserId, @Username, @FreeText)
SET @CommentId = (SELECT Comment_Id FROM @temp)
SELECT * FROM [Comments] WHERE [CommentID] = @CommentId

END
GO
/****** Object:  StoredProcedure [site15].[Add_Playlist_Songs]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Add_Playlist_Songs]
@playlistID int, 
@songID int
AS
BEGIN
INSERT INTO [site15].[Playlists_Songs] ([PlaylistID], [SongID])
VALUES (@playlistID, @songID)
END
GO
/****** Object:  StoredProcedure [site15].[Add_Remove_Like]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Add_Remove_Like]
@User_ID int,
@SongID int,
@Song_like bit
AS
BEGIN
UPDATE [Songs] 
    SET [Likes] = COALESCE([Likes], 0) + CASE WHEN @Song_like = 1 THEN 1
                                WHEN @Song_like = 0 THEN -1
                                ELSE 0 END
    WHERE [Song_ID] = @SongID;

IF NOT EXISTS (SELECT 1 FROM [Users_Likes_Songs] WHERE [UserID] = @User_ID AND [SongID] = @SongID)
  INSERT INTO [Users_Likes_Songs] (UserID, SongID, [LikeSong]) 
    VALUES (@User_ID, @SongID, @Song_like)
ELSE
IF @Song_like = 0 DELETE FROM  [Users_Likes_Songs] WHERE ([UserID] = @User_ID) AND ([SongID] = @SongID)
  ELSE UPDATE [Users_Likes_Songs]
    SET [LikeSong] = @Song_like WHERE ([UserID] = @User_ID) AND ([SongID] = @SongID)
	END
GO
/****** Object:  StoredProcedure [site15].[Create_Playlist]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Create_Playlist]
@user_Id int,
@playlist_Name nvarchar (50),
@playlist_Img_Id int NULL

AS
BEGIN
DECLARE @temp table (
Playlist_ID int)
DECLARE @PlaylistID int
INSERT INTO [site15].[Playlists] ([UserID], [Playlist_Name], [Playlist_Img_ID]) 
OUTPUT INSERTED.Playlist_ID into @temp
VALUES (@user_Id, @playlist_Name, @playlist_Img_Id)
SET @PlaylistID = (SELECT Playlist_ID FROM @temp)
IF (@@ROWCOUNT=0) 
BEGIN 
DELETE FROM [Playlists] WHERE [Playlist_ID] = SCOPE_IDENTITY()
END

SELECT * FROM [site15].[Playlists] WHERE [Playlist_ID] = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [site15].[Create_User]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [site15].[Create_User]
@userName nvarchar (30),
@userEmail nvarchar (30),
@password nvarchar (30)
AS
BEGIN
INSERT INTO site15.Users ([UserName],[UserEmail], [Password])
VALUES
(@userName, @userEmail, @password)
SELECT * FROM site15.Users WHERE [UserName] = @userName
IF (@@ROWCOUNT=0) -- אם הפקודה הקודמת נכשלה
	BEGIN
		DELETE FROM [Users] WHERE [User_ID] = SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [site15].[Delete_Playlist]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Delete_Playlist]
@playlist_Id int
AS 
BEGIN
DELETE FROM [site15].[Playlists_Songs] WHERE (PlaylistID = @playlist_Id)
DELETE FROM [site.15].[Playlists] WHERE  (Playlist_ID = @playlist_Id)
END
GO
/****** Object:  StoredProcedure [site15].[Delete_Playlists_Song]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Delete_Playlists_Song]
@SongID int,
@SeqNumber int
AS 
BEGIN
DELETE FROM [site15].[Playlists_Songs] WHERE (SongID = @SongID AND SeqNumber = @SeqNumber)
END
GO
/****** Object:  StoredProcedure [site15].[Login]    Script Date: 16/01/2019 12:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [site15].[Login]
@userName [nvarchar] (30),
@password [nvarchar] (30)
AS
BEGIN
SELECT * FROM site15.Users WHERE [UserName] = @userName  and [Password] = @password
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[39] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Comments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 196
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Comments_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Comments_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Playlists"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2580
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Playlists_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Playlists_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Songs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 180
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Songs_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'site15', @level1type=N'VIEW',@level1name=N'Songs_List'
GO
USE [master]
GO
ALTER DATABASE [site15] SET  READ_WRITE 
GO
