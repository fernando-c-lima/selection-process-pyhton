# PROCESSO SELETIVO

## Como rodar

1. Clone este repositório:
    ```bash
    git clone https://github.com/seu_usuario/seu_repositorio.git
    cd seu_repositorio
    ```

---

## 1. TESTE DE WEB SCRAPING

Este script realiza as seguintes etapas:

1. Faz o download dos arquivos PDF de uma página web.
2. Compacta os PDFs em um arquivo ZIP.
3. Remove os arquivos PDF após compactá-los.

### Requisitos

- Python 3.x
- Biblioteca `requests`
- Biblioteca `beautifulsoup4`

### Instalação das dependências

 Instale as dependências:
    ```bash
    pip install requests beautifulsoup4
    ```

### Execução do script

 Execute o script:
    ```bash
    python 1_web_scraping.py
    ```

---

## 2. TESTE DE TRANSFORMAÇÃO DE DADOS

### Script de Processamento de PDF e Excel

Este script realiza as seguintes etapas:

1. Extrai um arquivo PDF de um arquivo ZIP.
2. Extrai dados de uma tabela contida no PDF.
3. Converte os dados extraídos para um arquivo Excel formatado.
4. Substitui abreviações por descrições completas no Excel.
5. Compacta o arquivo Excel gerado em um arquivo ZIP.
6. Remove arquivos temporários.

### Requisitos

- Python 3.x
- Biblioteca `pdfplumber`
- Biblioteca `openpyxl`

### Instalação das dependências

 Instale as dependências:
    ```bash
    pip install pdfplumber openpyxl
    ```

### Execução do script

 Execute o script:
    ```bash
    python 2_transformacao_de_dados.py
    ```

O script gerará um arquivo ZIP contendo o arquivo Excel processado.

## 3. Teste de Banco de Dados

Para executar o teste de banco de dados, siga as instruções abaixo:

1. Abra o arquivo `TESTE_DE_BANCO_DE_DADOS.sql` em seu editor SQL de preferência, como **MySQL Workbench**.
2. Execute o script SQL para criar as tabelas e popular o banco de dados com os dados de teste.

> **Nota:** Certifique-se de estar conectado ao banco de dados correto antes de rodar o script.



## 4.Teste de API e Interface Web

Este repositório contém uma aplicação que inclui:

1. **Backend em Python** (Flask) para realizar uma busca textual nos cadastros de operadoras a partir de um CSV.
2. **Frontend em Vue.js** para interagir com o backend e exibir os resultados da busca.
3. **Coleção no Postman** para testar a API e verificar a funcionalidade da busca.

### Tarefas de Preparação

O backend interage com um **arquivo CSV(Relatorio_cadop(1).csv)** contendo os cadastros de operadoras, preparado anteriormente. Este CSV é utilizado pelo servidor para realizar a busca textual.

## Tarefas de Código

### 4.2 - Criação do Servidor (backend/frontend)

Foi implementado um servidor (Flask) com uma rota para realizar buscas textuais nos cadastros de operadoras. A rota retorna os registros mais relevantes conforme o critério de busca.

### 4.3 - Coleção no Postman

Uma coleção no Postman foi criada para demonstrar como interagir com a API, realizar as buscas e visualizar os resultados.
#### Como usar a coleção no Postman:

1. **Baixe a coleção do Postman**:

   - A coleção do Postman está disponível no repositório, no diretório `postman`.
   - Baixe o arquivo JSON da coleção a partir desse diretório.

2. **Importe a coleção no Postman**:

   - Abra o Postman e clique em **"Import"** no canto superior esquerdo.
   - Selecione o arquivo JSON da coleção que você baixou do repositório.
   - A coleção será automaticamente adicionada ao painel de coleções do Postman.

3. **Execute as requisições**:

   - Selecione qualquer requisição na coleção e clique em **"Send"** para testar a API.
   - O Postman exibirá os resultados da requisição, como status HTTP, corpo da resposta e dados retornados pela API.


## Tecnologias Utilizadas

- **Backend**: Python (Flask)
- **Frontend**: Vue.js
- **Banco de Dados**: CSV (arquivo de operadoras)
- **Ferramentas de Teste**: Postman

### Instalação das dependências

### Como Rodar o Projeto

#### Instale as dependências

Primeiro, instale as dependências do projeto usando o arquivo `requirements.txt` para o backend e o comando do `npm` para o frontend.

- **Para o backend**: Execute o seguinte comando para instalar as dependências do servidor Python:

    ```bash
    pip install -r requirements.txt
    ```

- **Para o frontend**: Execute o seguinte comando para instalar as dependências do frontend:

    ```bash
    npm install
    ```

#### 2. Execute o script:

Agora, execute ambos os servidores para rodar o backend e o frontend.

- **Para rodar o backend** (no terminal dentro do diretório do backend):

    ```bash
    python app.py
    ```

- **Para rodar o frontend** (no terminal dentro do diretório do frontend):

    ```bash
    npm run dev
    ```

#### 3. Importante

Ambos os servidores (backend e frontend) devem estar rodando simultaneamente para garantir que a interação entre eles funcione corretamente.









