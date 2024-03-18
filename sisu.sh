#!/bin/bash

# Referência ao arquivo da lista, em TXT
# Nota: Se você não tiver o arquivo em TXT, é possível convertê-lo a partir de
# um PDF utilizando o comando/aplicativo/programa pdftotext
arquivoDaListaEmTXT=${1:-lista-de-espera-completa_sisu-2024.txt}
ordenador=${2:-2}

# Captura apenas as linhas que contêm o número de inscrição, deixando todo
# restante do conteúdo de fora
grep -E '[0-9]{12}' ${arquivoDaListaEmTXT} | \
# Transforma quaisquer sequências com mais de um espaço em apenas um
tr -s ' ' | \
# Remove a coluna com o número de inscrição do(a) participante
sed -E 's#^.[0-9]*[^A-Z]*##' | \
# Adiciona o separador ponto e vírgula entre os campos de Nome, Nota e Cota
sed 's# \([0-9]\{3\}\.[0-9]\{4\}\) #;\1;#' | \
# Ordena a saída de acordo com o valor passado para o parâmetro -k
sort -t ';' -rk ${ordenador} | cat -n | less
