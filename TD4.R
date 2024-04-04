setwd("L:/BUT/SD/Promo 2023/lmarnas/R/TD4")
df = read.csv(file = "velov.csv",
              header = TRUE,
              sep = ";", 
              dec = "," )
summary(df)
df$status = as.factor(df$status)
df$CodePostal = as.factor(df$CodePostal)
summary(df)
df$bornes = ifelse(df$capacity != (df$bikes + df$stands), "KO" , "OK")
table(df$bornes)
hist(x = df$capacity,
     main = "Distribution de \n la capacité des stations")
hist(x = df$capacity,
     main = "Distribution de \n la capacité des stations",
     breaks = 6)
hist(x = df$capacity,
     main = "Distribution de \n la capacité des stations",
     col = "red",
     breaks = 6)
hist(x = df$capacity,
     main = "Distribution de \n la capacité des stations",
     xlab = "Capacity",
     col = "red",
     breaks = 6)
abline(h = 100,
       col = "blue",
       lty = 2)
abline(h = 100,
       col = "blue",
       lty = 2)
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity")
lines(x = density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 4)
hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0, 0.08))
lines(x = density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 4)
boxplot(x = df$capacity,
        main = "Diagramme en boîte \n de la capacité des stations")
boxplot(x = df$capacity,
        main = "Diagramme en boîte \n de la capacité des stations",
        horizontal = TRUE)
boxplot(x = df$capacity,
        main = "Diagramme en boîte \n de la capacité des stations",
        horizontal = FALSE,
        outline = FALSE)
points(mean(df$capacity),
       col = "red",
       pch = 15,
       cex = 2)
points(mean(df$capacity),
       col = "red",
       pch = 15,
       cex = 2)
par(mfrow=c(1,2))
df7 = subset(df, CodePostal == "69007")
df8 = subset(df, CodePostal == "69008")
boxplot(x = df7$bikes,
        main = "boxplot nb vélos \n 7e arrondissement")
boxplot(x = df8$bikes,
        main = "boxplot nb vélos \n 8e arrondissement",
        ylim = c(0,35))
par(mfrow=c(1,1)) #fenêtre sur 1 ligne et 1 colonne
# Tracer le graphique boxplot
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")