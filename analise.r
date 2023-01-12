presos.raw <- read.csv ("presos.csv")

presos <- subset (presos.raw, data.nascimento != "")
nrow (presos)
presos$data.nascimento <- as.Date (presos$data.nascimento)
presos$idade <- as.numeric (Sys.Date() - presos$data.nascimento) / 365.25
presos <- subset (presos, idade >= 18 & idade < 70)

nrow (presos.raw)
nrow (presos)

table (presos.raw$genero)
table (presos$genero)

n <- nrow (presos)
length (which (presos$idade > 45 & presos$idade < 55)) / n
length (which (presos$idade > 40 & presos$idade < 60)) / n

summary (presos$idade)
aggregate (presos, idade ~ genero, mean)
anova (lm (idade ~ genero, presos))

h <- hist (presos$idade)

png (file = "histograma-idades.png", height = 640, width = 640, pointsize = 24)
par (mar = c (5, 4, 0.1, 0.1))
plot (h, col = "cyan", las = 1,
      xlab = "idade (em anos)", ylab = "quantidade de pessoas", main = "")
hist (subset(presos, genero == "F")$idade, col = "pink", breaks = h$breaks,
      add = TRUE)
legend ("topleft", legend = c("mulheres", "homens"), pch = 15,
        col = c("pink", "cyan"), inset = 0.05)
dev.off ()
