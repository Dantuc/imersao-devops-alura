
FROM python:3.13.5-alpine3.22
# Instala dependências do sistema

WORKDIR /app
# Dockerfile para uma aplicação FastAPI com Uvicorn


RUN apk add --no-cache gcc musl-dev libffi-dev

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta padrão do Uvicorn/FastAPI
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]