#!/bin/bash

# Nom de l'utilisateur
username=$(whoami)

# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/$username/opt/icons"

if [-f icons_folder] then 
    echo "Dossier icons déjà présent"
else 
    # Rajout d'un dossier afin de stocker les icons
    echo "Ajout d'un dossier icons pour stocker les icons"
    echo "$icons_folder"
    mkdir "icons" "/Users/$username/opt"
fi