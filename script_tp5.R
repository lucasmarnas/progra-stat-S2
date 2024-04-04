setwd("L:/BUT/SD/_Données/Promo 2023/Programmation Statistique sous R/GitHub/IUT_SD1/dataset/nba")
fichiers = list.files( path = getwd(), pattern = ".csv$", full.names = TRUE)
print(fichiers[1])
nom_fichier_1 = basename(path = fichiers[1])
library(tools)
nom_fichier_1_sans_ext = file_path_sans_ext(x = nom_fichier_1)
assign(nom_fichier_1_sans_ext, value = read.csv(fichiers[1], sep = ",", dec = "."))

for (fichier in fichiers) {
  nom_fichiers_sans_ext = file_path_sans_ext(basename(fichier))
  assign(nom_fichiers_sans_ext, read.csv(fichier,
                                         sep = ",",
                                         dec = "."))
}
equipe_LA = subset(team, city == "Los Angeles", select = c("id", "city"))
idmatch_and_idhometeam = subset(game, select = c("game_id", "team_id_home"))
match_LA = merge(x = equipe_LA, y = idmatch_and_idhometeam, by.x = "id", by.y = "team_id_home", all.x = TRUE)

affluence = subset(game_info, select = c("game_id","attendance"))
afflu_match_LA = merge(x = affluence, y = match_LA, by = "game_id", all.x = TRUE)
mean(afflu_match_LA$attendance, na.rm = TRUE)
