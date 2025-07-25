USE [master]
GO
/****** Object:  Database [Avaliacao_2bim]    Script Date: 18/07/2025 14:02:04 ******/
CREATE DATABASE [Avaliacao_2bim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Avaliacao_2bim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Avaliacao_2bim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Avaliacao_2bim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Avaliacao_2bim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Avaliacao_2bim] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Avaliacao_2bim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Avaliacao_2bim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET ARITHABORT OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Avaliacao_2bim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Avaliacao_2bim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Avaliacao_2bim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Avaliacao_2bim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Avaliacao_2bim] SET  MULTI_USER 
GO
ALTER DATABASE [Avaliacao_2bim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Avaliacao_2bim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Avaliacao_2bim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Avaliacao_2bim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Avaliacao_2bim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Avaliacao_2bim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Avaliacao_2bim] SET QUERY_STORE = OFF
GO
USE [Avaliacao_2bim]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 18/07/2025 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18/07/2025 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[telefones] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 18/07/2025 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](80) NOT NULL,
	[valor_unitario] [numeric](10, 2) NOT NULL,
	[categoria_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 18/07/2025 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data_venda] [date] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[vendedor_id] [int] NOT NULL,
	[produto_id] [int] NOT NULL,
	[quantidade_produto] [int] NOT NULL,
	[valor_total] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 18/07/2025 14:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([id], [descricao]) VALUES (1, N'Monitor')
INSERT [dbo].[Categoria] ([id], [descricao]) VALUES (2, N'Processador')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [nome], [telefones]) VALUES (1, N'João da Silva', N'4444-5555')
INSERT [dbo].[Cliente] ([id], [nome], [telefones]) VALUES (2, N'Maria José', N'3333-2222')
INSERT [dbo].[Cliente] ([id], [nome], [telefones]) VALUES (3, N'José Maria', N'1111-9999')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Produto] ON 

INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (1, N'Samsung 22 polegadas', CAST(235.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (2, N'Samsung 26 polegadas', CAST(325.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (3, N'LG 22 polegadas', CAST(244.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (4, N'LG 26 polegadas', CAST(385.50 AS Numeric(10, 2)), 1)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (5, N'Intel i3', CAST(590.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (6, N'Intel i5', CAST(690.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (7, N'Intel i7', CAST(790.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (8, N'AMD 2,7GHZ', CAST(495.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Produto] ([id], [descricao], [valor_unitario], [categoria_id]) VALUES (9, N'AMD 3,5GHZ', CAST(788.00 AS Numeric(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Produto] OFF
GO
SET IDENTITY_INSERT [dbo].[Venda] ON 

INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (1, CAST(N'2025-01-01' AS Date), 1, 1, 1, 1, CAST(235.00 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (2, CAST(N'2025-01-11' AS Date), 2, 2, 2, 2, CAST(650.00 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (3, CAST(N'2025-01-21' AS Date), 3, 1, 3, 1, CAST(244.90 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (4, CAST(N'2025-01-31' AS Date), 3, 2, 4, 1, CAST(385.50 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (5, CAST(N'2025-02-01' AS Date), 1, 3, 5, 3, CAST(1770.00 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (6, CAST(N'2025-02-15' AS Date), 2, 1, 6, 4, CAST(2760.00 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (7, CAST(N'2025-03-01' AS Date), 1, 3, 7, 6, CAST(4740.00 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (8, CAST(N'2025-03-22' AS Date), 2, 3, 8, 1, CAST(495.50 AS Numeric(10, 2)))
INSERT [dbo].[Venda] ([id], [data_venda], [cliente_id], [vendedor_id], [produto_id], [quantidade_produto], [valor_total]) VALUES (9, CAST(N'2025-03-31' AS Date), 1, 2, 9, 1, CAST(788.00 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[Venda] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendedor] ON 

INSERT [dbo].[Vendedor] ([id], [nome]) VALUES (1, N'Adriano da Silva')
INSERT [dbo].[Vendedor] ([id], [nome]) VALUES (2, N'Joana Pereira')
INSERT [dbo].[Vendedor] ([id], [nome]) VALUES (3, N'Meire Moura')
SET IDENTITY_INSERT [dbo].[Vendedor] OFF
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD FOREIGN KEY([categoria_id])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD FOREIGN KEY([produto_id])
REFERENCES [dbo].[Produto] ([id])
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD FOREIGN KEY([vendedor_id])
REFERENCES [dbo].[Vendedor] ([id])
GO
USE [master]
GO
ALTER DATABASE [Avaliacao_2bim] SET  READ_WRITE 
GO
