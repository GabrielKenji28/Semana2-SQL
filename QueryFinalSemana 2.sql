CREATE TABLE Caminhao (
NumProd INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
DataFabricacao DATE NOT NULL ,
IdModelo INT);


CREATE TABLE Eixo (
NumProd INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
DataFabricacao DATE NOT NULL,
NumProdCaminhao INT );

CREATE TABLE Modelo (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
Nome VARCHAR(30) NOT NULL,
Descricao VARCHAR(150) NOT NULL,
);

CREATE TABLE CaminhaoEixo (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
NumProdCaminhao INT NOT NULL,
NumProdEixo INT NOT NULL,
FOREIGN KEY (NumProdCaminhao) REFERENCES Caminhao(NumProd),
FOREIGN KEY (NumProdEixo) REFERENCES Eixo(NumProd) );


SELECT * FROM Caminhao ;
SELECT * FROM CaminhaoEixo ;
SELECT * FROM Eixo ;
SELECT * FROM Modelo ;

TRUNCATE TABLE Eixo ;

ALTER TABLE Eixo 
ADD CONSTRAINT NumProdCaminhao
FOREIGN KEY (NumProdCaminhao)
REFERENCES Caminhao(NumProd)
GO

ALTER TABLE Caminhao 
ADD CONSTRAINT IdModelo
FOREIGN KEY (IdModelo)
REFERENCES Modelo(Id)
GO

INSERT INTO Modelo (Nome, Descricao) VALUES ('Accelo', 'Caminhão de pequeno porte')
INSERT INTO Modelo (Nome, Descricao) VALUES ('550', 'Caminhão de pequeno médio')
INSERT INTO Modelo (Nome, Descricao) VALUES ('1100', 'Caminhão de pequeno porte')

INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-21', (SELECT Id FROM Modelo WHERE Nome = 'Accelo'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-21', (SELECT Id FROM Modelo WHERE Nome = '550'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-21', (SELECT Id FROM Modelo WHERE Nome = '1100'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-22', (SELECT Id FROM Modelo WHERE Nome = 'Accelo'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-22', (SELECT Id FROM Modelo WHERE Nome = '550'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-22', (SELECT Id FROM Modelo WHERE Nome = '1100'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-23', (SELECT Id FROM Modelo WHERE Nome = 'Accelo'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-23', (SELECT Id FROM Modelo WHERE Nome = '550'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-23', (SELECT Id FROM Modelo WHERE Nome = '1100'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-24', (SELECT Id FROM Modelo WHERE Nome = 'Accelo'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-24', (SELECT Id FROM Modelo WHERE Nome = '550'))
INSERT INTO Caminhao (DataFabricacao, IdModelo) VALUES ('2021-04-24', (SELECT Id FROM Modelo WHERE Nome = '1100'))

INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-21')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-22')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-23')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-24')
INSERT INTO Eixo (DataFabricacao) VALUES ('2021-04-24')

INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (1, 1)
INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (1, 2)

INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (2, 3)
INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (2, 4)

INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (3, 5)
INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (3, 6)

INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (4, 7)
INSERT INTO CaminhaoEixo (NumProdCaminhao, NumProdEixo) VALUES (4, 8)


SELECT m.Nome , c.DataFabricacao , c.NumProd 
FROM Modelo as m 
INNER JOIN Caminhao as c ON c.IdModelo = m.Id 
WHERE m.Nome = 'Accelo';


--O número de produção e a data de fabricação do caminhão e do eixo,
--mas somente dos caminhões produzidos no dia 22/04/2021 e com pelo menos 1 eixo associado;

SELECT ce.NumProdCaminhao, ce.NumProdEixo, c.DataFabricacao AS 'DataCaminhao' , e.DataFabricacao AS 'DataEixo'
FROM CaminhaoEixo as ce 
INNER JOIN Caminhao as c ON c.NumProd = ce.NumProdCaminhao
INNER JOIN Eixo as e ON e.NumProd = ce.NumProdEixo 
;

--Todas as informações do passo anterior e também o nome do modelo do caminhão;

SELECT ce.NumProdCaminhao, ce.NumProdEixo, c.DataFabricacao AS 'DataCaminhao' , e.DataFabricacao AS 'DataEixo',
m.Nome AS 'Modelo'
FROM CaminhaoEixo as ce 
INNER JOIN Caminhao as c ON c.NumProd = ce.NumProdCaminhao
INNER JOIN Eixo as e ON e.NumProd = ce.NumProdEixo 
INNER JOIN Modelo AS m ON m.Id = c.IdModelo;

SELECT * FROM Caminhao;