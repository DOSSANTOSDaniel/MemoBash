# Rejouer un script

- Source : https://www.tecmint.com/record-and-replay-linux-terminal-session-commands-using-script/

```Bash
!#/bin/sh
script trace.txt -c ‘
pwd
echo "Bonjour"
exit
'
```
 
