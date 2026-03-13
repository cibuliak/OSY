# Cvičenie 6: Aktualizácia, zabezpečenie OS Windows a systémové politiky

## Úloha 1: Windows Update

### 1.1 Pojmy

1. Čo je Windows Update a na čo slúži?
Je to služba pomocou ktorej sťahujeme a aktualizujeme OS
   →

2. Čo znamená označenie KB (napr. KB5034441)?
identifikačné číslo článku/aktualizácie v databáze podpory od Microsoft
   →

3. Vysvetlite rozdiel medzi aktualizáciou kvality (Quality) a aktualizáciou funkcií (Feature):
opravuje chyby a zlepšuje bezpečnosť, zatiaľ čo aktualizácia funkcií (Feature) pridáva nové funkcie do systému Microsoft Windows.
   →

4. Prečo je nebezpečné neaktualizovať systém? Uveďte reálny príklad:
lebo neaktualizovaný OS má aj chyby aj bezpečnostné diery ktoré sa bez aktualizácie neopravia, príklad v 2017 bol ransomware ktorý napadol cez 200 000 PC ktoré nemali záplatu ktorá bola už 2 mesiace pred útokom
   →

### 1.2 Praktická časť

**Otvorte** Nastavenia → Windows Update:

| Otázka | Odpoveď |
|--------|---------|
| Je systém aktuálny? (Áno/Nie) | nie|
| Koľko aktualizácií čaká na inštaláciu? |nijaká |
| Dátum poslednej nainštalovanej aktualizácie | asi 11/26/2025 |
| KB číslo poslednej aktualizácie |  KB5072653 |

**Spustite v CMD:** `wmic qfe list brief /format:table`

| Otázka | Odpoveď |
|--------|---------|
| Koľko aktualizácií vidíte vo výpise? | 11|
| HotFixID poslednej aktualizácie |  KB5072653  |

**Otvorte** `services.msc` a nájdite službu Windows Update:

| Otázka | Odpoveď |
|--------|---------|
| Stav služby (Spustená/Zastavená) |spustená |
| Typ spustenia (Automaticky/Ručne/Zakázané) |ručne |

5. Čo by sa stalo, keby ste typ spustenia služby Windows Update zmenili na "Zakázané"?
systém Windows by nemohol automaticky vyhľadávať ani inštalovať aktualizácie
   →

---

## Úloha 2: Zabezpečenie Windows

### 2.1 Pojmy

1. Čo je Windows Defender?
vstavaný antivírus v systéme Microsoft Windows, ktorý chráni počítač pred vírusmi a škodlivým softvérom
   →

2. Aký je rozdiel medzi rýchlym a úplným skenovaním?
Rýchle skenovanie kontroluje len najčastejšie napádané miesta, zatiaľ čo úplné skenovanie prehľadá celý počítač v Microsoft Defender Antivirus
   →

3. Čo je firewall a na čo slúži? Vysvetlite vlastnými slovami:
taký kontrolór pripojení z internetu do počítača
   →

4. Windows firewall má 3 profily – vymenujte ich a napíšte, kedy sa ktorý aktivuje:

   - **Doménový:** Aktivuje sa, keď je počítač pripojený k firemnej sieti riadenej cez doménu
   - **Súkromný:**Aktivuje sa, keď je počítač pripojený k dôveryhodnej domácej alebo pracovnej sieti
   - **Verejný:**Aktivuje sa, keď je počítač pripojený k verejnej alebo neznámej sieti, napr. Wi-Fi v kaviarni

5. Čo znamená príkaz `wf.msc` a čo `firewall.cpl`? Aký je medzi nimi rozdiel?
sú to nastavenia firewallu a wf.msc poskytuje pokročilejšie nastavenia a firewall.cpl iba základné
   →

### 2.2 Praktická časť

**Otvorte** Zabezpečenie systému Windows a zapíšte stav:

| Komponent | Stav (OK / Varovanie / Chyba) |
|-----------|-------------------------------|
| Ochrana pred vírusmi a hrozbami | varovanie|
| Firewall a ochrana siete |OK |

**Spustite v CMD:** `netsh advfirewall show allprofiles state`

| Profil | Stav (ON/OFF) |
|--------|---------------|
| Doménový |ON|
| Súkromný |ON |
| Verejný |ON |

6. Prečo by ste nemali firewall vypínať, aj keď vám niečo nefunguje? Čo by ste mali urobiť namiesto toho?
lebo počítač by bol otvorený pre útoky z internetu; namiesto toho by sme mali povoliť konkrétnu aplikáciu alebo port cez firewall
   →

