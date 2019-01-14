# etc
spotnik configuration files

the main files are in /etc/spotnik


This part contains .sh and configurations files for the spotnik HAM radio/internet relay.

for user documentation please refer to the [spotnik documentation]

## 1ST très important et dépendant de l'architecture 

il faut avoir une connection wifi fonctionnel dans /etc/NetworkManager/system-connections
peut importe son nom, il faut la renommer en SPOTNIK en majuscule pour que la configuration faite par l'interface graphique
gui fonctionne correctement .



## Production

### Install

```
ssh spotnik
cd /etc
git clone https://github.com/spotnik-ham/etc.git spotnik

```

### Update

```
ssh spotnik
cd /etc/spotnik
git pull

```

### Run

```
ssh spotnik
cd /etc/spotnik
spot

```


## Development

### Install

```

### Deploy


```
```
