USE [master]
GO
/****** Object:  Database [Jail]    Script Date: 11.01.2020 20:23:44 ******/
CREATE DATABASE [Jail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jail', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Jail.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Jail_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Jail_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Jail] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jail].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jail] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jail] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jail] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jail] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jail] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jail] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jail] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jail] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jail] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jail] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jail] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jail] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jail] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jail] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jail] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jail] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jail] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jail] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jail] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jail] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jail] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jail] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jail] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jail] SET  MULTI_USER 
GO
ALTER DATABASE [Jail] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jail] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jail] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jail] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jail] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Jail] SET QUERY_STORE = OFF
GO
USE [Jail]
GO
/****** Object:  Table [dbo].[visit]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit](
	[visitorID] [int] IDENTITY(1,1) NOT NULL,
	[prisonerid] [int] NOT NULL,
	[visiterName] [nvarchar](50) NOT NULL,
	[visiterSurname] [nvarchar](50) NOT NULL,
	[relashionship] [nvarchar](50) NULL,
	[dateOfVisit] [date] NOT NULL,
	[purposeOfVisit] [nvarchar](100) NULL,
	[stuffBringed] [nvarchar](200) NULL,
	[IsAccepted] [bit] NOT NULL,
	[VisitTime] [time](7) NULL,
 CONSTRAINT [PK_visit] PRIMARY KEY CLUSTERED 
(
	[visitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[visitTimes]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[visitTimes]
AS
SELECT        dateOfVisit, VisitTime, COUNT(*) AS num
FROM            dbo.visit
GROUP BY dateOfVisit, VisitTime
GO
/****** Object:  Table [dbo].[Adjudication]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjudication](
	[AdjudicationID] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[periodInDays] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[crimeDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Adjudication] PRIMARY KEY CLUSTERED 
(
	[AdjudicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorAccount]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorAccount](
	[administratorID] [int] IDENTITY(1,1) NOT NULL,
	[OfficerID] [int] NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[roll] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdministratorAccounts] PRIMARY KEY CLUSTERED 
(
	[administratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facility]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facility](
	[facilityID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_facility] PRIMARY KEY CLUSTERED 
(
	[facilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[jobID] [int] IDENTITY(1,1) NOT NULL,
	[jobTitle] [nvarchar](50) NOT NULL,
	[dailyStartingTime] [time](7) NULL,
	[dailyEndingTime] [time](7) NULL,
	[JobDescription] [nvarchar](max) NULL,
	[facilityid] [int] NOT NULL,
	[availablePositionsCount] [int] NOT NULL,
	[workerType] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[officer]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[officer](
	[officerID] [int] IDENTITY(1,1) NOT NULL,
	[rank] [nvarchar](20) NULL,
	[citizinID] [nvarchar](11) NOT NULL,
	[dateOfBirth] [date] NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[imageURL] [nvarchar](200) NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_officers] PRIMARY KEY CLUSTERED 
(
	[officerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[officerRoom]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[officerRoom](
	[officerRoomID] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](100) NULL,
	[area] [float] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_officerRoom] PRIMARY KEY CLUSTERED 
(
	[officerRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[officerStayIn]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[officerStayIn](
	[officerRoomid] [int] NOT NULL,
	[officerid] [int] NOT NULL,
	[since] [date] NULL,
 CONSTRAINT [PK_officerStayIn] PRIMARY KEY CLUSTERED 
(
	[officerRoomid] ASC,
	[officerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficerWorkAs]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficerWorkAs](
	[officerid] [int] NOT NULL,
	[jobid] [int] NOT NULL,
	[since] [date] NULL,
	[until] [date] NULL,
 CONSTRAINT [PK_OfficerWorkAs] PRIMARY KEY CLUSTERED 
(
	[officerid] ASC,
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisoner]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisoner](
	[prisonerID] [int] IDENTITY(1,1) NOT NULL,
	[adjudicationid] [int] NOT NULL,
	[citizinid] [nvarchar](11) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NULL,
	[dateOfBirth] [date] NULL,
	[imageURL] [nvarchar](200) NULL,
 CONSTRAINT [PK_Prisoners] PRIMARY KEY CLUSTERED 
(
	[prisonerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prisonerCell]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prisonerCell](
	[prisonerCellID] [int] IDENTITY(1,1) NOT NULL,
	[capacity] [int] NOT NULL,
	[cellType] [nvarchar](50) NOT NULL,
	[area] [float] NULL,
	[address] [nvarchar](100) NULL,
	[availableCount] [int] NOT NULL,
 CONSTRAINT [PK_PrisonerStayIn] PRIMARY KEY CLUSTERED 
(
	[prisonerCellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prisonerSatyIn]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prisonerSatyIn](
	[prisonerid] [int] NOT NULL,
	[prisonerCellid] [int] NOT NULL,
	[since] [date] NOT NULL,
 CONSTRAINT [PK_prisonerSatyIn] PRIMARY KEY CLUSTERED 
(
	[prisonerid] ASC,
	[prisonerCellid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrisonerWorkAs]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrisonerWorkAs](
	[prisonerid] [int] NOT NULL,
	[jobid] [int] NOT NULL,
	[since] [date] NULL,
	[until] [date] NULL,
 CONSTRAINT [PK_PrisonerWorkAs] PRIMARY KEY CLUSTERED 
(
	[prisonerid] ASC,
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[times]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[times](
	[time] [time](7) NOT NULL,
 CONSTRAINT [PK_times] PRIMARY KEY CLUSTERED 
(
	[time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_AdministratorAccount]    Script Date: 11.01.2020 20:23:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdministratorAccount] ON [dbo].[AdministratorAccount]
(
	[OfficerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AdministratorAccount_1]    Script Date: 11.01.2020 20:23:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdministratorAccount_1] ON [dbo].[AdministratorAccount]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Prisoner]    Script Date: 11.01.2020 20:23:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Prisoner] ON [dbo].[Prisoner]
(
	[adjudicationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Job] ADD  CONSTRAINT [DF_Job_isAvailable]  DEFAULT ((1)) FOR [availablePositionsCount]
GO
ALTER TABLE [dbo].[officerRoom] ADD  CONSTRAINT [DF_officerRoom_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[visit] ADD  CONSTRAINT [DF_visit_IsAccepted]  DEFAULT ((1)) FOR [IsAccepted]
GO
ALTER TABLE [dbo].[AdministratorAccount]  WITH CHECK ADD  CONSTRAINT [FK_AdministratorAccount_officer] FOREIGN KEY([OfficerID])
REFERENCES [dbo].[officer] ([officerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdministratorAccount] CHECK CONSTRAINT [FK_AdministratorAccount_officer]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_facility] FOREIGN KEY([facilityid])
REFERENCES [dbo].[facility] ([facilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_facility]
GO
ALTER TABLE [dbo].[officerStayIn]  WITH CHECK ADD  CONSTRAINT [FK_officerStayIn_officer] FOREIGN KEY([officerid])
REFERENCES [dbo].[officer] ([officerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[officerStayIn] CHECK CONSTRAINT [FK_officerStayIn_officer]
GO
ALTER TABLE [dbo].[officerStayIn]  WITH CHECK ADD  CONSTRAINT [FK_officerStayIn_officerRoom] FOREIGN KEY([officerRoomid])
REFERENCES [dbo].[officerRoom] ([officerRoomID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[officerStayIn] CHECK CONSTRAINT [FK_officerStayIn_officerRoom]
GO
ALTER TABLE [dbo].[OfficerWorkAs]  WITH CHECK ADD  CONSTRAINT [FK_OfficerWorkAs_Job] FOREIGN KEY([jobid])
REFERENCES [dbo].[Job] ([jobID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfficerWorkAs] CHECK CONSTRAINT [FK_OfficerWorkAs_Job]
GO
ALTER TABLE [dbo].[OfficerWorkAs]  WITH CHECK ADD  CONSTRAINT [FK_OfficerWorkAs_officer] FOREIGN KEY([officerid])
REFERENCES [dbo].[officer] ([officerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfficerWorkAs] CHECK CONSTRAINT [FK_OfficerWorkAs_officer]
GO
ALTER TABLE [dbo].[Prisoner]  WITH CHECK ADD  CONSTRAINT [FK_Prisoner_Adjudication] FOREIGN KEY([adjudicationid])
REFERENCES [dbo].[Adjudication] ([AdjudicationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prisoner] CHECK CONSTRAINT [FK_Prisoner_Adjudication]
GO
ALTER TABLE [dbo].[prisonerSatyIn]  WITH CHECK ADD  CONSTRAINT [FK_prisonerSatyIn_Prisoner] FOREIGN KEY([prisonerid])
REFERENCES [dbo].[Prisoner] ([prisonerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prisonerSatyIn] CHECK CONSTRAINT [FK_prisonerSatyIn_Prisoner]
GO
ALTER TABLE [dbo].[prisonerSatyIn]  WITH CHECK ADD  CONSTRAINT [FK_prisonerSatyIn_prisonerCell] FOREIGN KEY([prisonerCellid])
REFERENCES [dbo].[prisonerCell] ([prisonerCellID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prisonerSatyIn] CHECK CONSTRAINT [FK_prisonerSatyIn_prisonerCell]
GO
ALTER TABLE [dbo].[PrisonerWorkAs]  WITH CHECK ADD  CONSTRAINT [FK_PrisonerWorkAs_Job] FOREIGN KEY([jobid])
REFERENCES [dbo].[Job] ([jobID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrisonerWorkAs] CHECK CONSTRAINT [FK_PrisonerWorkAs_Job]
GO
ALTER TABLE [dbo].[PrisonerWorkAs]  WITH CHECK ADD  CONSTRAINT [FK_PrisonerWorkAs_Prisoner] FOREIGN KEY([prisonerid])
REFERENCES [dbo].[Prisoner] ([prisonerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrisonerWorkAs] CHECK CONSTRAINT [FK_PrisonerWorkAs_Prisoner]
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD  CONSTRAINT [FK_visit_Prisoner] FOREIGN KEY([prisonerid])
REFERENCES [dbo].[Prisoner] ([prisonerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[visit] CHECK CONSTRAINT [FK_visit_Prisoner]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableAppointments]    Script Date: 11.01.2020 20:23:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableAppointments] 
@numberOfVisitsAtTheSameTime int =2
AS
BEGIN
   select* from times
           where time not in(
           select visitTime from visitTimes
           where num >= @numberOfVisitsAtTheSameTime)
END
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
         Begin Table = "visit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 312
            End
            DisplayFlags = 280
            TopColumn = 2
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'visitTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'visitTimes'
GO
USE [master]
GO
ALTER DATABASE [Jail] SET  READ_WRITE 
GO
