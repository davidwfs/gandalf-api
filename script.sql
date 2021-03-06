SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aplicacao](
	[idAplicacao] [tinyint] NOT NULL,
	[DescAplicacao] [varchar](50) NOT NULL,
	[TipoAplicacao] [char](1) NOT NULL,
 CONSTRAINT [PK_Aplicacao] PRIMARY KEY CLUSTERED 
(
	[idAplicacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 26/09/2017 15:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nomeCategoria] [varchar](50) NOT NULL,
	[descCategoria] [varchar](100) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/09/2017 15:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nomeCompletoCliente] [varchar](100) NOT NULL,
	[emailCliente] [varchar](100) NOT NULL,
	[senhaCliente] [varchar](64) NOT NULL,
	[CPFCliente] [char](14) NOT NULL,
	[celularCliente] [varchar](20) NULL,
	[telComercialCliente] [varchar](20) NULL,
	[telResidencialCliente] [varchar](20) NULL,
	[dtNascCliente] [date] NULL,
	[recebeNewsLetter] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[idEndereco] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[nomeEndereco] [varchar](50) NOT NULL,
	[logradouroEndereco] [varchar](100) NOT NULL,
	[numeroEndereco] [varchar](10) NOT NULL,
	[CEPEndereco] [char](9) NOT NULL,
	[complementoEndereco] [varchar](10) NULL,
	[cidadeEndereco] [varchar](50) NOT NULL,
	[paisEndereco] [varchar](50) NULL,
	[UFEndereco] [char](2) NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[estoque]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estoque](
	[idProduto] [int] NOT NULL,
	[qtdProdutoDisponivel] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ItemPedido]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPedido](
	[idProduto] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[qtdProduto] [smallint] NOT NULL,
	[precoVendaItem] [money] NOT NULL,
 CONSTRAINT [PK_ItemPedido] PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idStatus] [tinyint] NOT NULL,
	[dataPedido] [smalldatetime] NOT NULL,
	[idTipoPagto] [tinyint] NOT NULL,
	[idEndereco] [int] NULL,
	[idAplicacao] [tinyint] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Produto]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[idProduto] [int] IDENTITY(1,1) NOT NULL,
	[nomeProduto] [varchar](70) NOT NULL,
	[descProduto] [varchar](500) NULL,
	[precProduto] [money] NOT NULL,
	[descontoPromocao] [decimal](18, 2) NULL,
	[idCategoria] [int] NOT NULL,
	[ativoProduto] [char](1) NOT NULL,
	[idUsuario] [int] NULL,
	[qtdMinEstoque] [int] NULL,
	[imagem] [image] NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[StatusPedido]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPedido](
	[idStatus] [tinyint] NOT NULL,
	[descStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusPedido] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TipoPagamento]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPagamento](
	[idTipoPagto] [tinyint] NOT NULL,
	[descTipoPagto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPagamento] PRIMARY KEY CLUSTERED 
(
	[idTipoPagto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[loginUsuario] [varchar](100) NOT NULL,
	[senhaUsuario] [varchar](64) NULL,
	[nomeUsuario] [varchar](50) NULL,
	[tipoPerfil] [char](1) NULL,
	[usuarioAtivo] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Endereco] ON 

GO
SET IDENTITY_INSERT [dbo].[Endereco] OFF
GO
SET IDENTITY_INSERT [dbo].[Produto] ON 
GO
SET IDENTITY_INSERT [dbo].[Produto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_usuarioAtivo]  DEFAULT ((1)) FOR [usuarioAtivo]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Cliente]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPedido_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_ProdutoPedido_Pedido]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPedido_Produto] FOREIGN KEY([idProduto])
REFERENCES [dbo].[Produto] ([idProduto])
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_ProdutoPedido_Produto]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Aplicacao] FOREIGN KEY([idAplicacao])
REFERENCES [dbo].[Aplicacao] ([idAplicacao])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Aplicacao]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Endereco] FOREIGN KEY([idEndereco])
REFERENCES [dbo].[Endereco] ([idEndereco])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Endereco]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Status] FOREIGN KEY([idStatus])
REFERENCES [dbo].[StatusPedido] ([idStatus])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Status]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_TipoPagamento] FOREIGN KEY([idTipoPagto])
REFERENCES [dbo].[TipoPagamento] ([idTipoPagto])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_TipoPagamento]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Categoria]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Usuario]
GO
/****** Object:  Trigger [dbo].[tr_protegecategoria]    Script Date: 26/09/2017 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_protegecategoria] on [dbo].[Categoria]
for delete, update

as

	if exists (select 1 from deleted where idcategoria <= 6 )
	begin
		print 'Tentativa de acesso aos registros bloqueados'
		rollback
	end

GO
ALTER TABLE [dbo].[Categoria] ENABLE TRIGGER [tr_protegecategoria]
GO
/****** Object:  Trigger [dbo].[tr_atualizaValorEstoque]    Script Date: 26/09/2017 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_atualizaValorEstoque]
ON [dbo].[ItemPedido]
AFTER INSERT 

AS
update ip
set precoVendaItem = precProduto - descontoPromocao
from ItemPedido [ip] inner join produto [p]
on p.idproduto = ip.idproduto
where precoVendaItem = 0

GO
ALTER TABLE [dbo].[ItemPedido] ENABLE TRIGGER [tr_atualizaValorEstoque]
GO
/****** Object:  Trigger [dbo].[tr_InsereEstoque]    Script Date: 26/09/2017 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tr_InsereEstoque] on [dbo].[Produto]
for INSERT
as

insert into estoque
(idProduto, qtdProdutoDisponivel)
SELECT idProduto, isnull(qtdMinEstoque, 5) * 2 + 10
from Inserted

GO
ALTER TABLE [dbo].[Produto] ENABLE TRIGGER [tr_InsereEstoque]
GO
/****** Object:  Trigger [dbo].[tr_protegeproduto]    Script Date: 26/09/2017 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_protegeproduto] on [dbo].[Produto]
for delete, update

as

	if exists (select 1 from deleted where idproduto <= 10 )
	begin
		print 'Tentativa de acesso aos registros bloqueados'
		rollback
	end

GO
ALTER TABLE [dbo].[Produto] ENABLE TRIGGER [tr_protegeproduto]
GO
/****** Object:  Trigger [dbo].[tr_ProtegeDBA]    Script Date: 26/09/2017 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_ProtegeDBA] on [dbo].[Usuario]
for UPDATE, DELETE 
as
if exists (select 1 from deleted
			where idUsuario = 1)
begin
	rollback
	raiserror('Tentativa de acesso aos registros bloqueados', 10 , 1)	
end

GO
ALTER TABLE [dbo].[Usuario] ENABLE TRIGGER [tr_ProtegeDBA]
GO
/****** Object:  Trigger [dbo].[tr_protegeusuario]    Script Date: 26/09/2017 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tr_protegeusuario] on [dbo].[Usuario]
for delete, update

as

	if exists (select 1 from deleted where idusuario = 1 )
	begin
		print 'Tentativa de acesso aos registros bloqueados'
		rollback
	end

GO
ALTER TABLE [dbo].[Usuario] ENABLE TRIGGER [tr_protegeusuario]
GO
USE [master]
GO
ALTER DATABASE [Gandalf] SET  READ_WRITE 
GO
