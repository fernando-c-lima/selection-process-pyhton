import requests
from bs4 import BeautifulSoup
import os
import zipfile

# Função para fazer o download dos arquivos PDF
def download_file(url, file_name):
    print(f"Baixando: {file_name}")
    response = requests.get(url)
    if response.status_code == 200:  # Verifica se a requisição foi bem-sucedida
        with open(file_name, 'wb') as f:
            f.write(response.content)
        print(f"Download concluído: {file_name}")
    else:
        print(f"Falha ao baixar: {file_name}, Status: {response.status_code}")

# Função para compactar arquivos em ZIP
def zip_files(zip_name, files):
    with zipfile.ZipFile(zip_name, 'w') as zipf:
        for file in files:
            zipf.write(file)
    print(f"Arquivos compactados em {zip_name}")

# URL da página para extrair os pdf
url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

# Encontrar os links dos Anexos I e II
pdf_links = []
for link in soup.find_all("a", href=True):
    href = link["href"]
    # Verifique se o link contém "Anexo I" ou "Anexo II" e termina com ".pdf"
    if ("Anexo I" in link.text or "Anexo II" in link.text) and href.endswith(".pdf"):
        pdf_links.append(href if href.startswith("http") else "https://www.gov.br" + href)


# Baixar os arquivos encontrados
downloaded_files = []
for pdf_link in pdf_links:
    file_name = pdf_link.split("/")[-1]
    download_file(pdf_link, file_name)
    downloaded_files.append(file_name)

# Compactar os PDFs em um arquivo ZIP
zip_files("anexos.zip", downloaded_files)

# Remover os PDFs depois de compactar (opcional)
for file in downloaded_files:
    os.remove(file)

print("Processo concluído com sucesso!")
