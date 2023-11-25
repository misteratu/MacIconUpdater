#!/bin/bash

# Nom de l'utilisateur
username=$(whoami)

# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/$username/opt/icons"

# Création d'un tableau dans lequel l'élément 2i est le nom de l'app et l'élément 2i+1 est le nom de l'icon associé à l'application
Tab_nom_icon = ("discord.app" "electron.icns" "Brave\ Browser.app" "app.icns" "iTerm.app" "AppIcon.icns" "Visual\ Studio\ Code.app" "Code.icns" "draw.io.app" "icon.icns" "IntelliJ\ IDEA\ CE.app" "idea.icns")

# Taille du tableau des apps et du nom de leur icon
taille = ${#Tab_nom_icon[@]}

# Modification des icons
# Vérification que le tableau est bien paire 
if [ $((taille % 2)) -eq 0 ]; then 

    # Parcours du tableau
    for (( i=0; i<taille_du_tableau; i++ )); do
        app = ${info_array[2*i]} # Nom de l'app en question
        icon = ${info_array[2*i+1]} # Nom de l'icon en question

        # Suppression de l'ancien icon
        rm -rf "/Applications/$app/Contents/Resources/$icon"

        # Copie du nouvel icon dans l'app
        cp "/Users/$username/opt/icons/$icon" "/Applications/$app/Contents/Resources/$icon"
    done
else 
    echo "Error 1"
fi

