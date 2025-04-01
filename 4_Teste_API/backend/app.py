from flask import Flask, request, jsonify, redirect  
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app) # Habilitando CORS para todas as rotas

# Carregar o CSV
df = pd.read_csv('Relatorio_cadop (1).csv', encoding='utf-8', on_bad_lines='skip')

def buscar_operadoras(query):
    # Converte todos os campos para string e verifica se algum campo contém a query
    results = df[df.apply(lambda row: row.astype(str).str.contains(query, case=False, na=False).any(), axis=1)]
    return results

@app.route("/", methods=["GET"])
def home():
    return redirect("http://localhost:5173/")

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('q', '').strip()
    print(f"Consulta recebida: {query}")  # Log da consulta recebida
    if query:
        try:
            results = buscar_operadoras(query)
            print(f"Resultados encontrados: {results.shape[0]}")  # Log do número de resultados encontrados
            results_limited = results.head(10)
            return jsonify(results_limited.to_dict(orient='records'))
        except Exception as e:
            return jsonify({"error": f"Erro ao buscar dados: {str(e)}"})
    return jsonify([])  # Retorna uma lista vazia se nenhum termo for fornecido

if __name__ == '__main__':
    app.run(debug=True)