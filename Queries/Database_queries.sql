DROP TABLE [VIOLENCE_STG].[dbo].[TBL_VIOLENCE_STG];

CREATE TABLE [dbo].[TBL_VIOLENCE_STG] (
    [STR_NOMBRE_DEPARTAMENTO] VARCHAR(150),
    [STR_NOMBRE_MUNICIPIO] VARCHAR(150),
    [STR_CODIGO_DANE] VARCHAR(20),
    [STR_ARMAS_MEDIOS] VARCHAR(150),
    [DT_FECHA_HECHO] DATETIME,
    [STR_GRUPO_EDAD_PERSONA] NVARCHAR(20),
    [INT_CANTIDAD] INT,
    [STR_GENERO] NVARCHAR(20)
);

SELECT * FROM [dbo].[TBL_VIOLENCE_STG];

EXEC sp_columns [TBL_VIOLENCE_STG];

--------------------------------------
---------  DIM TIEMPO  ---------------
--------------------------------------

CREATE TABLE [dbo].[TBL_DIM_TIEMPO] (
    [DT_FECHA] datetime,
    [SK_DIM_TIEMPO] bigint,
    [NUM_ANIO] int,
    [STR_SEMESTRE] varchar(20),
    [NUM_PERIODO] int,
    [STR_MES] varchar(20),
    [NUM_MES] int,
    [NUM_DIA] int,
    [NUM_SEMANA_MES] int
);

SELECT * FROM [dbo].[TBL_DIM_TIEMPO];

--------------------------------------
-----------  DIM SEXO  ---------------
--------------------------------------

SELECT DISTINCT 
CASE WHEN [STR_GENERO] = '-' THEN 'NO REPORTADO' 
ELSE [STR_GENERO] END AS [STR_GENERO] 
FROM [dbo].[TBL_VIOLENCE_STG];

CREATE TABLE TBL_DIM_GENERO_T0 (
      SK_DIM_GENERO int IDENTITY(1,1) PRIMARY KEY,
      STR_GENERO varchar(50),
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM [dbo].TBL_DIM_GENERO_T0;

DROP TABLE TBL_DIM_GENERO_T0;

--------------------------------------
-----------  DIM LUGAR  --------------
--------------------------------------

SELECT * FROM [dbo].[TBL_VIOLENCE_STG];

SELECT DISTINCT REPLACE(UPPER(TRANSLATE([STR_NOMBRE_DEPARTAMENTO], 
'Ò·ÈÌÛ˙‡ËÏÚ˘„ı‚ÍÓÙÙ‰ÎÔˆ¸Á—¡…Õ”⁄¿»Ã“Ÿ√’¬ Œ‘€ƒÀœ÷‹« ', 
'naeiouaeiouaoaeiooaeioucNAEIOUAEIOUAOAEIOOAEIOUC_')),'_',' ') AS [STR_NOMBRE_DEPARTAMENTO],
CASE WHEN [STR_NOMBRE_MUNICIPIO] = '-' THEN 'NO REPORTA' 
ELSE REPLACE(UPPER(TRANSLATE([STR_NOMBRE_MUNICIPIO], 
'Ò·ÈÌÛ˙‡ËÏÚ˘„ı‚ÍÓÙÙ‰ÎÔˆ¸Á—¡…Õ”⁄¿»Ã“Ÿ√’¬ Œ‘€ƒÀœ÷‹« ', 
'naeiouaeiouaoaeiooaeioucNAEIOUAEIOUAOAEIOOAEIOUC_')),'_',' ') END AS [STR_NOMBRE_MUNICIPIO]
FROM [dbo].[TBL_VIOLENCE_STG]
ORDER BY 1,2;

CREATE TABLE TBL_DIM_LUGAR_T0 (
      SK_DIM_LUGAR int IDENTITY(1,1) PRIMARY KEY,
      STR_DEPARTAMENTO varchar(50),
	  STR_MUNICIPIO varchar(50),
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM TBL_DIM_LUGAR_T0;

--------------------------------------
---------  DIM GRUPO EDAD  -----------
--------------------------------------

SELECT DISTINCT 
CASE WHEN [STR_GRUPO_EDAD_PERSONA] = '-' THEN 'NO REPORTADO'
ELSE [STR_GRUPO_EDAD_PERSONA] END AS STR_GRUPO_EDAD_PERSONA
FROM [dbo].[TBL_VIOLENCE_STG];

CREATE TABLE TBL_DIM_GRUPO_EDAD_T0 (
      SK_DIM_GRUPO_EDAD int IDENTITY(1,1) PRIMARY KEY,
      STR_GRUPO_EDAD varchar(50),
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM TBL_DIM_GRUPO_EDAD_T0;
--------------------------------------
---------  DIM CODIGO DANE  ----------
--------------------------------------

SELECT DISTINCT [STR_CODIGO_DANE] 
FROM [dbo].[TBL_VIOLENCE_STG]
ORDER BY 1 ASC;

CREATE TABLE TBL_DIM_CODIGO_DANE_T0 (
      SK_DIM_CODIGO_DAME int IDENTITY(1,1) PRIMARY KEY,
      STR_CODIGO_DANE varchar(20),
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM TBL_DIM_CODIGO_DANE_T0;

--------------------------------------
-----------  DIM ARMA  ---------------
--------------------------------------

SELECT DISTINCT [STR_ARMAS_MEDIOS] 
FROM [dbo].[TBL_VIOLENCE_STG];

CREATE TABLE TBL_DIM_ARMA_T0 (
      SK_DIM_ARMA int IDENTITY(1,1) PRIMARY KEY,
      STR_ARMA varchar(50),
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM TBL_DIM_ARMA_T0;

--------------------------------------
----------  DIM CANTIDAD  ------------
--------------------------------------

SELECT DISTINCT [INT_CANTIDAD] 
FROM [dbo].[TBL_VIOLENCE_STG]
ORDER BY 1 ASC;

CREATE TABLE TBL_DIM_CANTIDAD_T0 (
      SK_DIM_CANTIDAD int IDENTITY(1,1) PRIMARY KEY,
      NUM_CANTIDAD INT,
	  DT_FECHA_CARGA DATETIME
);

SELECT * FROM TBL_DIM_CANTIDAD_T0;