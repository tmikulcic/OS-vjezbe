# Zadatak 1
## Instalirajte python3 paket na vašem VM-u. Unutar home direktorija stvorite direktorij python3 i datoteku hello.py koja ispisuje "Hello World!", a nakon 100 sekundi ispisuje "Goodbye World!".

sudo apt install python3
cd ~
touch python3/hello.py
mkdir python3
cd python3
nano hello.py

### Unutar hello.py
print("Hello World!")
import time
time.sleep(100)
print("Goodbye World!")
###

## Pokrenite skriptu i prebacite se u drugi terminal ili pokrenite u pozadini. Unutar htop alata ispišite i objasnite sve detalje o procesu koji je pokrenut.

python3 hello.py
htop

### Slika 1
PID 1514 - ID procesa
USER tomislavmi - pokrenuo korisnik
PRI 20, NI 0 - prioritet je 20, a nice vrijednost je 0, sto oznacava standardni korisnicki proces
VIRT 17268 - proces zauzima 17268KiB virtualne memorije
RES 9344 - proces koristi 9344KiB fizicke (RAM) memorije
SHR 1234 - proces dijeli 5760KiB memorije medu vise proces.
S - trenutno u pasivnom stanju bez aktivne upotrebe CPU-a
MEM% 0.5 - koristi 0.5% RAM memorije
TIME+ 0:00.01 - koristi 0.01 sekundi procesorskog vremena
Command python3 hello.py - proces je pokrenut iz paketa python3, sa naredbom `python3 hello.py`


## Napišite barem 3 načina kako biste prekinuli taj proces naredbom kill.
1) kill 1514 - prekida proces PID 1514
2) killall python3 - prekida sve procese unutar python3
3) pkill -f hello.py - ubija procese cija komanda ukljucuje `hello.py`


# Zadatak 2
## Napravite direktorije old_dir i new_dir unutar vašeg home direktorija i napunite ih proizvoljnim datotekama. 

cd ~
mkdir old_dir new_dir
cd old_dir
touch file1.txt file2.txt file3.txt file4.txt file5.txt file6.txt file7.txt file8.txt file9.txt file10.txt

## Napišite bash skriptu koja će prebaciti datoteku po datoteku iz direktorija old_dir u new_dir i nakon svakog prebacivanja ispisati poruku "Datoteka prebačena" i pričekati 1 sekundu.

cd ~
nano move_file.sh

### Unutar move_file.sh
#!/bin/bash

USERNAME="tomislavmikulcic"

if ["$#" -ne 2 ]; then
  echo "Potrebna 2 argumenta"
  exit 1
fi

SOURCE_DIR="/home/$USERNAME/$1"
TARGET_DIR="/home/$USERNAME/$2"

for file in "$SOURCE_DIR"/*; do
  mv "$file" "$TARGET_DIR"/
  echo "Prebacena datoteka $(basename "$file")"
  sleep 1
done

echo "Datoteke prebacene"
###

chmod +x move_file.sh

## Pokrenite skriptu sa zadanim, većim i manjim NI prioritetom i napravite screenshot htop alata.

### Zadani NI prioritet - Slika 2
./move_file.sh old_dir new_dir

### Nizi NI prioritet - Slika 3
nice -n 10 ./move_file.sh old_dir new_dir

### Vizi NI prioritet - Slika 4
sudo nice -n -5 ./move_file.sh old_dir new_dir


# Zadatak 3
## Potrebno je definirati novu grupu devteam za vašu ekipu. Napravite novi direktorij project u home direktoriju vašeg korisnika.
sudo groupadd devteam
getent group devteam
cd ~
mkdir project

## Stvorite nekoliko novih korisnika i dodajte ih u grupu devteam.
sudo useradd -m -G devteam user1
sudo passwd user1
sudo useradd -m -G devteam user2
sudo passwd user2
sudo useradd -m -G devteam user3
sudo passwd user3

## Za direktorij project , vi ostajete vlasnik, a grupu postavite na devteam.
sudo chown $(whoami):devteam ~/project

## Definirajte dozvole za direktorij project tako da svi članovi grupe devteam mogu čitati, pisati, vi možete čitati, pisati i izvršavati, a ostali korisnici samo čitati.
chmod 764 ~/project
ls -ld ~/project

## Konacna provjera - Slika 5


# Zadatak 4

## Definirajte oktalne reprezentacije dozvola za sljedeće dozvole:

rwxr-xr-x 755
Vlasnik može čitati, pisati i izvršavati, grupa može čitati i izvršavati, a ostali korisnici mogu čitati i izvršavati.

rw-r--r-- 644
Vlasnik može čitati i pisati, grupa može samo čitati, a ostali korisnici mogu samo čitati.

rwx------ 700
Vlasnik može čitati, pisati i izvršavati, grupa nema nikakva prava, a ostali korisnici nemaju nikakva prava.

rw-rw-r-- 664
Vlasnik može čitati i pisati, grupa može čitati i pisati, a ostali korisnici mogu samo čitati.

rwxrwxrwx 777
Vlasnik, grupa i ostali korisnici mogu čitati, pisati i izvršavati.

r--r--r-- 444
Vlasnik, grupa i ostali korisnici mogu samo čitati.

rw------- 600
Vlasnik može čitati i pisati, grupa nema nikakva prava, a ostali korisnici nemaju nikakva prava.


# Zadatak 5

Napišite bash skriptu koja očekuje dva argumenta:
1. Znakovna reprezentacija (9 znakova) dozvola (npr. rwxr-xr-- )
2. Apsolutnu putanju do neke datoteke (npr. /home/lukablaskovic/test.txt )

Skripta mora izračunati oktalnu reprezentaciju dozvole i primijeniti je na datoteku na danoj putanji.

### Skripta
#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Potrebna dva argumenta"
    exit 1
fi

perm_str=$1
file_path=$2
###