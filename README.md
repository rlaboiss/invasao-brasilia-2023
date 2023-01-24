# Análise demográfica das pessoas presas após os ataques na praça dos Três Poderes em Brasília no dia 8 de janeiro de 2023


## Introdução

Este repositório contém os dados publicados pela Secretaria de Estado de Administração Penitenciária do Distrito Federal (SEAPE-DF), assim que o programa em R para análise demográfica dos mesmos.

A lista de pessoas presas nos atos terroristas na Praça dos Três Poderes é atualizada frequentemente 
na [ṕagina da SEAPE-DF](https://seape.df.gov.br/prisoes-dos-atentados-bsb/), contendo os nomes completos, as datas de nascimento e o estado de origem das pessoas.


## Análise


### Gênero

A [lista atual](presos.csv), contém 1429 nomes. Esta lista não corresponde à ultima listagem disponibilizada pela SEAPE, que contém 1388 nomes, na listagem publicada em 22 de janeiro de 2023. Todos os nomes que figuravam nas listas previamente publicadas foram mantidos. Destas 1429 pessoas, 494 são mulheres e 935 são homens.


### Idades

A distribuição de idades é mostrada no gráfico abaixo, com as pessoas agrupadas em faixas etárias de 5 anos. Mulheres são representadas na cor rosa e homens na cor azul. Todas as idades relatadas nesta análise são relativas ao dia 8 de janeiro de 2023.

![figure](histograma-idades.png)

A idade mínima é de 18,0 anos e a máxima de 74,8 anos. 66,3% das pessoas têm entre 40 e 60 anos e 35,2% deles têm entre 45 e 55 anos. Está claro que o grosso do contingente é formado por pessoas de meia idade.

A mediana de idade das mulheres é de 47,9 anos e a dos homens de 44,8 anos. A média de idade das mulheres é de 46,4 anos e a dos homens é de 43,8 anos. Esta diferença de idade de 2,6 anos entre homens e mulheres é estatisticamente significativa (_t_[1122.6] = 4.72, _p_ < 0.001).

Cabe observar que a faixa de idade com maior representatividade entre as mulheres é entre 50 e 55 anos.


## Procedência

O número de pessoas por estado está indicado na tabela abaixo (a informação do estado de origem está ausente para 43 pessoas):

|estado|número de pessoas presas|porcentagem do total|presos/população|
|-|-|-|-|
|SP|271|19.6%|5.91|
|MG|201|14.5%|9.65|
|PR|131|9.5%|11.15|
|MT|104|7.5%|27.22|
|RS|101|7.3%|9.29|
|SC|90|6.5%|11.34|
|DF|82|5.9%|28.05|
|BA|67|4.8%|4.71|
|GO|51|3.7%|7.05|
|RO|42|3.0%|25.37|
|PA|41|3.0%|4.74|
|RJ|33|2.4%|1.99|
|MS|32|2.3%|11.29|
|CE|25|1.8%|2.80|
|TO|19|1.4%|12.62|
|ES|18|1.3%|4.38|
|PB|15|1.1%|3.72|
|AL|13|0.9%|4.16|
|MA|11|0.8%|1.62|
|PE|11|0.8%|1.22|
|RN|9|0.6%|2.72|
|PI|8|0.6%|2.45|
|AM|6|0.4%|1.52|
|AC|3|0.2%|3.62|
|RR|1|0.1%|1.58|
|SE|1|0.1%|0.45|

O número de presos por estado, dividido pela
[população](populacao-2022.csv), está relacionado à [porcentagem de votos em
Jair Bolsonaro no segundo turno da eleição presidencial de
2022](eleicao-2022.csv), como indica o gráfico abaixo.

![figure](votos-bolsonaro-numero-presos.png)

Neste gráfico, cada estado está representado pela sua sigla.
Foram incluídos na análise os estados que apresentam número de presos maior do que 3, para efeitos de confiabilidade da análise. A população de cada estado corresponde àquela publicada pelo IBGS na [prévia do censo de 2022](https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/Previa_da_Populacao/POP2022_Municipios.pdf). Note que o eixo vertical do gráfico (número de presos) está em escala logarítmica, o que é adequado para variáveis de contagem. A correlação entre as duas variáveis é significativamente diferente de zero (_r_ = 0.72, _t_[21] = 4.77, _p_ < 0.001). A linha de regressão entre as duas variáveis está indicada em vermelho no gráfico.

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
