# Étape 1 : Build
FROM python:3.10-slim as builder

WORKDIR /app

# Installer les dépendances système nécessaires pour construire les paquets Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer Poetry
RUN pip install --no-cache-dir poetry

# Copier les fichiers de configuration de Poetry
COPY pyproject.toml poetry.lock* /app/

# Installer les dépendances Python sans les extras GPU
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Étape 2 : Production
FROM python:3.10-slim

WORKDIR /app

# Copier les dépendances depuis le builder
COPY --from=builder /app /app

# Copier le reste du code source
COPY . /app

# Copier le script d'entrée et rendre exécutable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer le port pour Jupyter
EXPOSE 8888

# Définir l'entrypoint
ENTRYPOINT ["/entrypoint.sh"]