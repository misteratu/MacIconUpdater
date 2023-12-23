# MacIconUpdater

Le but de ce projet est de pouvoir facilement grâce au terminal modifier les icons des applications sur MacOS.
Cet outil permet d'ajouter des icons à des applications. Il dispose, aussi,  de la mise en place de commande dans le shell pour éviter de toujours utiliser à la main le fichier bash.

## IconScript

Ce script Bash vous permet de gérer les icônes d'applications sur votre système macOS.

### Prérequis

Activer l'accès au disque complet :
`Préférences` -> `Confidentialité et sécurité` -> `Accès au disque complet` -> Sélectionner le terminal

### Installation

Télécharger les deux scripts bash puis dans le dossier d'installation lancer la commande : 

```bash
./IconScriptSetup.sh
```

### Configuration

Le script peut être configuré pour être exécuté automatiquement lors du démarrage du système. Il ajoutera également des alias pratiques à votre fichier de configuration shell.

#### Alias

Après l'installation des commandes sont disponibles directement dans le shell :

`iconsetup` : Permet d'ajouter des icons.  
`iconupdate` : Exécute le script de mise à jour des icônes.

### Mise à jour des icons au démarrage

La mise à jour des icons se fait automatiquement au démarrage de votre Mac grâce à un crontab.

### Utilisation

#### Au premier lancement 

Exécution de l'installation par :

```bash
./IconScriptSetup.sh
```

```
1. Demande une confirmation de l'installation
2. Demande si l'on souhaite modifier l'icon d'une app
3. Demande le numéro de l'app à modifier
4. Demande le chemin du nouvel icon choisi
5. Demande si l'on doit renomer l'icon afin que son nom corresponde au tableau ci-dessous
6. Demande si l'on souhaite modifier l'icon d'une autre app
```

#### Après l'installation

Un alias a été créé dans le zshrc donc inutile de continuer à exécuter le .sh dans le repertoire d'installation.

Si on veut exécuter de nouveau la configuration on lance alors : 

```bash
iconsetup
```

Il se passe alors :

```
1. Demande si l'on souhaite modifier l'icon d'une app
2. Demande le numéro de l'app à modifier
3. Demande le chemin du nouvel icon choisi
4. Demande si l'on doit renomer l'icon afin que son nom corresponde au tableau ci-dessous
5. Demande si l'on souhaite modifier l'icon d'une autre app
```

Si on veut exécuter une simple mise à jour on lance :

```bash
iconupdate
```

## Les Icons

### Ou trouver des icons ?

https://macosicons.com/

### Correspondance des apps avec le nom de leur icons : 

| App                   | Nom icon           |
| --------------------- | ------------------ |
| Aperçu                | AppIcon.icns       |
| App Store             | AppIcon.icns       |
| Arduino IDE           | icon.icns          |
| Brave Browser         | app.icns           |
| Dashlane              | AppIcon.icns       |
| Discord               | electron.icns      |
| Eclipse               | Eclipse.icns       |
| Firefox               | firefox.icns       |
| GitHub Desktop        | electron.icns      |
| Goodnotes             | AppIcon.icns       |
| Hidden Bar            | AppIcon.icns       |
| IntelliJ IDEA CE      | idea.icns          |
| Macs Fan Control      | MacsFanControl.icns|
| MATLAB_R2022b         | MATLAB.icns        |
| Messenger             | messenger.icns     |
| Microsoft Excel       | XCEL.icns          |
| Microsoft OneNote     | OneNote.icns       |
| Microsoft PowerPoint  | PPT3.icns          |
| Microsoft Teams classic| icon.icns         |
| Microsoft Word        | MSWD.icns          |
| Minecraft             | favicon.icns       |
| Numbers               | AppIcon.icns       |
| Obsidian              | icon.icns          |
| OpenEmu               | OpenEmu.icns       |
| Pages                 | AppIcon.icns       |
| Prime Video           | AppIcon.icns       |
| R                     | RLogo.icns         |
| Rectangle             | AppIcon.icns       |
| Safari                | AppIcon.icns       |
| Stats                 | AppIcon.icns       |
| Steam                 | Steam.icns         |
| WhatsApp              | electron.icns      |
| Xcode                 | Xcode.icns         |
| draw.io               | icon.icns          |
| iTerm                 | AppIcon.icns       |
| logioptionsplus       | electron.icns      |
| owncloud              | owncloud.icns      |
| Visual Studio Code    | Code.icns          |



Si votre application n'est pas présente dans ce tableau alors il faut trouver le fichier .icns dans `/Applications/VotreApp/Contents/Resources/`

### Déinstallation

A noter que pour l'instant aucun script de déinstallation n'est en place.
Voici la démarche à suivre pour supprimer ce que cet a créé :

#### Suppression du dossier de stockage d'icons

```bash
rm -rf /Users/VotreUtilisateur/opt/icons
```

#### Suppression de la mise à jour au démarrage 

Lancer :

```bash
crontab -e
```

Et supprimer la ligne : `@reboot /Users/VotreUtilisateur/opt/icons/IconScriptUpdate.sh` et quittant en sauvegardant en écrivant `:x` puis appuyer sur `enter`

#### Suppression des alias 

Aller dans le zshrc :

```bash
nano .zshrc
```
Supprimer les lignes : `alias iconsetup="cd /Users/picardarthur/opt/icons && ./IconScriptSetup.sh"` et `alias iconupdate="cd /Users/picardarthur/opt/icons && ./IconScriptUpdate.sh"`

Et hop tout est revenu à la normal !

## Prochaines améliorations

```
- Créer un script de déinstallation
- Créer une base de donnée pour éviter de demander de renommer les icons
- Créer une interface graphique
```