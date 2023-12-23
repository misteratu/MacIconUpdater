#!/bin/bash

# Nom de l'utilisateur
username=$(whoami)

# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/$username/opt/icons"

# Dossier des applications
applications_folder="/Applications"

# Tableau des icônes
icons=()

# Recherche des dossiers qui contiennent .app dans le nom, sans inclure les sous-dossiers
while IFS= read -r -d $'\0' app_folder; do
    # Obtenez le nom de base du dossier
    app_name=$(basename "$app_folder")
    
    # Vérifier si le nom du dossier est "icons"
    if [ "$app_name" != "icons" ]; then
        # Ajouter le dossier au tableau des icônes
        icns_file=$(find "$app_folder" -maxdepth 1 -type f -name "*.icns" -print -quit)
        
        # Vérifier si un fichier .icns a été trouvé
        if [ -n "$icns_file" ]; then
            icons+=("$icns_file")
            
            # Copier l'icône dans le dossier de l'application en remplaçant si nécessaire
            app_destination_folder="$applications_folder/$app_name.app/Contents/Resources/"
            sudo cp -f "$icns_file" "$app_destination_folder"
        else
            echo "Aucun fichier .icns trouvé pour $app_name"
        fi
    fi
done < <(find "$icons_folder" -maxdepth 1 -type d -print0)

sudo rm -rfv /Library/Caches/com.apple.iconservices.store 2>/dev/null; sudo find /private/var/folders/ \( -name com.apple.dock.iconcache -or -name com.apple.iconservices \) -exec rm -rfv {} \; 2>/dev/null; sleep 3;sudo touch /Applications/* 2>/dev/null; killall Dock; killall Finder
