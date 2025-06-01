1. Otvorite htop alat i analizirajte barem: (Slika 1)

# real-time proces
355 root RT 0 347M 26368 7296 S 0.0 1.3 0:00.53 /sbin/multipathd -d -s

Proces s PID-om 355 pokrenut je od strane korisnika root.  
Ima prioritet označen kao RT (real-time) i neutralnu nice vrijednost 0, što ga svrstava među najprioritetnije procese u sustavu – koristi se za vremenski osjetljive zadatke.  
Rezervirano je 347 MB virtualne memorije, dok je stvarna potrošnja RAM-a 26368 KiB, od čega je 7296 KiB dijeljeno s ostalim procesima.  
U trenutku analize proces je u stanju mirovanja (S), ne koristi procesor, ali zauzima 1.3% ukupne fizičke memorije.  
Do sada je prikupio 0.53 sekunde procesorskog vremena.  
Pokrenut je naredbom: `/sbin/multipathd -d -s`.


# normalni proces koji je pokrenuo korisnik root
728 root 20 0 107M 21888 12672 S 0.0 1.1 0:00.07 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown--wait-for-signal

Proces PID 728 izvodi se pod korisničkim računom root.  
Postavljen je na standardni prioritet 20 uz nice vrijednost 0, što znači da se ponaša kao običan (ne real-time) proces.  
Zauzima ukupno 107 MB virtualne memorije, od čega je 21888 KiB aktivno u RAM-u, dok se 12672 KiB dijeli s drugim procesima.  
Proces je neaktivan (S – sleeping), ne koristi CPU trenutno, ali troši 1.1% ukupne memorije sustava.  
Do sada je proces izvršavan ukupno 0.07 sekundi.  
Naredba korištena za njegovo pokretanje je:  
`/usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal`.

# normalni proces koji ste vi pokrenuli
962 tomislavmi 20 0 90760 6784 6016 S 0.0 0.2 0:00.02 -bash

Proces pod brojem 962 pokrenuo je korisnik tomislavmi.  
Prioritet mu je 20, a nice vrijednost jednaka je 0 – to ga čini standardnim korisničkim procesom.  
Zauzima 90760 KiB virtualne memorije, pri čemu koristi 6784 KiB fizičke memorije, od čega se 6016 KiB dijeli među više procesa.  
Trenutno je u pasivnom stanju (S), bez aktivne upotrebe CPU-a, ali koristi 0.2% RAM-a.  
Od početka izvršavanja koristi ukupno 0.02 sekunde procesorskog vremena.  
Pokrenut je komandnom linijom: `-bash`.

2. Jednom kad napišite skriptu, možete ju pokrenuti koristeći naredbu node . Provjerite kako se proces ponaša
koristeći htop alat. Ispišite PID procesa i provjerite njegovu hijerarhiju.

# zadanim prioritetom (Slika 2)
Glavni proces je node stopwatch.js s PID 2271 koji je pokrenuti iz bash sesije koja ima PID 2107. Glavni proces sadrži 9 threadova.

# prioritetom -10 (Slika 3)
Glavni proces ima PID 2322 koji je pokrenuti iz bash sesije sa PID 2107. Glavni proces sadrži 9 threadova. Prioritet je 10 što je relativno visok prioritet, dok je Nice value -10. Naredbi je dodan "sudo" je obični korisnik ne može povećati prioritet.

# prioritetom 10 (Slika 4)
Glavni proces ima PID 2400 koji je pokrenuti iz bash sesije sa PID 2107. Glavni proces sadrži 9 threadova. Prioritet je 30 što je nizak prioritet, dok je Nice value 10.


# Ispišite PID trenutnog procesa jednom kad on započne, zatim pomoću htop alata provjerite podudara li se. (Slika 5 i Slika 6)

Iz slika se vidi da se PID 2427 podudara sa PID 2427 glavnom procesa.