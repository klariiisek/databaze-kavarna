# databaze-kavarna
## 📌 Přehled databáze

Tato databáze slouží k evidenci uživatelů, zákazníků, zaměstnanců, produktů, objednávek a položek objednávek. Umožňuje sledovat vztahy mezi zákazníkem, zaměstnancem, objednávkou a jednotlivými produkty. Součástí jsou také enum typy pro kategorizaci produktů a pracovních pozic. Vybrala jsem si kavárnu, protože v jedné pracuju, proto mě dané téma zajímá.

## 🏛️ Struktura databáze

<img width="1296" height="738" alt="kavarna" src="https://github.com/user-attachments/assets/747bf669-982a-4438-8ae3-f028c485098d" />

#### Odkaz na databazi
https://dbdiagram.io/d/KAVARNA-690dbbd96735e11170b5a894

### Uzivatel

Evidence základních informací o osobách – jméno, příjmení, email, telefon a datum vytvoření záznamu.

může být zákazník (tabulka Zakaznik)

může být zaměstnanec (tabulka Zamestnanec)

### Zakaznik

Rozšíření pro uživatele, kteří jsou zákazníky.

## Obsahuje:

vazbu na uživatele

věrnostní body

## Vztahy:

má více objednávek (tabulka Objednavka)

## Zamestnanec

Rozšíření pro uživatele, kteří pracují v podniku.

### Obsahuje:

vazbu na uživatele

typ pracovní pozice (enum typ_pozice)

datum nástupu

### Vztahy:

může obsluhovat více objednávek (Objednavka)

Produkt

Obsahuje nabídku produktů.

#### Data:
název

cena

typ produktu (enum typ_produktu)

dostupnost

### Vztahy:

může být součástí více položek objednávek (PolozkaObjednavky)

## Objednavka

Záznam o vytvořené objednávce.

### Obsahuje:

zákazníka

zaměstnance

datum a čas

celkovou cenu

#### Vztahy:

obsahuje více položek (PolozkaObjednavky)

PolozkaObjednavky

Konkrétní produkt v dané objednávce.

#### Obsahuje:

vazbu na objednávku

produkt

množství

poznámku

## 🔗 Hlavní vztahy

Uzivatel 1 ↔ 1 Zakaznik

Uzivatel 1 ↔ 1 Zamestnanec

Zakaznik 1 ↔ ∞ Objednavka

Zamestnanec 1 ↔ ∞ Objednavka

Objednavka 1 ↔ ∞ PolozkaObjednavky

Produkt 1 ↔ ∞ PolozkaObjednavky

## 🗂️ Enum typy
typ_produktu

káva

dezert

sendvič

nápoj

pivo

sušenka

dort

čaj

jiné

typ_pozice

majitel

manažer

brigádník
