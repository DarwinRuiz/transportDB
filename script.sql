CREATE DATABASE transport;
GO

USE transport;
GO

CREATE SCHEMA Negocio;
GO

CREATE TABLE Negocio.departamentos(
    departamento_id INT IDENTITY NOT NULL,
    departamento_nombre VARCHAR(255) NOT NULL,
    departamento_numero VARCHAR(255) NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.departamentos
ADD CONSTRAINT PK_departamentos PRIMARY KEY (departamento_id);
GO

CREATE TABLE Negocio.plantas(
    planta_id INT IDENTITY NOT NULL,
    planta_nombre VARCHAR(255),
    planta_procesamiento VARCHAR(255),
    planta_departamento_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.plantas
ADD CONSTRAINT PK_plantas PRIMARY KEY (planta_id);
GO

ALTER TABLE Negocio.plantas
ADD CONSTRAINT FK_plantas_departamentos FOREIGN KEY (planta_departamento_id) REFERENCES Negocio.departamentos(departamento_id);
GO

CREATE TABLE Negocio.bodegas(
    bodega_id INT IDENTITY NOT NULL,
    bodega_direccion VARCHAR(255) NOT NULL,
    bodega_contacto VARCHAR(255) NOT NULL,
    bodega_encargado VARCHAR(255) NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.bodegas
ADD CONSTRAINT PK_bodegas PRIMARY KEY (bodega_id);
GO

CREATE TABLE Negocio.tipos_vehiculos(
    tiposVehi_id INT IDENTITY NOT NULL,
    tiposVehi_nombre VARCHAR(255) NOT NULL,
    tiposVehi_capacidad VARCHAR(255) NOT NULL,
    tiposVehi_medida VARCHAR(45) NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.tipos_vehiculos
ADD CONSTRAINT PK_tipos_vehiculos PRIMARY KEY (tiposVehi_id);
GO

CREATE TABLE Negocio.vehiculos(
    vehiculo_id INT IDENTITY NOT NULL,
    vehiculo_placa VARCHAR(45) NOT NULL,
    vehiculo_modelo VARCHAR(45) NOT NULL,
    vehiculo_linea VARCHAR(45) NOT NULL,
    vehiculo_disponible BIT NOT NULL,
    vehiculo_tiposVehi_id INT NOT NULL,
    vehiculo_planta_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.vehiculos
ADD CONSTRAINT PK_vehiculos PRIMARY KEY (vehiculo_id);
GO

ALTER TABLE Negocio.vehiculos
ADD CONSTRAINT FK_vehiculos_tipos_vehiculos FOREIGN KEY (vehiculo_tiposVehi_id) REFERENCES Negocio.tipos_vehiculos(tiposVehi_id);
GO

ALTER TABLE Negocio.vehiculos
ADD CONSTRAINT FK_vehiculos_planta FOREIGN KEY (vehiculo_planta_id) REFERENCES Negocio.plantas(planta_id);
GO

CREATE TABLE Negocio.categorias_productos(
    categoriaProd_id INT IDENTITY NOT NULL,
    categoriaProd_nombre VARCHAR(255) NOT NULL,
    categoriaProd_bodega_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.categorias_productos
ADD CONSTRAINT PK_categorias_productos PRIMARY KEY (categoriaProd_id);
GO

ALTER TABLE Negocio.categorias_productos
ADD CONSTRAINT FK_categorias_productos_bodega FOREIGN KEY (categoriaProd_bodega_id) REFERENCES Negocio.bodegas(bodega_id);
GO

CREATE TABLE Negocio.productos(
    producto_id INT IDENTITY NOT NULL,
    producto_nombre VARCHAR(255) NOT NULL,
    producto_descripcion VARCHAR(255) NOT NULL,
    producto_cantidad INT NOT NULL,
    producto_precio FLOAT NOT NULL,
    producto_categoriaProd_id INT NOT NULL,
    producto_planta_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.productos
ADD CONSTRAINT PK_productos PRIMARY KEY (producto_id);
GO

ALTER TABLE Negocio.productos
ADD CONSTRAINT FK_productos_categorias_productos FOREIGN KEY (producto_categoriaProd_id) REFERENCES Negocio.categorias_productos(categoriaProd_id);
GO

ALTER TABLE Negocio.productos
ADD CONSTRAINT FK_productos_plantas FOREIGN KEY (producto_planta_id) REFERENCES Negocio.plantas(planta_id);
GO

CREATE TABLE Negocio.solicitudes_transportes(
    solicitudTransp_id INT IDENTITY NOT NULL,
    solicitudTransp_destino VARCHAR(255) NOT NULL,
    solicitudTransp_peso VARCHAR(45) NOT NULL,
    solicitudTransp_emisor VARCHAR(255) NOT NULL,
    solicitudTransp_receptor VARCHAR(255) NOT NULL,
    solicitudTransp_cantidad_productos INT NOT NULL,
    solicitudTransp_producto_id INT NOT NULL,
    solicitudTransp_bodega_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.solicitudes_transportes
ADD CONSTRAINT PK_solicitudes_transporte PRIMARY KEY (solicitudTransp_id);
GO

ALTER TABLE Negocio.solicitudes_transportes
ADD CONSTRAINT FK_solicitudes_transportes_productos FOREIGN KEY (solicitudTransp_producto_id) REFERENCES Negocio.productos(producto_id);
GO

ALTER TABLE Negocio.solicitudes_transportes
ADD CONSTRAINT FK_solicitudes_transportes_bodegas FOREIGN KEY (solicitudTransp_bodega_id) REFERENCES Negocio.bodegas(bodega_id);
GO

CREATE TABLE Negocio.clientes(
    cliente_id INT IDENTITY NOT NULL,
    cliente_nombre VARCHAR(255) NOT NULL,
    cliente_pais VARCHAR(255) NOT NULL,
    cliente_representante_legal VARCHAR(255) NOT NULL,
    cliente_telefono VARCHAR(45) NOT NULL,
    cliente_nit VARCHAR(45) NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.clientes
ADD CONSTRAINT PK_clientes PRIMARY KEY (cliente_id);
GO


CREATE TABLE Negocio.servicios(
    servicio_id INT IDENTITY NOT NULL,
    servicio_tipo VARCHAR(45) NOT NULL,
    servicio_fecha_entrega DATE NOT NULL,
    servicio_precio FLOAT NOT NULL,
    servicio_planta_id INT NOT NULL,
    servicio_producto_id INT NOT NULL,
    servicio_cliente_id INT NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Negocio.servicios
ADD CONSTRAINT PK_servicios PRIMARY KEY (servicio_id);
GO

ALTER TABLE Negocio.servicios
ADD CONSTRAINT FK_servicios_plantas FOREIGN KEY (servicio_planta_id) REFERENCES Negocio.plantas(planta_id);
GO

ALTER TABLE Negocio.servicios
ADD CONSTRAINT FK_servicios_productos FOREIGN KEY (servicio_producto_id) REFERENCES Negocio.productos(producto_id);
GO

ALTER TABLE Negocio.servicios
ADD CONSTRAINT FK_servicios_clientes FOREIGN KEY (servicio_cliente_id) REFERENCES Negocio.clientes(cliente_id);
GO


CREATE SCHEMA Administracion;
GO

CREATE TABLE Administracion.usuarios(
    usuario_id INT IDENTITY NOT NULL,
    usuario_nombre_usuario VARCHAR(255) NOT NULL,
    usuario_contrasenia VARCHAR(255) NOT NULL,
    usuario_correo VARCHAR(255) NOT NULL,
    createdAt DATE,
    updatedAt DATE
);
GO

ALTER TABLE Administracion.usuarios
ADD CONSTRAINT PK_usuarios PRIMARY KEY (usuario_id);
GO