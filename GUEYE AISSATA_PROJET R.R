getwd()
install.packages("rmarkdown")
library(readxl)
library(dplyr)
library(tidyverse)
library(rmarkdown)
library(stringr)
# importation et mise en forme
projet<-read_excel("Base_Partie 1.xlsx")
View(projet)

section_description <- projet %>% dplyr::select(-key)##Dans cette expression, nous utilisons l'opérateur `--avant le nom de la colonne que nous
section_description

valeurs_manquantes<-colSums(is.na(projet))
tab<-data.frame(variable=names(valeurs_manquantes),valeurs_manquantes=valeurs_manquantes)
print(tab)
# Calculer le nombre de valeurs manquantes par variable
valeurs_manquantes <- colSums(is.na(projet))
#valeurs_manquantes
# Calculer la proportion des valeurs manquantes par variable
somme<-sum(valeurs_manquantes)
somme
proportions <- valeurs_manquantes/somme
proportions
# Créer le tableau résumé
tableau_resume <- data.frame(valeurs_manquantes, proportions)

# Afficher le résultat
print(tableau_resume)


## la variable key n'a aucune valeur manquante
#[VMK<projet,is.na(.,select(key))
## Création de variable
projet<-rename(projet,region=q1)##la fonction rename est une fonction de base R permet de renommer le nom des var

projet<-rename(projet,departement=q2)
projet<-rename(projet,sexe=q23)
View(projet)


projet<-projet %>% dplyr::mutate(sexe_2 = ifelse(sexe =="Femme","1","0"))#mutate()de dplyr pour créer une nouvelle variable appelée sexe_2. La fonction ifelse()est utilisée pour assignersexe_2lorsque la valeur de lasexeest "femme", sinon
View(projet)
#data frame langue
langues<-data.frame(projet%>%dplyr::select("key",starts_with("q24a")))
langues
#création de la variable parle
langues<-langues %>% dplyr::mutate(parle=rowSums(select(.,starts_with("q24a"))))
langues
##selection de key et parle
langues<-langues%>%dplyr::select(key,parle)
langues                                 
##merger les deux data frame
New_projet<-merge(projet,langues)
New_projet
#2 analyse descriptive



## Création du tableau pour les variables univariées
tableau_univarie <- matrix(0, nrow = 0, ncol = 2) 
#Répartition des PME selon le sexe
repartition_sexe<-table(New_projet$sexe)
tableau_univarie <- rbind(tableau_univarie, repartition_sexe)
tableau_univarie
repartition_N.I<-table(New_projet$q25)
tableau_univarie <- rbind(tableau_univarie, repartition_N.I)
tableau_univarie
# Répartition des PME selon le niveau d'instruction
repartition_niveau_instr 
repartition_n
<- table(data$niveau)
tableau_univarie 
tableau_univar

table
<- rbind(tableau_univarie, repartition_niveau_instr)

# Répartition des PME selon le statut juridique
repartition_statut_jur <- table(data$statut_juridique)
tableau_univarie <- rbind(tableau_univarie, repartition_statut_jur)

# Répartition des PME selon le propriétaire/locataire
repartition_proprio_loc <- table(data$proprietaire_locataire)
tableau_univarie 
tableau_univarie

table
<- rbind(tableau_univarie, repartition_proprio_loc)

# Affichage du tableau pour les variables univariées
print(tableau_univarie)
Variables bivariées :
  Créer un tableau pour stocker
