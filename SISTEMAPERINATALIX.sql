USE [master]
GO
/****** Object:  Database [SISTEMAPERINATALIX]    Script Date: 24/08/2022 10:25:14 a. m. ******/
CREATE DATABASE [SISTEMAPERINATALIX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISTEMAPERINATALIX_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SISTEMAPERINATALIX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SISTEMAPERINATALIX_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SISTEMAPERINATALIX.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SISTEMAPERINATALIX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ARITHABORT OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET RECOVERY FULL 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET  MULTI_USER 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SISTEMAPERINATALIX] SET QUERY_STORE = OFF
GO
USE [SISTEMAPERINATALIX]
GO
/****** Object:  Table [dbo].[AdmisiónParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmisiónParto](
	[IdAdmisiónParto] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Parto] [bit] NOT NULL,
	[Aborto] [bit] NOT NULL,
	[CarnéPerinatal] [bit] NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[TamañoFetalAcorde] [bit] NOT NULL,
	[Acompañante] [bit] NOT NULL,
	[TipoAcompañante] [varchar](20) NOT NULL,
	[CorticoidesPrenatales] [varchar](20) NULL,
	[SemanaInicioCorticoidesPrenatales] [date] NULL,
	[Episotomía] [bit] NULL,
	[TARV] [bit] NULL,
	[ExpulsiónPlacenta] [bit] NULL,
	[LigaduraCordón] [bit] NULL,
	[PosiciónParto] [varchar](20) NULL,
	[TerminaciónParto] [varchar](20) NULL,
	[ConsultasPrenatales] [varchar](10) NULL,
 CONSTRAINT [PK_AdmisiónParto] PRIMARY KEY CLUSTERED 
(
	[IdAdmisiónParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anestesia]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anestesia](
	[IdAnestesia] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[AnestesiaGeneral] [bit] NOT NULL,
	[AnestesiaLocal] [bit] NOT NULL,
	[AnestesiaRegional] [bit] NOT NULL,
 CONSTRAINT [PK_Anestesia_1] PRIMARY KEY CLUSTERED 
(
	[IdAnestesia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Antecedentes]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesFamiliares]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesFamiliares](
	[IdAntecedenteFamiliar] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdAntecedente] [int] NOT NULL,
 CONSTRAINT [PK_Antecedentes familiares] PRIMARY KEY CLUSTERED 
(
	[IdAntecedenteFamiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesObstetricos]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesObstetricos](
	[IdAntecedentesObstetricos] [int] IDENTITY(1,1) NOT NULL,
	[IdPacientes] [int] NOT NULL,
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
	[FinEmbarazoAnterior] [date] NULL,
	[EmbarazoPlaneado] [bit] NOT NULL,
	[FracasoMetodoAnticonceptivo] [int] NOT NULL,
 CONSTRAINT [PK_AntecedentesObstetricos] PRIMARY KEY CLUSTERED 
(
	[IdAntecedentesObstetricos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AntecedentesPersonales]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntecedentesPersonales](
	[IdAntecedentePersonal] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdAntecedente] [int] NOT NULL,
 CONSTRAINT [PK_Antecedentes personales] PRIMARY KEY CLUSTERED 
(
	[IdAntecedentePersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Antirubeola]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bacteriuria]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chagas]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultasAntenatales]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultasAntenatales](
	[IdPaciente] [int] NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatosNacimientoRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DefectoCongenito]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefectoCongenito](
	[IdDefectoCongenito] [int] NOT NULL,
	[DefectoCongenito] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desgarros]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desgarros](
	[IdDesgarros] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[Desgarros] [bit] NOT NULL,
	[Grado] [int] NULL,
 CONSTRAINT [PK_Desgarros_1] PRIMARY KEY CLUSTERED 
(
	[IdDesgarros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPartograma]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPartograma](
	[IdDetallesPartograma] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[CurvasAlerta] [bit] NOT NULL,
 CONSTRAINT [PK_DetallesPartograma] PRIMARY KEY CLUSTERED 
(
	[IdDetallesPartograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeterminarEdadGestacionalParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeterminarEdadGestacionalParto](
	[IdDeterminarEdadGestacional] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[FUM] [bit] NOT NULL,
	[Ecografía] [bit] NOT NULL,
	[Días] [int] NOT NULL,
	[Semanas] [int] NOT NULL,
 CONSTRAINT [PK_DeterminarEdadGestacionalParto_1] PRIMARY KEY CLUSTERED 
(
	[IdDeterminarEdadGestacional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EdadGestacionalRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EdadGestacionalRecienNacido](
	[IdEdadGestacionalRecienNacido] [int] NOT NULL,
	[Semanas] [nchar](10) NOT NULL,
	[Dias] [int] NOT NULL,
	[IdNacimiento] [int] NOT NULL,
 CONSTRAINT [PK_EdadGestacionalRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdEdadGestacionalRecienNacido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnfermedadesRN]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnfermedadViralPrueba]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnfermedadViralPrueba](
	[IdEnfermedadViral] [int] NOT NULL,
	[Sifilis] [bit] NOT NULL,
	[VIH] [bit] NOT NULL,
 CONSTRAINT [PK_Enfermedad_viral] PRIMARY KEY CLUSTERED 
(
	[IdEnfermedadViral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCivil]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoVitalRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estreptococo]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudios]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etnia]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvoluciónTrabajoParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvoluciónTrabajoParto](
	[IdEvoluciónTrabajoParto] [int] IDENTITY(1,1) NOT NULL,
	[IdDetallesPartograma] [int] NOT NULL,
	[HoraMinutosEvaluación] [time](4) NOT NULL,
	[PosiciónGestante] [varchar](10) NOT NULL,
	[PresiónArterial] [varchar](20) NOT NULL,
	[PulsoLatidosPorMinuto] [int] NULL,
	[ContraccionesUterinas] [int] NULL,
	[DilataciónCervicalCM] [int] NULL,
	[AlturaPresentación] [varchar](20) NULL,
	[VariedadPosición] [varchar](20) NULL,
	[PresenciaMeconio] [bit] NULL,
	[FrecuenciaCardiacaFetal] [int] NULL,
 CONSTRAINT [PK_EvoluciónTrabajoParto_1] PRIMARY KEY CLUSTERED 
(
	[IdEvoluciónTrabajoParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GestacionActual]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GestacionActual](
	[IdGestacionActual] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hemorragias]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
	[IdPaciente] [int] NOT NULL,
 CONSTRAINT [PK_Hemorragias] PRIMARY KEY CLUSTERED 
(
	[IdHemorragias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizaciónEmbarazo]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalizaciónEmbarazo](
	[IdHospitalizaciónEmbarazo] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[HospitalizacionEmbarazo] [bit] NOT NULL,
	[DíasHospitalización] [int] NOT NULL,
 CONSTRAINT [PK_HospitalizaciónEmbarazo] PRIMARY KEY CLUSTERED 
(
	[IdHospitalizaciónEmbarazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndicaciónInducciónPrincipal]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicaciónInducciónPrincipal](
	[IdIndicaciónInducción] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[CausasInducción] [varchar](max) NOT NULL,
	[CódigoInducción] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndicaciónPrincipalInducción_1] PRIMARY KEY CLUSTERED 
(
	[IdIndicaciónInducción] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InicioTrabajoParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InicioTrabajoParto](
	[IdInicioTrabajoParto] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[Espontáneo] [bit] NOT NULL,
	[Inducido] [bit] NOT NULL,
 CONSTRAINT [PK_InicioTrabajoParto_1] PRIMARY KEY CLUSTERED 
(
	[IdInicioTrabajoParto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LongitudRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LongitudRecienNacido](
	[IdNacimiento] [int] NOT NULL,
	[IdLongitud] [int] NOT NULL,
	[Longitud] [numeric](3, 1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicaciónRecibidaParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicaciónRecibidaParto](
	[IdMedicaciónRecibida] [int] IDENTITY(1,1) NOT NULL,
	[IdAnestesia] [int] NOT NULL,
	[OcitocicosTDP] [bit] NOT NULL,
	[Antibiótico] [bit] NOT NULL,
	[Transfusión] [bit] NOT NULL,
	[OtroMedicamento] [varchar](max) NULL,
 CONSTRAINT [PK_MedicaciónRecibidaParto] PRIMARY KEY CLUSTERED 
(
	[IdMedicaciónRecibida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodosAnticonceptivos]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NacimientoRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NacimientoRecienNacido](
	[IdNacimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[EstadoVitalReciénNacido] [varchar](20) NULL,
	[FechaHoraNacimiento] [datetime] NULL,
 CONSTRAINT [PK_EstadoVitalReciénNacido] PRIMARY KEY CLUSTERED 
(
	[IdNacimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocitocicos]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocitocicos](
	[IdOcitocicos] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicaciónRecibida] [int] NOT NULL,
	[Prealumbramieto] [bit] NOT NULL,
	[PosAlumbramiento] [bit] NOT NULL,
 CONSTRAINT [PK_Ocitocicos_1] PRIMARY KEY CLUSTERED 
(
	[IdOcitocicos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtrasEnfermedades]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtrasEnfermedades](
	[IdPaciente] [int] NOT NULL,
	[IdPatologias] [int] NOT NULL,
	[IdOtrasEnfermedades] [int] NOT NULL,
	[IdEnfermedadRN] [int] NOT NULL,
	[Observación] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
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
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaludismoMalaria]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatologiaMaterna]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patologias]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCefálicoRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCefálicoRecienNacido](
	[IdP_Cefalico] [int] NOT NULL,
	[P_Cefalico] [numeric](3, 1) NOT NULL,
	[IdNacimiento] [int] NOT NULL,
 CONSTRAINT [PK_PCefálicoRecienNacido] PRIMARY KEY CLUSTERED 
(
	[IdP_Cefalico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalAtenciónParto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalAtenciónParto](
	[IdPersonalAtención] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[Parto] [bit] NOT NULL,
	[Neonato] [bit] NOT NULL,
	[TipoPersonal] [varchar](30) NOT NULL,
	[IdentificaciónPersonal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonalAtenciónParto_1] PRIMARY KEY CLUSTERED 
(
	[IdPersonalAtención] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PesoEG]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PesoNacer]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PesoNacer](
	[IdPeso_nacer] [int] NOT NULL,
	[Peso_nacer] [numeric](5, 3) NOT NULL,
 CONSTRAINT [PK_PesoNacer] PRIMARY KEY CLUSTERED 
(
	[IdPeso_nacer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresenciaAcompañante]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresenciaAcompañante](
	[IdPresenciaAcompañante] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[DuranteTrabajoParto] [bit] NOT NULL,
	[Parto] [bit] NOT NULL,
 CONSTRAINT [PK_PresenciaAcompañante_1] PRIMARY KEY CLUSTERED 
(
	[IdPresenciaAcompañante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PruebaNoTreponemica]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PruebaTreponemica]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reanimación]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referido](
	[IdReferido] [int] NOT NULL,
	[Referido] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadosVIH]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoturaMembranaAnteparto]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoturaMembranaAnteparto](
	[IdRoturaMembranasAnteparto] [int] IDENTITY(1,1) NOT NULL,
	[IdAdmisiónParto] [int] NOT NULL,
	[ExistenciaRotura] [bit] NULL,
	[FechaHoraRotura] [datetime] NULL,
	[SemanasRotura] [varchar](15) NULL,
	[Temperatura] [numeric](3, 1) NULL,
 CONSTRAINT [PK_RoturaMembranaAnteparto_1] PRIMARY KEY CLUSTERED 
(
	[IdRoturaMembranasAnteparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SexoRecienNacido]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSifilis]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestVIH]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoGrupoSanguineo]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPruebaSifilis]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toxoplasmosis]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TratamientoAntirretroviral]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trimestre]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrimestreHabito]    Script Date: 24/08/2022 10:25:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrimestreHabito](
	[IdTrimestreHabito] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdTrimestre] [int] NOT NULL,
	[IdHabito] [int] NOT NULL,
 CONSTRAINT [PK_TrimestreHabito] PRIMARY KEY CLUSTERED 
(
	[IdTrimestreHabito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UltimoPrevio]    Script Date: 24/08/2022 10:25:15 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdmisiónParto]  WITH CHECK ADD  CONSTRAINT [FK_AdmisiónParto_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[AdmisiónParto] CHECK CONSTRAINT [FK_AdmisiónParto_Paciente]
GO
ALTER TABLE [dbo].[Anestesia]  WITH CHECK ADD  CONSTRAINT [FK_Anestesia_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[Anestesia] CHECK CONSTRAINT [FK_Anestesia_AdmisiónParto]
GO
ALTER TABLE [dbo].[AntecedentesFamiliares]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesFamiliares_Antecedentes] FOREIGN KEY([IdAntecedente])
REFERENCES [dbo].[Antecedentes] ([IdAntecedente])
GO
ALTER TABLE [dbo].[AntecedentesFamiliares] CHECK CONSTRAINT [FK_AntecedentesFamiliares_Antecedentes]
GO
ALTER TABLE [dbo].[AntecedentesFamiliares]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesFamiliares_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[AntecedentesFamiliares] CHECK CONSTRAINT [FK_AntecedentesFamiliares_Pacientes]
GO
ALTER TABLE [dbo].[AntecedentesObstetricos]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesObstetricos_MetodosAnticonceptivos] FOREIGN KEY([FracasoMetodoAnticonceptivo])
REFERENCES [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo])
GO
ALTER TABLE [dbo].[AntecedentesObstetricos] CHECK CONSTRAINT [FK_AntecedentesObstetricos_MetodosAnticonceptivos]
GO
ALTER TABLE [dbo].[AntecedentesObstetricos]  WITH CHECK ADD  CONSTRAINT [FK_AntecedentesObstetricos_Pacientes] FOREIGN KEY([IdPacientes])
REFERENCES [dbo].[Paciente] ([IdPaciente])
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
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[AntecedentesPersonales] CHECK CONSTRAINT [FK_AntecedentesPersonales_Pacientes]
GO
ALTER TABLE [dbo].[Desgarros]  WITH CHECK ADD  CONSTRAINT [FK_Desgarros_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[Desgarros] CHECK CONSTRAINT [FK_Desgarros_AdmisiónParto]
GO
ALTER TABLE [dbo].[DetallesPartograma]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPartograma_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[DetallesPartograma] CHECK CONSTRAINT [FK_DetallesPartograma_AdmisiónParto]
GO
ALTER TABLE [dbo].[DeterminarEdadGestacionalParto]  WITH CHECK ADD  CONSTRAINT [FK_DeterminarEdadGestacionalParto_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[DeterminarEdadGestacionalParto] CHECK CONSTRAINT [FK_DeterminarEdadGestacionalParto_AdmisiónParto]
GO
ALTER TABLE [dbo].[EdadGestacionalRecienNacido]  WITH CHECK ADD  CONSTRAINT [FK_EdadGestacionalRecienNacido_NacimientoRecienNacido] FOREIGN KEY([IdNacimiento])
REFERENCES [dbo].[NacimientoRecienNacido] ([IdNacimiento])
GO
ALTER TABLE [dbo].[EdadGestacionalRecienNacido] CHECK CONSTRAINT [FK_EdadGestacionalRecienNacido_NacimientoRecienNacido]
GO
ALTER TABLE [dbo].[EvoluciónTrabajoParto]  WITH CHECK ADD  CONSTRAINT [FK_EvoluciónTrabajoParto_DetallesPartograma] FOREIGN KEY([IdDetallesPartograma])
REFERENCES [dbo].[DetallesPartograma] ([IdDetallesPartograma])
GO
ALTER TABLE [dbo].[EvoluciónTrabajoParto] CHECK CONSTRAINT [FK_EvoluciónTrabajoParto_DetallesPartograma]
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
ALTER TABLE [dbo].[GestacionActual]  WITH CHECK ADD  CONSTRAINT [FK_GestacionActual_Paciente1] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[GestacionActual] CHECK CONSTRAINT [FK_GestacionActual_Paciente1]
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
ALTER TABLE [dbo].[Hemorragias]  WITH CHECK ADD  CONSTRAINT [FK_Hemorragias_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[Hemorragias] CHECK CONSTRAINT [FK_Hemorragias_Paciente]
GO
ALTER TABLE [dbo].[HospitalizaciónEmbarazo]  WITH CHECK ADD  CONSTRAINT [FK_HospitalizaciónEmbarazo_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[HospitalizaciónEmbarazo] CHECK CONSTRAINT [FK_HospitalizaciónEmbarazo_Paciente]
GO
ALTER TABLE [dbo].[IndicaciónInducciónPrincipal]  WITH CHECK ADD  CONSTRAINT [FK_IndicaciónInducciónPrincipal_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[IndicaciónInducciónPrincipal] CHECK CONSTRAINT [FK_IndicaciónInducciónPrincipal_AdmisiónParto]
GO
ALTER TABLE [dbo].[InicioTrabajoParto]  WITH CHECK ADD  CONSTRAINT [FK_InicioTrabajoParto_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[InicioTrabajoParto] CHECK CONSTRAINT [FK_InicioTrabajoParto_AdmisiónParto]
GO
ALTER TABLE [dbo].[MedicaciónRecibidaParto]  WITH CHECK ADD  CONSTRAINT [FK_MedicaciónRecibidaParto_Anestesia] FOREIGN KEY([IdAnestesia])
REFERENCES [dbo].[Anestesia] ([IdAnestesia])
GO
ALTER TABLE [dbo].[MedicaciónRecibidaParto] CHECK CONSTRAINT [FK_MedicaciónRecibidaParto_Anestesia]
GO
ALTER TABLE [dbo].[NacimientoRecienNacido]  WITH CHECK ADD  CONSTRAINT [FK_NacimientoRecienNacido_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[NacimientoRecienNacido] CHECK CONSTRAINT [FK_NacimientoRecienNacido_AdmisiónParto]
GO
ALTER TABLE [dbo].[Ocitocicos]  WITH CHECK ADD  CONSTRAINT [FK_Ocitocicos_MedicaciónRecibidaParto1] FOREIGN KEY([IdMedicaciónRecibida])
REFERENCES [dbo].[MedicaciónRecibidaParto] ([IdMedicaciónRecibida])
GO
ALTER TABLE [dbo].[Ocitocicos] CHECK CONSTRAINT [FK_Ocitocicos_MedicaciónRecibidaParto1]
GO
ALTER TABLE [dbo].[OtrasEnfermedades]  WITH CHECK ADD  CONSTRAINT [FK_OtrasEnfermedades_Patologias] FOREIGN KEY([IdPatologias])
REFERENCES [dbo].[Patologias] ([IdPatologías])
GO
ALTER TABLE [dbo].[OtrasEnfermedades] CHECK CONSTRAINT [FK_OtrasEnfermedades_Patologias]
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
ALTER TABLE [dbo].[PatologiaMaterna]  WITH CHECK ADD  CONSTRAINT [FK_PatologiaMaterna_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[PatologiaMaterna] CHECK CONSTRAINT [FK_PatologiaMaterna_Paciente]
GO
ALTER TABLE [dbo].[PatologiaMaterna]  WITH CHECK ADD  CONSTRAINT [FK_PatologiaMaterna_Patologias] FOREIGN KEY([IdPatologia])
REFERENCES [dbo].[Patologias] ([IdPatologías])
GO
ALTER TABLE [dbo].[PatologiaMaterna] CHECK CONSTRAINT [FK_PatologiaMaterna_Patologias]
GO
ALTER TABLE [dbo].[PersonalAtenciónParto]  WITH CHECK ADD  CONSTRAINT [FK_PersonalAtenciónParto_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[PersonalAtenciónParto] CHECK CONSTRAINT [FK_PersonalAtenciónParto_AdmisiónParto]
GO
ALTER TABLE [dbo].[PresenciaAcompañante]  WITH CHECK ADD  CONSTRAINT [FK_PresenciaAcompañante_AdmisiónParto] FOREIGN KEY([IdAdmisiónParto])
REFERENCES [dbo].[AdmisiónParto] ([IdAdmisiónParto])
GO
ALTER TABLE [dbo].[PresenciaAcompañante] CHECK CONSTRAINT [FK_PresenciaAcompañante_AdmisiónParto]
GO
ALTER TABLE [dbo].[TrimestreHabito]  WITH CHECK ADD  CONSTRAINT [FK_TrimestreHabito_Hábitos] FOREIGN KEY([IdHabito])
REFERENCES [dbo].[Habitos] ([IdHabito])
GO
ALTER TABLE [dbo].[TrimestreHabito] CHECK CONSTRAINT [FK_TrimestreHabito_Hábitos]
GO
ALTER TABLE [dbo].[TrimestreHabito]  WITH CHECK ADD  CONSTRAINT [FK_TrimestreHabito_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
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
ALTER DATABASE [SISTEMAPERINATALIX] SET  READ_WRITE 
GO
