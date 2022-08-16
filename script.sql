USE [master]
GO
/****** Object:  Database [Sistema Perinatal BD V7]    Script Date: 16/08/2022 4:25:35 a. m. ******/
CREATE DATABASE [Sistema Perinatal BD V7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema Perinatal BD V7_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sistema Perinatal BD V7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sistema Perinatal BD V7_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sistema Perinatal BD V7.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema Perinatal BD V7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema Perinatal BD V7', N'ON'
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET QUERY_STORE = OFF
GO
USE [Sistema Perinatal BD V7]
GO
/****** Object:  Table [dbo].[AdmisiónParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmisiónParto](
	[IdAdmisiónAborto] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Parto] [bit] NOT NULL,
	[Aborto] [bit] NOT NULL,
	[CarnéPerinatal] [bit] NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[TamañoFetalAcorde] [bit] NOT NULL,
	[Acompañante] [bit] NOT NULL,
	[TipoAcompañante] [varchar](20) NOT NULL,
	[CorticoidesPrenatales] [varchar](20) NOT NULL,
	[SemanaInicioCorticoidesPrenatales] [date] NOT NULL,
	[Episotomía] [bit] NOT NULL,
	[TARV] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdAdmisiónAborto] ASC,
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anestesia]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anestesia](
	[IdMedicamentoAnestesia] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Anestesia] [bit] NOT NULL,
 CONSTRAINT [PK_Anestesia] PRIMARY KEY CLUSTERED 
(
	[IdMedicamentoAnestesia] ASC,
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnestesiaGeneral]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnestesiaGeneral](
	[IdAnestesiaGeneral] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicamentoAnestesia] [int] NOT NULL,
	[AnestesiaGeneral] [bit] NOT NULL,
 CONSTRAINT [PK_AnestesiaGeneral] PRIMARY KEY CLUSTERED 
(
	[IdAnestesiaGeneral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnestesiaLocal]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnestesiaLocal](
	[IdAnestesiaLocal] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicamentoAnestesia] [int] NOT NULL,
	[AnestesiaLocal] [bit] NOT NULL,
 CONSTRAINT [PK_AnestesiaLocal] PRIMARY KEY CLUSTERED 
(
	[IdAnestesiaLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnestesiaRegional]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnestesiaRegional](
	[IdAnestesiaRegional] [int] NOT NULL,
	[IdMedicamentoAnestesia] [int] NOT NULL,
	[AnestesiaRegional] [bit] NOT NULL,
 CONSTRAINT [PK_AnestesiaRegional] PRIMARY KEY CLUSTERED 
(
	[IdAnestesiaRegional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Antecedentes]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antecedentes](
	[IdAntecedente] [int] NOT NULL,
	[Antecedente] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Antecedentes] PRIMARY KEY CLUSTERED 
(
	[IdAntecedente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesFamiliares]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesFamiliares](
	[IdAntecedenteFamiliar] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [bigint] NOT NULL,
	[IdAntecedente] [int] NOT NULL,
 CONSTRAINT [PK_Antecedentes familiares] PRIMARY KEY CLUSTERED 
(
	[IdAntecedenteFamiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesObstetricos]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesObstetricos](
	[IdAntecedentesObstetricos] [int] NOT NULL,
	[IdPacientes] [bigint] NOT NULL,
	[NumeroGestasPrevias] [int] NOT NULL,
	[NumeroPartosVaginales] [int] NOT NULL,
	[NumeroPartosCesareas] [int] NOT NULL,
	[IdUltimoPrevio] [int] NOT NULL,
	[Gemelares] [bit] NOT NULL,
	[NumeroAbortos] [int] NOT NULL,
	[NumeroNacidosVivos] [int] NOT NULL,
	[NumeroEmbarazoEctopico] [int] NOT NULL,
	[NumeroNacidosMuertos] [int] NOT NULL,
	[NumeroHijosVivos] [int] NOT NULL,
	[Muertes1raSemana] [int] NOT NULL,
	[MuertesDespués1raSemana] [int] NOT NULL,
	[FinEmbarazoAnterior] [date] NOT NULL,
	[EmbarazoPlaneado] [bit] NOT NULL,
	[IdFracasoMetodoAnticonceptivo] [int] NOT NULL,
 CONSTRAINT [PK_AntecedentesObstetricos] PRIMARY KEY CLUSTERED 
(
	[IdAntecedentesObstetricos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesPersonales]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesPersonales](
	[IdAntecedentePersonal] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [bigint] NOT NULL,
	[IdAntecedente] [int] NOT NULL,
 CONSTRAINT [PK_Antecedentes personales] PRIMARY KEY CLUSTERED 
(
	[IdAntecedentePersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Antirubeola]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antirubeola](
	[IdAntirubeola] [int] NOT NULL,
	[Antirubeola] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Antirubeola] PRIMARY KEY CLUSTERED 
(
	[IdAntirubeola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bacteriuria]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bacteriuria](
	[IdBacteriuria] [int] NOT NULL,
	[ResultadoBacteriuria] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Bacteriuria] PRIMARY KEY CLUSTERED 
(
	[IdBacteriuria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chagas]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chagas](
	[IdChagas] [int] NOT NULL,
	[ResultadoChagas] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Chagas] PRIMARY KEY CLUSTERED 
(
	[IdChagas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultasAntenatales]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultasAntenatales](
	[IdPaciente] [bigint] NOT NULL,
	[IdConsultaAntenatal] [int] NOT NULL,
	[FechaConsulta] [date] NOT NULL,
	[EdadGestacional] [int] NOT NULL,
	[Peso] [decimal](18, 0) NOT NULL,
	[PresionArterial] [decimal](18, 0) NOT NULL,
	[AlturaUterina] [decimal](18, 0) NOT NULL,
	[Presentacion] [varchar](20) NOT NULL,
	[FrecuenciaCardiacaFetal] [int] NOT NULL,
	[MovimientosFetales] [text] NOT NULL,
	[Proteinuria] [text] NOT NULL,
	[SignosAlarma] [text] NOT NULL,
	[InicialesTecnico] [text] NOT NULL,
	[ProximaCita] [date] NOT NULL,
 CONSTRAINT [PK_ConsultasAntenatales] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatosNacimientoRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosNacimientoRecienNacido](
	[IdDatosNacimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdEstadoVitalRecienNacido] [int] NOT NULL,
	[FechaHoraNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_DatosNacimientoRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdDatosNacimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DefectoCongenito]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefectoCongenito](
	[IdDefectoCongenito] [int] NOT NULL,
	[DefectoCongenito] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desgarros]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desgarros](
	[IdDesgarros] [int] IDENTITY(1,1) NOT NULL,
	[Desgarros] [bit] NOT NULL,
	[Grado] [int] NOT NULL,
 CONSTRAINT [PK_Desgarros] PRIMARY KEY CLUSTERED 
(
	[IdDesgarros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoRecienNacido](
	[IdDestinoRecienNacido] [int] NOT NULL,
	[DestinoRecienNacido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DestinoRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdDestinoRecienNacido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPartograma]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPartograma](
	[IdDetallesPartograma] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[CurvasAlerta] [bit] NOT NULL,
 CONSTRAINT [PK_HospitalizacionEmbarazo] PRIMARY KEY CLUSTERED 
(
	[IdDetallesPartograma] ASC,
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeterminarEdadGestacionalParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeterminarEdadGestacionalParto](
	[IdDeterminarEdadGestacional] [int] IDENTITY(1,1) NOT NULL,
	[IdEdadGestacionalParto] [int] NOT NULL,
	[FUM] [bit] NOT NULL,
	[Ecografía] [bit] NOT NULL,
 CONSTRAINT [PK_DeterminarEdadGestacionalParto] PRIMARY KEY CLUSTERED 
(
	[IdDeterminarEdadGestacional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EdadGestacionalParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdadGestacionalParto](
	[IdGestacionalParto] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Días] [int] NOT NULL,
	[Semanas] [int] NOT NULL,
 CONSTRAINT [PK_EdadGestacionalParto] PRIMARY KEY CLUSTERED 
(
	[IdGestacionalParto] ASC,
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EdadGestacionalRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdadGestacionalRecienNacido](
	[IdEdadGestacionalRecienNacido] [int] NOT NULL,
	[Semanas] [nchar](10) NOT NULL,
	[Dias] [int] NOT NULL,
 CONSTRAINT [PK_EdadGestacionalRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdEdadGestacionalRecienNacido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedad_viral Prueba]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad_viral Prueba](
	[IdEnfermedadViral] [int] NOT NULL,
	[Sifilis] [bit] NOT NULL,
	[VIH] [bit] NOT NULL,
 CONSTRAINT [PK_Enfermedad_viral] PRIMARY KEY CLUSTERED 
(
	[IdEnfermedadViral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnfermedadesRN]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnfermedadesRN](
	[IdEnfermedadRN] [int] NOT NULL,
	[EnfermedadRN] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EnfermedadesRN] PRIMARY KEY CLUSTERED 
(
	[IdEnfermedadRN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCivil]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCivil](
	[IdEstadoCivil] [int] NOT NULL,
	[EstadoCivil] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Estado Civil] PRIMARY KEY CLUSTERED 
(
	[IdEstadoCivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoVitalRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoVitalRecienNacido](
	[IdEstadoVitalRecienNacido] [int] IDENTITY(1,1) NOT NULL,
	[EstadoVitalRecienNacido] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EstadoVitalRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdEstadoVitalRecienNacido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estreptococo]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estreptococo](
	[IdEstreptococo] [int] NOT NULL,
	[ResultadoEstreptococo] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Estreptococo] PRIMARY KEY CLUSTERED 
(
	[IdEstreptococo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudios]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudios](
	[IdEstudio] [int] NOT NULL,
	[Estudio] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Escolaridad] PRIMARY KEY CLUSTERED 
(
	[IdEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etnia]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etnia](
	[IdEtnia] [int] NOT NULL,
	[Etnia] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Etnia] PRIMARY KEY CLUSTERED 
(
	[IdEtnia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvoluciónTrabajoParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvoluciónTrabajoParto](
	[IdEvoluciónTrabajoParto] [int] IDENTITY(1,1) NOT NULL,
	[IdDetallesPartograma] [int] NOT NULL,
	[HoraMinutosEvaluación] [time](4) NOT NULL,
	[PosiciónGestante] [varchar](20) NOT NULL,
	[PresiónArterial] [nchar](10) NOT NULL,
	[PulsoLatidosPorMinuto] [int] NOT NULL,
	[ContraccionesUterinas] [int] NOT NULL,
	[DilataciónCervicalCM] [int] NOT NULL,
	[AlturaPresentación] [nchar](5) NOT NULL,
	[VariedadPosición] [varchar](20) NOT NULL,
	[PresenciaMeconio] [bit] NOT NULL,
	[FrecuenciaCardiacaFetal] [int] NOT NULL,
 CONSTRAINT [PK_EvoluciónTrabajoParto] PRIMARY KEY CLUSTERED 
(
	[IdEvoluciónTrabajoParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpulsiónPlacenta]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpulsiónPlacenta](
	[IdExpulsiónPlacenta] [int] IDENTITY(1,1) NOT NULL,
	[ExpulsiónPlacenta] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ExpulsiónPlacenta] PRIMARY KEY CLUSTERED 
(
	[IdExpulsiónPlacenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FracasoMetodoAnticonceptivo]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FracasoMetodoAnticonceptivo](
	[IdFracasoMetodoAnticonceptivo] [int] IDENTITY(1,1) NOT NULL,
	[IdHCP] [int] NOT NULL,
	[IdMetodoAnticonceptivo] [int] NOT NULL,
 CONSTRAINT [PK_Fracaso Metodo Anticonceptivo] PRIMARY KEY CLUSTERED 
(
	[IdFracasoMetodoAnticonceptivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GestacionActual]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GestacionActual](
	[IdGestacionActual] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [bigint] NOT NULL,
	[PesoAnterior] [decimal](18, 0) NOT NULL,
	[Talla] [decimal](18, 0) NOT NULL,
	[FUM] [date] NOT NULL,
	[FPP] [date] NOT NULL,
	[EGConfiableFUM] [bit] NOT NULL,
	[EGConfiableEco] [bit] NOT NULL,
	[IdAntirubeola] [int] NOT NULL,
	[Antitetanica] [bit] NOT NULL,
	[ExamenOdontologico] [bit] NOT NULL,
	[ExamenMamas] [bit] NOT NULL,
	[IdGrupoSanguineo] [int] NOT NULL,
	[TipoRH] [varchar](20) NOT NULL,
	[IdToxoplasmosis] [int] NULL,
	[TipoToxoplasmosis] [varchar](20) NULL,
	[IdVIH] [int] NOT NULL,
	[IdTestVIH] [int] NOT NULL,
	[SemanasEmabarazo] [int] NOT NULL,
	[IdTtoAntirretroviral] [int] NULL,
	[HCPAntenatal] [varchar](20) NULL,
	[HCPAborto] [varchar](20) NULL,
	[SuplementoHierro] [bit] NOT NULL,
	[AcidoFolico] [bit] NOT NULL,
	[IdPruebaSifilis] [int] NOT NULL,
	[IdTreponemica] [int] NOT NULL,
	[IdNoTreponemica] [int] NOT NULL,
	[SemanaPruebaSifilis] [int] NOT NULL,
	[IdChagas] [int] NOT NULL,
	[IdMalaria] [int] NOT NULL,
	[IdBacteriuria] [int] NOT NULL,
	[GlucemiaAyunas] [decimal](18, 0) NULL,
	[IdEstreptococo] [int] NOT NULL,
	[PreparacionParto] [bit] NULL,
	[ConsejeriaLactancia] [bit] NOT NULL,
 CONSTRAINT [PK_GestacionActual] PRIMARY KEY CLUSTERED 
(
	[IdGestacionActual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitos](
	[IdHabito] [int] NOT NULL,
	[Habito] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Hábitos] PRIMARY KEY CLUSTERED 
(
	[IdHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HCP]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HCP](
	[IdHCP] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaHCP] [varchar](25) NOT NULL,
	[PesoAnterior] [int] NOT NULL,
	[Talla] [int] NOT NULL,
	[FUM] [date] NOT NULL,
	[FPP] [date] NOT NULL,
	[EGConfiableFUM] [bit] NOT NULL,
	[EGConfiableEco] [bit] NOT NULL,
	[IdFumadoraActiva] [int] NOT NULL,
	[IdFumadoraPasiva] [int] NOT NULL,
	[IdUsoDrogas] [int] NOT NULL,
	[IdUsoAlcohol] [int] NOT NULL,
	[IdViolencia] [int] NOT NULL,
	[IdAntirubeola] [int] NOT NULL,
	[Antitetanica] [bit] NOT NULL,
	[DosisAntitetanica] [nchar](10) NOT NULL,
	[MesGestacion] [int] NOT NULL,
	[ExamenOdontologico] [bit] NOT NULL,
	[ExamendeMama] [bit] NOT NULL,
	[Apgar1] [nvarchar](10) NOT NULL,
	[Apgar2] [nvarchar](50) NOT NULL,
	[FalleceLugarParto] [bit] NOT NULL,
 CONSTRAINT [PK_Historia Clinica] PRIMARY KEY CLUSTERED 
(
	[IdHCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hemorragias]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hemorragias](
	[IdHemorragias] [int] IDENTITY(1,1) NOT NULL,
	[Hemorragia] [bit] NOT NULL,
	[Postparto] [bit] NOT NULL,
	[Infeccion_Puerperal] [bit] NOT NULL,
	[IdTrimestre] [int] NOT NULL,
 CONSTRAINT [PK_Hemorragias] PRIMARY KEY CLUSTERED 
(
	[IdHemorragias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizaciónEmbarazo]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalizaciónEmbarazo](
	[IdHospitalizaciónEmbarazo] [int] IDENTITY(1,1) NOT NULL,
	[HospitalizaciónEnEmbarazo] [bit] NOT NULL,
	[DíasHospitalización] [int] NOT NULL,
 CONSTRAINT [PK_HospitalizaciónEmbarazo] PRIMARY KEY CLUSTERED 
(
	[IdHospitalizaciónEmbarazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdMedicaciónRecibida]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdMedicaciónRecibida](
	[IdMedicaciónRecibida] [int] IDENTITY(1,1) NOT NULL,
	[IdRecibida] [int] NULL,
 CONSTRAINT [PK_IdMedicaciónRecibida] PRIMARY KEY CLUSTERED 
(
	[IdMedicaciónRecibida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicaciónPrincipalInducción]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicaciónPrincipalInducción](
	[IdIndicaciónInducción] [int] IDENTITY(1,1) NOT NULL,
	[CausasInducción] [varchar](max) NOT NULL,
	[CódigoInducción] [int] NOT NULL,
 CONSTRAINT [PK_IndicaciónPrincipalInducción] PRIMARY KEY CLUSTERED 
(
	[IdIndicaciónInducción] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InicioTrabajoParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InicioTrabajoParto](
	[IdInicioTrabajoParto] [int] IDENTITY(1,1) NOT NULL,
	[TipoTrabajoParto] [varchar](20) NOT NULL,
 CONSTRAINT [PK_InicioTrabajoParto] PRIMARY KEY CLUSTERED 
(
	[IdInicioTrabajoParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LigaduraCordón]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LigaduraCordón](
	[IdLigaduraCordón] [int] IDENTITY(1,1) NOT NULL,
	[LigaduraCordónPrecoz] [bit] NOT NULL,
 CONSTRAINT [PK_LigaduraCordón] PRIMARY KEY CLUSTERED 
(
	[IdLigaduraCordón] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LongitudRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LongitudRecienNacido](
	[IdLongitud] [int] NOT NULL,
	[Longitud] [numeric](3, 1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicamentoOcitocicos]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicamentoOcitocicos](
	[IdOcitocicosTDP] [int] IDENTITY(1,1) NOT NULL,
	[IdRecibida] [int] NOT NULL,
	[Recibida] [bit] NOT NULL,
 CONSTRAINT [PK_MedicamentoOcitocicos] PRIMARY KEY CLUSTERED 
(
	[IdOcitocicosTDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodosAnticonceptivos]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodosAnticonceptivos](
	[IdMetodoAnticonceptivo] [int] NOT NULL,
	[MetodoAnticonceptivo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Metodos Anticonceptivos] PRIMARY KEY CLUSTERED 
(
	[IdMetodoAnticonceptivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NacimientoRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NacimientoRecienNacido](
	[IdNacimiento] [int] IDENTITY(1,1) NOT NULL,
	[EstadoVitalReciénNacido] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EstadoVitalReciénNacido] PRIMARY KEY CLUSTERED 
(
	[IdNacimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocitocicos]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocitocicos](
	[IdOcitocicos] [int] IDENTITY(1,1) NOT NULL,
	[IdUsoOcitocicos] [int] NOT NULL,
 CONSTRAINT [PK_Ocitocicos] PRIMARY KEY CLUSTERED 
(
	[IdOcitocicos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtraMedicación]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtraMedicación](
	[IdOtraMedición] [int] IDENTITY(1,1) NOT NULL,
	[IdRecibida] [int] NOT NULL,
	[Medicación] [varchar](max) NOT NULL,
	[Código] [int] NOT NULL,
 CONSTRAINT [PK_OtraMedicación] PRIMARY KEY CLUSTERED 
(
	[IdOtraMedición] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtrasEnfermedades]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtrasEnfermedades](
	[IdOtrasEnfermedades] [int] NOT NULL,
	[IdEnfermedadRN] [int] NOT NULL,
	[Observación] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPacientes] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Apellido] [varchar](25) NOT NULL,
	[Domicilio] [varchar](25) NOT NULL,
	[Localidad] [varchar](25) NOT NULL,
	[Municipio] [varchar](25) NOT NULL,
	[Telefono] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdEtnia] [int] NOT NULL,
	[Alfabeta] [bit] NOT NULL,
	[IdEstudio] [int] NOT NULL,
	[AñosMayorNivel] [int] NOT NULL,
	[IdEstadoCivil] [int] NOT NULL,
	[ViveSola] [bit] NOT NULL,
	[LugarControlPrenatal] [varchar](25) NOT NULL,
	[LugarPartoAborto] [varchar](25) NOT NULL,
	[NumeroIdentidad] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[IdPacientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaludismoMalaria]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaludismoMalaria](
	[IdMalaria] [int] NOT NULL,
	[ResultadoMalaria] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PaludismoMalaria] PRIMARY KEY CLUSTERED 
(
	[IdMalaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatologiaMaterna]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatologiaMaterna](
	[IdPaciente] [int] NOT NULL,
	[IdPatologia] [int] NOT NULL,
 CONSTRAINT [PK_PatologiaMaterna] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC,
	[IdPatologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patologias]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patologias](
	[IdPatologías] [int] NOT NULL,
	[Patologías] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Enfermedades] PRIMARY KEY CLUSTERED 
(
	[IdPatologías] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCefálicoRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCefálicoRecienNacido](
	[IdP_Cefalico] [int] NOT NULL,
	[P_Cefalico] [numeric](3, 1) NOT NULL,
 CONSTRAINT [PK_PCefálicoRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdP_Cefalico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalAtenciónParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalAtenciónParto](
	[IdPersonalAtención] [int] IDENTITY(1,1) NOT NULL,
	[PersonalAtención] [varchar](20) NOT NULL,
	[Identificación] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersonalAtenciónParto] PRIMARY KEY CLUSTERED 
(
	[IdPersonalAtención] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PesoEG]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PesoEG](
	[IdPesoEG] [int] NOT NULL,
	[PesoEG] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PesoEG] PRIMARY KEY CLUSTERED 
(
	[IdPesoEG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PesoNacer]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PesoNacer](
	[IdPeso_nacer] [int] NOT NULL,
	[Peso_nacer] [numeric](4, 3) NOT NULL,
 CONSTRAINT [PK_PesoNacer] PRIMARY KEY CLUSTERED 
(
	[IdPeso_nacer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosiciónParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosiciónParto](
	[IdPosiciónParto] [int] IDENTITY(1,1) NOT NULL,
	[PosiciónParto] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PosiciónParto] PRIMARY KEY CLUSTERED 
(
	[IdPosiciónParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postalumbramiento]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postalumbramiento](
	[IdPostalumbramiento] [int] IDENTITY(1,1) NOT NULL,
	[Postalumbramiento] [bit] NOT NULL,
	[IdUsoOcitocicos] [int] NOT NULL,
 CONSTRAINT [PK_Postalumbramiento] PRIMARY KEY CLUSTERED 
(
	[IdPostalumbramiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prealumbramiento]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prealumbramiento](
	[IdPrealumbramiento] [int] IDENTITY(1,1) NOT NULL,
	[Prealumbramiento] [bit] NOT NULL,
	[IdUsoOcitocicos] [int] NOT NULL,
 CONSTRAINT [PK_Prealumbramiento] PRIMARY KEY CLUSTERED 
(
	[IdPrealumbramiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresenciaAcompañante]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresenciaAcompañante](
	[IdPresenciaAcompañante] [int] IDENTITY(1,1) NOT NULL,
	[DuranteTrabajoParto] [bit] NOT NULL,
	[Parto] [bit] NOT NULL,
 CONSTRAINT [PK_PresenciaAcompañante] PRIMARY KEY CLUSTERED 
(
	[IdPresenciaAcompañante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresentaciónSituación]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresentaciónSituación](
	[IdPresentaciónSituación] [int] IDENTITY(1,1) NOT NULL,
	[PresentaciónSituación] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PresentaciónSituación] PRIMARY KEY CLUSTERED 
(
	[IdPresentaciónSituación] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PruebaNoTreponemica]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PruebaNoTreponemica](
	[IdNoTreponemica] [int] NOT NULL,
	[ResultadoNoTreponemica] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PruebaNoTreponemica] PRIMARY KEY CLUSTERED 
(
	[IdNoTreponemica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PruebaTreponemica]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PruebaTreponemica](
	[IdTreponemica] [int] NOT NULL,
	[ResultadoTreponemica] [varchar](20) NULL,
 CONSTRAINT [PK_PruebaTreponemica] PRIMARY KEY CLUSTERED 
(
	[IdTreponemica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reanimación]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reanimación](
	[IdReanimación] [int] NOT NULL,
	[Reanimación] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reanimación] PRIMARY KEY CLUSTERED 
(
	[IdReanimación] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referido](
	[IdReferido] [int] NOT NULL,
	[Referido] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroAdmisionAborto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroAdmisionAborto](
	[IdAdmisionAborto] [int] IDENTITY(1,1) NOT NULL,
	[IdRegistroAdmision] [int] NOT NULL,
	[ConsultasPrenatales] [int] NOT NULL,
 CONSTRAINT [PK_RegistroAdmisionAborto] PRIMARY KEY CLUSTERED 
(
	[IdRegistroAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadosVIH]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultadosVIH](
	[IdVIH] [int] NOT NULL,
	[ResultadoVIH] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ResultadosVIH] PRIMARY KEY CLUSTERED 
(
	[IdVIH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoturaMembranaAnteparto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoturaMembranaAnteparto](
	[IdRoturaMembranasAnteparto] [int] IDENTITY(1,1) NOT NULL,
	[ExistenciaRotura] [bit] NOT NULL,
	[FechaHoraRotura] [datetime] NOT NULL,
	[SemanasRotura] [varchar](15) NOT NULL,
	[Temperatura] [numeric](3, 1) NOT NULL,
 CONSTRAINT [PK_RoturaMembranaAnteparto] PRIMARY KEY CLUSTERED 
(
	[IdRoturaMembranasAnteparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SexoRecienNacido]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SexoRecienNacido](
	[IdSexo_RecienNacido] [int] NOT NULL,
	[Sexo_RecienNacido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SexoRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdSexo_RecienNacido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TerminaciónParto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerminaciónParto](
	[IdTerminaciónParto] [int] IDENTITY(1,1) NOT NULL,
	[TerminaciónParto] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TerminaciónParto] PRIMARY KEY CLUSTERED 
(
	[IdTerminaciónParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSifilis]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSifilis](
	[IdTestSifilis] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TestSifilis] PRIMARY KEY CLUSTERED 
(
	[IdTestSifilis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestVIH]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestVIH](
	[IdTestVIH] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TestVIH] PRIMARY KEY CLUSTERED 
(
	[IdTestVIH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAborto]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAborto](
	[IdAdmisionAborto] [int] NOT NULL,
	[IdInicioTrabajoParto] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TipoAborto] PRIMARY KEY CLUSTERED 
(
	[IdInicioTrabajoParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoGrupoSanguineo]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoGrupoSanguineo](
	[IdGrupoSanguineo] [int] NOT NULL,
	[GrupoSanguineo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoGrupoSanguineo] PRIMARY KEY CLUSTERED 
(
	[IdGrupoSanguineo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPruebaSifilis]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPruebaSifilis](
	[IdPruebaSifilis] [int] NOT NULL,
	[TipoPrueba] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoPruebaSifilis] PRIMARY KEY CLUSTERED 
(
	[IdPruebaSifilis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toxoplasmosis]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toxoplasmosis](
	[IdToxoplasmosis] [int] NOT NULL,
	[Toxoplasmosis] [varchar](20) NULL,
 CONSTRAINT [PK_Toxoplasmosis] PRIMARY KEY CLUSTERED 
(
	[IdToxoplasmosis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tranfusión]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tranfusión](
	[IdTransfusión] [int] IDENTITY(1,1) NOT NULL,
	[IdRecibida] [int] NOT NULL,
	[Transfusión] [bit] NOT NULL,
 CONSTRAINT [PK_Tranfusión] PRIMARY KEY CLUSTERED 
(
	[IdTransfusión] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TratamientoAntirretroviral]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TratamientoAntirretroviral](
	[IdTtoAntirretroviral] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TratamientoAntirretroviral] PRIMARY KEY CLUSTERED 
(
	[IdTtoAntirretroviral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trimestre]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trimestre](
	[IdTrimestre] [int] NOT NULL,
	[Trimestre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Trimestres] PRIMARY KEY CLUSTERED 
(
	[IdTrimestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrimestreHabito]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrimestreHabito](
	[IdTrimestreHabito] [int] NOT NULL,
	[IdPaciente] [bigint] NOT NULL,
	[IdTrimestre] [int] NOT NULL,
	[IdHabito] [int] NOT NULL,
 CONSTRAINT [PK_TrimestreHabito] PRIMARY KEY CLUSTERED 
(
	[IdTrimestreHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UltimoPrevio]    Script Date: 16/08/2022 4:25:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UltimoPrevio](
	[IdUltimoPrevio] [int] NOT NULL,
	[Respuesta] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Ultimo Previo] PRIMARY KEY CLUSTERED 
(
	[IdUltimoPrevio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AntecedentesFamiliares]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesFamiliares_Antecedentes] FOREIGN KEY([IdAntecedente])
REFERENCES [dbo].[Antecedentes] ([IdAntecedente])
GO
ALTER TABLE [dbo].[AntecedentesFamiliares] CHECK CONSTRAINT [FK_AntecedentesFamiliares_Antecedentes]
GO
ALTER TABLE [dbo].[AntecedentesFamiliares]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesFamiliares_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPacientes])
GO
ALTER TABLE [dbo].[AntecedentesFamiliares] CHECK CONSTRAINT [FK_AntecedentesFamiliares_Pacientes]
GO
ALTER TABLE [dbo].[AntecedentesObstetricos]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesObstetricos_FracasoMetodoAnticonceptivo] FOREIGN KEY([IdFracasoMetodoAnticonceptivo])
REFERENCES [dbo].[FracasoMetodoAnticonceptivo] ([IdFracasoMetodoAnticonceptivo])
GO
ALTER TABLE [dbo].[AntecedentesObstetricos] CHECK CONSTRAINT [FK_AntecedentesObstetricos_FracasoMetodoAnticonceptivo]
GO
ALTER TABLE [dbo].[AntecedentesObstetricos]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesObstetricos_Pacientes] FOREIGN KEY([IdPacientes])
REFERENCES [dbo].[Paciente] ([IdPacientes])
GO
ALTER TABLE [dbo].[AntecedentesObstetricos] CHECK CONSTRAINT [FK_AntecedentesObstetricos_Pacientes]
GO
ALTER TABLE [dbo].[AntecedentesObstetricos]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesObstetricos_UltimoPrevio] FOREIGN KEY([IdUltimoPrevio])
REFERENCES [dbo].[UltimoPrevio] ([IdUltimoPrevio])
GO
ALTER TABLE [dbo].[AntecedentesObstetricos] CHECK CONSTRAINT [FK_AntecedentesObstetricos_UltimoPrevio]
GO
ALTER TABLE [dbo].[AntecedentesPersonales]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesPersonales_Antecedentes] FOREIGN KEY([IdAntecedente])
REFERENCES [dbo].[Antecedentes] ([IdAntecedente])
GO
ALTER TABLE [dbo].[AntecedentesPersonales] CHECK CONSTRAINT [FK_AntecedentesPersonales_Antecedentes]
GO
ALTER TABLE [dbo].[AntecedentesPersonales]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesPersonales_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPacientes])
GO
ALTER TABLE [dbo].[AntecedentesPersonales] CHECK CONSTRAINT [FK_AntecedentesPersonales_Pacientes]
GO
ALTER TABLE [dbo].[FracasoMetodoAnticonceptivo]  WITH CHECK ADD  CONSTRAINT [FK_FracasoMetodoAnticonceptivo_MetodosAnticonceptivos] FOREIGN KEY([IdMetodoAnticonceptivo])
REFERENCES [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo])
GO
ALTER TABLE [dbo].[FracasoMetodoAnticonceptivo] CHECK CONSTRAINT [FK_FracasoMetodoAnticonceptivo_MetodosAnticonceptivos]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_Bacteriuria] FOREIGN KEY([IdBacteriuria])
REFERENCES [dbo].[Bacteriuria] ([IdBacteriuria])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_Bacteriuria]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_Chagas] FOREIGN KEY([IdMalaria])
REFERENCES [dbo].[Chagas] ([IdChagas])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_Chagas]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_ConsultasAntenatales] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[ConsultasAntenatales] ([IdPaciente])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_ConsultasAntenatales]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_Paciente] FOREIGN KEY([IdGestacionActual])
REFERENCES [dbo].[Paciente] ([IdPacientes])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_Paciente]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_PaludismoMalaria] FOREIGN KEY([IdMalaria])
REFERENCES [dbo].[PaludismoMalaria] ([IdMalaria])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_PaludismoMalaria]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_PruebaNoTreponemica] FOREIGN KEY([IdNoTreponemica])
REFERENCES [dbo].[PruebaNoTreponemica] ([IdNoTreponemica])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_PruebaNoTreponemica]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_PruebaTreponemica] FOREIGN KEY([IdTreponemica])
REFERENCES [dbo].[PruebaTreponemica] ([IdTreponemica])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_PruebaTreponemica]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_ResultadosVIH] FOREIGN KEY([IdVIH])
REFERENCES [dbo].[ResultadosVIH] ([IdVIH])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_ResultadosVIH]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_TestVIH] FOREIGN KEY([IdTestVIH])
REFERENCES [dbo].[TestVIH] ([IdTestVIH])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_TestVIH]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_TipoGrupoSanguineo] FOREIGN KEY([IdGrupoSanguineo])
REFERENCES [dbo].[TipoGrupoSanguineo] ([IdGrupoSanguineo])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_TipoGrupoSanguineo]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_TipoPruebaSifilis] FOREIGN KEY([IdPruebaSifilis])
REFERENCES [dbo].[TipoPruebaSifilis] ([IdPruebaSifilis])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_TipoPruebaSifilis]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_Toxoplasmosis] FOREIGN KEY([IdToxoplasmosis])
REFERENCES [dbo].[Toxoplasmosis] ([IdToxoplasmosis])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_Toxoplasmosis]
GO
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_TratamientoAntirretroviral] FOREIGN KEY([IdTtoAntirretroviral])
REFERENCES [dbo].[TratamientoAntirretroviral] ([IdTtoAntirretroviral])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_TratamientoAntirretroviral]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_EstadoCivil] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Pacientes_EstadoCivil]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Estudios] FOREIGN KEY([IdEstudio])
REFERENCES [dbo].[Estudios] ([IdEstudio])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Pacientes_Estudios]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Etnia] FOREIGN KEY([IdEtnia])
REFERENCES [dbo].[Etnia] ([IdEtnia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Pacientes_Etnia]
GO
ALTER TABLE [dbo].[PatologiaMaterna]  WITH CHECK ADD  CONSTRAINT [FK_PatologiaMaterna_Patologias] FOREIGN KEY([IdPatologia])
REFERENCES [dbo].[Patologias] ([IdPatologías])
GO
ALTER TABLE [dbo].[PatologiaMaterna] CHECK CONSTRAINT [FK_PatologiaMaterna_Patologias]
GO
ALTER TABLE [dbo].[TrimestreHabito]  WITH CHECK ADD  CONSTRAINT [FK_TrimestreHabito_Hábitos] FOREIGN KEY([IdHabito])
REFERENCES [dbo].[Habitos] ([IdHabito])
GO
ALTER TABLE [dbo].[TrimestreHabito] CHECK CONSTRAINT [FK_TrimestreHabito_Hábitos]
GO
ALTER TABLE [dbo].[TrimestreHabito]  WITH CHECK ADD  CONSTRAINT [FK_TrimestreHabito_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPacientes])
GO
ALTER TABLE [dbo].[TrimestreHabito] CHECK CONSTRAINT [FK_TrimestreHabito_Paciente]
GO
ALTER TABLE [dbo].[TrimestreHabito]  WITH CHECK ADD  CONSTRAINT [FK_TrimestreHabito_Trimestre] FOREIGN KEY([IdTrimestre])
REFERENCES [dbo].[Trimestre] ([IdTrimestre])
GO
ALTER TABLE [dbo].[TrimestreHabito] CHECK CONSTRAINT [FK_TrimestreHabito_Trimestre]
GO
USE [master]
GO
ALTER DATABASE [Sistema Perinatal BD V7] SET  READ_WRITE 
GO
