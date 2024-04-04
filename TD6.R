"partie 1"
setwd("L:/BUT/SD/Promo 2023/lmarnas/R/TD6")
df <- read.csv(file = "nba2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")
View(df)
nrow(df)
ncol(df)
colnames(df)
df$PERIOD <- as.factor(df$PERIOD)
df$PTS_TYPE <- as.factor(df$PTS_TYPE)
df$SHOOTER = as.factor(df$SHOOTER)

"partie 2"
length(levels(df$PERIOD))
length(df$PTS_TYPE)
length(df$SHOOTER)
summary(df)
sd(df$SHOT_DIST)
sd(df$SHOT_CLOCK, na.rm = TRUE)
     
#combien de tirs manqués/réussis
table(df["SHOT_RESULT"])
#les quartiles
quantile(df$SHOT_CLOCK, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
#les déciles
quantile(df$CLOSE_DEF_DIST, probs = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9))
#nombre de matches différents
liste_game <- unique(df$GAME_ID)
length(liste_game)
#nombre de joueurs différents
df$SHOOTER <- as.factor(df$SHOOTER)
nlevels(df$SHOOTER)
#conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
df$SHOT_DIST_METRE = df$SHOT_DIST * 0.30
#nombre de points qu'a rapporté la tentative (0,2 ou 3)  
df$PTS_MARQUES <- ifelse(df$SHOT_RESULT == "made", yes = df$PTS_TYPE, no = 0)
#On supprime la variable GAME_RESULT car elle n'est pas utile
df$GAME_RESULT <- NULL
#création d'un objet sans la première colonne GAME_ID
df2 <- df[ -1 ]

"Partie 3"
#Les 100 tirs réussis ou manqués les plus loin
rang <- order(df$SHOT_DIST, decreasing = TRUE)
df3 <- df[rang[ 1:100],]

#Les 100 tirs réussis les plus loin
df4 = subset(df2, SHOT_RESULT == "made")
df4 <- df[ 1 : 100 , ]

#Combien de tirs à 3 points a réussi Kobe Bryant ?
df_kobe = subset(df,SHOT_RESULT == "made" &
                   PTS_TYPE == 3 & 
                   SHOOTER == "kobe bryant")

dim(df_kobe)

#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = sum)
df_total_tri <- order(df_total$PTS_MARQUES, decreasing = TRUE)
df_top5 <-  df_total_tri[  5  ,  ]