---

## Úloha 3: Lokálne politiky – gpedit.msc

### 3.1 Pojmy

1. Čo je gpedit.msc a na čo slúži?
je to komand, ktorý spustí ovládací panel pre administrátorov
   →

2. Aký je rozdiel medzi lokálnou politikou a doménovou politikou?
lokálna - na jednom pc, doménová - na celej sieti
   →

3. Čo robí príkaz `gpupdate /force`? Kedy ho musíte spustiť?
okamžite aplikuje politiky, 
   →

4. Čo robí príkaz `gpresult /r`?
kontroluje aplikované politiky
   →

5. Vysvetlite, čo je politika uzamknutia účtu a proti akému typu útoku chráni:
Politika uzamknutia účtu dočasne blokuje prístup po viacerých neúspešných prihláseniach a chráni tak pred útokmi hrubou silou
   →

### 3.2 Praktická časť – politiky hesiel

**Otvorte** `gpedit.msc` → Konfigurácia počítača → Nastavenia systému Windows → Nastavenia zabezpečenia → Politiky účtov → Politika hesiel

Zapíšte aktuálne hodnoty:

| Politika | Aktuálna hodnota |
|----------|-------------------|
| Minimálna dĺžka hesla |0 |
| Maximálny vek hesla | 42 dní|
| Heslo musí spĺňať požiadavky na zložitosť | disabled|
| Vynútiť históriu hesiel |0 zapamätaných hesiel |

6. Prečo je dôležité vynútiť históriu hesiel? Čo by sa stalo bez nej?
Vynútenie histórie hesiel zabraňuje používateľom opakovane používať staré heslá, čím znižuje riziko kompromitácie účtu; bez nej by si používatelia mohli stále používať rovnaké heslá, čo by uľahčilo útoky
   →

### 3.3 Praktická časť – uzamknutie účtu a CMD

**Nastavte politiku uzamknutia účtu:**

1. Prah uzamknutia → **5 pokusov**
2. Potvrďte dobu uzamknutia **30 minút**
3. Spustite `gpupdate /force`

- [ ano ] Hotovo

**Vyskúšajte zakázať CMD:**

Cesta: Konfigurácia používateľa → Šablóny pre správu → Systém → Zabrániť prístupu k príkazovému riadku

1. Zapnite politiku → spustite `gpupdate /force` → skúste otvoriť CMD

| Otázka | Odpoveď |
|--------|---------|
| Čo sa stalo po pokuse otvoriť CMD? |otvoril sa ale pisalo ze zablokovane adminom |
| Funguje PowerShell naďalej? (Áno/Nie) |áno |

2. **DÔLEŽITÉ:** Vráťte politiku späť na **Nekonfigurované** a spustite `gpupdate /force`!

- [ ano ] Vrátené

---

## Bonusové scenáre (nepovinné)

### Scenár 1: Ransomware útok

*Kolega zavolá, že na obrazovke sa objavila správa: "Vaše súbory boli zašifrované."*

1. Čo mal mať zapnuté, aby sa tomu predišlo? (2 veci)
antivírusový program a zálohovanie a obnovenie súborou, mal by tiež mať zapnutý firewall a aktualizovaný OS
   →

2. Aký typ skenovania by ste spustili na ostatných PC?
celé/full skenovanie
   →

### Scenár 2: Nový zamestnanec

*Šéf chce: žiadny CMD, žiadne registre, heslo aspoň 10 znakov.*

1. Aký nástroj použijete? (gpedit.msc)

   →

2. Napíšte celú cestu v gpedit.msc k politike minimálnej dĺžky hesla:
Konfigurácia počítača → Nastavenia systému Windows → Nastavenia
zabezpečenia → Politiky účtov → Politika hesiel
   →

3. Napíšte celú cestu k politike zakázania CMD:
Konfigurácia používateľov → Administrative Templates → System → Prevent access to the command prompt

   →

4. Aký príkaz spustíte po zmene politík?
gpupdate /force

   →

### Scenár 3: Podozrivá aktivita

*V logoch je 50 neúspešných prihlásení na jeden účet za 10 minút.*

1. O aký typ útoku ide?
brute force útoku
   →

2. Aká politika by tomu zabránila a aké hodnoty by ste nastavili?
Account lockout threshold: 5 neúspešných pokusov

Account lockout duration: 15 minút

Reset account lockout counter after: 15 minút
asi takto by som to nastavil keďže po 5tich pokusoch je block na 15minut
   →