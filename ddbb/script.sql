USE [master]
GO
/****** Object:  Database [CarTwoCity]    Script Date: 9/30/2017 8:10:11 AM ******/
CREATE DATABASE [CarTwoCity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarTwoCity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\CarTwoCity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarTwoCity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\CarTwoCity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarTwoCity] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarTwoCity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarTwoCity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarTwoCity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarTwoCity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarTwoCity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarTwoCity] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarTwoCity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarTwoCity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarTwoCity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarTwoCity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarTwoCity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarTwoCity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarTwoCity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarTwoCity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarTwoCity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarTwoCity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarTwoCity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarTwoCity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarTwoCity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarTwoCity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarTwoCity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarTwoCity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarTwoCity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarTwoCity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarTwoCity] SET  MULTI_USER 
GO
ALTER DATABASE [CarTwoCity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarTwoCity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarTwoCity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarTwoCity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarTwoCity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarTwoCity] SET QUERY_STORE = OFF
GO
USE [CarTwoCity]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CarTwoCity]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[prefijo] [nvarchar](5) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](10) NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoEquipaje]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEquipaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoEquipaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[usuario] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sexo] [nchar](1) NULL,
	[idPais] [int] NULL,
	[idTipoDoc] [int] NULL,
	[numeroDoc] [numeric](18, 0) NULL,
	[telefono] [nvarchar](50) NULL,
	[imagen] [nvarchar](50) NULL,
	[puntosConductor] [decimal](18, 0) NULL,
	[puntosPasajero] [decimal](18, 0) NULL,
	[kmAcumulados] [decimal](18, 0) NULL,
	[co2] [decimal](18, 0) NULL,
	[fechaRegistro] [date] NULL,
	[fechaIngreso] [date] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patente] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
	[modelo] [int] NULL,
	[año] [int] NULL,
	[color] [nvarchar](50) NULL,
	[imagen] [nvarchar](50) NULL,
	[isUsuario] [int] NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viaje](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[origen] [nvarchar](50) NULL,
	[destino] [nvarchar](50) NULL,
	[lat1] [numeric](18, 0) NULL,
	[lng1] [numeric](18, 0) NULL,
	[lat2] [numeric](18, 0) NULL,
	[lng2] [numeric](18, 0) NULL,
	[kilometros] [decimal](18, 0) NULL,
	[co2] [decimal](18, 0) NULL,
	[idVehiculo] [int] NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ViajeCaracteristicas]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViajeCaracteristicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idViaje] [int] NULL,
	[asientos] [int] NULL,
	[idEquipaje] [int] NULL,
	[bebida] [bit] NULL,
	[comer] [bit] NULL,
	[musica] [bit] NULL,
	[fumar] [bit] NULL,
	[mixto] [bit] NULL,
	[mascota] [bit] NULL,
	[flexibilidad] [int] NULL,
	[aceptacion] [bit] NULL,
 CONSTRAINT [PK_ViajeCaracteristicas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ViajeUsuario]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViajeUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idViaje] [int] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Pais]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoDocumento] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoDocumento]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Usuario] FOREIGN KEY([isUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Usuario]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Vehiculo] FOREIGN KEY([idVehiculo])
REFERENCES [dbo].[Vehiculo] ([id])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Vehiculo]
GO
ALTER TABLE [dbo].[ViajeCaracteristicas]  WITH CHECK ADD  CONSTRAINT [FK_ViajeCaracteristicas_TipoEquipaje] FOREIGN KEY([idEquipaje])
REFERENCES [dbo].[TipoEquipaje] ([id])
GO
ALTER TABLE [dbo].[ViajeCaracteristicas] CHECK CONSTRAINT [FK_ViajeCaracteristicas_TipoEquipaje]
GO
ALTER TABLE [dbo].[ViajeCaracteristicas]  WITH CHECK ADD  CONSTRAINT [FK_ViajeCaracteristicas_Viaje] FOREIGN KEY([idViaje])
REFERENCES [dbo].[Viaje] ([id])
GO
ALTER TABLE [dbo].[ViajeCaracteristicas] CHECK CONSTRAINT [FK_ViajeCaracteristicas_Viaje]
GO
ALTER TABLE [dbo].[ViajeUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ViajeUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[ViajeUsuario] CHECK CONSTRAINT [FK_ViajeUsuario_Usuario]
GO
ALTER TABLE [dbo].[ViajeUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ViajeUsuario_Viaje] FOREIGN KEY([idViaje])
REFERENCES [dbo].[Viaje] ([id])
GO
ALTER TABLE [dbo].[ViajeUsuario] CHECK CONSTRAINT [FK_ViajeUsuario_Viaje]
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioInsert]    Script Date: 9/30/2017 8:10:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UsuarioInsert]
    @nombre as nvarchar(50),
	@apellido as nvarchar(50),
	@usuario as nvarchar(50),
	@email as nvarchar(50),
	@sexo as nchar(1),
	@idPais as int,
	@idTipoDoc as int,
	@numeroDoc as numeric(18,0),
	@telefono as nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[Usuario]
        ([nombre]
        ,[apellido]
        ,[usuario]
        ,[email]
        ,[sexo]
        ,[idPais]
        ,[idTipoDoc]
        ,[numeroDoc]
        ,[telefono]
		,[fechaRegistro]
		)
     VALUES
		(@nombre,
		@apellido,
		@usuario,
		@email,
		@sexo,
		@idPais,
		@idTipoDoc,
		@numeroDoc,
		@telefono,
		GETDATE())
END

GO
USE [master]
GO
ALTER DATABASE [CarTwoCity] SET  READ_WRITE 
GO
