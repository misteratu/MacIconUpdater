#!/bin/bash

# Nom de l'utilisateur
username=$(whoami)

# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/$username/opt/icons"

# Vérifier si IconScriptSetup.sh et IconScriptUpdate.sh existent dans icons_folder
if [ ! -f "$icons_folder/IconScriptSetup.sh" ] || [ ! -f "$icons_folder/IconScriptUpdate.sh" ]; then
    echo "Au moins l'un des fichiers IconScriptSetup.sh ou IconScriptUpdate.sh n'est pas présent dans $icons_folder"
    while true; do
        read -p "Voulez-vous installer ? (y/n) " reponse
        case $reponse in
            [Yy]* )
                # Vérifier si IconScriptSetup.sh existe dans icons_folder
                if [ ! -f "$icons_folder/IconScriptSetup.sh" ]; then
                    echo "Copie de IconScriptSetup.sh dans $icons_folder"
                    cp -f IconScriptSetup.sh "$icons_folder/IconScriptSetup.sh"
                    chmod +x "$icons_folder/IconScriptSetup.sh"
                else
                    echo "IconScriptSetup.sh existe déjà dans $icons_folder"
                fi

                # Vérifier si IconScriptUpdate.sh existe dans icons_folder
                if [ ! -f "$icons_folder/IconScriptUpdate.sh" ]; then
                    echo "Copie de IconScriptUpdate.sh dans $icons_folder"
                    cp -f IconScriptUpdate.sh "$icons_folder/IconScriptUpdate.sh"
                    chmod +x "$icons_folder/IconScriptUpdate.sh"
                else
                    echo "IconScriptUpdate.sh existe déjà dans $icons_folder"
                fi
                echo 'alias iconsetup="cd /Users/picardarthur/opt/icons && ./IconScriptSetup.sh"' >> ~/.zshrc
                echo 'alias iconupdate="cd /Users/picardarthur/opt/icons && ./IconScriptUpdate.sh"' >> ~/.zshrc
                crontab -l | { cat; echo "@reboot /Users/$username/opt/icons/IconScriptUpdate.sh"; } | crontab -
                break
                ;;
            [Nn]* ) exit;;
            * ) echo "Veuillez répondre par y ou n.";;
        esac
    done
fi


if [ -d "$icons_folder" ]; then
    true
else 
    # Création d'un dossier pour stocker les icônes
    echo "Ajout d'un dossier icons pour stocker les icônes"
    mkdir "$icons_folder"
fi

# Boucle principale pour ajouter des icônes
while true; do
    # Demander à l'utilisateur s'il veut ajouter une icône à une application spécifique
    read -p "Voulez-vous ajouter une icône à une application spécifique ? (y/n) " response
    case $response in
        [Yy]* ) 
            # Chemin vers le dossier contenant les applications installées
            app_folder="/Applications"

            # Tableau contenant les applications installées
            app_list=()

            # Parcours du dossier contenant les applications installées
            for app in "$app_folder"/*.app; do
                # Récupération du nom de l'application
                app_name=$(basename "$app")
                # Ajout du nom de l'application dans le tableau
                app_list+=("$app_name")
            done

            # Afficher la liste des applications
            echo "Applications installées :"
            for ((i=0; i<${#app_list[@]}; i++)); do
                echo "$((i+1)). ${app_list[i]}"
            done

            # Demander à l'utilisateur de choisir une application
            while true; do
                read -p "Choisissez le numéro de l'application à laquelle vous voulez ajouter une icône : " app_number
                if [[ "$app_number" =~ ^[0-9]+$ ]] && [ "$app_number" -ge 1 ] && [ "$app_number" -le "${#app_list[@]}" ]; then
                    selected_app="${app_list[$((app_number-1))]}"
                    
                    selected_app_without_extension="${selected_app%.*}"
                    echo "Vous avez choisi l'application : $selected_app_without_extension"

                    # Vérifier si le dossier existe déjà
                    if [ ! -d "$icons_folder/$selected_app_without_extension" ]; then
                        # Si le dossier n'existe pas, le créer
                        mkdir "$icons_folder/$selected_app_without_extension"
                    else
                        # Si le dossier existe déjà, afficher un message
                        echo "Le dossier existe déjà : $icons_folder/$selected_app_without_extension"
                    fi

                    # Demander à l'utilisateur de spécifier le chemin de l'icône
                    echo "Attention : l'icône doit être au format .icns et le nom de l'icon doit correspondre au nom de l'icon de l'application."
                    read -p "Entrez le chemin complet de l'icône que vous souhaitez utiliser : " icon_path

                    # Copier l'icône dans le dossier de l'application
                    cp "$icon_path" "$icons_folder/$selected_app_without_extension/"

                    # Proposer à l'utilisateur de renommer le fichier .icns
                    read -p "Voulez-vous renommer le fichier .icns ? (y/n) " rename_response
                    case $rename_response in
                        [Yy]* )
                            read -p "Entrez le nouveau nom pour le fichier .icns : " new_icns_name
                            mv "$icons_folder/$selected_app_without_extension/$(basename "$icon_path")" "$icons_folder/$selected_app_without_extension/$new_icns_name.icns"
                            echo "Le fichier .icns a été renommé avec succès."
                            ;;
                        [Nn]* ) ;;
                        * ) echo "Veuillez répondre par y ou n.";;
                    esac

                    echo "L'icône a été ajoutée avec succès."

                    break
                else
                    echo "Veuillez entrer un numéro valide."
                fi
            done
            ;;
        [Nn]* ) exit;;
        * ) echo "Veuillez répondre par y ou n.";;
    esac

    # Demander à l'utilisateur s'il veut ajouter une autre icône
    read -p "Voulez-vous ajouter une autre icône ? (y/n) " add_more_response
    case $add_more_response in
        [Yy]* ) continue;;
        [Nn]* ) exit;;
        * ) echo "Veuillez répondre par y ou n.";;
    esac
done

# Execution du script de mise à jour
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
