#!/bin/bash

arquivoDoPerfil=lala

(
cat <<EOF

# -----------------------[ Personalização do Prompt ]---------------------------

### Define o nome do usuario
usuario=$(whoami)

### Define o nome da maquina
nomeDoHost=$(uname -n)

### Personaliza o prompt de comandos

### Se o perfil for do usuario root, coloca o simbolo de cerquilha (#) ao
### final do PS1, se nao, coloca o simbolo do cifrao ($)
simboloDoPrompt='$'

if [ $(id -u) -eq 0 ]
then
    simboloDoPrompt='#'
fi

PS1='$usuario@$nomeDoHost $PWD $simboloDoPrompt '

# -------------------------[ Variáveis de ambiente ]----------------------------

### Configura o EXINIT para personalizar o comportamento do vi
EXINIT=":set number tabstop=4 hardtabs=4 showmode expandtab \
nohlsearch ai cursorline"

### Define o tamanho máximo do history
HISTSIZE=100000

### Define o editor de textos padrao
EDITOR=/usr/bin/vi

# ----------------[ Personalizações do ambiente de edição ]---------------------

### Configura o vi como editor principal do Shell
set -o vi

### Garante que o histórico de uma sessão é imediatamente adicionado ao
### ~/.bash_history assim que essa sessão é finalizada
#shopt -s histappend

# ------------------------[ Exportação de variáveis ]---------------------------

export EDITOR PS1 EXINIT HISTSIZE
EOF
) >> $arquivoDoPerfil 
