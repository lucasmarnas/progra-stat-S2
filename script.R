# Créer une toile de fond vide pour le graphique
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")
# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

#loi normale
normale = rnorm(10000, mean = 0, sd = 1)
hist(normale, main = "loi normale", probability = TRUE)
median(normale)
quantile(normale)
quantile(normale, c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9))
quantile(normale, 0.95)
qnorm(0.95, 0, 1)
pnorm(1.644854, 0, 1)
qnorm(0.975, 0, 1)
pnorm(1.96, 0, 1)

#matrice proba
lignes = seq(from = 0, to = 3.9, by = 0.1)
colonnes = seq(from = 0, to = 0.09, by = 0.01)

proba_colonne = c()
for (i in colonnes) 
  {
    proba_ligne = c()
    for (j in lignes) 
      {
        quantiles = i + j
        proba = round(pnorm(quantiles, 0, 1), digits = 4)
        proba_ligne = c(proba_ligne, proba)
      }
    proba_colonne = cbind(proba_colonne, proba_ligne)
}
View(proba_colonne)
class(proba_colonne)
table = data.frame(proba_colonne)
colnames(table) = colonnes
rownames(table) = lignes
View(table)
pop = rnorm(10000000, 171, 9)
mean(pop)
sd(pop)
hist(pop, probability = TRUE)
#observé
pop190 = pop[pop < 190]
length(pop190)
length(pop190) / length(pop)

#en théorie
pnorm(q = 190, mean=mean(pop), sd=sd(pop))*1e7

#observé
pop200 = pop[pop >= 200]
length(pop200)
length(pop200) / length(pop)

#en théorie
#proba de P( X < 200cm)
proba_inf_200 = pnorm(q = 200, mean=mean(pop), sd=sd(pop))
#proba de P( X >= 200cm)
1 - proba_inf_200