USE [master]
GO
/****** Object:  Database [ConceptsRelationDB]    Script Date: 21-02-2019 12:57:06 ******/
CREATE DATABASE [ConceptsRelationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConceptsRelationDB', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ConceptsRelationDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConceptsRelationDB_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ConceptsRelationDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConceptsRelationDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConceptsRelationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConceptsRelationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ConceptsRelationDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ConceptsRelationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConceptsRelationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConceptsRelationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ConceptsRelationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConceptsRelationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConceptsRelationDB] SET  MULTI_USER 
GO
ALTER DATABASE [ConceptsRelationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConceptsRelationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConceptsRelationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConceptsRelationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ConceptsRelationDB]
GO
/****** Object:  Table [dbo].[ConceptOne]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptOne](
	[C1Id] [int] IDENTITY(1,1) NOT NULL,
	[ConceptOneName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConceptTwo]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptTwo](
	[C2Id] [int] IDENTITY(1,1) NOT NULL,
	[ConceptTwoName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterConceptRelation]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterConceptRelation](
	[CrID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [nvarchar](255) NULL,
	[TopicName] [nvarchar](255) NULL,
	[ConceptOne] [nvarchar](255) NULL,
	[ConceptTwo] [nvarchar](255) NULL,
	[CoceptRelation] [nvarchar](255) NULL,
 CONSTRAINT [PK__MasterCo__AD761D44DEB3CE9D] PRIMARY KEY CLUSTERED 
(
	[CrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relations]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relations](
	[RelID] [int] IDENTITY(1,1) NOT NULL,
	[RelationName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaveAllCR]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaveAllCR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fTopicId] [int] NOT NULL,
	[fRId] [int] NOT NULL,
	[fC1Id] [int] NOT NULL,
	[fC2Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 21-02-2019 12:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicsName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ConceptOne] ON 

INSERT [dbo].[ConceptOne] ([C1Id], [ConceptOneName]) VALUES (4, N'C11')
INSERT [dbo].[ConceptOne] ([C1Id], [ConceptOneName]) VALUES (1, N'Concept 1')
INSERT [dbo].[ConceptOne] ([C1Id], [ConceptOneName]) VALUES (2, N'Conceptt 2')
INSERT [dbo].[ConceptOne] ([C1Id], [ConceptOneName]) VALUES (3, N'niu')
SET IDENTITY_INSERT [dbo].[ConceptOne] OFF
SET IDENTITY_INSERT [dbo].[ConceptTwo] ON 

INSERT [dbo].[ConceptTwo] ([C2Id], [ConceptTwoName]) VALUES (4, N'C22')
INSERT [dbo].[ConceptTwo] ([C2Id], [ConceptTwoName]) VALUES (3, N'c2new1')
INSERT [dbo].[ConceptTwo] ([C2Id], [ConceptTwoName]) VALUES (1, N'ConceptTwo 1')
INSERT [dbo].[ConceptTwo] ([C2Id], [ConceptTwoName]) VALUES (2, N'ConceptTwo 2')
SET IDENTITY_INSERT [dbo].[ConceptTwo] OFF
SET IDENTITY_INSERT [dbo].[MasterConceptRelation] ON 

INSERT [dbo].[MasterConceptRelation] ([CrID], [TopicID], [TopicName], [ConceptOne], [ConceptTwo], [CoceptRelation]) VALUES (1, N'1', N'Topic 1', N'Text1', N'Text2', N'isRelated')
INSERT [dbo].[MasterConceptRelation] ([CrID], [TopicID], [TopicName], [ConceptOne], [ConceptTwo], [CoceptRelation]) VALUES (2, N'2', N'Topic 2', N'Text2', N'Text4', N'isCommon')
SET IDENTITY_INSERT [dbo].[MasterConceptRelation] OFF
SET IDENTITY_INSERT [dbo].[Relations] ON 

INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (1, N'rel1')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (2, N'rel2')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (3, N'rel3')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (4, N'lol')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (5, N'lol1')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (6, N'lol3')
INSERT [dbo].[Relations] ([RelID], [RelationName]) VALUES (7, N'R7')
SET IDENTITY_INSERT [dbo].[Relations] OFF
SET IDENTITY_INSERT [dbo].[SaveAllCR] ON 

INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (5, 1, 3, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (6, 1, 3, 4, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (7, 1, 1, 4, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (8, 1, 1, 1, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (9, 7, 2, 4, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (10, 7, 4, 1, 1)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (11, 9, 1, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (12, 9, 1, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (13, 9, 1, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (14, 10, 2, 4, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (15, 11, 2, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (16, 11, 4, 2, 1)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (17, 12, 1, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (18, 12, 2, 1, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (19, 12, 5, 2, 1)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (20, 13, 1, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (21, 13, 3, 1, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (22, 13, 5, 3, 2)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (23, 13, 6, 2, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (24, 14, 2, 4, 4)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (25, 14, 3, 1, 3)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (26, 14, 5, 3, 2)
INSERT [dbo].[SaveAllCR] ([Id], [fTopicId], [fRId], [fC1Id], [fC2Id]) VALUES (27, 1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[SaveAllCR] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (8, N'ismail topic')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (7, N'sohailTopic')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (9, N'testtopic01')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (1, N'Topic 1')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (2, N'Topic 2')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (10, N'topic001')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (11, N'topic002')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (12, N'topic003')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (13, N'topic004')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (14, N'topic005')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (3, N'topic1')
INSERT [dbo].[Topics] ([TopicID], [TopicsName]) VALUES (6, N'topic11')
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ConceptO__46374B0A0B04C3C8]    Script Date: 21-02-2019 12:57:06 ******/
ALTER TABLE [dbo].[ConceptOne] ADD UNIQUE NONCLUSTERED 
(
	[ConceptOneName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ConceptT__A50FCABD7BE6AA34]    Script Date: 21-02-2019 12:57:06 ******/
ALTER TABLE [dbo].[ConceptTwo] ADD UNIQUE NONCLUSTERED 
(
	[ConceptTwoName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [U_Topic]    Script Date: 21-02-2019 12:57:06 ******/
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [U_Topic] UNIQUE NONCLUSTERED 
(
	[TopicsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SaveAllCR]  WITH CHECK ADD FOREIGN KEY([fC1Id])
REFERENCES [dbo].[ConceptOne] ([C1Id])
GO
ALTER TABLE [dbo].[SaveAllCR]  WITH CHECK ADD FOREIGN KEY([fC2Id])
REFERENCES [dbo].[ConceptTwo] ([C2Id])
GO
ALTER TABLE [dbo].[SaveAllCR]  WITH CHECK ADD FOREIGN KEY([fRId])
REFERENCES [dbo].[Relations] ([RelID])
GO
ALTER TABLE [dbo].[SaveAllCR]  WITH CHECK ADD FOREIGN KEY([fTopicId])
REFERENCES [dbo].[Topics] ([TopicID])
GO
USE [master]
GO
ALTER DATABASE [ConceptsRelationDB] SET  READ_WRITE 
GO
