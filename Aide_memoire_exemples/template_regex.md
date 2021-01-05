# Exemples d'expressions régulières

## Adresse IP

Format : de 100.100.100.100 à 255.255.255.255

IPv4 valide ou non valide

```bash
# Regex
ip_regex='^([1-2]([0-5]{1,2})\.){3}([1-2]([0-5]{1,2}))$'
ipadd='254.254.254.254'

if [[ ${ipadd} =~ ${ip_regex} ]]
then
  echo "validé"
else
  echo "non validé"
fi
```
## Nom des partitions des disques

Format : sda,hda,md1...

Partitions standard ou RAID

```bash
# Regex
disk_regex='^([s|h][d][a-z])$|^([m][d][0-9])$'
sd_disk='sdb'

if [[ ${sd_disk} =~ ${disk_regex} ]]
then
  echo "validé"
else
  echo "non validé"
fi
```
## Numéro de téléphone

Format : de 01.00.00.00.00 à 09.99.99.99.99

Numéros de téléphones non spéciaux

```bash
# Regex
tel_regex='^(0[1-9]\.)([0-9]{1,2}\.){3}([0-9]{1,2})$'
tel='01.11.11.11.11'

if [[ ${tel} =~ ${tel_regex} ]]
then
  echo "validé"
else
  echo "non validé"
fi
```
## Email

Format : <user>@<host>.<dom>

```bash
# Regex
email_regex='^[A-Za-z0-9\.\_\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,3}$'
mail='toto@mail.fr'

if [[ ${mail} =~ ${email_regex} ]]
then
  echo "validé"
else
  echo "non validé"
fi
```
