USE [master]
GO
/****** Object:  Database [SISTEMAPERINATALIX]    Script Date: 25/08/2022 9:45:26 ******/
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
/****** Object:  Table [dbo].[AdmisiónParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Anestesia]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Antecedentes]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[AntecedentesFamiliares]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[AntecedentesObstetricos]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[AntecedentesPersonales]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Antirubeola]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Bacteriuria]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Chagas]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[ConsultasAntenatales]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[DatosNacimientoRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[DefectoCongenito]    Script Date: 25/08/2022 9:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefectoCongenito](
	[IdDefectoCongenito] [int] NOT NULL,
	[DefectoCongenito] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desgarros]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[DestinoRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[DetallesPartograma]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[DeterminarEdadGestacionalParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EdadGestacionalRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EnfermedadesRN]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EnfermedadViralPrueba]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EstadoCivil]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EstadoVitalRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Estreptococo]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Estudios]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Etnia]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[EvoluciónTrabajoParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[GestacionActual]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Habitos]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Hemorragias]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[HospitalizaciónEmbarazo]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[IndicaciónInducciónPrincipal]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[InicioTrabajoParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[LongitudRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[MedicaciónRecibidaParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[MetodosAnticonceptivos]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[NacimientoRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Ocitocicos]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[OtrasEnfermedades]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PaludismoMalaria]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PatologiaMaterna]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Patologias]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PCefálicoRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PersonalAtenciónParto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PesoEG]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PesoNacer]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PresenciaAcompañante]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PruebaNoTreponemica]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[PruebaTreponemica]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Reanimación]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Referido]    Script Date: 25/08/2022 9:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referido](
	[IdReferido] [int] NOT NULL,
	[Referido] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadosVIH]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[RoturaMembranaAnteparto]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[SexoRecienNacido]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TestSifilis]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TestVIH]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TipoGrupoSanguineo]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TipoPruebaSifilis]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Toxoplasmosis]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TratamientoAntirretroviral]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[Trimestre]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[TrimestreHabito]    Script Date: 25/08/2022 9:45:27 ******/
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
/****** Object:  Table [dbo].[UltimoPrevio]    Script Date: 25/08/2022 9:45:27 ******/
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
SET IDENTITY_INSERT [dbo].[AdmisiónParto] ON 

INSERT [dbo].[AdmisiónParto] ([IdAdmisiónParto], [IdPaciente], [Parto], [Aborto], [CarnéPerinatal], [FechaIngreso], [TamañoFetalAcorde], [Acompañante], [TipoAcompañante], [CorticoidesPrenatales], [SemanaInicioCorticoidesPrenatales], [Episotomía], [TARV], [ExpulsiónPlacenta], [LigaduraCordón], [PosiciónParto], [TerminaciónParto], [ConsultasPrenatales]) VALUES (4, 1, 1, 0, 1, CAST(N'2022-07-15' AS Date), 1, 1, N'Pareja', N'Incompleto', CAST(N'2022-04-20' AS Date), 1, 0, 1, 0, N'Cunclillas', N'Cesárea', N'10')
INSERT [dbo].[AdmisiónParto] ([IdAdmisiónParto], [IdPaciente], [Parto], [Aborto], [CarnéPerinatal], [FechaIngreso], [TamañoFetalAcorde], [Acompañante], [TipoAcompañante], [CorticoidesPrenatales], [SemanaInicioCorticoidesPrenatales], [Episotomía], [TARV], [ExpulsiónPlacenta], [LigaduraCordón], [PosiciónParto], [TerminaciónParto], [ConsultasPrenatales]) VALUES (5, 2, 1, 0, 1, CAST(N'2022-07-13' AS Date), 0, 1, N'Familiar', N'Incompleto', CAST(N'2021-10-15' AS Date), 1, 0, 1, 1, N'Acostada', N'Fórceps', N'8')
INSERT [dbo].[AdmisiónParto] ([IdAdmisiónParto], [IdPaciente], [Parto], [Aborto], [CarnéPerinatal], [FechaIngreso], [TamañoFetalAcorde], [Acompañante], [TipoAcompañante], [CorticoidesPrenatales], [SemanaInicioCorticoidesPrenatales], [Episotomía], [TARV], [ExpulsiónPlacenta], [LigaduraCordón], [PosiciónParto], [TerminaciónParto], [ConsultasPrenatales]) VALUES (11, 4, 1, 0, 1, CAST(N'2022-07-08' AS Date), 1, 0, N'Ninguno', N'Completo', CAST(N'2021-10-22' AS Date), 1, 0, 0, 0, N'Sentada', N'Espontánea', N'10')
INSERT [dbo].[AdmisiónParto] ([IdAdmisiónParto], [IdPaciente], [Parto], [Aborto], [CarnéPerinatal], [FechaIngreso], [TamañoFetalAcorde], [Acompañante], [TipoAcompañante], [CorticoidesPrenatales], [SemanaInicioCorticoidesPrenatales], [Episotomía], [TARV], [ExpulsiónPlacenta], [LigaduraCordón], [PosiciónParto], [TerminaciónParto], [ConsultasPrenatales]) VALUES (12, 5, 0, 1, 1, CAST(N'2022-01-20' AS Date), 0, 1, N'Familiar', N'Completo', CAST(N'2021-05-02' AS Date), 0, 0, 0, 0, N'Acostada', N'Espontánea', N'4')
SET IDENTITY_INSERT [dbo].[AdmisiónParto] OFF
GO
SET IDENTITY_INSERT [dbo].[Anestesia] ON 

INSERT [dbo].[Anestesia] ([IdAnestesia], [IdAdmisiónParto], [AnestesiaGeneral], [AnestesiaLocal], [AnestesiaRegional]) VALUES (1, 4, 1, 0, 0)
INSERT [dbo].[Anestesia] ([IdAnestesia], [IdAdmisiónParto], [AnestesiaGeneral], [AnestesiaLocal], [AnestesiaRegional]) VALUES (2, 5, 1, 0, 0)
INSERT [dbo].[Anestesia] ([IdAnestesia], [IdAdmisiónParto], [AnestesiaGeneral], [AnestesiaLocal], [AnestesiaRegional]) VALUES (3, 11, 0, 1, 1)
INSERT [dbo].[Anestesia] ([IdAnestesia], [IdAdmisiónParto], [AnestesiaGeneral], [AnestesiaLocal], [AnestesiaRegional]) VALUES (4, 12, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Anestesia] OFF
GO
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (1, N'TBC')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (2, N'diabetes I')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (3, N'diabetes II')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (4, N'diabetes G')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (5, N'hipertensión')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (6, N'preeclampsia')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (7, N'eclampsia')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (8, N'cirugía genito-urinaria')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (9, N'infertilidad')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (10, N'cardiopatía')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (11, N'nefropatía')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (12, N'violencia')
INSERT [dbo].[Antecedentes] ([IdAntecedente], [Antecedente]) VALUES (13, N'VIH+')
GO
SET IDENTITY_INSERT [dbo].[AntecedentesFamiliares] ON 

