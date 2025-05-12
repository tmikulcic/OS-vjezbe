Slika 1. Nakon instalacije, napravite screenshot početnog zaslona Ubuntu Servera na kojem se jasno vidi
vaše korisničko ime i naziv virtualnog stroja.



Slika 2, 3. Ažurirajte lokalnu listu dostupnih paketa i verzija te nadogradite sve pakete na najnovije verzije.

Slika 4. Instalirajte paket openssh-server , pokrenite SSH poslužitelj i provjerite njegov status.

Slika 5. Pronađite IP adresu virtualnog stroja i provjerite koji su mrežni portovi otvoreni.
Kako ćete provjeriti koji port koristi SSH poslužitelj? Naredbom hostname -I

Kada uspostavite SSH vezu s poslužiteljem, napravite screenshot terminala domaćina (SSH klijenta).
Slika 6. korištenjem NAT adaptera i port forwardinga
Slika 7.korištenjem Bridged adaptera

Slika 8. Putem domaćina, izradite novu bash skriptu unutar virtualnog stroja, u direktoriju /home/username/
(zamijenite username svojim korisničkim imenom). Skripta treba napraviti detaljan ispis svih datoteka
(uključujući skrivene) iz korijenskog direktorija VM-a ( / ).
