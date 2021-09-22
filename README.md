# TP 1 Bases du Génie Logiciel -- Git

**Enseignant**: Pablo de Oliveira < pablo.oliveira@uvsq.fr >

Le but de ce TP est de vous configurer votre environnement de travail et vous
familiariser avec l'outil de contrôle de version Git.  

Ce document est sous licence [CC by-nc-sa](https://creativecommons.org/licenses/by-nc-sa/2.0/).

## Utilisation de Git

Pour tous les TPs de BGL on utilisera [git](http://git-scm.com). Un dépôt
git contient un projet logiciel. Chaque dépôt git peut-être cloné sur différents
ordinateurs locaux ou distants.

## Dépôt Github

Pour sauvegarder et rendre votre travail nous allons utiliser Github qui permet d'héberger des dépôts gits sur internet. 
Normalement le lien de connexion a crée automatiquement un dépôt Github pour vous. C'est sur ce dépôt Github que vous êtes en train de lire ce document.

1. Si vous souhaitez pouvoir cloner et pusher sur votre dépôt sans taper votre mot de passe à chaque fois, rajoutez une clé ssh sur votre compte. Cliquez sur le
menu déroulant tout en haut à droite, choisissez « Settings », puis sur la barre à gauche choisissez « SSH and GPG Keys ». 
La création d'une clé ssh est expliquée [ici](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

## Environnement de développement

Pour les TPs et projets de SEA il vous faut un environnement de développement avec `git`, `gcc` ou `clang`, `make` et `gdb`. 
Vous pouvez également utiliser un IDE.
Si vous travaillez sur les cartables numériques, ces outils sont déjà installés.

## Initialization du dépôt

1. Pour pouvoir commencer à travailler sur votre dépôt git, il va falloir le cloner. Pour cela récupérez
 l'adresse du dépôt en cliquant sur le bouton « Code ». Choisissez le type d'adresse HTTP ou SSH sur le
 menu déroulant (ne choisissez SSH que si vous avez rajouté une clé SSH sur votre profil). Puis copiez l'adresse qui se trouve juste à côté.

2. Allez maintenant sur un terminal et tapez les commande suivantes:

```bash
    # clonez le dépôt
    $ git clone [adresse du dépôt]

    # Allez à l'intérieur du dépôt cloné en local
    $ cd tp-bgl-git-<identifiant>/
    
    # Vérifiez que c'est bien un dépôt git
    $ git status
```

Si vous souhaitez cloner ce dépôt sur d'autres machines; la procédure est la
même. Les commandes git vous permettent de synchroniser les différentes
instances de dépôt entre elles.

Dans la suite du TP, à chaque question où l'on vous demande de créer un modifier des
fichiers, vous *committerez* vos modifications.

### Création d'un dépôt git et ajout de fichiers

Tout d'abord il faut configurer git avec vos informations personnelles (remplacez avec votre nom et mail)

```bash
$ git config --global user.name "Pablo Oliveira"
$ git config --global user.email "pablo.oliveira@uvsq.fr"
```

Maintenant écrivez un programme ```test.c``` pour afficher "Hello World!"
sur la sortie standard et un fichier Makefile pour le compiler avec ```gcc```.

La commande ```git status``` vous permet de voir ce qui est nouveau depuis la dernière sauvegarde (ou commit) dans le dépôt:

```bash
$ git status
On branch main

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    Makefile
	  test.c
```

Pour commiter les fichier il faut d'abord les ajouter dans git avec

```bash
$ git add Makefile test.c
$ git status
On branch main

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   Makefile
	new file:   test.c
```

Maintenant ```git status``` nous indique que les deux fichiers sont prets à
être committés.

La commande ```git commit``` ouvre un editeur qui vous permet de taper un
message indiquant à quoi correspondent les fichier ajoutés ou modifiés.

Pour les messages de commit utilise la convention suivante,

* la première ligne doit contenir un message court et informatif qui
  résume vos modifications

* la deuxième ligne doit être vide

* à partir de la troisième ligne vous pouvez décrire le détail de vos
  changements

Par exemple:

```
    Initial commit: Hello World program
    
    Write an example C program and a create
    a Makefile so it can be automatically built.
```

[Voici une bonne référence](http://ensiwiki.ensimag.fr/index.php/%C3%89crire_de_bons_messages_de_commit_avec_Git)
sur la manière de rédiger vos messages de commit.

## Enregistrer des modifications sous git

Maintenant vous pouvez modifier votre programme. Faites en sorte que le
programme fasse une faute de segmentation. Comment faire ? Soyez créatifs.

Puis tapez ```git diff``` pour voir vos changements:

```bash
git diff
diff --git a/test.c b/test.c
index 69899ec..ad7f9c6 100644
--- a/test.c
+++ b/test.c
@@ -1,4 +1,5 @@
 #include <stdio.h>
 int main(void) {
-    printf("Hello World!\n");
+    do_segmentation_fault();
 }
```

Maintenant commitez vos changements avec ```git add test.c``` suivi de ```git commit```.

Vous pouvez consulter le journal des modifications avec ```git log```

```bash
$ git log
commit 66ea53ab301045fc5a990fac3672f842dc75b2e8
Author: Pablo Oliveira <pablo.oliveira@uvsq.fr>
Date:   Thu Sep 11 22:59:15 2014 +0200

    Harmless modification that makes the program segfault

commit b35c2b6551d4b3738170637634702ed4d82aa501
Author: Pablo Oliveira <pablo.oliveira@uvsq.fr>
Date:   Thu Sep 11 22:55:05 2014 +0200

    Initial commit: Hello World program
```

Chaque commit est suivi d'un code hexadecimal unique qui l'identifie.  Vous
pouvez visualiser les changements entre deux versions avec ```git diff b35c2b6
66ea53a```, ce n'est pas la peine de taper tous les chiffres, les premiers
suffisent (sauf en cas de conflit). Essayez !

Les différentes versions forment une **branche** de versions.
Dans git la branche principale s'appelle d'habitude ```main```.

Git permet de travailler sur plusieurs branches en même temps,
mais cela dépasse le cadre de cette introduction.

## Visiter une version précédente

Git sauvegarde toutes les versions et permets de revenir à une version précédente.

Par exemple pour revenir à la version de base vous pouvez taper:

```bash
 $ git checkout b35c2b6

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at b35c2b6... Initial commit: Hello World program
```

```git``` nous previens que nous ne sommes plus en tête de la branche main ce
qui est normal vu que nous sommes revenus à une vieille version.

Pour revenir à la dernière version vous pouvez taper:

```bash
$ git checkout main
Previous HEAD position was b35c2b6... Initial commit: Hello World program
Switched to branch 'main'
```

## Annuler les changements non commités

Parfois vous avez fait des modifications sur un fichier et
vous voulez les annuler et revenir à la dernière version commitée.

Pour cela vous pouvez utiliser ```git checkout``` comme sur l'exemple suivant

```bash
$ rm hello.c

# Ooops j'ai effacé hello.c

$ git checkout hello.c

# tout va bien !

```

Essayez.

## Revenir à une ancienne version définitivement

Parfois on veut revenir à une ancienne version pour de bon.
La commande suivante vous le permet:

```bash
$ git reset --hard b35c2b6
```

Essayez de revenir à la version sans segfault.

## Partager votre code avec les autres

Pour partager votre code avec un autre dépot, ```git``` propose deux commandes:

* ```push``` qui permet d'envoyer ("pousser") votre code vers un autre dépot
* ```pull``` qui permet de récupérer ("tirer") les changements depuis un un autre dépot

Comme vous avez cloné votre dépôt depuis Github; ce serveur est déja configuré
comme serveur push par défaut.

Pour envoyer vos changements sur Github faites:

```bash
    $ git push origin main  
```

Vérifiez que les changements sont maintenant disponibles sur Github.
