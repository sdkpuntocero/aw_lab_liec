
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/06/2018 23:04:34
-- Generated from EDMX file: C:\Users\Axel\Source\Repos\sdkpuntocero\aw_lab_liec\aw_lab_liec\md_liec.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [lab_liec];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_contacto_usuarios_general_usuarios]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_cont_usr] DROP CONSTRAINT [FK_contacto_usuarios_general_usuarios];
GO
IF OBJECT_ID(N'[dbo].[FK_fact_areas_fact_estatus_areas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[fact_areas] DROP CONSTRAINT [FK_fact_areas_fact_estatus_areas];
GO
IF OBJECT_ID(N'[dbo].[FK_fact_areas_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[fact_areas] DROP CONSTRAINT [FK_fact_areas_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_general_usuarios_fact_departamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_usuarios] DROP CONSTRAINT [FK_general_usuarios_fact_departamento];
GO
IF OBJECT_ID(N'[dbo].[FK_general_usuarios_fact_estatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_usuarios] DROP CONSTRAINT [FK_general_usuarios_fact_estatus];
GO
IF OBJECT_ID(N'[dbo].[FK_general_usuarios_fact_generos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_usuarios] DROP CONSTRAINT [FK_general_usuarios_fact_generos];
GO
IF OBJECT_ID(N'[dbo].[FK_general_usuarios_fact_perfil]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_usuarios] DROP CONSTRAINT [FK_general_usuarios_fact_perfil];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_caja_fact_est_caja]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_caja] DROP CONSTRAINT [FK_inf_caja_fact_est_caja];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_caja_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_caja] DROP CONSTRAINT [FK_inf_caja_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_fact_estatus_clte]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte] DROP CONSTRAINT [FK_inf_clte_fact_estatus_clte];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_fact_tipo_rfc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte] DROP CONSTRAINT [FK_inf_clte_fact_tipo_rfc];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte] DROP CONSTRAINT [FK_inf_clte_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_obras_fact_estatus_obra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte_obras] DROP CONSTRAINT [FK_inf_clte_obras_fact_estatus_obra];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_obras_fact_tipo_servicio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte_obras] DROP CONSTRAINT [FK_inf_clte_obras_fact_tipo_servicio];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_clte_obras_inf_clte]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_clte_obras] DROP CONSTRAINT [FK_inf_clte_obras_inf_clte];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_conc_ec_inf_mrp_concreto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_conc_ec] DROP CONSTRAINT [FK_inf_conc_ec_inf_mrp_concreto];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_control_montos_inf_rubro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_control_montos] DROP CONSTRAINT [FK_inf_control_montos_inf_rubro];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_email_envio_fact_est_e_env]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_email_envio] DROP CONSTRAINT [FK_inf_email_envio_fact_est_e_env];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_email_envio_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_email_envio] DROP CONSTRAINT [FK_inf_email_envio_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_email_recepcion_fact_est_e_recep]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_email_recepcion] DROP CONSTRAINT [FK_inf_email_recepcion_fact_est_e_recep];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_email_recepcion_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_email_recepcion] DROP CONSTRAINT [FK_inf_email_recepcion_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_gastos_dep_inf_gastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_gastos_dep] DROP CONSTRAINT [FK_inf_gastos_dep_inf_gastos];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_gastos_fact_est_gast]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_gastos] DROP CONSTRAINT [FK_inf_gastos_fact_est_gast];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_gastos_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_gastos] DROP CONSTRAINT [FK_inf_gastos_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_mrp_concreto_fac_situacion_concreto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_mrp_concreto] DROP CONSTRAINT [FK_inf_mrp_concreto_fac_situacion_concreto];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_mrp_concreto_fac_tipo_concreto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_mrp_concreto] DROP CONSTRAINT [FK_inf_mrp_concreto_fac_tipo_concreto];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_mrp_concreto_fact_especimen]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_mrp_concreto] DROP CONSTRAINT [FK_inf_mrp_concreto_fact_especimen];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_mrp_concreto_fact_est_concreto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_mrp_concreto] DROP CONSTRAINT [FK_inf_mrp_concreto_fact_est_concreto];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_mrp_concreto_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_mrp_concreto] DROP CONSTRAINT [FK_inf_mrp_concreto_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_rubro_fact_est_rub]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_rubro] DROP CONSTRAINT [FK_inf_rubro_fact_est_rub];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_rubro_fact_tipo_rubro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_rubro] DROP CONSTRAINT [FK_inf_rubro_fact_tipo_rubro];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_rubro_inf_emp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_rubro] DROP CONSTRAINT [FK_inf_rubro_inf_emp];
GO
IF OBJECT_ID(N'[dbo].[FK_inf_usuarios_fact_areas]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inf_usuarios] DROP CONSTRAINT [FK_inf_usuarios_fact_areas];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fac_sit_concreto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fac_sit_concreto];
GO
IF OBJECT_ID(N'[dbo].[fac_tipo_concreto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fac_tipo_concreto];
GO
IF OBJECT_ID(N'[dbo].[fact_areas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_areas];
GO
IF OBJECT_ID(N'[dbo].[fact_departamento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_departamento];
GO
IF OBJECT_ID(N'[dbo].[fact_especimen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_especimen];
GO
IF OBJECT_ID(N'[dbo].[fact_est_areas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_areas];
GO
IF OBJECT_ID(N'[dbo].[fact_est_caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_caja];
GO
IF OBJECT_ID(N'[dbo].[fact_est_clte]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_clte];
GO
IF OBJECT_ID(N'[dbo].[fact_est_concreto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_concreto];
GO
IF OBJECT_ID(N'[dbo].[fact_est_e_env]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_e_env];
GO
IF OBJECT_ID(N'[dbo].[fact_est_e_recep]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_e_recep];
GO
IF OBJECT_ID(N'[dbo].[fact_est_gast]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_gast];
GO
IF OBJECT_ID(N'[dbo].[fact_est_obra]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_obra];
GO
IF OBJECT_ID(N'[dbo].[fact_est_rub]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_est_rub];
GO
IF OBJECT_ID(N'[dbo].[fact_estatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_estatus];
GO
IF OBJECT_ID(N'[dbo].[fact_generos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_generos];
GO
IF OBJECT_ID(N'[dbo].[fact_perfil]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_perfil];
GO
IF OBJECT_ID(N'[dbo].[fact_tipo_rfc]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_tipo_rfc];
GO
IF OBJECT_ID(N'[dbo].[fact_tipo_rubro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_tipo_rubro];
GO
IF OBJECT_ID(N'[dbo].[fact_tipo_servicio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[fact_tipo_servicio];
GO
IF OBJECT_ID(N'[dbo].[inf_caja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_caja];
GO
IF OBJECT_ID(N'[dbo].[inf_clte]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_clte];
GO
IF OBJECT_ID(N'[dbo].[inf_clte_obras]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_clte_obras];
GO
IF OBJECT_ID(N'[dbo].[inf_conc_ec]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_conc_ec];
GO
IF OBJECT_ID(N'[dbo].[inf_cont_usr]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_cont_usr];
GO
IF OBJECT_ID(N'[dbo].[inf_control_montos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_control_montos];
GO
IF OBJECT_ID(N'[dbo].[inf_email_envio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_email_envio];
GO
IF OBJECT_ID(N'[dbo].[inf_email_recepcion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_email_recepcion];
GO
IF OBJECT_ID(N'[dbo].[inf_emp]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_emp];
GO
IF OBJECT_ID(N'[dbo].[inf_gastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_gastos];
GO
IF OBJECT_ID(N'[dbo].[inf_gastos_dep]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_gastos_dep];
GO
IF OBJECT_ID(N'[dbo].[inf_mrp_concreto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_mrp_concreto];
GO
IF OBJECT_ID(N'[dbo].[inf_rubro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_rubro];
GO
IF OBJECT_ID(N'[dbo].[inf_sepomex]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_sepomex];
GO
IF OBJECT_ID(N'[dbo].[inf_usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inf_usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'fac_sit_concreto'
CREATE TABLE [dbo].[fac_sit_concreto] (
    [id_sit_concreto] int IDENTITY(1,1) NOT NULL,
    [desc_sit_concreto] varchar(50)  NULL
);
GO

-- Creating table 'fac_tipo_concreto'
CREATE TABLE [dbo].[fac_tipo_concreto] (
    [id_tipo_concreto] int IDENTITY(1,1) NOT NULL,
    [desc_tipo_concreto] varchar(50)  NULL
);
GO

-- Creating table 'fact_areas'
CREATE TABLE [dbo].[fact_areas] (
    [id_area] uniqueidentifier  NOT NULL,
    [cod_area] varchar(50)  NOT NULL,
    [id_est_areas] int  NULL,
    [desc_areas] varchar(50)  NULL,
    [id_emp] uniqueidentifier  NOT NULL,
    [fecha_registro] datetime  NULL
);
GO

-- Creating table 'fact_departamento'
CREATE TABLE [dbo].[fact_departamento] (
    [id_departamento] int IDENTITY(1,1) NOT NULL,
    [desc_departamento] varchar(50)  NULL
);
GO

-- Creating table 'fact_especimen'
CREATE TABLE [dbo].[fact_especimen] (
    [id_tipo_especimen] int IDENTITY(1,1) NOT NULL,
    [desc_tipo_especimen] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_areas'
CREATE TABLE [dbo].[fact_est_areas] (
    [id_est_area] int  NOT NULL,
    [desc_est_area] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_caja'
CREATE TABLE [dbo].[fact_est_caja] (
    [id_est_caja] int  NOT NULL,
    [desc_est_caja] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_clte'
CREATE TABLE [dbo].[fact_est_clte] (
    [id_est_clte] int  NOT NULL,
    [desc_est_clte] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_concreto'
CREATE TABLE [dbo].[fact_est_concreto] (
    [id_est_concreto] int IDENTITY(1,1) NOT NULL,
    [desc_est_concreto] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_e_env'
CREATE TABLE [dbo].[fact_est_e_env] (
    [id_est_e_env] int  NOT NULL,
    [descid_est_e_env] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_e_recep'
CREATE TABLE [dbo].[fact_est_e_recep] (
    [id_est_e_recep] int  NOT NULL,
    [desc_est_e_recep] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_gast'
CREATE TABLE [dbo].[fact_est_gast] (
    [id_est_gast] int  NOT NULL,
    [desc_est_gast] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_obra'
CREATE TABLE [dbo].[fact_est_obra] (
    [id_est_obra] int  NOT NULL,
    [desc_est_obra] varchar(50)  NULL
);
GO

-- Creating table 'fact_est_rub'
CREATE TABLE [dbo].[fact_est_rub] (
    [id_est_rub] int  NOT NULL,
    [desc_est_rub] varchar(50)  NULL
);
GO

-- Creating table 'fact_estatus'
CREATE TABLE [dbo].[fact_estatus] (
    [id_est_usr] int IDENTITY(1,1) NOT NULL,
    [desc_est_usr] varchar(50)  NULL
);
GO

-- Creating table 'fact_generos'
CREATE TABLE [dbo].[fact_generos] (
    [id_genero] int IDENTITY(1,1) NOT NULL,
    [desc_genero] varchar(50)  NULL
);
GO

-- Creating table 'fact_perfil'
CREATE TABLE [dbo].[fact_perfil] (
    [id_perfil] int IDENTITY(1,1) NOT NULL,
    [desc_perfil] varchar(50)  NULL
);
GO

-- Creating table 'fact_tipo_rfc'
CREATE TABLE [dbo].[fact_tipo_rfc] (
    [id_tipo_rfc] int  NOT NULL,
    [desc_tipo_rfc] varchar(15)  NULL
);
GO

-- Creating table 'fact_tipo_rubro'
CREATE TABLE [dbo].[fact_tipo_rubro] (
    [id_tipo_rubro] int  NOT NULL,
    [tipo_rubro] varchar(50)  NULL,
    [desc_tipo_rubro] varchar(50)  NULL
);
GO

-- Creating table 'fact_tipo_servicio'
CREATE TABLE [dbo].[fact_tipo_servicio] (
    [id_tipo_servicio] int  NOT NULL,
    [desc_tipo_servicio] varchar(50)  NULL
);
GO

-- Creating table 'inf_caja'
CREATE TABLE [dbo].[inf_caja] (
    [id_caja] uniqueidentifier  NOT NULL,
    [id_est_caja] int  NULL,
    [id_estatus_rpt] int  NULL,
    [id_tipo_rubro] int  NULL,
    [id_rubro] uniqueidentifier  NOT NULL,
    [monto] decimal(19,4)  NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NULL,
    [desc_caja] varchar(150)  NULL,
    [codigo_caja] varchar(20)  NULL
);
GO

-- Creating table 'inf_clte'
CREATE TABLE [dbo].[inf_clte] (
    [id_clte] uniqueidentifier  NOT NULL,
    [id_est_clte] int  NULL,
    [cod_clte] varchar(20)  NULL,
    [id_tipo_rfc] int  NULL,
    [rfc] varchar(50)  NULL,
    [razon_social] varchar(50)  NULL,
    [telefono] varchar(20)  NULL,
    [email] varchar(50)  NULL,
    [callenum] varchar(300)  NULL,
    [d_codigo] varchar(6)  NULL,
    [id_asenta_cpcons] int  NULL,
    [fecha_registro] datetime  NULL,
    [comentarios] varchar(max)  NULL,
    [id_emp] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_clte_obras'
CREATE TABLE [dbo].[inf_clte_obras] (
    [id_clte_obras] int IDENTITY(1,1) NOT NULL,
    [id_est_obra] int  NULL,
    [clave_obra] varchar(50)  NULL,
    [desc_obra] varchar(max)  NULL,
    [coordinador] varchar(150)  NULL,
    [contacto_obra] varchar(150)  NULL,
    [id_tipo_servicio] int  NOT NULL,
    [comentarios] varchar(max)  NULL,
    [fecha_registro] datetime  NULL,
    [id_clte] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_conc_ec'
CREATE TABLE [dbo].[inf_conc_ec] (
    [id_conc_ec] uniqueidentifier  NOT NULL,
    [clave_ensa_a] int  NULL,
    [calve_ensa_b] varchar(50)  NULL,
    [masa_a] decimal(18,4)  NULL,
    [masa_b] decimal(18,4)  NULL,
    [altura_a] decimal(18,4)  NULL,
    [altura_b] decimal(18,4)  NULL,
    [lados_a] decimal(18,4)  NULL,
    [lados_b] decimal(18,4)  NULL,
    [directo_a] int  NULL,
    [directo_b] int  NULL,
    [intensidad_a] varchar(50)  NULL,
    [intensidad_b] varchar(50)  NULL,
    [area_a] decimal(18,4)  NULL,
    [area_b] decimal(18,4)  NULL,
    [presion_a] decimal(18,4)  NULL,
    [presion_b] decimal(18,4)  NULL,
    [esfuerzo_a] decimal(18,4)  NULL,
    [esfuerzo_b] decimal(18,4)  NULL,
    [eprom_a] decimal(18,4)  NULL,
    [e_prom_b] decimal(18,4)  NULL,
    [masa_vol_a] decimal(18,4)  NULL,
    [masa_vol_b] decimal(18,4)  NULL,
    [masa_volprom_a] decimal(18,4)  NULL,
    [masa_volprom_b] decimal(18,4)  NULL,
    [tipofalla_a] varchar(50)  NULL,
    [tipofalla_b] varchar(50)  NULL,
    [dif_ab] varchar(50)  NULL,
    [fecha_registro] datetime  NULL,
    [id_mrp_concreto] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_cont_usr'
CREATE TABLE [dbo].[inf_cont_usr] (
    [id_dir_usuario] int IDENTITY(1,1) NOT NULL,
    [callenum] varchar(300)  NULL,
    [d_codigo] varchar(6)  NULL,
    [id_asenta_cpcons] int  NULL,
    [telefono] varchar(15)  NULL,
    [movil] varchar(15)  NULL,
    [email] varchar(50)  NULL,
    [id_usuario] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_control_montos'
CREATE TABLE [dbo].[inf_control_montos] (
    [id_control_monto] uniqueidentifier  NOT NULL,
    [monto] float  NULL,
    [fecha_registro] datetime  NULL,
    [id_rubro] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_email_envio'
CREATE TABLE [dbo].[inf_email_envio] (
    [id_email_env] uniqueidentifier  NOT NULL,
    [id_est_e_env] int  NULL,
    [email] varchar(50)  NULL,
    [usuario] varchar(50)  NULL,
    [clave] varchar(50)  NULL,
    [asunto] varchar(50)  NULL,
    [servidor_smtp] varchar(50)  NULL,
    [puerto] int  NULL,
    [id_emp] uniqueidentifier  NOT NULL,
    [fecha_registro] datetime  NULL
);
GO

-- Creating table 'inf_email_recepcion'
CREATE TABLE [dbo].[inf_email_recepcion] (
    [id_email_recep] uniqueidentifier  NOT NULL,
    [id_est_e_recep] int  NULL,
    [email_recepcion] varchar(50)  NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_emp'
CREATE TABLE [dbo].[inf_emp] (
    [id_emp] uniqueidentifier  NOT NULL,
    [id_estatus] int  NULL,
    [razon_social] varchar(50)  NULL,
    [telefono] varchar(50)  NULL,
    [email] varchar(50)  NULL,
    [callenum] varchar(300)  NULL,
    [d_codigo] varchar(6)  NULL,
    [id_asenta_cpcons] int  NULL,
    [id_codigo] int  NULL,
    [fecha_registro] datetime  NULL
);
GO

-- Creating table 'inf_gastos'
CREATE TABLE [dbo].[inf_gastos] (
    [id_gasto] uniqueidentifier  NOT NULL,
    [id_est_gast] int  NULL,
    [id_est_rpt] int  NULL,
    [id_tipo_rubro] int  NULL,
    [id_rubro] uniqueidentifier  NULL,
    [monto] decimal(19,4)  NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NULL,
    [desc_gasto] varchar(255)  NULL,
    [codigo_gasto] varchar(255)  NULL
);
GO

-- Creating table 'inf_gastos_dep'
CREATE TABLE [dbo].[inf_gastos_dep] (
    [id_gastos_dep] int IDENTITY(1,1) NOT NULL,
    [id_tipo_rubro] int  NOT NULL,
    [id_rubro] uniqueidentifier  NOT NULL,
    [id_estatus_montos] int  NULL,
    [id_gasto] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'inf_mrp_concreto'
CREATE TABLE [dbo].[inf_mrp_concreto] (
    [id_mrp_concreto] uniqueidentifier  NOT NULL,
    [id_est_concreto] int  NOT NULL,
    [no_muesra] varchar(50)  NULL,
    [fecha_colado] datetime  NULL,
    [fecha_recibe] datetime  NULL,
    [entrega] varchar(50)  NULL,
    [recibe] varchar(50)  NULL,
    [presion] int  NULL,
    [id_tipo_especimen] int  NOT NULL,
    [id_tipo_concreto] int  NOT NULL,
    [id_sit_concreto] int  NOT NULL,
    [C24_horas] datetime  NULL,
    [C3_dias] datetime  NULL,
    [C7_dias] datetime  NULL,
    [C14_dias] datetime  NULL,
    [C28_dias] datetime  NULL,
    [otra] int  NULL,
    [id_usuario] uniqueidentifier  NOT NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NOT NULL,
    [id_clte_obras] int  NULL
);
GO

-- Creating table 'inf_rubro'
CREATE TABLE [dbo].[inf_rubro] (
    [id_rubro] uniqueidentifier  NOT NULL,
    [codigo_rubro] varchar(20)  NULL,
    [id_est_rub] int  NULL,
    [id_tipo_rubro] int  NULL,
    [etiqueta_rubro] varchar(10)  NULL,
    [rubro] varchar(150)  NULL,
    [presupuesto] float  NULL,
    [minimo] int  NULL,
    [maximo] int  NULL,
    [presupuesto_extra] float  NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NULL
);
GO

-- Creating table 'inf_sepomex'
CREATE TABLE [dbo].[inf_sepomex] (
    [d_codigo] varchar(50)  NOT NULL,
    [d_asenta] varchar(150)  NULL,
    [d_tipo_asenta] varchar(50)  NULL,
    [d_mnpio] varchar(50)  NULL,
    [d_estado] varchar(50)  NULL,
    [d_ciudad] varchar(50)  NULL,
    [d_cp] varchar(50)  NULL,
    [c_estado] varchar(50)  NULL,
    [c_oficina] varchar(50)  NULL,
    [c_cp] varchar(50)  NULL,
    [c_tipo_asenta] varchar(50)  NULL,
    [c_mnpio] varchar(50)  NULL,
    [id_asenta_cpcons] int  NOT NULL,
    [d_zona] varchar(50)  NULL,
    [c_cve_ciudad] varchar(50)  NULL
);
GO

-- Creating table 'inf_usuarios'
CREATE TABLE [dbo].[inf_usuarios] (
    [id_usuario] uniqueidentifier  NOT NULL,
    [id_est_usr] int  NULL,
    [id_genero] int  NULL,
    [id_area] uniqueidentifier  NOT NULL,
    [id_departamento] int  NULL,
    [id_perfil] int  NULL,
    [email] varchar(30)  NULL,
    [cod_usr] varchar(50)  NULL,
    [usr] varchar(50)  NULL,
    [clave] varchar(50)  NULL,
    [nombres] varchar(50)  NULL,
    [a_paterno] varchar(50)  NULL,
    [a_materno] varchar(50)  NULL,
    [fecha_nacimiento] datetime  NULL,
    [fecha_registro] datetime  NULL,
    [id_emp] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id_sit_concreto] in table 'fac_sit_concreto'
ALTER TABLE [dbo].[fac_sit_concreto]
ADD CONSTRAINT [PK_fac_sit_concreto]
    PRIMARY KEY CLUSTERED ([id_sit_concreto] ASC);
GO

-- Creating primary key on [id_tipo_concreto] in table 'fac_tipo_concreto'
ALTER TABLE [dbo].[fac_tipo_concreto]
ADD CONSTRAINT [PK_fac_tipo_concreto]
    PRIMARY KEY CLUSTERED ([id_tipo_concreto] ASC);
GO

-- Creating primary key on [id_area] in table 'fact_areas'
ALTER TABLE [dbo].[fact_areas]
ADD CONSTRAINT [PK_fact_areas]
    PRIMARY KEY CLUSTERED ([id_area] ASC);
GO

-- Creating primary key on [id_departamento] in table 'fact_departamento'
ALTER TABLE [dbo].[fact_departamento]
ADD CONSTRAINT [PK_fact_departamento]
    PRIMARY KEY CLUSTERED ([id_departamento] ASC);
GO

-- Creating primary key on [id_tipo_especimen] in table 'fact_especimen'
ALTER TABLE [dbo].[fact_especimen]
ADD CONSTRAINT [PK_fact_especimen]
    PRIMARY KEY CLUSTERED ([id_tipo_especimen] ASC);
GO

-- Creating primary key on [id_est_area] in table 'fact_est_areas'
ALTER TABLE [dbo].[fact_est_areas]
ADD CONSTRAINT [PK_fact_est_areas]
    PRIMARY KEY CLUSTERED ([id_est_area] ASC);
GO

-- Creating primary key on [id_est_caja] in table 'fact_est_caja'
ALTER TABLE [dbo].[fact_est_caja]
ADD CONSTRAINT [PK_fact_est_caja]
    PRIMARY KEY CLUSTERED ([id_est_caja] ASC);
GO

-- Creating primary key on [id_est_clte] in table 'fact_est_clte'
ALTER TABLE [dbo].[fact_est_clte]
ADD CONSTRAINT [PK_fact_est_clte]
    PRIMARY KEY CLUSTERED ([id_est_clte] ASC);
GO

-- Creating primary key on [id_est_concreto] in table 'fact_est_concreto'
ALTER TABLE [dbo].[fact_est_concreto]
ADD CONSTRAINT [PK_fact_est_concreto]
    PRIMARY KEY CLUSTERED ([id_est_concreto] ASC);
GO

-- Creating primary key on [id_est_e_env] in table 'fact_est_e_env'
ALTER TABLE [dbo].[fact_est_e_env]
ADD CONSTRAINT [PK_fact_est_e_env]
    PRIMARY KEY CLUSTERED ([id_est_e_env] ASC);
GO

-- Creating primary key on [id_est_e_recep] in table 'fact_est_e_recep'
ALTER TABLE [dbo].[fact_est_e_recep]
ADD CONSTRAINT [PK_fact_est_e_recep]
    PRIMARY KEY CLUSTERED ([id_est_e_recep] ASC);
GO

-- Creating primary key on [id_est_gast] in table 'fact_est_gast'
ALTER TABLE [dbo].[fact_est_gast]
ADD CONSTRAINT [PK_fact_est_gast]
    PRIMARY KEY CLUSTERED ([id_est_gast] ASC);
GO

-- Creating primary key on [id_est_obra] in table 'fact_est_obra'
ALTER TABLE [dbo].[fact_est_obra]
ADD CONSTRAINT [PK_fact_est_obra]
    PRIMARY KEY CLUSTERED ([id_est_obra] ASC);
GO

-- Creating primary key on [id_est_rub] in table 'fact_est_rub'
ALTER TABLE [dbo].[fact_est_rub]
ADD CONSTRAINT [PK_fact_est_rub]
    PRIMARY KEY CLUSTERED ([id_est_rub] ASC);
GO

-- Creating primary key on [id_est_usr] in table 'fact_estatus'
ALTER TABLE [dbo].[fact_estatus]
ADD CONSTRAINT [PK_fact_estatus]
    PRIMARY KEY CLUSTERED ([id_est_usr] ASC);
GO

-- Creating primary key on [id_genero] in table 'fact_generos'
ALTER TABLE [dbo].[fact_generos]
ADD CONSTRAINT [PK_fact_generos]
    PRIMARY KEY CLUSTERED ([id_genero] ASC);
GO

-- Creating primary key on [id_perfil] in table 'fact_perfil'
ALTER TABLE [dbo].[fact_perfil]
ADD CONSTRAINT [PK_fact_perfil]
    PRIMARY KEY CLUSTERED ([id_perfil] ASC);
GO

-- Creating primary key on [id_tipo_rfc] in table 'fact_tipo_rfc'
ALTER TABLE [dbo].[fact_tipo_rfc]
ADD CONSTRAINT [PK_fact_tipo_rfc]
    PRIMARY KEY CLUSTERED ([id_tipo_rfc] ASC);
GO

-- Creating primary key on [id_tipo_rubro] in table 'fact_tipo_rubro'
ALTER TABLE [dbo].[fact_tipo_rubro]
ADD CONSTRAINT [PK_fact_tipo_rubro]
    PRIMARY KEY CLUSTERED ([id_tipo_rubro] ASC);
GO

-- Creating primary key on [id_tipo_servicio] in table 'fact_tipo_servicio'
ALTER TABLE [dbo].[fact_tipo_servicio]
ADD CONSTRAINT [PK_fact_tipo_servicio]
    PRIMARY KEY CLUSTERED ([id_tipo_servicio] ASC);
GO

-- Creating primary key on [id_caja] in table 'inf_caja'
ALTER TABLE [dbo].[inf_caja]
ADD CONSTRAINT [PK_inf_caja]
    PRIMARY KEY CLUSTERED ([id_caja] ASC);
GO

-- Creating primary key on [id_clte] in table 'inf_clte'
ALTER TABLE [dbo].[inf_clte]
ADD CONSTRAINT [PK_inf_clte]
    PRIMARY KEY CLUSTERED ([id_clte] ASC);
GO

-- Creating primary key on [id_clte_obras] in table 'inf_clte_obras'
ALTER TABLE [dbo].[inf_clte_obras]
ADD CONSTRAINT [PK_inf_clte_obras]
    PRIMARY KEY CLUSTERED ([id_clte_obras] ASC);
GO

-- Creating primary key on [id_conc_ec] in table 'inf_conc_ec'
ALTER TABLE [dbo].[inf_conc_ec]
ADD CONSTRAINT [PK_inf_conc_ec]
    PRIMARY KEY CLUSTERED ([id_conc_ec] ASC);
GO

-- Creating primary key on [id_dir_usuario] in table 'inf_cont_usr'
ALTER TABLE [dbo].[inf_cont_usr]
ADD CONSTRAINT [PK_inf_cont_usr]
    PRIMARY KEY CLUSTERED ([id_dir_usuario] ASC);
GO

-- Creating primary key on [id_control_monto] in table 'inf_control_montos'
ALTER TABLE [dbo].[inf_control_montos]
ADD CONSTRAINT [PK_inf_control_montos]
    PRIMARY KEY CLUSTERED ([id_control_monto] ASC);
GO

-- Creating primary key on [id_email_env] in table 'inf_email_envio'
ALTER TABLE [dbo].[inf_email_envio]
ADD CONSTRAINT [PK_inf_email_envio]
    PRIMARY KEY CLUSTERED ([id_email_env] ASC);
GO

-- Creating primary key on [id_email_recep] in table 'inf_email_recepcion'
ALTER TABLE [dbo].[inf_email_recepcion]
ADD CONSTRAINT [PK_inf_email_recepcion]
    PRIMARY KEY CLUSTERED ([id_email_recep] ASC);
GO

-- Creating primary key on [id_emp] in table 'inf_emp'
ALTER TABLE [dbo].[inf_emp]
ADD CONSTRAINT [PK_inf_emp]
    PRIMARY KEY CLUSTERED ([id_emp] ASC);
GO

-- Creating primary key on [id_gasto] in table 'inf_gastos'
ALTER TABLE [dbo].[inf_gastos]
ADD CONSTRAINT [PK_inf_gastos]
    PRIMARY KEY CLUSTERED ([id_gasto] ASC);
GO

-- Creating primary key on [id_gastos_dep] in table 'inf_gastos_dep'
ALTER TABLE [dbo].[inf_gastos_dep]
ADD CONSTRAINT [PK_inf_gastos_dep]
    PRIMARY KEY CLUSTERED ([id_gastos_dep] ASC);
GO

-- Creating primary key on [id_mrp_concreto] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [PK_inf_mrp_concreto]
    PRIMARY KEY CLUSTERED ([id_mrp_concreto] ASC);
GO

-- Creating primary key on [id_rubro] in table 'inf_rubro'
ALTER TABLE [dbo].[inf_rubro]
ADD CONSTRAINT [PK_inf_rubro]
    PRIMARY KEY CLUSTERED ([id_rubro] ASC);
GO

-- Creating primary key on [d_codigo], [id_asenta_cpcons] in table 'inf_sepomex'
ALTER TABLE [dbo].[inf_sepomex]
ADD CONSTRAINT [PK_inf_sepomex]
    PRIMARY KEY CLUSTERED ([d_codigo], [id_asenta_cpcons] ASC);
GO

-- Creating primary key on [id_usuario] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [PK_inf_usuarios]
    PRIMARY KEY CLUSTERED ([id_usuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [id_sit_concreto] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [FK_inf_mrp_concreto_fac_situacion_concreto]
    FOREIGN KEY ([id_sit_concreto])
    REFERENCES [dbo].[fac_sit_concreto]
        ([id_sit_concreto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_mrp_concreto_fac_situacion_concreto'
CREATE INDEX [IX_FK_inf_mrp_concreto_fac_situacion_concreto]
ON [dbo].[inf_mrp_concreto]
    ([id_sit_concreto]);
GO

-- Creating foreign key on [id_tipo_concreto] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [FK_inf_mrp_concreto_fac_tipo_concreto]
    FOREIGN KEY ([id_tipo_concreto])
    REFERENCES [dbo].[fac_tipo_concreto]
        ([id_tipo_concreto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_mrp_concreto_fac_tipo_concreto'
CREATE INDEX [IX_FK_inf_mrp_concreto_fac_tipo_concreto]
ON [dbo].[inf_mrp_concreto]
    ([id_tipo_concreto]);
GO

-- Creating foreign key on [id_est_areas] in table 'fact_areas'
ALTER TABLE [dbo].[fact_areas]
ADD CONSTRAINT [FK_fact_areas_fact_estatus_areas]
    FOREIGN KEY ([id_est_areas])
    REFERENCES [dbo].[fact_est_areas]
        ([id_est_area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_fact_areas_fact_estatus_areas'
CREATE INDEX [IX_FK_fact_areas_fact_estatus_areas]
ON [dbo].[fact_areas]
    ([id_est_areas]);
GO

-- Creating foreign key on [id_emp] in table 'fact_areas'
ALTER TABLE [dbo].[fact_areas]
ADD CONSTRAINT [FK_fact_areas_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_fact_areas_inf_emp'
CREATE INDEX [IX_FK_fact_areas_inf_emp]
ON [dbo].[fact_areas]
    ([id_emp]);
GO

-- Creating foreign key on [id_area] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [FK_inf_usuarios_fact_areas]
    FOREIGN KEY ([id_area])
    REFERENCES [dbo].[fact_areas]
        ([id_area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_usuarios_fact_areas'
CREATE INDEX [IX_FK_inf_usuarios_fact_areas]
ON [dbo].[inf_usuarios]
    ([id_area]);
GO

-- Creating foreign key on [id_departamento] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [FK_general_usuarios_fact_departamento]
    FOREIGN KEY ([id_departamento])
    REFERENCES [dbo].[fact_departamento]
        ([id_departamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_general_usuarios_fact_departamento'
CREATE INDEX [IX_FK_general_usuarios_fact_departamento]
ON [dbo].[inf_usuarios]
    ([id_departamento]);
GO

-- Creating foreign key on [id_tipo_especimen] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [FK_inf_mrp_concreto_fact_especimen]
    FOREIGN KEY ([id_tipo_especimen])
    REFERENCES [dbo].[fact_especimen]
        ([id_tipo_especimen])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_mrp_concreto_fact_especimen'
CREATE INDEX [IX_FK_inf_mrp_concreto_fact_especimen]
ON [dbo].[inf_mrp_concreto]
    ([id_tipo_especimen]);
GO

-- Creating foreign key on [id_est_caja] in table 'inf_caja'
ALTER TABLE [dbo].[inf_caja]
ADD CONSTRAINT [FK_inf_caja_fact_est_caja]
    FOREIGN KEY ([id_est_caja])
    REFERENCES [dbo].[fact_est_caja]
        ([id_est_caja])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_caja_fact_est_caja'
CREATE INDEX [IX_FK_inf_caja_fact_est_caja]
ON [dbo].[inf_caja]
    ([id_est_caja]);
GO

-- Creating foreign key on [id_est_clte] in table 'inf_clte'
ALTER TABLE [dbo].[inf_clte]
ADD CONSTRAINT [FK_inf_clte_fact_estatus_clte]
    FOREIGN KEY ([id_est_clte])
    REFERENCES [dbo].[fact_est_clte]
        ([id_est_clte])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_fact_estatus_clte'
CREATE INDEX [IX_FK_inf_clte_fact_estatus_clte]
ON [dbo].[inf_clte]
    ([id_est_clte]);
GO

-- Creating foreign key on [id_est_concreto] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [FK_inf_mrp_concreto_fact_est_concreto]
    FOREIGN KEY ([id_est_concreto])
    REFERENCES [dbo].[fact_est_concreto]
        ([id_est_concreto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_mrp_concreto_fact_est_concreto'
CREATE INDEX [IX_FK_inf_mrp_concreto_fact_est_concreto]
ON [dbo].[inf_mrp_concreto]
    ([id_est_concreto]);
GO

-- Creating foreign key on [id_est_e_env] in table 'inf_email_envio'
ALTER TABLE [dbo].[inf_email_envio]
ADD CONSTRAINT [FK_inf_email_envio_fact_est_e_env]
    FOREIGN KEY ([id_est_e_env])
    REFERENCES [dbo].[fact_est_e_env]
        ([id_est_e_env])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_email_envio_fact_est_e_env'
CREATE INDEX [IX_FK_inf_email_envio_fact_est_e_env]
ON [dbo].[inf_email_envio]
    ([id_est_e_env]);
GO

-- Creating foreign key on [id_est_e_recep] in table 'inf_email_recepcion'
ALTER TABLE [dbo].[inf_email_recepcion]
ADD CONSTRAINT [FK_inf_email_recepcion_fact_est_e_recep]
    FOREIGN KEY ([id_est_e_recep])
    REFERENCES [dbo].[fact_est_e_recep]
        ([id_est_e_recep])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_email_recepcion_fact_est_e_recep'
CREATE INDEX [IX_FK_inf_email_recepcion_fact_est_e_recep]
ON [dbo].[inf_email_recepcion]
    ([id_est_e_recep]);
GO

-- Creating foreign key on [id_est_gast] in table 'inf_gastos'
ALTER TABLE [dbo].[inf_gastos]
ADD CONSTRAINT [FK_inf_gastos_fact_est_gast]
    FOREIGN KEY ([id_est_gast])
    REFERENCES [dbo].[fact_est_gast]
        ([id_est_gast])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_gastos_fact_est_gast'
CREATE INDEX [IX_FK_inf_gastos_fact_est_gast]
ON [dbo].[inf_gastos]
    ([id_est_gast]);
GO

-- Creating foreign key on [id_est_obra] in table 'inf_clte_obras'
ALTER TABLE [dbo].[inf_clte_obras]
ADD CONSTRAINT [FK_inf_clte_obras_fact_estatus_obra]
    FOREIGN KEY ([id_est_obra])
    REFERENCES [dbo].[fact_est_obra]
        ([id_est_obra])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_obras_fact_estatus_obra'
CREATE INDEX [IX_FK_inf_clte_obras_fact_estatus_obra]
ON [dbo].[inf_clte_obras]
    ([id_est_obra]);
GO

-- Creating foreign key on [id_est_rub] in table 'inf_rubro'
ALTER TABLE [dbo].[inf_rubro]
ADD CONSTRAINT [FK_inf_rubro_fact_est_rub]
    FOREIGN KEY ([id_est_rub])
    REFERENCES [dbo].[fact_est_rub]
        ([id_est_rub])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_rubro_fact_est_rub'
CREATE INDEX [IX_FK_inf_rubro_fact_est_rub]
ON [dbo].[inf_rubro]
    ([id_est_rub]);
GO

-- Creating foreign key on [id_est_usr] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [FK_general_usuarios_fact_estatus]
    FOREIGN KEY ([id_est_usr])
    REFERENCES [dbo].[fact_estatus]
        ([id_est_usr])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_general_usuarios_fact_estatus'
CREATE INDEX [IX_FK_general_usuarios_fact_estatus]
ON [dbo].[inf_usuarios]
    ([id_est_usr]);
GO

-- Creating foreign key on [id_genero] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [FK_general_usuarios_fact_generos]
    FOREIGN KEY ([id_genero])
    REFERENCES [dbo].[fact_generos]
        ([id_genero])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_general_usuarios_fact_generos'
CREATE INDEX [IX_FK_general_usuarios_fact_generos]
ON [dbo].[inf_usuarios]
    ([id_genero]);
GO

-- Creating foreign key on [id_perfil] in table 'inf_usuarios'
ALTER TABLE [dbo].[inf_usuarios]
ADD CONSTRAINT [FK_general_usuarios_fact_perfil]
    FOREIGN KEY ([id_perfil])
    REFERENCES [dbo].[fact_perfil]
        ([id_perfil])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_general_usuarios_fact_perfil'
CREATE INDEX [IX_FK_general_usuarios_fact_perfil]
ON [dbo].[inf_usuarios]
    ([id_perfil]);
GO

-- Creating foreign key on [id_tipo_rfc] in table 'inf_clte'
ALTER TABLE [dbo].[inf_clte]
ADD CONSTRAINT [FK_inf_clte_fact_tipo_rfc]
    FOREIGN KEY ([id_tipo_rfc])
    REFERENCES [dbo].[fact_tipo_rfc]
        ([id_tipo_rfc])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_fact_tipo_rfc'
CREATE INDEX [IX_FK_inf_clte_fact_tipo_rfc]
ON [dbo].[inf_clte]
    ([id_tipo_rfc]);
GO

-- Creating foreign key on [id_tipo_rubro] in table 'inf_rubro'
ALTER TABLE [dbo].[inf_rubro]
ADD CONSTRAINT [FK_inf_rubro_fact_tipo_rubro]
    FOREIGN KEY ([id_tipo_rubro])
    REFERENCES [dbo].[fact_tipo_rubro]
        ([id_tipo_rubro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_rubro_fact_tipo_rubro'
CREATE INDEX [IX_FK_inf_rubro_fact_tipo_rubro]
ON [dbo].[inf_rubro]
    ([id_tipo_rubro]);
GO

-- Creating foreign key on [id_tipo_servicio] in table 'inf_clte_obras'
ALTER TABLE [dbo].[inf_clte_obras]
ADD CONSTRAINT [FK_inf_clte_obras_fact_tipo_servicio]
    FOREIGN KEY ([id_tipo_servicio])
    REFERENCES [dbo].[fact_tipo_servicio]
        ([id_tipo_servicio])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_obras_fact_tipo_servicio'
CREATE INDEX [IX_FK_inf_clte_obras_fact_tipo_servicio]
ON [dbo].[inf_clte_obras]
    ([id_tipo_servicio]);
GO

-- Creating foreign key on [id_emp] in table 'inf_caja'
ALTER TABLE [dbo].[inf_caja]
ADD CONSTRAINT [FK_inf_caja_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_caja_inf_emp'
CREATE INDEX [IX_FK_inf_caja_inf_emp]
ON [dbo].[inf_caja]
    ([id_emp]);
GO

-- Creating foreign key on [id_emp] in table 'inf_clte'
ALTER TABLE [dbo].[inf_clte]
ADD CONSTRAINT [FK_inf_clte_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_inf_emp'
CREATE INDEX [IX_FK_inf_clte_inf_emp]
ON [dbo].[inf_clte]
    ([id_emp]);
GO

-- Creating foreign key on [id_clte] in table 'inf_clte_obras'
ALTER TABLE [dbo].[inf_clte_obras]
ADD CONSTRAINT [FK_inf_clte_obras_inf_clte]
    FOREIGN KEY ([id_clte])
    REFERENCES [dbo].[inf_clte]
        ([id_clte])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_clte_obras_inf_clte'
CREATE INDEX [IX_FK_inf_clte_obras_inf_clte]
ON [dbo].[inf_clte_obras]
    ([id_clte]);
GO

-- Creating foreign key on [id_mrp_concreto] in table 'inf_conc_ec'
ALTER TABLE [dbo].[inf_conc_ec]
ADD CONSTRAINT [FK_inf_conc_ec_inf_mrp_concreto]
    FOREIGN KEY ([id_mrp_concreto])
    REFERENCES [dbo].[inf_mrp_concreto]
        ([id_mrp_concreto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_conc_ec_inf_mrp_concreto'
CREATE INDEX [IX_FK_inf_conc_ec_inf_mrp_concreto]
ON [dbo].[inf_conc_ec]
    ([id_mrp_concreto]);
GO

-- Creating foreign key on [id_usuario] in table 'inf_cont_usr'
ALTER TABLE [dbo].[inf_cont_usr]
ADD CONSTRAINT [FK_contacto_usuarios_general_usuarios]
    FOREIGN KEY ([id_usuario])
    REFERENCES [dbo].[inf_usuarios]
        ([id_usuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_contacto_usuarios_general_usuarios'
CREATE INDEX [IX_FK_contacto_usuarios_general_usuarios]
ON [dbo].[inf_cont_usr]
    ([id_usuario]);
GO

-- Creating foreign key on [id_rubro] in table 'inf_control_montos'
ALTER TABLE [dbo].[inf_control_montos]
ADD CONSTRAINT [FK_inf_control_montos_inf_rubro]
    FOREIGN KEY ([id_rubro])
    REFERENCES [dbo].[inf_rubro]
        ([id_rubro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_control_montos_inf_rubro'
CREATE INDEX [IX_FK_inf_control_montos_inf_rubro]
ON [dbo].[inf_control_montos]
    ([id_rubro]);
GO

-- Creating foreign key on [id_emp] in table 'inf_email_envio'
ALTER TABLE [dbo].[inf_email_envio]
ADD CONSTRAINT [FK_inf_email_envio_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_email_envio_inf_emp'
CREATE INDEX [IX_FK_inf_email_envio_inf_emp]
ON [dbo].[inf_email_envio]
    ([id_emp]);
GO

-- Creating foreign key on [id_emp] in table 'inf_email_recepcion'
ALTER TABLE [dbo].[inf_email_recepcion]
ADD CONSTRAINT [FK_inf_email_recepcion_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_email_recepcion_inf_emp'
CREATE INDEX [IX_FK_inf_email_recepcion_inf_emp]
ON [dbo].[inf_email_recepcion]
    ([id_emp]);
GO

-- Creating foreign key on [id_emp] in table 'inf_gastos'
ALTER TABLE [dbo].[inf_gastos]
ADD CONSTRAINT [FK_inf_gastos_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_gastos_inf_emp'
CREATE INDEX [IX_FK_inf_gastos_inf_emp]
ON [dbo].[inf_gastos]
    ([id_emp]);
GO

-- Creating foreign key on [id_emp] in table 'inf_mrp_concreto'
ALTER TABLE [dbo].[inf_mrp_concreto]
ADD CONSTRAINT [FK_inf_mrp_concreto_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_mrp_concreto_inf_emp'
CREATE INDEX [IX_FK_inf_mrp_concreto_inf_emp]
ON [dbo].[inf_mrp_concreto]
    ([id_emp]);
GO

-- Creating foreign key on [id_emp] in table 'inf_rubro'
ALTER TABLE [dbo].[inf_rubro]
ADD CONSTRAINT [FK_inf_rubro_inf_emp]
    FOREIGN KEY ([id_emp])
    REFERENCES [dbo].[inf_emp]
        ([id_emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_rubro_inf_emp'
CREATE INDEX [IX_FK_inf_rubro_inf_emp]
ON [dbo].[inf_rubro]
    ([id_emp]);
GO

-- Creating foreign key on [id_gasto] in table 'inf_gastos_dep'
ALTER TABLE [dbo].[inf_gastos_dep]
ADD CONSTRAINT [FK_inf_gastos_dep_inf_gastos]
    FOREIGN KEY ([id_gasto])
    REFERENCES [dbo].[inf_gastos]
        ([id_gasto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inf_gastos_dep_inf_gastos'
CREATE INDEX [IX_FK_inf_gastos_dep_inf_gastos]
ON [dbo].[inf_gastos_dep]
    ([id_gasto]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------