```Bash
#!/bin/bash

#Variable date du jour
dat=$(date "+%m_%d_%y-%H_%M_%S")

#Création des logs
ficlog="smartlog_$dat"
touch $ficlog
exec > >(tee -a $ficlog)
exec 2>&1
```