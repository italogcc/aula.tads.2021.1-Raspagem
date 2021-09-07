# RASPAGEM DE DADOS
# Os vinte clubes que mais participaram dos torneios que compoem o Campeonato Brasileiro de Futebol ao longo dos anos.

library(ggplot2)
library(rvest)
library(dplyr)

baseDeDadosClubesMais <- "https://pt.wikipedia.org/wiki/Campeonato_Brasileiro_de_Futebol"

# Raspagem fazendo uso da funcao html_nodes e html_table
# Captura a setima tabela da base de dados

tabela_ClubesMais <- read_html(baseDeDadosClubesMais) %>%
    html_nodes("table") %>%
    .[(7)] %>%
    html_table(header = TRUE)

# Conversao para data frame e ajuste do nome de coluna

dataFrame_ClubesMais <- data.frame(tabela_ClubesMais)
colnames(dataFrame_ClubesMais)[colnames(dataFrame_ClubesMais) == "Total.de.participações.1959.2021."] <- "Total"
View(dataFrame_ClubesMais)

# Tratamento da exibicao dos dados do grafico

ggplot(dataFrame_ClubesMais) +
  aes(x = Clube, y = Total, color = Clube) +
  geom_point(size = 5) +
  ggtitle("20 clubes com maiores participacoes no modelo Campeonato Brasileiro de Futebol") +
  xlab("Clubes") +
  ylab("Participacoes") +
  ylim (c(0, 70)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
