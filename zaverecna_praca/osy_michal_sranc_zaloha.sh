#!/bin/bash
# Zálohovací skript - Michal Šranc 2.D

# Vytvorenie priečinka pre zálohy, ak neexistuje
mkdir -p /tmp/zalohy

# Zbalenie priečinka do archívu s dátumom
TAR_NAME="/tmp/zalohy/zaloha-$(date +%F).tar.gz"
tar -czf "$TAR_NAME" -C /home/cibuliak/ zaloha_sranc

echo "Záloha bola úspešne vytvorená v: $TAR_NAME"

#!/bin/bash
#
# zaloha.sh — jednoduchy zalohovaci skript
# Zabali zvoleny priecinok do .tar.gz archivu s datumom v nazve.
#
# Pouzitie:
#   chmod +x zaloha.sh     # raz: sprav skript spustitelnym
#   ./zaloha.sh            # spusti zalohu
#
# Vsetko je bezpecne: zdroj sa LEN cita, archiv sa uklada do /tmp/zalohy.

# --- Nastavenia -----------------------------------------------------------

# TODO 1: Doplň cestu k svojmu OSOBNEMU priecinku zo zadania:
#         Upravené pre: Michal Šranc (cibuliak)
ZDROJ="$HOME/zaloha_sranc"

# Kam ukladame archivy (nemusis menit).
CIEL="/tmp/zalohy"

# Datum v tvare RRRR-MM-DD — bude sucastou nazvu archivu.
DATUM=$(date +%Y-%m-%d)

# Cely nazov vysledneho archivu.
ARCHIV="$CIEL/zaloha-$DATUM.tar.gz"

# --- Kontroly -------------------------------------------------------------

# Ak zdrojovy priecinok neexistuje, skript skonci s chybou (nezalohuje nic naprazdno).
if [ ! -d "$ZDROJ" ]; then
    echo "CHYBA: zdrojovy priecinok '$ZDROJ' neexistuje."
    echo "Vytvor ho (mkdir $ZDROJ) alebo uprav premennu ZDROJ v skripte."
    exit 1
fi

# Ak cielovy priecinok na zalohy neexistuje, vytvorime ho (-p = nehlasi chybu, ak uz je).
mkdir -p "$CIEL"

# --- Zaloha ---------------------------------------------------------------

echo "Zalohujem '$ZDROJ' do '$ARCHIV' ..."

# c = create, z = gzip kompresia, f = nazov suboru.
# (zamerne BEZ v, aby vystup nebol zahlteny — pre ucenie mozes pridat v: -czvf)
tar -czf "$ARCHIV" "$ZDROJ"

# --- Vysledok -------------------------------------------------------------

echo "Hotovo. Archiv: $ARCHIV"
echo "Velkost:"
ls -lh "$ARCHIV"

# --- Kontrola obsahu archívu pre študenta ---
echo ""
echo "=== Kontrola obsahu vytvoreného TAR archívu ==="
tar -tzf "$ARCHIV"

# TODO 2 (BONUS): Namiesto tar skus pouzit rsync -av na synchronizaciu
#                 priecinka do /tmp/zalohy/zrkadlo/ a v prirucke vysvetli,
#                 kedy je lepsi tar a kedy rsync.
echo ""
echo "=== BONUS: Spúšťam synchronizáciu cez rsync ==="
mkdir -p "$CIEL/zrkadlo"
rsync -av "$ZDROJ/" "$CIEL/zrkadlo/"

echo "=== VŠETKO OK ==="
