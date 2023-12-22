#!/bin/bash

# Demander à l'utilisateur et attendre une réponse y/n
while true; do
    read -p "Voulez-vous installer ? (y/n) " reponse
    case $reponse in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Veuillez répondre par y ou n.";;
    esac
done

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

    # A vérifier la syntaxe de mkdir
    mkdir "/Users/$username/opt/icons"
fi

chmod +x IconScriptUpdate.sh
./IconScriptUpdate.sh

# Demander à l'utilisateur et attendre une réponse y/n
while true; do
    read -p "Voulez-vous ouvrir le script à chaque démarrage ? (y/n) " reponse
    case $reponse in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Veuillez répondre par y ou n.";;
    esac
done

#launchctl load -w /Library/LaunchDaemons/com.IconScriptUpdate.plist