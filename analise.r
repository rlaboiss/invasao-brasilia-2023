presos.raw <- read.csv ("presos.csv")
nrow (presos.raw)
table (presos.raw$genero)

presos <- subset (presos.raw, data.nascimento != "")
nrow (presos)

presos$data.nascimento <- as.Date (presos$data.nascimento)
presos$idade <- as.numeric (as.Date ("2023-01-08")
                            - presos$data.nascimento) / 365.25

nrow (subset (presos, idade < 18))
nrow (subset (presos, idade >= 80))

presos <- subset (presos, idade >= 18 & idade < 80)
nrow (presos)
table (presos$genero)

summary (presos$idade)

n <- nrow (presos)
length (which (presos$idade > 45 & presos$idade < 55)) / n
length (which (presos$idade > 40 & presos$idade < 60)) / n

(mean.df <- aggregate (presos, idade ~ genero, mean))
mean.f <- mean.df$idade [1]
mean.m <- mean.df$idade [2]
aggregate (presos, idade ~ genero, median)
t.test (idade ~ genero, presos)

h <- hist (presos$idade, plot = FALSE)
max.count <- max (h$counts)

png (file = "histograma-idades.png", height = 640, width = 640, pointsize = 24)
par (mar = c (5, 4, 0.1, 0.1))
plot (h, col = "cyan", las = 1, ylim = c (-20, max.count),
      xlab = "idade (em anos)", ylab = "quantidade de pessoas", main = "")
hist (subset(presos, genero == "F")$idade, col = "pink", breaks = h$breaks,
      add = TRUE)
lines (mean.f + c (5, 0, 0), c (-15, -15, max.count), col = "#ff000080",
       lwd = 3)
text (mean.f + 6, -15, adj = c (0, 0.5), col = "#ff000080",
      label = sprintf ("média M: %.1f", mean.f))
lines (mean.m + c (-5, 0, 0), c (-15, -15, max.count), col = "#0000ff80",
       lwd = 3)
text (mean.m - 6, -15, adj = c (1, 0.5), col = "#0000ff80",
      label = sprintf ("média H: %.1f", mean.m))
legend ("topleft", legend = c("mulheres", "homens"), pch = 15,
        col = c("pink", "cyan"), inset = 0.05)
dev.off ()

election <- read.csv ("eleicao-2022.csv")
population <- read.csv ("populacao-2022.csv")
election$count <- election$count.pop <- NA
for (i in names(uf.count)) {
    idx <- which (election$uf == i)
    election$count [idx] <- uf.count [i]
    election$count.pop [idx] <- 1e6 * (uf.count [i]
        / population$populacao [which (population$uf == i)])
}

uf.count <- sort (table (presos$uf), decreasing = TRUE)
uf.count <- uf.count [which (names (uf.count) != "")]
cat ("\n|estado|número de pessoas presas|porcentagem do total|presos/população|\n|-|-|-|-|\n")
s <- sum (uf.count)
for (i in names (uf.count))
    cat (sprintf ("|%s|%s|%.1f%%|%.2f|\n", i, uf.count [i],
                  100 * (uf.count [i] / s),
                  election$count.pop [which (election$uf == i)]))

election <- subset (election, count > 5)
cor.test (election$votos.bolsonaro, log (election$count.pop))

png (file = "votos-bolsonaro-numero-presos.png", height = 640, width = 640,
     pointsize = 24)
par (mar = c (5, 4, 0.1, 0.1))
plot (election$votos.bolsonaro, election$count.pop,
      log = "y", type = "n", las = 1, bty = "n",
      xlab = "% de votos em Bolsonaro 2º turno 2022",
      ylab = "número de presos por milhão de habitantes")
text (election$votos.bolsonaro, election$count.pop, labels = election$uf)
fm <- lm (log (count.pop) ~ votos.bolsonaro, election)
x.pred <- seq (min (election$votos.bolsonaro), max (election$votos.bolsonaro),
               by = 0.1)
lines (x.pred, exp (predict (fm,
                             newdata = data.frame (votos.bolsonaro = x.pred))),
       lwd = 5, col = "#ff000080")
dev.off ()
