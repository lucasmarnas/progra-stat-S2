'EXO 1'
'Q1'
salaire_net_cadre = function(salaire_brut)
{
  salaire_net_avant_impôt = salaire_brut * 0.75
  return(salaire_net_avant_impôt)
}
salaire_net_cadre(salaire_brut = 2500)

'Q2'
salaire_net_cadre = function(salaire_brut = 2500)
{
  salaire_net_avant_impôt = salaire_brut * 0.75
  return(salaire_net_avant_impôt)
}
salaire_net_cadre()

'Q3'
salaire_net_cadre = function( salaire_brut = 2500, temps_travail = 1)
{
  salaire_net_avant_impôts = salaire_brut * 0.75 * temps_travail
  return(salaire_net_avant_impôts)
}
salaire_net_cadre(temps_travail = 0.75)

'Q4'
salaire_net_cadre = function( salaire_brut = 2500, temps_travail = 1)
{
  if(!is.numeric(salaire_brut))
  {
    return("ERREUR : Le salaire brut doit être une valeur numérique")
  }
  salaire_net_avant_impôts = salaire_brut * 0.75 * temps_travail
  return(salaire_net_avant_impôts)
}
salaire_net_cadre(salaire_brut = "2000")
salaire_net_cadre(salaire_brut = 2000)

'Q5'
salaire_net_cadre = function( salaire_brut = 2500, temps_travail = 1)
{
  if(!is.numeric(salaire_brut))
  {
    return("ERREUR : Le salaire brut doit être une valeur numérique")
  }
  if(!is.numeric(temps_travail) | (temps_travail < 0) | (temps_travail > 1))
  {
    return("ERREUR : Le temps de travail doit être une valeur numérique comprise entre 0 et 1")
  }
  salaire_net_avant_impôts = salaire_brut * 0.75 * temps_travail
  return(salaire_net_avant_impôts)
}
salaire_net_cadre(temps_travail = 2)

'Q6'
salaire_net = function( salaire_brut = 2500, temps_travail = 1, statut)
{
  if(!is.numeric(salaire_brut))
  {
    return("ERREUR : Le salaire brut doit être une valeur numérique")
  }
  if(!is.numeric(temps_travail) | (temps_travail < 0) | (temps_travail > 1))
  {
    return("ERREUR : Le temps de travail doit être une valeur numérique comprise entre 0 et 1")
  }
  if(!statut %in% c("cadre", "non cadre"))
  {
    return("ERREUR : le statut ne peut que cadre ou non cadre")
  }
  if(statut == "cadre")
  {
    salaire_net_avant_impôts = salaire_brut * 0.75 * temps_travail
  }
  else
  {
    salaire_net_avant_impôts = salaire_brut * 0.78 * temps_travail
  }
  return(salaire_net_avant_impôts)
}
salaire_net(statut = "non cadre")

'EXO 2'
'Q1'
somme = 0
for (v in 1:5)
{
  somme = somme + v
  print(somme)
}
'Q2'
somme = 0
v=1
while (somme <= 50) 
{
  somme = somme + v
  print(somme)
}