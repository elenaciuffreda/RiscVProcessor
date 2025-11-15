#!/bin/bash

# ================================================
#   RISC-V ROM ASSEMBLER
#   Compila un file .s con RARS e genera .hex
#   compatibile con Logisim ("v2.0 raw")
# ================================================

# --- Colors ---
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

# --- File temporaneo ---
TMPFILE=".tmp_logisim_compile.hex"
cleanup() {
    rm -f "$TMPFILE"
}
trap cleanup EXIT

# --- Validazione argomenti ---
if (( $# < 2 )); then
    echo -e "${RED}[ERRORE]${RESET} Uso corretto:"
    echo -e "   ${CYAN}$0 <input.s> <output.hex>${RESET}"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# --- Controllo se file sorgente esiste ---
if [[ ! -f "$INPUT" ]]; then
    echo -e "${RED}[ERRORE]${RESET} File sorgente non trovato: ${YELLOW}$INPUT${RESET}"
    exit 1
fi

# --- Controllo se RARS è installato ---
#if ! command -v rars &> /dev/null; then
#    echo -e "${RED}[ERRORE]${RESET} RARS non trovato."
#    echo -e "Installa RARS o metti 'rars' nel PATH."
#    exit 1
#fi

# --- Inizio ---
echo -e "${CYAN}========================================${RESET}"
echo -e "${CYAN}   COMPILAZIONE RISC-V (RARS → HEX)     ${RESET}"
echo -e "${CYAN}========================================${RESET}"
echo ""
echo -e "${YELLOW}[1/3] Compilo con RARS...${RESET}"

# --- Avvio RARS ---
java -jar rars1_6.jar a dump .text HexText "$TMPFILE" "$INPUT"


if [[ $? -ne 0 ]]; then
    echo -e "${RED}[ERRORE]${RESET} RARS ha fallito la compilazione."
    exit 1
fi

echo -e "${GREEN}Compilazione OK${RESET}"

# --- Converti in HEX compatibile Logisim ---
echo -e "${YELLOW}[2/3]Genero file HEX compatibile Logisim...${RESET}"

echo "v2.0 raw" > "$OUTPUT"
cat "$TMPFILE" >> "$OUTPUT"

echo -e "${GREEN}File generato: ${CYAN}$OUTPUT${RESET}"

# --- Cleanup ---
echo -e "${YELLOW}[3/3] Pulizia file temporanei...${RESET}"
cleanup

echo -e "${GREEN}Finito!${RESET}"
echo ""
echo -e "${CYAN}Puoi caricare '$OUTPUT' nella ROM di Logisim!${RESET}"
