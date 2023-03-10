USE [master]
GO
/****** Object:  Database [BuildingManagementDB]    Script Date: 06/12/2022 21:34:02 ******/
CREATE DATABASE [BuildingManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BuildingManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\BuildingManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BuildingManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EXPRESS\MSSQL\DATA\BuildingManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BuildingManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuildingManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuildingManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuildingManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuildingManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuildingManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuildingManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BuildingManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [BuildingManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuildingManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuildingManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuildingManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BuildingManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BuildingManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BuildingManagementDB] SET QUERY_STORE = OFF
GO
USE [BuildingManagementDB]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[ApartmentId] [nvarchar](6) NOT NULL,
	[BuildingId] [nvarchar](6) NOT NULL,
	[ApartmentNumber] [int] NOT NULL,
	[Rooms] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TenantId] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Apartments] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [nvarchar](6) NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[AppointmentTime] [datetime] NOT NULL,
	[EmployeeId] [nvarchar](6) NOT NULL,
	[TenantId] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [nvarchar](6) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](6) NOT NULL,
	[City] [nvarchar](10) NOT NULL,
	[Province] [nvarchar](25) NOT NULL,
	[YearBuilt] [date] NOT NULL,
	[EmployeeId] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [nvarchar](6) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[JobTitle] [nvarchar](25) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [nvarchar](6) NOT NULL,
	[MessageTitle] [nvarchar](25) NOT NULL,
	[MessageDate] [datetime] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[TenantId] [nvarchar](6) NOT NULL,
	[EmployeeId] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 06/12/2022 21:34:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantId] [nvarchar](6) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nchar](10) NOT NULL,
	[MaritalStatus] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT001', N'BLD001', 101, 3, CAST(3500.00 AS Decimal(18, 2)), N'Available', N'New, Very clean', N'TNT001')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT002', N'BLD001', 102, 2, CAST(2800.00 AS Decimal(18, 2)), N'Available', N'Used, Clean', N'TNT002')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT003', N'BLD001', 201, 3, CAST(3100.00 AS Decimal(18, 2)), N'N/A', N'N/A', N'TNT003')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT004', N'BLD001', 202, 2, CAST(2800.00 AS Decimal(18, 2)), N'N/A', N'N/A', N'TNT004')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT005', N'BLD002', 101, 4, CAST(4800.00 AS Decimal(18, 2)), N'Available', N'High-end, Very Modern', N'TNT005')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT006', N'BLD002', 102, 2, CAST(2800.00 AS Decimal(18, 2)), N'N/A', N'N/A', N'TNT006')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT007', N'BLD003', 401, 1, CAST(1900.00 AS Decimal(18, 2)), N'Available', N'Used, Clean', N'TNT007')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT008', N'BLD003', 402, 3, CAST(2400.00 AS Decimal(18, 2)), N'N/A', N'N/A', N'TNT008')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT009', N'BLD003', 903, 4, CAST(5200.00 AS Decimal(18, 2)), N'Available', N'High-end, Very Modern', N'TNT009')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT010', N'BLD004', 107, 3, CAST(2800.00 AS Decimal(18, 2)), N'Available', N'New, Very clean', N'TNT010')
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [ApartmentNumber], [Rooms], [Price], [Status], [Description], [TenantId]) VALUES (N'APT011', N'BLD004', 108, 3, CAST(2800.00 AS Decimal(18, 2)), N'Available', N'New, Very clean', N'TNT011')
GO
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentDate], [AppointmentTime], [EmployeeId], [TenantId], [Description]) VALUES (N'PP01', CAST(N'2022-10-24' AS Date), CAST(N'2022-10-24T14:00:00.000' AS DateTime), N'EMP001', N'TNT005', N'Contract Renewal')
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentDate], [AppointmentTime], [EmployeeId], [TenantId], [Description]) VALUES (N'PP02', CAST(N'2022-11-10' AS Date), CAST(N'2022-11-10T17:00:00.000' AS DateTime), N'EMP001', N'TNT002', N'Contract Renewal')
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentDate], [AppointmentTime], [EmployeeId], [TenantId], [Description]) VALUES (N'PP03', CAST(N'2022-11-15' AS Date), CAST(N'2022-11-15T17:00:00.000' AS DateTime), N'EMP004', N'TNT010', N'Contract Renewal')
INSERT [dbo].[Appointments] ([AppointmentId], [AppointmentDate], [AppointmentTime], [EmployeeId], [TenantId], [Description]) VALUES (N'PP04', CAST(N'2022-12-20' AS Date), CAST(N'2022-12-20T15:00:00.000' AS DateTime), N'EMP004', N'TNT011', N'Contract Renewal')
GO
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostalCode], [City], [Province], [YearBuilt], [EmployeeId]) VALUES (N'BLD001', N'4580 Queen Mary Rd', N'H3W1W6', N'Montreal', N'Quebec', CAST(N'1990-08-10' AS Date), N'EMP001')
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostalCode], [City], [Province], [YearBuilt], [EmployeeId]) VALUES (N'BLD002', N'780 Boul de maisonneuve', N'H3H1K6', N'Montreal', N'Quebec', CAST(N'1999-10-25' AS Date), N'EMP002')
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostalCode], [City], [Province], [YearBuilt], [EmployeeId]) VALUES (N'BLD003', N'4575 saint mathieu', N'H4K1P7', N'Montreal', N'Quebec', CAST(N'2005-03-18' AS Date), N'EMP003')
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostalCode], [City], [Province], [YearBuilt], [EmployeeId]) VALUES (N'BLD004', N'2100 Guy Concordia', N'H8T4V7', N'Montreal', N'Quebec', CAST(N'2010-11-11' AS Date), N'EMP004')
GO
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [PhoneNumber], [JobTitle], [DateOfBirth], [Password]) VALUES (N'EMP001', N'Victoria', N'Murcia', N'vemur@gmail.com', N'8493099003', N'Owner', CAST(N'1990-09-23' AS Date), N'admin1234')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [PhoneNumber], [JobTitle], [DateOfBirth], [Password]) VALUES (N'EMP002', N'Jhon', N'Joe', N'ali@gmail.com', N'5147893993', N'Manager', CAST(N'1985-11-25' AS Date), N'admin1234')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [PhoneNumber], [JobTitle], [DateOfBirth], [Password]) VALUES (N'EMP003', N'Teresa', N'Morales', N'tere@gmail.com', N'5147890559', N'Manager', CAST(N'1984-05-04' AS Date), N'admin1234')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [PhoneNumber], [JobTitle], [DateOfBirth], [Password]) VALUES (N'EMP004', N'Jaina', N'Manik', N'jaina@gmail.com', N'5143491221', N'Manager', CAST(N'1990-12-28' AS Date), N'admin1234')
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Email], [PhoneNumber], [JobTitle], [DateOfBirth], [Password]) VALUES (N'EMP006', N'Mr', N'Cao', N'cao@gmail.com', N'4389257095', N'Manager', CAST(N'1980-09-17' AS Date), N'admin1234')
GO
INSERT [dbo].[Messages] ([MessageId], [MessageTitle], [MessageDate], [Description], [TenantId], [EmployeeId]) VALUES (N'MSG001', N'Clean apartment', CAST(N'2022-10-24T00:00:00.000' AS DateTime), N'Please clean the place for the new tenant', N'TNT001', N'EMP001')
INSERT [dbo].[Messages] ([MessageId], [MessageTitle], [MessageDate], [Description], [TenantId], [EmployeeId]) VALUES (N'MSG002', N'Fix windows', CAST(N'2022-12-10T00:00:00.000' AS DateTime), N'Please fix the broken windows', N'TNT008', N'EMP003')
INSERT [dbo].[Messages] ([MessageId], [MessageTitle], [MessageDate], [Description], [TenantId], [EmployeeId]) VALUES (N'MSG003', N'Color the walls', CAST(N'2022-09-15T00:00:00.000' AS DateTime), N'Please color the walls', N'TNT004', N'EMP001')
INSERT [dbo].[Messages] ([MessageId], [MessageTitle], [MessageDate], [Description], [TenantId], [EmployeeId]) VALUES (N'MSG004', N'Humidity ', CAST(N'2022-11-30T00:00:00.000' AS DateTime), N'Please fix the humidity in the main room', N'TNT001', N'EMP001')
GO
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT001', N'Felipe', N'Triana', N'4580 King Philip', N'felipeTriana@hotmail.com', N'4385556666', N'Single', N'admin1234', CAST(N'1986-06-06' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT002', N'Jaina', N'Manik', N'4580 Queen Mary Rd', N'jainamanik@gmail.com', N'5143491231', N'Single', N'abc1234', CAST(N'1998-12-06' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT003', N'Will', N'Smith', N'4580 Queen Mary Rd', N'will@hotmail.com', N'5147895667', N'Married', N'abc1234', CAST(N'1970-06-24' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT004', N'James', N'Bond', N'4580 Queen Mary Rd', N'james@yahoo.com', N'6147897663', N'Married', N'abc1234', CAST(N'1965-10-08' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT005', N'Steve', N'Jobs', N'780 Boul de maisonneuve', N'steve@icloud.com', N'5148905444', N'Married', N'abc1234', CAST(N'1960-09-10' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT006', N'Iron', N'Maiden', N'780 Boul de maisonneuve', N'maiden@gmail.com', N'7849758773', N'Single', N'abc1234', CAST(N'1980-09-17' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT007', N'Axel', N'Rose', N'4575 saint mathieu', N'axel@gmail.com', N'5147869339', N'Single', N'abc1234', CAST(N'1989-09-10' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT008', N'Steven', N'Tyler', N'4575 saint mathieu', N'steven@hotmail.com', N'5148967887', N'Single', N'abc1234', CAST(N'1984-10-10' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT009', N'Brian', N'Johnson', N'4575 saint mathieu', N'brianAcdc@gmail.com', N'7853787667', N'Single', N'abc1234', CAST(N'1975-11-04' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT010', N'Michael', N'Jackson', N'2100 Guy Concordia', N'jackson5@icloud.com', N'5147893990', N'Married', N'abc1234', CAST(N'1978-07-09' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT011', N'Albert', N'Einstein', N'2100 Guy Concordia', N'albert@science.com', N'5143491001', N'Married', N'abc1234', CAST(N'1920-10-25' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT012', N'Diego', N'Murcia', N'5602 Jean Talon- Ap 3', N'diegoMurcia@gmail.com', N'4385556666', N'Single', N'admin1234', CAST(N'1980-09-17' AS Date))
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [Address], [Email], [PhoneNumber], [MaritalStatus], [Password], [DateOfBirth]) VALUES (N'TNT013', N'Lola', N'Lopez', N'356 Av Summerhille', N'lolalo@gmail.com', N'4383456789', N'single', N'abc1234', CAST(N'1960-09-10' AS Date))
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Buildings] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Buildings]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Tenants] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([TenantId])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Tenants]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Employees]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Tenants] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([TenantId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Tenants]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [FK_Buildings_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [FK_Buildings_Employees]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Employees]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Tenants] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([TenantId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Tenants]
GO
USE [master]
GO
ALTER DATABASE [BuildingManagementDB] SET  READ_WRITE 
GO
