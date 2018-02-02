#!/bin/bash

# Recebe o caminho das aplicações como parametro,
# Caso nenhum caminho seja passado
# Será assumido como path o caminho '/var/www'
PROJECTS=$1;

if [ "$PROJECTS" == "" ]; then
    PROJECTS="/var/www"
fi

# Varre todos os repositórios dentro do path de projetos
# Se este repositório possuir um .git
# Então ele será atualizado
for repository in $(find $PROJECTS -maxdepth 2 -type d)
do
  if [ -d "$repository/.git" ]; then
    (
      cd "${repository}";
      git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD` -q;
      git pull --all --commit --no-edit -q;
      git pull --tags -q;
    )
  fi
done
