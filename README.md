# TP 1 Bases du Génie Logiciel -- Git

Pablo de Oliveira < pablo.oliveira@uvsq.fr >

Le but de ce TP est de vous configurer votre environnement de travail et vous
familiariser avec l'outil de contrôle de version Git.  

Ce document est sous licence [CC by-nc-sa](https://creativecommons.org/licenses/by-nc-sa/2.0/).

## Utilisation de Git

Pour tous les TPs de BGL on utilisera [git](http://git-scm.com). Un dépôt
git contient un projet logiciel. Chaque dépôt git peut-être cloné sur différents
ordinateurs locaux ou distants.

## Dépôt GitHub

Pour sauvegarder et rendre votre travail nous allons utiliser GitHub qui permet d'héberger des dépôts gits sur internet. 
Normalement le lien de connexion a crée automatiquement un dépôt GitHub pour vous. C'est sur ce dépôt GitHub que vous êtes en train de lire ce document.

1. Si vous souhaitez pouvoir cloner et pousser des modifications sur votre dépôt sans taper votre mot de passe à chaque fois, rajoutez une clé ssh sur votre compte. Cliquez sur le
menu déroulant tout en haut à droite, choisissez « Settings », puis sur la barre à gauche choisissez « SSH and GPG Keys ». 
La création d'une clé ssh est expliquée [ici](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

## Environnement de développement

Pour les TPs et projets de BGL il vous faut un environnement de développement avec `git`, `gcc` ou `clang`, `make` et `gdb`. 
Vous pouvez également utiliser un IDE.
Si vous travaillez sur les cartables numériques, ces outils sont déjà installés.

## Initialisation du dépôt

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
fichiers, vous *commiterez* vos modifications.

### Création d'un dépôt git et ajout de fichiers

1. Tout d'abord il faut configurer git avec vos informations personnelles (remplacez avec votre nom et mail)

```bash
$ git config --global user.name "Pablo Oliveira"
$ git config --global user.email "pablo.oliveira@uvsq.fr"
```

2. Maintenant écrivez un programme `test.c` pour afficher « Hello World! » sur
la sortie standard et un fichier `Makefile` pour le compiler.

La commande `git status` vous permet de voir ce qui est nouveau depuis le dernière commit dans le dépôt:

```bash
$ git status
On branch main
Your branch is up to date with 'origin/main'.

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
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   Makefile
        new file:   test.c
```

Maintenant `git status` nous indique que les deux fichiers sont prêts à
être committés.

La commande `git commit` ouvre un éditeur qui vous permet de taper un
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

Puis tapez `git diff` pour voir vos changements:

```bash
$ git diff
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

Maintenant commitez vos changements avec `git add test.c` suivi de `git commit`.

Vous pouvez consulter le journal des modifications avec `git log`

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

Chaque commit est suivi d'un code hexadécimal unique qui l'identifie.  Vous
pouvez visualiser les changements entre deux versions avec `git diff b35c2b6 66ea53a`,
ce n'est pas la peine de taper tous les chiffres, les premiers
suffisent (sauf en cas de conflit). Essayez !

Les différentes versions forment une **branche** de versions.
Dans git la branche principale s'appelle d'habitude ```main```.

Git permet de travailler sur plusieurs branches en même temps.

## Visiter une version précédente

Git sauvegarde toutes les versions et permets de revenir à une version précédente.

1. Par exemple pour revenir à la version de base vous pouvez taper:

```bash
 $ git checkout b35c2b6

Note: switching to 'b35c2b6'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at b35c2b6... Initial commit: Hello World program
```

`git` nous prévient que nous ne sommes plus en tête de la branche main ce
qui est normal vu que nous sommes revenus à une vieille version.

2. Pour revenir à la dernière version vous pouvez taper (par exemple):

```bash
$ git checkout main
Previous HEAD position was b35c2b6... Initial commit: Hello World program
Switched to branch 'main'
```

## Annuler les changements non commités

Parfois vous avez fait des modifications sur un fichier et
vous voulez les annuler et revenir à la dernière version commitée.

Pour cela vous pouvez utiliser `git checkout` comme sur l'exemple suivant

```bash
$ rm test.c

# Ooops j'ai effacé test.c

$ git checkout test.c

# tout va bien !

```

1. Essayez.

## Revenir à une ancienne version définitivement

Parfois on veut revenir à une ancienne version pour de bon.
La commande suivante vous le permet:

```bash
$ git reset --hard b35c2b6
```

1. Essayez de revenir à la version sans segfault.

## Partager votre code avec les autres

Pour partager votre code avec un autre dépot, ```git``` propose deux commandes:

* ```push``` qui permet d'envoyer ("pousser") votre code vers un autre dépot
* ```pull``` qui permet de récupérer ("tirer") les changements depuis un un autre dépot

Comme vous avez cloné votre dépôt depuis GitHub; ce serveur est déja configuré
comme serveur push par défaut.

Pour envoyer vos changements sur GitHub faites:

```bash
    $ git push origin main  
```

1. Vérifiez que les changements sont maintenant disponibles sur GitHub.

2. GitHub vous permets de faire des modifications directement en ligne. 
   Modifiez le fichier `test.c` depuis l'interface GitHub.

3. Pour récupérer les modifications faites sur l'interface web sur votre
machine, utilisez la commande

```bash
    $ git pull origin main  
```

Si vous avez des modifications locales, lors d'un _pull_, il peut y avoir des
conflits. Dans ce cas git vous proposera d'ouvrir un éditeur et vous demandera
de résoudre les conflits à la main.

## Utilisation de branches

Git permets l'utilisation de plusieurs branches de code. Cela vous permets de travailler sur plusieurs versions du code en même temps.
Cela peut être intéressant de créer une nouvelle branche pour développer une fonctionnalité nouvelle.

Nous souhaitons modifier `test.c` pour demander le nom à l'utilisateur et l'afficher.

1. Utilisez la commande `git checkout -b demande-nom` pour créer une nouvelle branche nommée `demande-nom`.

2. Vérifiez avec `git branch` que vous êtes bien sur la nouvelle branche.

3. À tout moment vous pouvez revenir sur `main` avec la commande `git checkout main`.

4. Dans la branche `demande-nom` modifiez `test.c` de manière à rajouter la nouvelle fonctionnalité pour demander le nom à l'utilisateur et l'afficher. Vous pouvez par exemple utiliser la fonction de la bibliothèque standard C `scanf()`.

5. Commitez vos changements dans la nouvelle branche.

6. Utilisez la commande `git push origin demande-nom` pour pousser la nouvelle branche sur GitHub.

7. Il est possible de fusionner deux branches avec la commande `git merge`. Utilisez la commande pour fusionner la branche `demande-nom` dans `main`.

8. Envoyez vos modifications sur GitHub.
