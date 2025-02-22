USE [master]
GO
/****** Object:  Database [Certificate]    Script Date: 16-04-2024 05:27:09 PM ******/
CREATE DATABASE [Certificate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Certificate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Certificate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Certificate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Certificate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Certificate] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Certificate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Certificate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Certificate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Certificate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Certificate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Certificate] SET ARITHABORT OFF 
GO
ALTER DATABASE [Certificate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Certificate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Certificate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Certificate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Certificate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Certificate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Certificate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Certificate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Certificate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Certificate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Certificate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Certificate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Certificate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Certificate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Certificate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Certificate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Certificate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Certificate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Certificate] SET  MULTI_USER 
GO
ALTER DATABASE [Certificate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Certificate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Certificate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Certificate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Certificate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Certificate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Certificate] SET QUERY_STORE = ON
GO
ALTER DATABASE [Certificate] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Certificate]
GO
/****** Object:  Table [dbo].[Certificate_Table]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate_Table](
	[Certificate_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Course_Name] [nvarchar](max) NOT NULL,
	[Start_DATE] [date] NOT NULL,
	[End_DATE] [date] NOT NULL,
	[Generate_DATE] [date] NOT NULL,
 CONSTRAINT [PK_Cerificate_Table] PRIMARY KEY CLUSTERED 
(
	[Certificate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error_Table]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error_Table](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Error_Type] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Error_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Table]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Table](
	[User_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_NAME] [nvarchar](100) NOT NULL,
	[User_EMAIL] [nvarchar](250) NOT NULL,
	[User_PASSWORD] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_Table] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Certificate_Table] ON 

INSERT [dbo].[Certificate_Table] ([Certificate_ID], [User_ID], [Course_Name], [Start_DATE], [End_DATE], [Generate_DATE]) VALUES (1, 1, N'CSS', CAST(N'2024-03-01' AS Date), CAST(N'2024-04-02' AS Date), CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Certificate_Table] ([Certificate_ID], [User_ID], [Course_Name], [Start_DATE], [End_DATE], [Generate_DATE]) VALUES (2, 1, N'JAVA DEVELOPER', CAST(N'2024-03-01' AS Date), CAST(N'2024-03-16' AS Date), CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Certificate_Table] ([Certificate_ID], [User_ID], [Course_Name], [Start_DATE], [End_DATE], [Generate_DATE]) VALUES (3, 1, N'Python', CAST(N'2024-02-08' AS Date), CAST(N'2024-03-31' AS Date), CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Certificate_Table] ([Certificate_ID], [User_ID], [Course_Name], [Start_DATE], [End_DATE], [Generate_DATE]) VALUES (4, 1, N'React', CAST(N'2024-02-03' AS Date), CAST(N'2024-02-29' AS Date), CAST(N'2024-04-02' AS Date))
SET IDENTITY_INSERT [dbo].[Certificate_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Error_Table] ON 

INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (1, N'sdgsjvggjhvsdjgvh')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (2, N'Procedure or function ''insertUser'' expects parameter ''@userName'', which was not supplied. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (3, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10003, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10004, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10005, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10006, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10007, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10008, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10009, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10010, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10011, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10012, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10013, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10014, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10015, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10016, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10017, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10018, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10019, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10020, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10021, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10022, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10023, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10024, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10025, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10026, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10027, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10028, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10029, N'Input string was not in a correct format. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10030, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10031, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10032, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10033, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10034, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10035, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10036, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10037, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10038, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10039, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10040, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10041, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10042, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10043, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10044, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10045, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10046, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10047, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10048, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10049, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10050, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10051, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10052, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10053, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10054, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10055, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10056, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10057, N'Input string was not in a correct format. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10058, N'Input string was not in a correct format. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10059, N'Invalid object name ''Cerificate_Table''. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10060, N'Input string was not in a correct format. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10061, N'Specified cast is not valid. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10062, N'Specified cast is not valid. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10063, N'Specified cast is not valid. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10064, N'Error converting data type bigint to nvarchar. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10065, N'Error converting data type bigint to nvarchar. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10066, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10067, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (10068, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20061, N'Procedure or function ''insertCertificate'' expects parameter ''@StartDate'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20062, N'Procedure or function ''insertCertificate'' expects parameter ''@StartDate'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20063, N'Procedure or function ''insertCertificate'' expects parameter ''@StartDate'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20064, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20065, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20066, N'Procedure or function ''insertCertificate'' expects parameter ''@StartDate'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20067, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20068, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20069, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20070, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20071, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20072, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20073, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20074, N'Procedure or function ''insertCertificate'' expects parameter ''@CName'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (20075, N'Procedure or function ''insertCertificatepdf'' expects parameter ''@id'', which was not supplied. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (30071, N'Could not write the output file. Could not find a part of the path ''C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 7\All certificate data\Darshan1\Darshan10003.pdf''. Error From createCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (30072, N'Object reference not set to an instance of an object. Error From insertUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (30073, N'ExecuteReader requires an open and available Connection. The connection''s current state is closed. Error From insertCertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (40072, N'Input string was not in a correct format. Error From findUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (40073, N'Attempted to access a missing method. Error From pdfcertificate method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (40074, N'Input string was not in a correct format. Error From findUser method.')
INSERT [dbo].[Error_Table] ([Id], [Error_Type]) VALUES (40075, N'Could not write the output file. Could not find a part of the path ''C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 7\All certificate data\Darshan1\CSS2.pdf''. Error From createCertificate method.')
SET IDENTITY_INSERT [dbo].[Error_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Table] ON 

INSERT [dbo].[User_Table] ([User_ID], [User_NAME], [User_EMAIL], [User_PASSWORD]) VALUES (1, N'Darshan', N'darshan0@gmail.com', N'Darshan@123')
INSERT [dbo].[User_Table] ([User_ID], [User_NAME], [User_EMAIL], [User_PASSWORD]) VALUES (2, N'DARSHAN VAGHANI', N'darshan01@gmail.com', N'Darshan@123')
SET IDENTITY_INSERT [dbo].[User_Table] OFF
GO
/****** Object:  StoredProcedure [dbo].[findUser]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[findUser]
(
@userName nvarchar(100),
@userEmail nvarchar(250),
@userPassword nvarchar(50)
)
AS
BEGIN
if(exists(select 1 from User_Table WHERE User_NAME=@userName AND User_EMAIL=@userEmail AND User_PASSWORD=@userPassword))
begin
	Select User_ID as Id from User_Table WHERE User_NAME=@userName AND User_EMAIL=@userEmail AND User_PASSWORD=@userPassword
end
else 
begin
	Select null as Id
end
END
GO
/****** Object:  StoredProcedure [dbo].[getAllCertificate]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[getAllCertificate] --1
(
@id bigint
)
AS
BEGIN
	SELECT Certificate_Id,Course_Name,Start_DATE,End_DATE,Generate_DATE FROM Certificate_Table c INNER JOIN User_Table u ON c.User_ID=u.User_ID WHERE c.User_ID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[getCertificate]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[getCertificate]
(
@id bigint
)
AS
BEGIN
	SELECT User_NAME,Course_Name,Start_DATE,End_DATE,Generate_DATE,u.User_ID,Certificate_ID FROM Certificate_Table c INNER JOIN User_Table u ON c.User_ID=u.User_ID WHERE Certificate_ID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[insertCertificate]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertCertificate]-- 1,'java','2024-01-12','2024-01-13',''
(@UserId bigint,
@CName nvarchar(max),
@StartDate date,
@EndDate date,
@cId bigint out
)
AS
BEGIN
	INSERT INTO Certificate_Table (User_ID,Course_Name,Start_Date,End_DATE,Generate_DATE) VALUES (@UserId,@CName,@StartDate,@EndDate,GETDATE())
	select @cId = Certificate_ID from Certificate_Table where Course_Name = @CName and Start_Date = @StartDate and End_DATE = @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[insertCertificatepdf]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[insertCertificatepdf]-- 1,'ewfrtyjukiywerqrtyutrewrytuiwertyutrewqertyrewqertyutrewrtyui'
(
@id bigint,
@string text
)
AS
BEGIN
	INSERT INTO Certificate_pdf (Certificate_ID,pdfBase64text) VALUES (@id, @string)
END
GO
/****** Object:  StoredProcedure [dbo].[insertError]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[insertError]
(@error_text nvarchar(max))
AS
BEGIN
	INSERT INTO Error_Table (Error_Type) VALUES (@error_text)
END
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 16-04-2024 05:27:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[insertUser] 
(
@userName nvarchar(100),
@userEmail nvarchar(250),
@userPassword nvarchar(50)
)
AS
BEGIN
	INSERT INTO User_Table (User_NAME,User_EMAIL,User_PASSWORD) VALUES (@userName,@userEmail,@userPassword)
END
GO
USE [master]
GO
ALTER DATABASE [Certificate] SET  READ_WRITE 
GO
