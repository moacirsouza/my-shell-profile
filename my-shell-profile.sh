#!/bin/bash

arquivoDoPerfil=${HOME}/.bashrc
comeco='Começo da Personalização'
fim='Fim da Personalização'

### TODO: Adicionar opções de mudança de idiomas para os comentários e
### cabeçalhos das seções.

### Remove versões anteriores das personalizações criadas pelo programa
sed -i "/$comeco/,/$fim/d" $arquivoDoPerfil

(
cat <<EOF
# -----------------------[ $comeco ]---------------------------

### TODO: Avaliar se vale à pena alterar o PS1 com o formato definido pelas
### variáveis desta Seção. Levar em consideração outros ambientes que não usam
### o $HOME/.bashrc como configurador do shell interativo

### Define o nome do usuario
#usuario=\$(whoami)

### Define o nome da maquina
#nomeDoHost=\$(uname -n)

### Personaliza o prompt de comandos

### Se o perfil for do usuario root, coloca o simbolo de cerquilha (#) ao
### final do PS1, se nao, coloca o simbolo do cifrao ($)
#simboloDoPrompt='$'

#if [ $(id -u) -eq 0 ]
#then
#    simboloDoPrompt='#'
#fi

# PS1='\$usuario@\$nomeDoHost:\$PWD\$simboloDoPrompt '

# -------------------------[ Variáveis de ambiente ]----------------------------

### Configura o EXINIT para personalizar o comportamento do vi
EXINIT=":set number tabstop=4 hardtabs=4 showmode expandtab \
nohlsearch ai cursorline colorcolumn=81"

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

# export EDITOR PS1 EXINIT HISTSIZE
export EDITOR EXINIT HISTSIZE

# -------------------------[ $fim ]----------------------------
EOF
) >> $arquivoDoPerfil 
