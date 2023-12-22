#!/bin/bash

# Nom de l'utilisateur
username=$(whoami)

# Recherche des apps le dossier Applications

# Chemin du dossier où rechercher
search_directory="/Applications"
# Tableau pour les noms originaux des dossiers d'applications
original_app_directories=()
# Tableau pour les noms modifiés
modified_app_directories=()
# Tableau pour les noms des applications sans l'extension .app
app_names_without_extension=()
# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/$username/opt/icons"

# Recherche des dossiers qui contiennent .app dans le nom, sans inclure les sous-dossiers
while IFS= read -r app_dir; do
    # Obtenez le nom de base du dossier
    app_name=$(basename "$app_dir")

    # Ajoutez le nom original au premier tableau
    original_app_directories+=("$app_name")

    # Modifiez le nom pour le terminal
    modified_app_name=$(echo "$app_name" | sed 's/ /\\ /g')
    modified_app_directories+=("$modified_app_name")

    # Enlevez l'extension .app et ajoutez au troisième tableau
    name_without_extension="${app_name%.app}"
    app_names_without_extension+=("$name_without_extension")
done < <(find "$search_directory" -maxdepth 1 -type d -name "*.app" -print)

taillei=${#original_app_directories[@]}
Tab_nom_icon=()
for (( i=0; i<taillei; i++ )); do

    app=${modified_app_directories[i]} 

    # Chemin du répertoire à parcourir
    search_directory="/Applications/$app/Contents/Resources/"

    # Trouver tous les fichiers .icns dans le répertoire
    icns_files=($(find "$search_directory" -type f -name "*.icns"))

    # Vérifier le nombre de fichiers trouvés
    if [ ${#icns_files[@]} -eq 1 ]; then
        # S'il y a exactement un fichier, affichez uniquement son nom
        icon=$(basename "${icns_files[0]}")
        Tab_nom_icon+=("$app")
        Tab_nom_icon+=("$icon")

    elif [ ${#icns_files[@]} -gt 1 ]; then
        # S'il y a plus d'un fichier, ne rien renvoyer
        echo "Plusieurs fichiers .icns trouvés pour $app, aucun résultat renvoyé."
    else
        # Aucun fichier trouvé
        echo "Aucun fichier .icns trouvé dans le répertoire spécifié pour $app."
    fi
done

# Taille du tableau des apps et du nom de leur icon
taille=${#Tab_nom_icon[@]}

# Modification des icons
# Vérification que le tableau est bien paire 
if [ $((taille % 2)) -eq 0 ]; then 

    # Parcours du tableau
    for (( i=0; i<taille; i++ )); do
        app=${Tab_nom_icon[2*i]} # Nom de l'app en question
        icon=${Tab_nom_icon[2*i+1]} # Nom de l'icon en question

        # Chemin du fichier à vérifier
        chemin_fichier="$icons_folder/icon"

        # Testez si le fichier existe
        if [ -f "$chemin_fichier" ]; then
            # Suppression de l'ancien icon
            rm -rf "/Applications/$app/Contents/Resources/$icon"

            # Copie du nouvel icon dans l'app
            cp "/Users/$username/opt/icons/$icon" "/Applications/$app/Contents/Resources/$icon"
            echo "Le fichier existe."
        else
            echo "Le fichier n'existe pas."
        fi
    done
else 
    echo "Error 1"
fi

