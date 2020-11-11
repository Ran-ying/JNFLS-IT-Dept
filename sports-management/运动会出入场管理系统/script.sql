USE [master]
GO
/****** Object:  Database [2018年运动会]    Script Date: 10/12/2018 07:53:14 ******/
CREATE DATABASE [2018年运动会] ON  PRIMARY 
( NAME = N'2018年运动会', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.JACK\MSSQL\DATA\2018年运动会.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'2018年运动会_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.JACK\MSSQL\DATA\2018年运动会_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [2018年运动会] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [2018年运动会].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [2018年运动会] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [2018年运动会] SET ANSI_NULLS OFF
GO
ALTER DATABASE [2018年运动会] SET ANSI_PADDING OFF
GO
ALTER DATABASE [2018年运动会] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [2018年运动会] SET ARITHABORT OFF
GO
ALTER DATABASE [2018年运动会] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [2018年运动会] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [2018年运动会] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [2018年运动会] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [2018年运动会] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [2018年运动会] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [2018年运动会] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [2018年运动会] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [2018年运动会] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [2018年运动会] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [2018年运动会] SET  DISABLE_BROKER
GO
ALTER DATABASE [2018年运动会] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [2018年运动会] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [2018年运动会] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [2018年运动会] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [2018年运动会] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [2018年运动会] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [2018年运动会] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [2018年运动会] SET  READ_WRITE
GO
ALTER DATABASE [2018年运动会] SET RECOVERY SIMPLE
GO
ALTER DATABASE [2018年运动会] SET  MULTI_USER
GO
ALTER DATABASE [2018年运动会] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [2018年运动会] SET DB_CHAINING OFF
GO
USE [2018年运动会]
GO
/****** Object:  Table [dbo].[运动员项目信息]    Script Date: 10/12/2018 07:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[运动员项目信息](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[编号] [nchar](10) NULL,
	[项目] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[运动员扣分汇总]    Script Date: 10/12/2018 07:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[运动员扣分汇总](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[编号] [char](10) NULL,
	[备注] [nvarchar](50) NULL,
	[班级] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[运动员卡号信息]    Script Date: 10/12/2018 07:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[运动员卡号信息](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[运动员卡号] [int] NULL,
	[编号] [char](10) NULL,
	[姓名] [nvarchar](50) NULL,
	[班级] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[运动员出]    Script Date: 10/12/2018 07:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[运动员出](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[出门时间] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[项目]    Script Date: 10/12/2018 07:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[项目] [nvarchar](50) NULL,
	[出门开始时间] [datetime] NULL,
	[出门结束时间] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[登录]    Script Date: 10/12/2018 07:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[登录](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[地址] [nvarchar](50) NULL,
	[身份] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[班级扣分汇总]    Script Date: 10/12/2018 07:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[班级扣分汇总](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[班级] [nvarchar](50) NULL,
	[备注] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[班级卡号信息]    Script Date: 10/12/2018 07:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[班级卡号信息](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[班级] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[班级出]    Script Date: 10/12/2018 07:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[班级出](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[卡号] [int] NULL,
	[出门时间] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
