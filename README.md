# MacIconUpdater

Le but de ce projet est de pouvoir facilement grâce au terminal modifier les icons des applications sur MacOS.
Cet outil permet d'ajouter des icons à des applications. Il dispose aussi de la mise en place de commande dans le shell pour éviter de toujours utiliser à la main le fichier bash.

## IconScript

Ce script Bash vous permet de gérer les icônes d'applications sur votre système macOS.

### Prérequis

Activer l'accès au disque complet :
Préférences -> Confidentialité et sécurité -> Accès au disque complet -> Sélectionner le terminal

### Installation

Télécharger les deux scripts bash puis dans le dossier d'installation lancer la commande : 

```bash
./IconScriptSetup.sh
```

### Configuration

Le script peut être configuré pour être exécuté automatiquement lors du démarrage du système. Il ajoutera également des alias pratiques à votre fichier de configuration shell.

#### Alias

iconsetup : Permet d'ajouter des icons.
iconupdate : Exécute le script de mise à jour des icônes.

### Mise à jour des icons au démarrage

La mise à jour des icons se fait automatiquement au démarrage de votre Mac grâce à un crontab.

### Utilisation

Ajout d'une icône à une application
Exécutez le script.
Suivez les instructions pour choisir une application.
Spécifiez le chemin complet de l'icône que vous souhaitez utiliser.
Suivez les instructions pour renommer le fichier .icns (optionnel).
Ajout de plusieurs icônes
Le script vous permet d'ajouter plusieurs icônes à différentes applications pendant la même exécution.

Mise à jour des icônes
Exécutez le script de mise à jour pour appliquer les changements aux icônes des applications.

```bash
./IconScriptUpdate.sh
```

Correspondance des apps avec le nom de leur icons : 

| App         |  Nom icon   |
| ----------- | ----------- |
| Header      | Title |
| Paragraph   | First paragraph. <br><br> Second paragraph. |

Si votre application n'est pas présente dans ce tableau alors il faut trouver le fichier .icns dans /Applications/VotreApp/Contents/Resources/