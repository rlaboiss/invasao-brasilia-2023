# Análise demográfica das pessoas presas após os ataques na praça dos Três Poderes em Brasília no dia 8 de janeiro de 2023


## Introdução

Este repositório contém os dados publicados pela Secretaria de Estado de Administração Penitenciária do Distrito Federal (SEAPE-DF), assim que o programa em R para análise demográfica dos mesmos.

A lista de pessoas presas nos atos terroristas na Praça dos Três Poderes é atualizada frequentemente 
na [ṕagina da SEAPE-DF](https://seape.df.gov.br/prisoes-dos-atentados-bsb/), contendo os nomes completos, as datas de nascimento e o estado de origem das pessoas.


## Análise


### Gênero

A [lista atual](presos.csv), contém 1429 nomes. Esta lista não corresponde à ultima listagem disponibilizada pela SEAPE, que contém 1298 nomes, na listagem publicada em 17 de fevereiro de 2023. Todos os nomes que figuravam nas listas previamente publicadas foram mantidos. Destas 1429 pessoas, 494 são mulheres e 935 são homens.


### Idades

A distribuição de idades é mostrada no gráfico abaixo, com as pessoas agrupadas em faixas etárias de 5 anos. Mulheres são representadas na cor rosa e homens na cor azul. Todas as idades relatadas nesta análise são relativas ao dia 8 de janeiro de 2023.

![figure](histograma-idades.png)

A idade mínima é de 18,0 anos e a máxima de 74,7 anos. 66,3% das pessoas têm entre 40 e 60 anos e 35,2% deles têm entre 45 e 55 anos. Está claro que o grosso do contingente é formado por pessoas de meia idade.

A mediana de idade das mulheres é de 47,9 anos e a dos homens de 44,8 anos. A média de idade das mulheres é de 46,4 anos e a dos homens é de 43,8 anos. Esta diferença de idade de 2,6 anos entre homens e mulheres é estatisticamente significativa (_t_[1122.2] = 4.70, _p_ < 0.001).

Cabe observar que a faixa de idade com maior representatividade entre as mulheres é entre 50 e 55 anos.


## Procedência

O número de pessoas por estado está indicado na tabela abaixo (a informação do estado de origem está ausente para 43 pessoas):

|estado|número de pessoas presas|porcentagem do total|presos/população|
|-|-|-|-|
|SP|276|19.9%|6.00|
|MG|208|15.0%|10.03|
|PR|132|9.5%|11.15|
|RS|106|7.6%|9.56|
|MT|93|6.7%|24.58|
|SC|86|6.2%|11.08|
|BA|69|5.0%|4.71|
|DF|56|4.0%|19.16|
|GO|55|4.0%|7.91|
|RO|41|3.0%|25.37|
|MS|40|2.9%|14.12|
|PA|39|2.8%|4.62|
|RJ|32|2.3%|1.93|
|CE|26|1.9%|2.91|
|ES|20|1.4%|4.87|
|TO|20|1.4%|12.62|
|PB|16|1.2%|3.97|
|MA|15|1.1%|2.21|
|PE|14|1.0%|1.55|
|AL|13|0.9%|4.16|
|RN|10|0.7%|3.03|
|PI|8|0.6%|2.45|
|AM|5|0.4%|1.27|
|AC|3|0.2%|3.62|
|SE|2|0.1%|0.90|
|RR|1|0.1%|1.58|

O número de presos por estado, dividido pela
[população](populacao-2022.csv), está relacionado à [porcentagem de votos em
Jair Bolsonaro no segundo turno da eleição presidencial de
2022](eleicao-2022.csv), como indica o gráfico abaixo.

![figure](votos-bolsonaro-numero-presos.png)

Neste gráfico, cada estado está representado pela sua sigla.
Foram incluídos na análise os estados que apresentam número de presos maior do que 5, para efeitos de confiabilidade da análise. A população de cada estado corresponde àquela publicada pelo IBGS na [prévia do censo de 2022](https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/Previa_da_Populacao/POP2022_Municipios.pdf). Note que o eixo vertical do gráfico (número de presos) está em escala logarítmica, o que é adequado para variáveis de contagem. A correlação entre as duas variáveis é significativamente diferente de zero (_r_ = 0.76, _t_[20] = 5.31, _p_ < 0.001). A linha de regressão entre as duas variáveis está indicada em vermelho no gráfico.

Note que a correlação acima é feita entre o resultado da eleição e o número de presos **dividido pela população do estado** e não o número de presos simplesmente. A razão para esta escolha é que o número de presos é correlacionada à população de cada estado (_r_ = 0.84, _t_[20] = 6.86, _p_ < 0.001). Isto faz com que a população do estado se torne uma variável de confusão no estudo. A normalização do número de presos pela população do estado minimiza este problema.

### Código para esta análise

O código que permite obter os resultados relatados acima, assim como os gráficos, se encontra no arquivo [analise.r](analise.r), escrito na linguagem de programação [R](https://www.r-project.org/).


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
