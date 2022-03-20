# Protéger ses scripts shell avec SHC

Page de manuel du projet : http://www.datsi.fi.upm.es/~frosal/sources/shc.html

Parfois certains scripts contiennent des données critiques comme des mots de passes.

La commande "SHC" permet de cacher le code source de notre script shell.

Processus de sécurisation :

```
+-------+        +-------+          +-+  +-+        +-------+
|       |        |       |         _| |__| |_       |       |
|  .sh  |------->| .c    |------->| GCC      |----->|  .x   |  Exécutable binaire chiffré 
|       |        |       |        |_   __   _|--+   |       |
|       |        |       |          | |  | |    |   |       |
+-------+        +-------+          +-+  +-+    |   +-------+
                                                |
Script Bash      Code en C        Compilateur   |   +-------+
                                                |   |       |
                                                +-->|  .x.c |  Code source en C
                                                    |       |
                                                    |       |
                                                    +-------+

```

 
Processus d’exécution :

```

[Exécutable binaire chiffré (.x)]---->(Déchiffrage)---->[Fichier binaire]---->(Exécution du code) 

```

Le code est toujours interprété par Bash, ce n'est pas du code compilé, et ce n'est pas du C, c'est juste le script qui est caché.

Ce processus est peut fiable, il exit la commande "UNSHC" qui permet de récupérer le code source Bash à partir du fichier binaire en .x.