Utilisez la fonction `tabletable()pour chaque
Voici un exemple de code pour les variables bivariées :
  
  R

Copier le code
# Création du tableau pour les variables bivariées
tableau_bivarie 
tableau_b
<- matrix(0, nrow = 0, ncol = 3)

# Répartition des PME selon le statut juridique et le sexe
repartition_statut_sexe 
repartition_statut
<- table(data$statut_juridique, data$sexe)
tableau_bivarie 
tableau_bivar

table
<- rbind(tableau_bivarie, as.matrix(repartition_statut_sexe))

# Répartition des PME selon le niveau d'instruction et le sexe
repartition_niveau_sexe 
repartition_niveau

repartition
<- table(data$niveau_instruction, data$sexe)
tableau_bivarie <- rbind(tableau_bivarie, as.matrix(repartition_niveau_sexe))

# Répartition des PME selon le propriétaire/locataire et le sexe
repartition_proprio_sexe 
repartition_proprio_sexe
<- table(data$proprietaire_locataire, data$sexe)
tableau_bivarie <- rbind(tableau_bivarie, as.matrix(repartition_proprio_sexe))

# Affichage du tableau pour les variables bivariées
print(tableau_bivarie)
Dans cet exemple,tableau_univarie, tandis que les répartitions destableau_bivarie.

préparez-vous à remplacerdatapar le nom de votre





Utilisateur
ligne=0 signifie quoi
ChatGPT
​row = 0verser

Dans l'exemple donnétableau_univarieet `tableautableau_bivariesont desrow = 0et `ncolncolspécial

Salle de bains attenanterbind(), nous

L'utilisation de `ligne = 0row = 0au départ nous





Utilisateur
si la taille de la répartition sexe et niveau d'instruction est différente le code ne va pas marché
ChatGPT
​rbind()nécessite que les matrices ou tableaux aient le m

Pour résoudre ce problème, vous pouvez utiliser la fonction cbind()pour combiner les répartitions des variables univariées en ajoutant

R

Copier le code
# Création du tableau pour les variables univariées
tableau_univarie <- matrix(0, nrow = max(length(repartition_sexe), length(repartition_niveau_instr)), ncol = 2)

# Répartition des PME selon le sexe
repartition_sexe <- table(data$sexe)
tableau_univarie[, 1] <- repartition_sexe

# Répartition des PME selon le niveau d'instruction
repartition_niveau_instr <- table(data$niveau_instruction)
tableau_univarie
table


# Affichage du tableau pour les variables univariées
print(tableau_univarie)


### Création du tableau pour les variables bivariées
tableau_bivarie 
tableau_b
<- matrix(0, nrow = 0, ncol = 3)

# Répartition des PME selon le statut juridique et le sexe
repartition_statut_sexe 
repartition_statut
<- table(data$statut_juridique, data$sexe)
tableau_bivarie 
tableau_bivar

table
<- rbind(tableau_bivarie, as.matrix(repartition_statut_sexe))

# Répartition des PME selon le niveau d'instruction et le sexe
repartition_niveau_sexe 
repartition_niveau

repartition
<- table(data$niveau_instruction, data$sexe)
tableau_bivarie <- rbind(tableau_bivarie, as.matrix(repartition_niveau_sexe))

# Répartition des PME selon le propriétaire/locataire et le sexe
repartition_proprio_sexe 
repartition_proprio_sexe
<- table(data$proprietaire_locataire, data$sexe)
tableau_bivarie <- rbind(tableau_bivarie, as.matrix(repartition_proprio_sexe))

# Affichage du tableau pour les variables bivariées
print(tableau_bivarie)
Dans cet exemple,tableau_univarie, tandis que les répartitions destableau_bivarie.

préparez-vous à remplacerdatapar le nom de votre





Utilisateur
ligne=0 signifie quoi
ChatGPT
​row = 0verser

Dans l'exemple donnétableau_univarieet `tableautableau_bivariesont desrow = 0et `ncolncolspécial

Salle de bains attenanterbind(), nous

L'utilisation de `ligne = 0row = 0au départ nous





Utilisateur
si la taille de l
 
R

Copier le code
# Création du tableau pour les variables univariées
tableau_univarie <- matrix(0, nrow = max(length(repartition_sexe), length(repartition_niveau_instr)), ncol = 2)

# Répartition des PME selon le sexe
repartition_sexe <- table(data$sexe)
tableau_univarie[, 1] <- repartition_sexe

# Répartition des PME selon le niveau d'instruction
repartition_niveau_instr <- table(data$niveau_instruction)
tableau_univarie
table
[, 2] <- repartition_niveau_instr

# Affichage du tableau pour les variables univariées
print(tableau_univarie)
















