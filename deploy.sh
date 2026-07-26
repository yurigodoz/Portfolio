#!/bin/bash
set -e    # para na hora se qualquer comando falhar

REPO=~/Portfolio
DEST=/var/www/portfolio

echo "== Frontend =="
cd "$REPO"
git pull

# copia todos os arquivos da raiz do repo, menos ocultos (.git*), .md e este script
find . -maxdepth 1 -type f \
  ! -name '.*' \
  ! -name '*.md' \
  ! -name 'deploy.sh' \
  -exec cp -f {} "$DEST"/ \;

# nginx precisa conseguir ler os arquivos
chmod 644 "$DEST"/*

echo "-- publicado em $DEST:"
ls -1 "$DEST"

echo "== Pronto =="
