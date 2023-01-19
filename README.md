# Análise demográfica das pessoas presas após os ataques na praça dos Três Poderes em Brasília no dia 8 de janeiro de 2023


## Introdução

Este repositório contém os dados publicados pela Secretaria de Estado de Administração Penitenciária do Distrito Federal (SEAPE-DF), assim que o programa em R para análise demográfica dos mesmos.

A lista de pessoas presas nos atos terroristas na Praça dos Três Poderes é atualizada frequentemente 
na [ṕagina da SEAPE-DF](https://seape.df.gov.br/prisoes-dos-atentados-bsb/), contendo os nomes completos e as datas de nascimento das pessoas.


## Análise

A [lista atual](presos.csv), contém 1430 nomes. Esta lista não corresponde à ultima listagem disponibilizada pela SEAPE, que contém 1382 nomes, na listagem publicada em 19 de janeiro de 2023. Todos os nomes que figuravam nas listas previamente publicadas foram mantidos. 

Destas 1430 pessoas, 495 são mulheres e 935 são homens. Uma pessoa com idade de 123 anos foi suprimida da análise, pois acredito tratar-se de um erro de digitação. A análise aqui presente é assim relativa a 1429 pessoas (494 mulheres e 935 homens).

A distribuição de idades é mostrada no gráfico abaixo, com as pessoas agrupadas em faixas etárias de 5 anos. Mulheres são representadas na cor rosa e homens na cor azul.

![figure](histograma-idades.png)

A idade mínima é de 18,1 anos e a máxima de 74.8 anos. 66% das pessoas têm entre 40 e 60 anos e 35,1% deles têm entre 45 e 55 anos. Está claro que o grosso do contingente é formado por pessoas de meia idade.

A mediana de idade das mulheres é de 47,8 anos e a dos homens de 44,9 anos. A média de idade das mulheres é de 46,4 anos e a dos homens é de 43,8 anos. Esta diferença de idade de 2,6 anos entre homens e mulheres é estatisticamente significativa (_p_ < 0.001).

Cabe observar que a faixa de idade com maior representatividade entre as mulheres é entre 50 e 55 anos.


## Author

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Copyright © 2023  Rafael Laboissière (<rafael@laboissiere.net>)

O material contido neste repositório pode ser livremente distribuído e reproduzido de acordo com os termos da licença [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).


<!---
Local Variables:
ispell-local-dictionary: "brasileiro"
eval: (auto-fill-mode -1)
eval: (visual-line-mode)
eval: (flyspell-mode)
End:
--->
