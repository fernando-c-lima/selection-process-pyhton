CREATE DATABASE processo_seletivo;
USE processo_seletivo;

-- 3.3. Crie queries para estruturar tabelas necessárias para o arquivo csv.

--  Tabela de Empresas
CREATE TABLE IF NOT EXISTS empresas (
    Registro_ANS INT PRIMARY KEY,  -- Agora é chave primária
    CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Razao_Social VARCHAR(255) NOT NULL,
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Regiao_de_Comercializacao VARCHAR(255),
    Data_Registro_ANS DATE
);

--  Tabela de Endereços
CREATE TABLE IF NOT EXISTS enderecos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Registro_ANS INT,  -- Relaciona com a tabela empresas
    Logradouro VARCHAR(255),
    Numero VARCHAR(10),
    Complemento VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(9),  -- Corrigido para aceitar formato com hífen (ex: 12345-678)
    FOREIGN KEY (Registro_ANS) REFERENCES empresas(Registro_ANS) ON DELETE CASCADE
);

--  Tabela de Contatos
CREATE TABLE IF NOT EXISTS contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Registro_ANS INT,  -- Relaciona com a tabela empresas
    DDD CHAR(2),  -- DDD geralmente tem 2 dígitos
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(100),
    FOREIGN KEY (Registro_ANS) REFERENCES empresas(Registro_ANS) ON DELETE CASCADE
);


-- 3.4 Elabore queries para importar o conteúdo dos arquivos preparados, atentando para o encoding correto.



CREATE TABLE IF NOT EXISTS balanco_trimestral (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    reg_ans INT NOT NULL,
    cd_conta_contabil VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial DECIMAL(15,2) NOT NULL,
    vl_saldo_final DECIMAL(15,2) NOT NULL,
    ano INT NOT NULL,
    trimestre INT NOT NULL,
    FOREIGN KEY (reg_ans) REFERENCES empresas(Registro_ANS) ON DELETE CASCADE
);


-- Importar	o conteúdo dos trimestres de 2023

LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/1T2023.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2023, trimestre = 1;


LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/2t2023.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2023, trimestre = 2;

LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/3T2023.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2023, trimestre = 3;


LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/4T2023.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2023, trimestre = 4;

-- Importar	o conteúdo dos trimestres de 2024


LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/1T2024.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2024, trimestre = 1;


LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/2T2024.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2024, trimestre = 2;

LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/3T2024.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2024, trimestre = 3;


LOAD DATA INFILE 'C:/Users/marce/OneDrive/Área de Trabalho/www/Processo seletivo/3_teste_banco_de_dados/4T2024.csv'
INTO TABLE balanco_trimestral
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final, ano, trimestre)
SET data = STR_TO_DATE(data, '%d/%m/%Y'), ano = 2024, trimestre = 4;





--   3.5-1 Quais as 10 operadoras com maiores despesas em "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?

SELECT 
    e.Razao_Social AS Operadora,
    SUM(bt.vl_saldo_final) AS Despesa_Total
FROM 
    balanco_trimestral bt
JOIN 
    empresas e ON bt.reg_ans = e.Registro_ANS
WHERE 
    bt.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MÉDICO HOSPITALAR'
    AND bt.ano = 2024 
    AND bt.trimestre = 4
GROUP BY 
    e.Razao_Social
ORDER BY 
    Despesa_Total DESC
LIMIT 10;


-- 3.5-2 Quais as 10 operadoras com maiores despesas nessa categoria no último ano?

SELECT 
    e.Razao_Social AS Operadora,
    SUM(bt.vl_saldo_final) AS Despesa_Total
FROM 
    balanco_trimestral bt
JOIN 
    empresas e ON bt.reg_ans = e.Registro_ANS
WHERE 
    bt.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MÉDICO HOSPITALAR'
    AND bt.ano = (SELECT MAX(ano) FROM balanco_trimestral)
GROUP BY 
    e.Razao_Social
ORDER BY 
    Despesa_Total DESC
LIMIT 10;




