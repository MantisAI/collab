# Utiliser l'image Python 3.10 slim comme base
FROM python:3.10-slim

# Définir les variables d'environnement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Définir le répertoire de travail
WORKDIR /app

# Installer les dépendances système nécessaires pour construire les paquets Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer Poetry
RUN pip install --no-cache-dir poetry

# Copier les fichiers de configuration de Poetry
COPY pyproject.toml poetry.lock* /app/

# Installer les dépendances Python et nettoyer les dépendances de construction
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi \
    && apt-get remove --purge -y build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Copier le reste du code source
COPY . /app

# Copier le script d'entrée et rendre exécutable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer le port pour Jupyter
EXPOSE 8888

# Définir l'entrypoint
ENTRYPOINT ["/entrypoint.sh"]