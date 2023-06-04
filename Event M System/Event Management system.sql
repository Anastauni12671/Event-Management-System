USE [master]
GO
/****** Object:  Database [Event Management system ]    Script Date: 6/4/2023 10:20:36 AM ******/
CREATE DATABASE [Event Management system ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Event Management system', FILENAME = N'D:\SQL Serer 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event Management system .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Event Management system _log', FILENAME = N'D:\SQL Serer 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event Management system _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Event Management system ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event Management system ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event Management system ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event Management system ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event Management system ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event Management system ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event Management system ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event Management system ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Event Management system ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event Management system ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event Management system ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event Management system ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event Management system ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event Management system ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event Management system ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event Management system ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event Management system ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Event Management system ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event Management system ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event Management system ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event Management system ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event Management system ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event Management system ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event Management system ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event Management system ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event Management system ] SET  MULTI_USER 
GO
ALTER DATABASE [Event Management system ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event Management system ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event Management system ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event Management system ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Event Management system ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Event Management system ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Event Management system ] SET QUERY_STORE = ON
GO
ALTER DATABASE [Event Management system ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Event Management system ]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 6/4/2023 10:20:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_ID] [int] NULL,
	[Event_ID] [int] NULL,
	[Ticket_ID] [int] NULL,
	[Transport] [int] NULL,
	[Food] [int] NULL,
	[Price] [int] NULL,
	[Total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cattering]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cattering](
	[Cattering_ID] [int] IDENTITY(1,1) NOT NULL,
	[CT_Type] [int] NULL,
	[Name] [varchar](45) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cattering_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cattering_Type]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cattering_Type](
	[CT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](10) NULL,
	[Last_Name] [varchar](10) NULL,
	[User_Name] [varchar](15) NULL,
	[Address] [varchar](35) NULL,
	[Contact] [varchar](15) NULL,
	[Email] [varchar](25) NULL,
	[City] [varchar](10) NULL,
	[Password] [varchar](25) NULL,
	[Confirm_Password] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Event_ID] [int] IDENTITY(1,1) NOT NULL,
	[Event_Name] [varchar](45) NULL,
	[Venue_ID] [int] NULL,
	[Cattering_ID] [int] NULL,
	[Transport_ID] [int] NULL,
	[Music_ID] [int] NULL,
	[Date] [date] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Music]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Music](
	[M_ID] [int] IDENTITY(1,1) NOT NULL,
	[M_Type] [int] NULL,
	[Name] [varchar](45) NULL,
	[Singer] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Music_Type]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Music_Type](
	[MT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](10) NULL,
	[Last_Name] [varchar](10) NULL,
	[User_Name] [varchar](15) NULL,
	[Designation] [varchar](15) NULL,
	[Salary] [int] NULL,
	[Address] [varchar](35) NULL,
	[Contact] [varchar](15) NULL,
	[Email] [varchar](25) NULL,
	[City] [varchar](10) NULL,
	[Password] [varchar](25) NULL,
	[Confirm_Password] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_ID] [int] IDENTITY(1,1) NOT NULL,
	[Event_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[Transport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vehicle_Name] [varchar](45) NULL,
	[Vehicle_Company] [varchar](45) NULL,
	[Vehicle_No] [varchar](45) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Transport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_Type] [varchar](10) NULL,
	[Staff_ID] [int] NULL,
	[C_ID] [int] NULL,
	[Name] [varchar](15) NULL,
	[Password] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[U_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 6/4/2023 10:20:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[V_ID] [int] IDENTITY(1,1) NOT NULL,
	[V_Name] [varchar](15) NULL,
	[Address] [varchar](45) NULL,
	[Contact] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD FOREIGN KEY([C_ID])
REFERENCES [dbo].[Customer] ([C_ID])
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD FOREIGN KEY([Ticket_ID])
REFERENCES [dbo].[Ticket] ([Ticket_ID])
GO
ALTER TABLE [dbo].[Cattering]  WITH CHECK ADD FOREIGN KEY([CT_Type])
REFERENCES [dbo].[Cattering_Type] ([CT_ID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([Cattering_ID])
REFERENCES [dbo].[Cattering] ([Cattering_ID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([Music_ID])
REFERENCES [dbo].[Music] ([M_ID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([Transport_ID])
REFERENCES [dbo].[Transport] ([Transport_ID])
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([Venue_ID])
REFERENCES [dbo].[Venue] ([V_ID])
GO
ALTER TABLE [dbo].[Music]  WITH CHECK ADD FOREIGN KEY([M_Type])
REFERENCES [dbo].[Music_Type] ([MT_ID])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([C_ID])
REFERENCES [dbo].[Customer] ([C_ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[Staff] ([Staff_ID])
GO
USE [master]
GO
ALTER DATABASE [Event Management system ] SET  READ_WRITE 
GO
