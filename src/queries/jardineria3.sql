CREATE TABLE [Cliente] (
  [id_cliente] INT PRIMARY KEY IDENTITY(1, 1),
  [nombre_cliente] VARCHAR(50) NOT NULL,
  [nombre_contacto] VARCHAR(30),
  [apellido_contacto] VARCHAR(30),
  [telefono] VARCHAR(15) NOT NULL,
  [fax] VARCHAR(15),
  [direccion1] VARCHAR(50) NOT NULL,
  [direccion2] VARCHAR(50),
  [ciudad] VARCHAR(50) NOT NULL,
  [region] VARCHAR(50),
  [pais] VARCHAR(50) NOT NULL,
  [codigo_postal] VARCHAR(10),
  [limite_credito] NUMERIC(15,2)
)
GO

CREATE TABLE [Producto] (
  [id_producto] INT PRIMARY KEY IDENTITY(1, 1),
  [codigo_producto] VARCHAR(15) NOT NULL,
  [nombre] VARCHAR(70) NOT NULL,
  [categoria] INT NOT NULL,
  [dimensiones] VARCHAR(25),
  [proveedor] VARCHAR(50),
  [descripcion] TEXT,
  [cantidad_en_stock] SMALLINT NOT NULL,
  [precio_venta] NUMERIC(15,2) NOT NULL,
  [precio_proveedor] NUMERIC(15,2)
)
GO

CREATE TABLE [Tiempo] (
  [id_tiempo] INT PRIMARY KEY IDENTITY(1, 1),
  [fecha] DATE NOT NULL,
  [dia] INT NOT NULL,
  [mes] INT NOT NULL,
  [anio] INT NOT NULL,
  [trimestre] INT NOT NULL,
  [semana] INT NOT NULL,
  [semestre] INT NOT NULL
)
GO

CREATE TABLE [Pedido] (
  [id_pedido] INT PRIMARY KEY IDENTITY(1, 1),
  [fecha_pedido] DATE NOT NULL,
  [fecha_esperada] DATE NOT NULL,
  [fecha_entrega] DATE,
  [estado] VARCHAR(15) NOT NULL,
  [comentarios] TEXT,
  [id_cliente] INT NOT NULL
)
GO

CREATE TABLE [HechosVentas] (
  [id_venta] INT PRIMARY KEY IDENTITY(1, 1),
  [id_pedido] INT NOT NULL,
  [id_cliente] INT NOT NULL,
  [id_producto] INT NOT NULL,
  [id_tiempo] INT NOT NULL,
  [id_empleado] INT NOT NULL,
  [id_oficina] INT NOT NULL,
  [id_categoria] INT NOT NULL,
  [cantidad_vendida] INT NOT NULL,
  [precio_unidad] NUMERIC(15,2) NOT NULL,
  [forma_pago] VARCHAR(40) NOT NULL,
  [total] NUMERIC(15,2) NOT NULL,
  [estado] VARCHAR(15) NOT NULL
)
GO

ALTER TABLE [Pedido] ADD FOREIGN KEY ([id_cliente]) REFERENCES [Cliente] ([id_cliente])
GO

ALTER TABLE [HechosVentas] ADD FOREIGN KEY ([id_pedido]) REFERENCES [Pedido] ([id_pedido])
GO

ALTER TABLE [HechosVentas] ADD FOREIGN KEY ([id_cliente]) REFERENCES [Cliente] ([id_cliente])
GO

ALTER TABLE [HechosVentas] ADD FOREIGN KEY ([id_producto]) REFERENCES [Producto] ([id_producto])
GO

ALTER TABLE [HechosVentas] ADD FOREIGN KEY ([id_tiempo]) REFERENCES [Tiempo] ([id_tiempo])
GO
