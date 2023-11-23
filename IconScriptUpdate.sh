#!/bin/bash

# Chemin vers le dossier contenant les nouveaux fichiers d'icônes
icons_folder="/Users/picardarthur/opt/Save icons mac"

# Nom du fichier spécifique à remplacer dans Discord
specific_file_to_replace="electron.ics"

# Chemin vers le fichier à remplacer dans le dossier Discord
discord_specific_file_path="/Applications/Discord.app/Contents/Resources/$specific_file_to_replace"

# Vérifiez si le fichier spécifique existe dans le dossier des icônes
if [ -f "$icons_folder/$specific_file_to_replace" ]; then
    # Remplacez le fichier spécifique dans Discord par le nouveau
    cp "$icons_folder/$specific_file_to_replace" "$discord_specific_file_path"
    echo "Le fichier $specific_file_to_replace a été remplacé avec succès dans Discord."
else
    echo "Le fichier $specific_file_to_replace n'a pas été trouvé dans votre dossier d'icônes."
fi
