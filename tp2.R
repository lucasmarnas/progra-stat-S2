fao = read.csv("L:/BUT/SD/Promo 2023/lmarnas/R/TP2/fao.csv", header = TRUE, dec = ",", sep = ";")
class(fao$Nom)
class(fao$Dispo_alim)
class(fao$Prod_viande)
class(fao$Import_viande)
class(fao$Export_viande)
class(fao$Population)
#nbr pays
nrow(fao)
#résumé
summary(fao)

#exo2
#moyenne dispo_alim
mean(fao$Dispo_alim)
#nbr hab dans le monde
sum(fao$Population,na.rm = TRUE)
#écart-type exp viandes
sd(fao$Export_viande, TRUE)
#écart-type imp viandes
sd(fao$Import_viande, TRUE)
#médiane prod viandes
median(fao$Prod_viande, TRUE)
#quartiles dispo_alim
quantile(fao$Dispo_alim, seq(0.25, 0.75, 0.25))
#centiles imp viandes
quantile(fao$Dispo_alim, seq(0.1, 0.9, 0.1))

#exo3
#top5 -peuplés
View(head(fao[order(fao$Population),], 5))
#top5 +peuplés
View(head(fao[order(fao$Population, decreasing =  TRUE),], 5))
#top5 +prod viandes
View(head(fao[order(fao$Prod_viande, decreasing =  TRUE),], 5))
#top5 +imp viandes
View(head(fao[order(fao$Import_viande, decreasing =  TRUE),], 5))
#pays >2300 kcal
View(subset(fao, Dispo_alim >= 2300))
