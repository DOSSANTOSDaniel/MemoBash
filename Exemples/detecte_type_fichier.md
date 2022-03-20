# Détection du type de fichier (MIME)


```bash
#!/bin/bash

file="${1}"
type_file=$(file -b --mime-type "${file}" | cut -d '/' -f1)

echo "Le fichier ${file} est de type ${type_file}"
```