INSERT [dbo].[AntecedentesFamiliares] ([IdAntecedenteFamiliar], [IdPaciente], [IdAntecedente]) VALUES (1, 1, 2)
INSERT [dbo].[AntecedentesFamiliares] ([IdAntecedenteFamiliar], [IdPaciente], [IdAntecedente]) VALUES (6, 2, 7)
SET IDENTITY_INSERT [dbo].[AntecedentesFamiliares] OFF
GO
SET IDENTITY_INSERT [dbo].[AntecedentesObstetricos] ON 

INSERT [dbo].[AntecedentesObstetricos] ([IdAntecedentesObstetricos], [IdPacientes], [NumeroGestasPrevias], [NumeroPartosVaginales], [NumeroPartosCesareas], [IdUltimoPrevio], [Gemelares], [NumeroAbortos], [NumeroNacidosVivos], [NumeroEmbarazoEctopico], [NumeroNacidosMuertos], [NumeroHijosVivos], [Muertes1raSemana], [MuertesDespués1raSemana], [FinEmbarazoAnterior], [EmbarazoPlaneado], [FracasoMetodoAnticonceptivo]) VALUES (1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'1990-07-10' AS Date), 1, 1)
INSERT [dbo].[AntecedentesObstetricos] ([IdAntecedentesObstetricos], [IdPacientes], [NumeroGestasPrevias], [NumeroPartosVaginales], [NumeroPartosCesareas], [IdUltimoPrevio], [Gemelares], [NumeroAbortos], [NumeroNacidosVivos], [NumeroEmbarazoEctopico], [NumeroNacidosMuertos], [NumeroHijosVivos], [Muertes1raSemana], [MuertesDespués1raSemana], [FinEmbarazoAnterior], [EmbarazoPlaneado], [FracasoMetodoAnticonceptivo]) VALUES (2, 2, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[AntecedentesObstetricos] OFF
GO
SET IDENTITY_INSERT [dbo].[AntecedentesPersonales] ON 

INSERT [dbo].[AntecedentesPersonales] ([IdAntecedentePersonal], [IdPaciente], [IdAntecedente]) VALUES (2, 4, 5)
INSERT [dbo].[AntecedentesPersonales] ([IdAntecedentePersonal], [IdPaciente], [IdAntecedente]) VALUES (3, 5, 10)
INSERT [dbo].[AntecedentesPersonales] ([IdAntecedentePersonal], [IdPaciente], [IdAntecedente]) VALUES (4, 4, 2)
INSERT [dbo].[AntecedentesPersonales] ([IdAntecedentePersonal], [IdPaciente], [IdAntecedente]) VALUES (5, 1, 5)
SET IDENTITY_INSERT [dbo].[AntecedentesPersonales] OFF
GO
INSERT [dbo].[Antirubeola] ([IdAntirubeola], [Antirubeola]) VALUES (1, N'previa')
INSERT [dbo].[Antirubeola] ([IdAntirubeola], [Antirubeola]) VALUES (2, N'no sabe')
INSERT [dbo].[Antirubeola] ([IdAntirubeola], [Antirubeola]) VALUES (3, N'embarazo')
INSERT [dbo].[Antirubeola] ([IdAntirubeola], [Antirubeola]) VALUES (4, N'no')
GO
INSERT [dbo].[Bacteriuria] ([IdBacteriuria], [ResultadoBacteriuria]) VALUES (1, N'Normal')
INSERT [dbo].[Bacteriuria] ([IdBacteriuria], [ResultadoBacteriuria]) VALUES (2, N'Anormal')
INSERT [dbo].[Bacteriuria] ([IdBacteriuria], [ResultadoBacteriuria]) VALUES (3, N'No se hizo')
INSERT [dbo].[Bacteriuria] ([IdBacteriuria], [ResultadoBacteriuria]) VALUES (4, N'No corresponde')
GO
INSERT [dbo].[Chagas] ([IdChagas], [ResultadoChagas]) VALUES (1, N'Negativa')
INSERT [dbo].[Chagas] ([IdChagas], [ResultadoChagas]) VALUES (2, N'Positiva')
INSERT [dbo].[Chagas] ([IdChagas], [ResultadoChagas]) VALUES (3, N'No se hizo')
GO
INSERT [dbo].[ConsultasAntenatales] ([IdPaciente], [IdConsultaAntenatal], [FechaConsulta], [EdadGestacional], [Peso], [PresionArterial], [AlturaUterina], [Presentacion], [FrecuenciaCardiacaFetal], [MovimientosFetales], [Proteinuria], [SignosAlarma], [InicialesTecnico], [ProximaCita]) VALUES (1, 1, CAST(N'2022-09-20' AS Date), 24, CAST(56 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), N'Cef', 89, N'Negativo', N'Negativo', N'Ninguno', N'NGA', CAST(N'2022-12-12' AS Date))
INSERT [dbo].[ConsultasAntenatales] ([IdPaciente], [IdConsultaAntenatal], [FechaConsulta], [EdadGestacional], [Peso], [PresionArterial], [AlturaUterina], [Presentacion], [FrecuenciaCardiacaFetal], [MovimientosFetales], [Proteinuria], [SignosAlarma], [InicialesTecnico], [ProximaCita]) VALUES (2, 2, CAST(N'2022-10-03' AS Date), 27, CAST(47 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), N'Tra', 98, N'Positivo', N'Negativo', N'Ninguno', N'VLA', CAST(N'2020-11-04' AS Date))
INSERT [dbo].[ConsultasAntenatales] ([IdPaciente], [IdConsultaAntenatal], [FechaConsulta], [EdadGestacional], [Peso], [PresionArterial], [AlturaUterina], [Presentacion], [FrecuenciaCardiacaFetal], [MovimientosFetales], [Proteinuria], [SignosAlarma], [InicialesTecnico], [ProximaCita]) VALUES (4, 4, CAST(N'2022-08-10' AS Date), 26, CAST(59 AS Decimal(18, 0)), CAST(98 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), N'Cef', 98, N'Positivos', N'Negativo', N'Ninguno', N'AGM', CAST(N'2022-09-28' AS Date))
INSERT [dbo].[ConsultasAntenatales] ([IdPaciente], [IdConsultaAntenatal], [FechaConsulta], [EdadGestacional], [Peso], [PresionArterial], [AlturaUterina], [Presentacion], [FrecuenciaCardiacaFetal], [MovimientosFetales], [Proteinuria], [SignosAlarma], [InicialesTecnico], [ProximaCita]) VALUES (5, 5, CAST(N'2022-01-13' AS Date), 12, CAST(61 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), N'Cef', 99, N'Negativo', N'Negativo', N'Ninguno', N'ALP', CAST(N'2022-09-15' AS Date))
GO
INSERT [dbo].[DefectoCongenito] ([IdDefectoCongenito], [DefectoCongenito]) VALUES (1, N'Menor')
INSERT [dbo].[DefectoCongenito] ([IdDefectoCongenito], [DefectoCongenito]) VALUES (2, N'Mayor ')
GO
SET IDENTITY_INSERT [dbo].[Desgarros] ON 

INSERT [dbo].[Desgarros] ([IdDesgarros], [IdAdmisiónParto], [Desgarros], [Grado]) VALUES (1, 4, 1, 2)
INSERT [dbo].[Desgarros] ([IdDesgarros], [IdAdmisiónParto], [Desgarros], [Grado]) VALUES (2, 5, 1, 2)
INSERT [dbo].[Desgarros] ([IdDesgarros], [IdAdmisiónParto], [Desgarros], [Grado]) VALUES (3, 11, 0, 0)
INSERT [dbo].[Desgarros] ([IdDesgarros], [IdAdmisiónParto], [Desgarros], [Grado]) VALUES (4, 12, 0, 0)
SET IDENTITY_INSERT [dbo].[Desgarros] OFF
GO
INSERT [dbo].[DestinoRecienNacido] ([IdDestinoRecienNacido], [DestinoRecienNacido]) VALUES (1, N'AlojamientoConjunto')
INSERT [dbo].[DestinoRecienNacido] ([IdDestinoRecienNacido], [DestinoRecienNacido]) VALUES (2, N'UnidadNeonatal ')
INSERT [dbo].[DestinoRecienNacido] ([IdDestinoRecienNacido], [DestinoRecienNacido]) VALUES (3, N'OtroHospital')
GO
SET IDENTITY_INSERT [dbo].[DetallesPartograma] ON 

INSERT [dbo].[DetallesPartograma] ([IdDetallesPartograma], [IdAdmisiónParto], [CurvasAlerta]) VALUES (1, 4, 1)
INSERT [dbo].[DetallesPartograma] ([IdDetallesPartograma], [IdAdmisiónParto], [CurvasAlerta]) VALUES (2, 5, 1)
INSERT [dbo].[DetallesPartograma] ([IdDetallesPartograma], [IdAdmisiónParto], [CurvasAlerta]) VALUES (3, 11, 1)
INSERT [dbo].[DetallesPartograma] ([IdDetallesPartograma], [IdAdmisiónParto], [CurvasAlerta]) VALUES (4, 12, 0)
SET IDENTITY_INSERT [dbo].[DetallesPartograma] OFF
GO
SET IDENTITY_INSERT [dbo].[DeterminarEdadGestacionalParto] ON 

INSERT [dbo].[DeterminarEdadGestacionalParto] ([IdDeterminarEdadGestacional], [IdAdmisiónParto], [FUM], [Ecografía], [Días], [Semanas]) VALUES (1, 4, 0, 1, 10, 38)
INSERT [dbo].[DeterminarEdadGestacionalParto] ([IdDeterminarEdadGestacional], [IdAdmisiónParto], [FUM], [Ecografía], [Días], [Semanas]) VALUES (3, 5, 1, 0, 10, 39)
INSERT [dbo].[DeterminarEdadGestacionalParto] ([IdDeterminarEdadGestacional], [IdAdmisiónParto], [FUM], [Ecografía], [Días], [Semanas]) VALUES (7, 11, 1, 0, 12, 40)
INSERT [dbo].[DeterminarEdadGestacionalParto] ([IdDeterminarEdadGestacional], [IdAdmisiónParto], [FUM], [Ecografía], [Días], [Semanas]) VALUES (8, 12, 0, 1, 10, 24)
SET IDENTITY_INSERT [dbo].[DeterminarEdadGestacionalParto] OFF
GO
INSERT [dbo].[EdadGestacionalRecienNacido] ([IdEdadGestacionalRecienNacido], [Semanas], [Dias], [IdNacimiento]) VALUES (1, N'38        ', 0, 1)
INSERT [dbo].[EdadGestacionalRecienNacido] ([IdEdadGestacionalRecienNacido], [Semanas], [Dias], [IdNacimiento]) VALUES (2, N'35        ', 2, 2)
INSERT [dbo].[EdadGestacionalRecienNacido] ([IdEdadGestacionalRecienNacido], [Semanas], [Dias], [IdNacimiento]) VALUES (3, N'42        ', 0, 3)
INSERT [dbo].[EdadGestacionalRecienNacido] ([IdEdadGestacionalRecienNacido], [Semanas], [Dias], [IdNacimiento]) VALUES (4, N'40        ', 3, 4)
GO
INSERT [dbo].[EnfermedadesRN] ([IdEnfermedadRN], [EnfermedadRN]) VALUES (1, N'Fibrosis')
INSERT [dbo].[EnfermedadesRN] ([IdEnfermedadRN], [EnfermedadRN]) VALUES (2, N'Hipotiroidismo')
INSERT [dbo].[EnfermedadesRN] ([IdEnfermedadRN], [EnfermedadRN]) VALUES (3, N'Gastroenteritis')
GO
INSERT [dbo].[EstadoCivil] ([IdEstadoCivil], [EstadoCivil]) VALUES (1, N'casada')
INSERT [dbo].[EstadoCivil] ([IdEstadoCivil], [EstadoCivil]) VALUES (2, N'unión estable')
INSERT [dbo].[EstadoCivil] ([IdEstadoCivil], [EstadoCivil]) VALUES (3, N'soltera')
INSERT [dbo].[EstadoCivil] ([IdEstadoCivil], [EstadoCivil]) VALUES (4, N'otro')
GO
INSERT [dbo].[Estreptococo] ([IdEstreptococo], [ResultadoEstreptococo]) VALUES (1, N'Negativo  ')
INSERT [dbo].[Estreptococo] ([IdEstreptococo], [ResultadoEstreptococo]) VALUES (2, N'Positivo  ')
INSERT [dbo].[Estreptococo] ([IdEstreptococo], [ResultadoEstreptococo]) VALUES (3, N'No se hizo')
GO
INSERT [dbo].[Estudios] ([IdEstudio], [Estudio]) VALUES (1, N'ninguno')
INSERT [dbo].[Estudios] ([IdEstudio], [Estudio]) VALUES (2, N'primaria')
INSERT [dbo].[Estudios] ([IdEstudio], [Estudio]) VALUES (3, N'secundaria')
INSERT [dbo].[Estudios] ([IdEstudio], [Estudio]) VALUES (4, N'universidad')
GO
INSERT [dbo].[Etnia] ([IdEtnia], [Etnia]) VALUES (1, N'Blanca')
INSERT [dbo].[Etnia] ([IdEtnia], [Etnia]) VALUES (2, N'Indigena')
INSERT [dbo].[Etnia] ([IdEtnia], [Etnia]) VALUES (3, N'Mestiza')
INSERT [dbo].[Etnia] ([IdEtnia], [Etnia]) VALUES (4, N'Negra')
INSERT [dbo].[Etnia] ([IdEtnia], [Etnia]) VALUES (5, N'Otra')
GO
SET IDENTITY_INSERT [dbo].[EvoluciónTrabajoParto] ON 

INSERT [dbo].[EvoluciónTrabajoParto] ([IdEvoluciónTrabajoParto], [IdDetallesPartograma], [HoraMinutosEvaluación], [PosiciónGestante], [PresiónArterial], [PulsoLatidosPorMinuto], [ContraccionesUterinas], [DilataciónCervicalCM], [AlturaPresentación], [VariedadPosición], [PresenciaMeconio], [FrecuenciaCardiacaFetal]) VALUES (1, 1, CAST(N'12:10:00' AS Time), N'Cunclillas', N'100/80', 20, 3, 7, N'I Plano', N'OIIA', 0, 110)
INSERT [dbo].[EvoluciónTrabajoParto] ([IdEvoluciónTrabajoParto], [IdDetallesPartograma], [HoraMinutosEvaluación], [PosiciónGestante], [PresiónArterial], [PulsoLatidosPorMinuto], [ContraccionesUterinas], [DilataciónCervicalCM], [AlturaPresentación], [VariedadPosición], [PresenciaMeconio], [FrecuenciaCardiacaFetal]) VALUES (4, 2, CAST(N'02:38:00' AS Time), N'Acostada', N'120/75', 18, 4, 5, N'I Plano', N'OIIA', 0, 115)
INSERT [dbo].[EvoluciónTrabajoParto] ([IdEvoluciónTrabajoParto], [IdDetallesPartograma], [HoraMinutosEvaluación], [PosiciónGestante], [PresiónArterial], [PulsoLatidosPorMinuto], [ContraccionesUterinas], [DilataciónCervicalCM], [AlturaPresentación], [VariedadPosición], [PresenciaMeconio], [FrecuenciaCardiacaFetal]) VALUES (5, 3, CAST(N'05:10:00' AS Time), N'Sentada', N'118/80', 18, 4, 8, N'II Plano', N'OIDA', 0, 112)
INSERT [dbo].[EvoluciónTrabajoParto] ([IdEvoluciónTrabajoParto], [IdDetallesPartograma], [HoraMinutosEvaluación], [PosiciónGestante], [PresiónArterial], [PulsoLatidosPorMinuto], [ContraccionesUterinas], [DilataciónCervicalCM], [AlturaPresentación], [VariedadPosición], [PresenciaMeconio], [FrecuenciaCardiacaFetal]) VALUES (6, 4, CAST(N'02:28:00' AS Time), N'Acostada', N'120/80', 20, 0, 0, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[EvoluciónTrabajoParto] OFF
GO
SET IDENTITY_INSERT [dbo].[GestacionActual] ON 

INSERT [dbo].[GestacionActual] ([IdGestacionActual], [IdPaciente], [PesoAnterior], [Talla], [FUM], [FPP], [EGConfiableFUM], [EGConfiableEco], [IdAntirubeola], [Antitetanica], [ExamenOdontologico], [ExamenMamas], [IdGrupoSanguineo], [TipoRH], [IdToxoplasmosis], [TipoToxoplasmosis], [IdVIH], [IdTestVIH], [SemanasEmabarazo], [IdTtoAntirretroviral], [HCPAntenatal], [HCPAborto], [SuplementoHierro], [AcidoFolico], [IdPruebaSifilis], [IdTreponemica], [IdNoTreponemica], [SemanaPruebaSifilis], [IdChagas], [IdMalaria], [IdBacteriuria], [GlucemiaAyunas], [IdEstreptococo], [PreparacionParto], [ConsejeriaLactancia]) VALUES (12, 1, CAST(55 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(N'2011-01-03' AS Date), CAST(N'2011-09-08' AS Date), 1, 0, 1, 1, 1, 1, 1, N'Negativo', 1, N'IgM', 2, 2, 23, 1, N'11', N'11', 0, 0, 1, 1, 1, 22, 1, 1, 1, CAST(155 AS Decimal(18, 0)), 1, 1, 1)
INSERT [dbo].[GestacionActual] ([IdGestacionActual], [IdPaciente], [PesoAnterior], [Talla], [FUM], [FPP], [EGConfiableFUM], [EGConfiableEco], [IdAntirubeola], [Antitetanica], [ExamenOdontologico], [ExamenMamas], [IdGrupoSanguineo], [TipoRH], [IdToxoplasmosis], [TipoToxoplasmosis], [IdVIH], [IdTestVIH], [SemanasEmabarazo], [IdTtoAntirretroviral], [HCPAntenatal], [HCPAborto], [SuplementoHierro], [AcidoFolico], [IdPruebaSifilis], [IdTreponemica], [IdNoTreponemica], [SemanaPruebaSifilis], [IdChagas], [IdMalaria], [IdBacteriuria], [GlucemiaAyunas], [IdEstreptococo], [PreparacionParto], [ConsejeriaLactancia]) VALUES (14, 2, CAST(56 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(N'2020-09-16' AS Date), CAST(N'2021-04-06' AS Date), 1, 1, 1, 1, 1, 1, 1, N'Positivo', 1, N'IgG', 1, 1, 31, 1, N'12', N'12', 1, 1, 1, 1, 1, 25, 1, 1, 1, CAST(150 AS Decimal(18, 0)), 1, 1, 1)
INSERT [dbo].[GestacionActual] ([IdGestacionActual], [IdPaciente], [PesoAnterior], [Talla], [FUM], [FPP], [EGConfiableFUM], [EGConfiableEco], [IdAntirubeola], [Antitetanica], [ExamenOdontologico], [ExamenMamas], [IdGrupoSanguineo], [TipoRH], [IdToxoplasmosis], [TipoToxoplasmosis], [IdVIH], [IdTestVIH], [SemanasEmabarazo], [IdTtoAntirretroviral], [HCPAntenatal], [HCPAborto], [SuplementoHierro], [AcidoFolico], [IdPruebaSifilis], [IdTreponemica], [IdNoTreponemica], [SemanaPruebaSifilis], [IdChagas], [IdMalaria], [IdBacteriuria], [GlucemiaAyunas], [IdEstreptococo], [PreparacionParto], [ConsejeriaLactancia]) VALUES (22, 4, CAST(58 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(N'2022-09-16' AS Date), CAST(N'2023-04-14' AS Date), 0, 0, 1, 0, 0, 0, 2, N'Negatico', 2, N'IgM', 2, 2, 12, 2, N'12', N'12', 0, 1, 1, 1, 2, 12, 2, 2, 1, CAST(148 AS Decimal(18, 0)), 2, 0, 0)
INSERT [dbo].[GestacionActual] ([IdGestacionActual], [IdPaciente], [PesoAnterior], [Talla], [FUM], [FPP], [EGConfiableFUM], [EGConfiableEco], [IdAntirubeola], [Antitetanica], [ExamenOdontologico], [ExamenMamas], [IdGrupoSanguineo], [TipoRH], [IdToxoplasmosis], [TipoToxoplasmosis], [IdVIH], [IdTestVIH], [SemanasEmabarazo], [IdTtoAntirretroviral], [HCPAntenatal], [HCPAborto], [SuplementoHierro], [AcidoFolico], [IdPruebaSifilis], [IdTreponemica], [IdNoTreponemica], [SemanaPruebaSifilis], [IdChagas], [IdMalaria], [IdBacteriuria], [GlucemiaAyunas], [IdEstreptococo], [PreparacionParto], [ConsejeriaLactancia]) VALUES (23, 5, CAST(59 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(N'2022-01-12' AS Date), CAST(N'2022-09-12' AS Date), 1, 1, 2, 0, 1, 1, 3, N'Positivo', 2, N'IgG', 2, 2, 15, 2, N'10', N'11', 0, 1, 1, 1, 1, 10, 1, 1, 1, CAST(155 AS Decimal(18, 0)), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[GestacionActual] OFF
GO
SET IDENTITY_INSERT [dbo].[Hemorragias] ON 

INSERT [dbo].[Hemorragias] ([IdHemorragias], [Hemorragia], [Postparto], [Infeccion_Puerperal], [IdTrimestre], [IdPaciente]) VALUES (3, 1, 0, 0, 1, 2)
INSERT [dbo].[Hemorragias] ([IdHemorragias], [Hemorragia], [Postparto], [Infeccion_Puerperal], [IdTrimestre], [IdPaciente]) VALUES (4, 1, 1, 0, 2, 1)
INSERT [dbo].[Hemorragias] ([IdHemorragias], [Hemorragia], [Postparto], [Infeccion_Puerperal], [IdTrimestre], [IdPaciente]) VALUES (7, 0, 0, 0, 3, 4)
INSERT [dbo].[Hemorragias] ([IdHemorragias], [Hemorragia], [Postparto], [Infeccion_Puerperal], [IdTrimestre], [IdPaciente]) VALUES (8, 1, 1, 0, 1, 5)
SET IDENTITY_INSERT [dbo].[Hemorragias] OFF
GO
SET IDENTITY_INSERT [dbo].[HospitalizaciónEmbarazo] ON 

INSERT [dbo].[HospitalizaciónEmbarazo] ([IdHospitalizaciónEmbarazo], [IdPaciente], [HospitalizacionEmbarazo], [DíasHospitalización]) VALUES (2, 1, 1, 2)
INSERT [dbo].[HospitalizaciónEmbarazo] ([IdHospitalizaciónEmbarazo], [IdPaciente], [HospitalizacionEmbarazo], [DíasHospitalización]) VALUES (3, 2, 1, 3)
INSERT [dbo].[HospitalizaciónEmbarazo] ([IdHospitalizaciónEmbarazo], [IdPaciente], [HospitalizacionEmbarazo], [DíasHospitalización]) VALUES (10, 4, 1, 3)
INSERT [dbo].[HospitalizaciónEmbarazo] ([IdHospitalizaciónEmbarazo], [IdPaciente], [HospitalizacionEmbarazo], [DíasHospitalización]) VALUES (11, 5, 1, 1)
SET IDENTITY_INSERT [dbo].[HospitalizaciónEmbarazo] OFF
GO
SET IDENTITY_INSERT [dbo].[IndicaciónInducciónPrincipal] ON 

INSERT [dbo].[IndicaciónInducciónPrincipal] ([IdIndicaciónInducción], [IdAdmisiónParto], [CausasInducción], [CódigoInducción]) VALUES (1, 4, N'Desprendimiento Cervical', N'D10')
INSERT [dbo].[IndicaciónInducciónPrincipal] ([IdIndicaciónInducción], [IdAdmisiónParto], [CausasInducción], [CódigoInducción]) VALUES (2, 5, N'Movilizar al Feto', N'M08')
INSERT [dbo].[IndicaciónInducciónPrincipal] ([IdIndicaciónInducción], [IdAdmisiónParto], [CausasInducción], [CódigoInducción]) VALUES (4, 11, N'Parto Normal', N'M10')
INSERT [dbo].[IndicaciónInducciónPrincipal] ([IdIndicaciónInducción], [IdAdmisiónParto], [CausasInducción], [CódigoInducción]) VALUES (5, 12, N'Aborto Normal', N'M1010')
SET IDENTITY_INSERT [dbo].[IndicaciónInducciónPrincipal] OFF
GO
SET IDENTITY_INSERT [dbo].[InicioTrabajoParto] ON 

INSERT [dbo].[InicioTrabajoParto] ([IdInicioTrabajoParto], [IdAdmisiónParto], [Espontáneo], [Inducido]) VALUES (1, 4, 0, 1)
INSERT [dbo].[InicioTrabajoParto] ([IdInicioTrabajoParto], [IdAdmisiónParto], [Espontáneo], [Inducido]) VALUES (2, 5, 0, 1)
INSERT [dbo].[InicioTrabajoParto] ([IdInicioTrabajoParto], [IdAdmisiónParto], [Espontáneo], [Inducido]) VALUES (3, 11, 1, 0)
INSERT [dbo].[InicioTrabajoParto] ([IdInicioTrabajoParto], [IdAdmisiónParto], [Espontáneo], [Inducido]) VALUES (4, 12, 1, 0)
SET IDENTITY_INSERT [dbo].[InicioTrabajoParto] OFF
GO
INSERT [dbo].[LongitudRecienNacido] ([IdNacimiento], [IdLongitud], [Longitud]) VALUES (1, 2, CAST(43.0 AS Numeric(3, 1)))
INSERT [dbo].[LongitudRecienNacido] ([IdNacimiento], [IdLongitud], [Longitud]) VALUES (2, 1, CAST(40.2 AS Numeric(3, 1)))
INSERT [dbo].[LongitudRecienNacido] ([IdNacimiento], [IdLongitud], [Longitud]) VALUES (3, 3, CAST(38.9 AS Numeric(3, 1)))
INSERT [dbo].[LongitudRecienNacido] ([IdNacimiento], [IdLongitud], [Longitud]) VALUES (4, 4, CAST(42.1 AS Numeric(3, 1)))
GO
SET IDENTITY_INSERT [dbo].[MedicaciónRecibidaParto] ON 

INSERT [dbo].[MedicaciónRecibidaParto] ([IdMedicaciónRecibida], [IdAnestesia], [OcitocicosTDP], [Antibiótico], [Transfusión], [OtroMedicamento]) VALUES (2, 1, 1, 1, 0, N'Ninguno')
INSERT [dbo].[MedicaciónRecibidaParto] ([IdMedicaciónRecibida], [IdAnestesia], [OcitocicosTDP], [Antibiótico], [Transfusión], [OtroMedicamento]) VALUES (3, 2, 1, 1, 0, N'Ninguno')
INSERT [dbo].[MedicaciónRecibidaParto] ([IdMedicaciónRecibida], [IdAnestesia], [OcitocicosTDP], [Antibiótico], [Transfusión], [OtroMedicamento]) VALUES (4, 3, 1, 1, 0, N'Ninguno')
INSERT [dbo].[MedicaciónRecibidaParto] ([IdMedicaciónRecibida], [IdAnestesia], [OcitocicosTDP], [Antibiótico], [Transfusión], [OtroMedicamento]) VALUES (5, 4, 0, 1, 1, N'Ninguno')
SET IDENTITY_INSERT [dbo].[MedicaciónRecibidaParto] OFF
GO
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (1, N'no usaba')
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (2, N'barrera')
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (3, N'DIU')
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (4, N'hormonal')
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (5, N'emergencia')
INSERT [dbo].[MetodosAnticonceptivos] ([IdMetodoAnticonceptivo], [MetodoAnticonceptivo]) VALUES (6, N'natural')
GO
SET IDENTITY_INSERT [dbo].[NacimientoRecienNacido] ON 

INSERT [dbo].[NacimientoRecienNacido] ([IdNacimiento], [IdAdmisiónParto], [EstadoVitalReciénNacido], [FechaHoraNacimiento]) VALUES (1, 4, N'Vivo', CAST(N'2022-07-15T15:12:00.000' AS DateTime))
INSERT [dbo].[NacimientoRecienNacido] ([IdNacimiento], [IdAdmisiónParto], [EstadoVitalReciénNacido], [FechaHoraNacimiento]) VALUES (2, 5, N'Vivo', CAST(N'2022-07-13T14:30:00.000' AS DateTime))
INSERT [dbo].[NacimientoRecienNacido] ([IdNacimiento], [IdAdmisiónParto], [EstadoVitalReciénNacido], [FechaHoraNacimiento]) VALUES (3, 11, N'Vivo', CAST(N'2022-07-08T12:45:00.000' AS DateTime))
INSERT [dbo].[NacimientoRecienNacido] ([IdNacimiento], [IdAdmisiónParto], [EstadoVitalReciénNacido], [FechaHoraNacimiento]) VALUES (4, 12, N'Muerto Anteparto', CAST(N'2022-01-20T12:15:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[NacimientoRecienNacido] OFF
GO
SET IDENTITY_INSERT [dbo].[Ocitocicos] ON 

INSERT [dbo].[Ocitocicos] ([IdOcitocicos], [IdMedicaciónRecibida], [Prealumbramieto], [PosAlumbramiento]) VALUES (1, 2, 1, 1)
INSERT [dbo].[Ocitocicos] ([IdOcitocicos], [IdMedicaciónRecibida], [Prealumbramieto], [PosAlumbramiento]) VALUES (2, 3, 1, 1)
INSERT [dbo].[Ocitocicos] ([IdOcitocicos], [IdMedicaciónRecibida], [Prealumbramieto], [PosAlumbramiento]) VALUES (3, 4, 1, 1)
INSERT [dbo].[Ocitocicos] ([IdOcitocicos], [IdMedicaciónRecibida], [Prealumbramieto], [PosAlumbramiento]) VALUES (4, 5, 1, 0)
SET IDENTITY_INSERT [dbo].[Ocitocicos] OFF
GO
INSERT [dbo].[OtrasEnfermedades] ([IdPaciente], [IdPatologias], [IdOtrasEnfermedades], [IdEnfermedadRN], [Observación]) VALUES (5, 16, 1, 3, N'Se registra enfermedad en la Hc')
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [Domicilio], [Localidad], [Municipio], [Telefono], [FechaNacimiento], [IdEtnia], [Alfabeta], [IdEstudio], [AñosMayorNivel], [IdEstadoCivil], [ViveSola], [LugarControlPrenatal], [LugarPartoAborto], [NumeroIdentidad]) VALUES (1, N'Valeria', N'Valencia', N'Carrera 48 10 03', N'Llanogrande', N'Rionegro', 2363538, CAST(N'2000-08-10' AS Date), 1, 0, 4, 7, 2, 0, N'Complex', N'Ninguno', N'1001362576')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [Domicilio], [Localidad], [Municipio], [Telefono], [FechaNacimiento], [IdEtnia], [Alfabeta], [IdEstudio], [AñosMayorNivel], [IdEstadoCivil], [ViveSola], [LugarControlPrenatal], [LugarPartoAborto], [NumeroIdentidad]) VALUES (2, N'Alejandra', N'Medina', N'Carrera 56c 10 23', N'Itagui', N'Itagui', 5287654, CAST(N'1999-06-23' AS Date), 1, 0, 4, 7, 2, 0, N'Torre medica el Tesoro', N'Ninguno', N'1023654781')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [Domicilio], [Localidad], [Municipio], [Telefono], [FechaNacimiento], [IdEtnia], [Alfabeta], [IdEstudio], [AñosMayorNivel], [IdEstadoCivil], [ViveSola], [LugarControlPrenatal], [LugarPartoAborto], [NumeroIdentidad]) VALUES (4, N'Yennifer', N'Cogollo', N'Calle 29 08 33', N'Coopacabana', N'Copacabana', 3456789, CAST(N'2001-09-14' AS Date), 3, 0, 4, 7, 1, 0, N'San Vicente', N'Ninguno', N'1001567569')
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellido], [Domicilio], [Localidad], [Municipio], [Telefono], [FechaNacimiento], [IdEtnia], [Alfabeta], [IdEstudio], [AñosMayorNivel], [IdEstadoCivil], [ViveSola], [LugarControlPrenatal], [LugarPartoAborto], [NumeroIdentidad]) VALUES (5, N'Alejandra', N'Gamboa', N'Calle 54c 23 6', N'Los Alpes', N'Medellín', 4567890, CAST(N'1999-02-10' AS Date), 3, 0, 4, 7, 1, 0, N'El Rosario', N'Ninguno', N'1234567810')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
INSERT [dbo].[PaludismoMalaria] ([IdMalaria], [ResultadoMalaria]) VALUES (1, N'Negativa')
INSERT [dbo].[PaludismoMalaria] ([IdMalaria], [ResultadoMalaria]) VALUES (2, N'Positiva')
INSERT [dbo].[PaludismoMalaria] ([IdMalaria], [ResultadoMalaria]) VALUES (3, N'No se hizo')
GO
INSERT [dbo].[PatologiaMaterna] ([IdPaciente], [IdPatologia]) VALUES (1, 11)
INSERT [dbo].[PatologiaMaterna] ([IdPaciente], [IdPatologia]) VALUES (2, 15)
INSERT [dbo].[PatologiaMaterna] ([IdPaciente], [IdPatologia]) VALUES (4, 3)
INSERT [dbo].[PatologiaMaterna] ([IdPaciente], [IdPatologia]) VALUES (5, 16)
GO
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (1, N'HTA Previa')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (2, N'HTA Inducida_Embarazo')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (3, N'Preeclampsia ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (4, N'Eclampsia ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (5, N'Cardiopatia ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (6, N'Nefropatia ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (7, N'Diabetes I')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (8, N'Diabetes II')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (9, N'Diabetes G ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (10, N'Infeccion ovular ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (11, N'Infeccion urinaria ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (12, N'Amenaza Parto preter')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (13, N'R_C_I_U')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (14, N'Rotura prematura membranas ')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (15, N'Anemia')
INSERT [dbo].[Patologias] ([IdPatologías], [Patologías]) VALUES (16, N'Otra condición grave')
GO
INSERT [dbo].[PCefálicoRecienNacido] ([IdP_Cefalico], [P_Cefalico], [IdNacimiento]) VALUES (1, CAST(35.2 AS Numeric(3, 1)), 1)
INSERT [dbo].[PCefálicoRecienNacido] ([IdP_Cefalico], [P_Cefalico], [IdNacimiento]) VALUES (2, CAST(36.5 AS Numeric(3, 1)), 2)
INSERT [dbo].[PCefálicoRecienNacido] ([IdP_Cefalico], [P_Cefalico], [IdNacimiento]) VALUES (3, CAST(30.3 AS Numeric(3, 1)), 3)
INSERT [dbo].[PCefálicoRecienNacido] ([IdP_Cefalico], [P_Cefalico], [IdNacimiento]) VALUES (4, CAST(33.7 AS Numeric(3, 1)), 4)
GO
SET IDENTITY_INSERT [dbo].[PersonalAtenciónParto] ON 

INSERT [dbo].[PersonalAtenciónParto] ([IdPersonalAtención], [IdAdmisiónParto], [Parto], [Neonato], [TipoPersonal], [IdentificaciónPersonal]) VALUES (1, 4, 1, 1, N'Médico', N'102982')
INSERT [dbo].[PersonalAtenciónParto] ([IdPersonalAtención], [IdAdmisiónParto], [Parto], [Neonato], [TipoPersonal], [IdentificaciónPersonal]) VALUES (3, 5, 1, 1, N'Obstetra', N'112988')
INSERT [dbo].[PersonalAtenciónParto] ([IdPersonalAtención], [IdAdmisiónParto], [Parto], [Neonato], [TipoPersonal], [IdentificaciónPersonal]) VALUES (5, 11, 1, 1, N'Obstetra', N'112987')
INSERT [dbo].[PersonalAtenciónParto] ([IdPersonalAtención], [IdAdmisiónParto], [Parto], [Neonato], [TipoPersonal], [IdentificaciónPersonal]) VALUES (6, 12, 1, 0, N'Auxiliar', N'122390')
SET IDENTITY_INSERT [dbo].[PersonalAtenciónParto] OFF
GO
INSERT [dbo].[PesoEG] ([IdPesoEG], [PesoEG]) VALUES (1, N'Adecuado')
INSERT [dbo].[PesoEG] ([IdPesoEG], [PesoEG]) VALUES (2, N'Pequeño')
INSERT [dbo].[PesoEG] ([IdPesoEG], [PesoEG]) VALUES (3, N'Grande')
GO
INSERT [dbo].[PesoNacer] ([IdPeso_nacer], [Peso_nacer]) VALUES (1, CAST(2.300 AS Numeric(5, 3)))
INSERT [dbo].[PesoNacer] ([IdPeso_nacer], [Peso_nacer]) VALUES (2, CAST(3.230 AS Numeric(5, 3)))
INSERT [dbo].[PesoNacer] ([IdPeso_nacer], [Peso_nacer]) VALUES (3, CAST(3.180 AS Numeric(5, 3)))
GO
SET IDENTITY_INSERT [dbo].[PresenciaAcompañante] ON 

INSERT [dbo].[PresenciaAcompañante] ([IdPresenciaAcompañante], [IdAdmisiónParto], [DuranteTrabajoParto], [Parto]) VALUES (1, 4, 1, 1)
INSERT [dbo].[PresenciaAcompañante] ([IdPresenciaAcompañante], [IdAdmisiónParto], [DuranteTrabajoParto], [Parto]) VALUES (2, 5, 1, 1)
INSERT [dbo].[PresenciaAcompañante] ([IdPresenciaAcompañante], [IdAdmisiónParto], [DuranteTrabajoParto], [Parto]) VALUES (3, 11, 1, 1)
INSERT [dbo].[PresenciaAcompañante] ([IdPresenciaAcompañante], [IdAdmisiónParto], [DuranteTrabajoParto], [Parto]) VALUES (5, 12, 1, 0)
SET IDENTITY_INSERT [dbo].[PresenciaAcompañante] OFF
GO
INSERT [dbo].[PruebaNoTreponemica] ([IdNoTreponemica], [ResultadoNoTreponemica]) VALUES (1, N'No reactiva')
INSERT [dbo].[PruebaNoTreponemica] ([IdNoTreponemica], [ResultadoNoTreponemica]) VALUES (2, N'Reactiva')
INSERT [dbo].[PruebaNoTreponemica] ([IdNoTreponemica], [ResultadoNoTreponemica]) VALUES (3, N'Sin dato')
GO
INSERT [dbo].[PruebaTreponemica] ([IdTreponemica], [ResultadoTreponemica]) VALUES (1, N'No reactiva')
INSERT [dbo].[PruebaTreponemica] ([IdTreponemica], [ResultadoTreponemica]) VALUES (2, N'Reactiva')
INSERT [dbo].[PruebaTreponemica] ([IdTreponemica], [ResultadoTreponemica]) VALUES (4, N'Sin dato')
GO
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (1, N'Estimulación')
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (2, N'Aspiración_Boca_Nariz ')
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (3, N'Máscara')
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (4, N'Oxígeno')
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (5, N'Intubación_Endotraqueal')
INSERT [dbo].[Reanimación] ([IdReanimación], [Reanimación]) VALUES (6, N'Masaje_Cardiaco')
GO
INSERT [dbo].[Referido] ([IdReferido], [Referido]) VALUES (1, N'Alojamiento Conjunto')
INSERT [dbo].[Referido] ([IdReferido], [Referido]) VALUES (2, N'Unidad neonatal')
INSERT [dbo].[Referido] ([IdReferido], [Referido]) VALUES (3, N'Referido otro establecimiento')
GO
INSERT [dbo].[ResultadosVIH] ([IdVIH], [ResultadoVIH]) VALUES (1, N'Positivo')
INSERT [dbo].[ResultadosVIH] ([IdVIH], [ResultadoVIH]) VALUES (2, N'Negativo')
INSERT [dbo].[ResultadosVIH] ([IdVIH], [ResultadoVIH]) VALUES (3, N'Sin dato')
INSERT [dbo].[ResultadosVIH] ([IdVIH], [ResultadoVIH]) VALUES (4, N'No corresponde')
GO
SET IDENTITY_INSERT [dbo].[RoturaMembranaAnteparto] ON 

INSERT [dbo].[RoturaMembranaAnteparto] ([IdRoturaMembranasAnteparto], [IdAdmisiónParto], [ExistenciaRotura], [FechaHoraRotura], [SemanasRotura], [Temperatura]) VALUES (7, 4, 1, CAST(N'2022-07-15T14:30:00.000' AS DateTime), N'35', CAST(37.2 AS Numeric(3, 1)))
INSERT [dbo].[RoturaMembranaAnteparto] ([IdRoturaMembranasAnteparto], [IdAdmisiónParto], [ExistenciaRotura], [FechaHoraRotura], [SemanasRotura], [Temperatura]) VALUES (8, 5, 1, CAST(N'2022-07-15T11:28:00.000' AS DateTime), N'30', CAST(36.8 AS Numeric(3, 1)))
INSERT [dbo].[RoturaMembranaAnteparto] ([IdRoturaMembranasAnteparto], [IdAdmisiónParto], [ExistenciaRotura], [FechaHoraRotura], [SemanasRotura], [Temperatura]) VALUES (11, 11, 1, CAST(N'2022-07-08T15:33:00.000' AS DateTime), N'38', CAST(37.5 AS Numeric(3, 1)))
INSERT [dbo].[RoturaMembranaAnteparto] ([IdRoturaMembranasAnteparto], [IdAdmisiónParto], [ExistenciaRotura], [FechaHoraRotura], [SemanasRotura], [Temperatura]) VALUES (12, 12, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RoturaMembranaAnteparto] OFF
GO
INSERT [dbo].[SexoRecienNacido] ([IdSexo_RecienNacido], [Sexo_RecienNacido]) VALUES (1, N'F')
INSERT [dbo].[SexoRecienNacido] ([IdSexo_RecienNacido], [Sexo_RecienNacido]) VALUES (2, N'M')
INSERT [dbo].[SexoRecienNacido] ([IdSexo_RecienNacido], [Sexo_RecienNacido]) VALUES (3, N'ND')
GO
SET IDENTITY_INSERT [dbo].[TestSifilis] ON 

INSERT [dbo].[TestSifilis] ([IdTestSifilis], [Estado]) VALUES (1, N'Solicitado')
INSERT [dbo].[TestSifilis] ([IdTestSifilis], [Estado]) VALUES (2, N'No solicitado')
INSERT [dbo].[TestSifilis] ([IdTestSifilis], [Estado]) VALUES (3, N'No realizado ')
INSERT [dbo].[TestSifilis] ([IdTestSifilis], [Estado]) VALUES (4, N'No corresponde')
SET IDENTITY_INSERT [dbo].[TestSifilis] OFF
GO
INSERT [dbo].[TestVIH] ([IdTestVIH], [Estado]) VALUES (1, N'Solicitado')
INSERT [dbo].[TestVIH] ([IdTestVIH], [Estado]) VALUES (2, N'No solicitado')
INSERT [dbo].[TestVIH] ([IdTestVIH], [Estado]) VALUES (3, N'No corresponde')
GO
INSERT [dbo].[TipoGrupoSanguineo] ([IdGrupoSanguineo], [GrupoSanguineo]) VALUES (1, N'A')
INSERT [dbo].[TipoGrupoSanguineo] ([IdGrupoSanguineo], [GrupoSanguineo]) VALUES (2, N'B')
INSERT [dbo].[TipoGrupoSanguineo] ([IdGrupoSanguineo], [GrupoSanguineo]) VALUES (3, N'AB')
INSERT [dbo].[TipoGrupoSanguineo] ([IdGrupoSanguineo], [GrupoSanguineo]) VALUES (4, N'O')
GO
INSERT [dbo].[TipoPruebaSifilis] ([IdPruebaSifilis], [TipoPrueba]) VALUES (1, N'Treponemica')
INSERT [dbo].[TipoPruebaSifilis] ([IdPruebaSifilis], [TipoPrueba]) VALUES (2, N'No treponemica')
GO
INSERT [dbo].[Toxoplasmosis] ([IdToxoplasmosis], [Toxoplasmosis]) VALUES (1, N'<20semIgG')
INSERT [dbo].[Toxoplasmosis] ([IdToxoplasmosis], [Toxoplasmosis]) VALUES (2, N'>=semIgG')
GO
INSERT [dbo].[TratamientoAntirretroviral] ([IdTtoAntirretroviral], [Estado]) VALUES (1, N'Si ha recibido')
INSERT [dbo].[TratamientoAntirretroviral] ([IdTtoAntirretroviral], [Estado]) VALUES (2, N'No ha recibido')
INSERT [dbo].[TratamientoAntirretroviral] ([IdTtoAntirretroviral], [Estado]) VALUES (3, N'No corresponde')
GO
INSERT [dbo].[Trimestre] ([IdTrimestre], [Trimestre]) VALUES (1, N'PrimerTrismestre')
INSERT [dbo].[Trimestre] ([IdTrimestre], [Trimestre]) VALUES (2, N'SegundoTrimestre')
INSERT [dbo].[Trimestre] ([IdTrimestre], [Trimestre]) VALUES (3, N'TercerTrimestre')
GO
INSERT [dbo].[UltimoPrevio] ([IdUltimoPrevio], [Respuesta]) VALUES (1, N'n/c')
INSERT [dbo].[UltimoPrevio] ([IdUltimoPrevio], [Respuesta]) VALUES (2, N'<2500g')
INSERT [dbo].[UltimoPrevio] ([IdUltimoPrevio], [Respuesta]) VALUES (3, N'normal')
INSERT [dbo].[UltimoPrevio] ([IdUltimoPrevio], [Respuesta]) VALUES (4, N'>=400g')
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
