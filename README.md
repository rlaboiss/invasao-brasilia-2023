# Análise demográfica das pessoas presas após os ataques na praça dos Três Poderes em Brasília no dia 8 de janeiro de 2023


## Introdução

Este repositório contém os dados publicados pela Secretaria de Estado de Administração Penitenciária do Distrito Federal (SEAPE), assim que o programa em R para análise demográfica dos mesmos.

A lista de pessoas presas nos atos terroristas na Praça dos Três Poderes é atualizada frequentemente 
na [ṕagina da SEAPE](https://seape.df.gov.br/prisoes-dos-atentados-bsb/), contendo os nomes completos e as datas de nascimento das pessoas.


## Análise

A [lista atual](presos.csv), na data 12 de janeiro de 2023, contém 1193 nomes. Esta lista não corresponde à ultima listagem disponibilizada pela SEAPE. Todos os nomes que figuravam nas listas previamente publicadas foram mantidos.

Destas 1183 pessoas, 494 são mulheres e 699 são homens. Há 10 pessoas cujas datas de nascimento não estão informadas no arquivo da SEAPE. Uma pessoa com idade inferior a 18 anos e uma pessoa com idade de 86 anos foram suprimidas da análise, pois acredito tratar-se de erros de digitação. A data de nascimento de uma pessoa foi corrigida de “1696” para “1996”. A análise aqui presente é assim relativa a 1177 pessoas (480 mulheres e 697 homens).

A distribuição de idades é mostrada no gráfico abaixo, com as pessoas agrupadas em faixas etárias de 5 anos. Mulheres são representadas na cor rosa e homens na cor azul.

![figure](histograma-idades.png)

A idade mínima é de 18,5 anos e a máxima de 74.8 anos. 68,1% das pessoas têm entre 40 e 60 anos e 36,8% deles têm entre 45 e 55 anos. Está claro que o grosso do contingente é formado por pessoas de meia idade.

A média de idade das mulheres é de 46,3 anos e a dos homens é de 44,6 anos. Esta diferença de idade de quase 2 anos entre homens e mulheres é estatisticamente significativa (_p_ < 0.01).

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
