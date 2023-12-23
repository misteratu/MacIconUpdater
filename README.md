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

## Les Icons

### Ou trouver des icons ?

https://macosicons.com/

### Correspondance des apps avec le nom de leur icons : 

| App                   | Nom icon           |
| --------------------- | ------------------ |
| Aperçu                |    AppIcon.icns    |
| App Store             |    AppIcon.icns    |
| Arduino IDE           |    icon.icns       |
| Minecraft             |    favicon.icns    |
| Numbers               |    AppIcon.icns    |
| BetterDisplay         |    BetterDisplay.icns|
| Obsidian              |    icon.icns       |
| Brave Browser         |    app.icns        |
| OpenEmu               |    OpenEmu.icns    |
| Dashlane              |    AppIcon.icns    |
| Pages                 |    AppIcon.icns    |
| Discord               |    electron.icns   |
| Prime Video           |    AppIcon.icns    |
| Eclipse               |    Eclipse.icns    |
| R                     |    RLogo.icns      |
| Firefox               |    firefox.icns    |
| Rectangle             |    AppIcon.icns    |
| GitHub Desktop        |    electron.icns   |
| Safari                |    AppIcon.icns    |
| Goodnotes             |    AppIcon.icns    |
| Stats                 |    AppIcon.icns    |
| Hidden Bar            |    AppIcon.icns    |
| Steam                 |    Steam.icns      |
| IntelliJ IDEA CE      |    idea.icns       |
| MATLAB_R2022b         |    MATLAB.icns     |
| Visual Studio Code    |    Code.icns       |
| Macs Fan Control      |    MacsFanControl.icns|
| WhatsApp              |    electron.icns   |
| Messenger             |    messenger.icns  |
| Xcode                 |    Xcode.icns      |
| Microsoft Excel       |    XCEL.icns       |
| draw.io               |    icon.icns       |
| Microsoft OneNote     |    OneNote.icns    |
| iTerm                 |    AppIcon.icns    |
| Microsoft PowerPoint  |    PPT3.icns       |
| logioptionsplus       |    electron.icns   |
| Microsoft Teams classic|   icon.icns        |
| owncloud              |    owncloud.icns   |
| Microsoft Word        |    MSWD.icns       |


Si votre application n'est pas présente dans ce tableau alors il faut trouver le fichier .icns dans /Applications/VotreApp/Contents/Resources/