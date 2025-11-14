

## Descrizione del progetto

Questo repository contiene l'implementazione di un semplice processore compatibile con l'ISA RISC‑V, sviluppato per il corso di Architettura dei Calcolatori. L'obiettivo è fornire una progettazione didattica che mostri i principali blocchi funzionali di una CPU (fetch, decode, execute, memory, writeback), l'implementazione della pipeline e il supporto alle istruzioni base di RISC‑V.

### Autore
Elena Maria Ciuffreda, matr.119325


### Caratteristiche principali
- Implementazione di un core RISC‑V RV32I di base.
- Pipeline a N stadi (configurabile) con gestione di hazard e forwarding.
- Supporto per istruzioni aritmetiche, logiche, load/store e branch.
- Bancos di registri, ALU, unità di controllo e memoria dati/instr.
- Testbench e suite di test per la verifica funzionale.


### Istruzioni supportate (esempi)
- Aritmetica: add, sub, addi
- Logiche: and, or, xor
- Load/Store: lw, sw
- Branch: beq, bne
- ALU immediati e operazioni su registri


### Requisiti e strumenti

- RARS (RISC-V Assembler and Runtime Simulator) — utilizzato per assemblare ed eseguire il programma da caricare nella rom della RISC‑V.
- Logisim — utilizzato per la modellazione e simulazione del datapath e dei blocchi logici.
- Java Runtime Environment (JRE) 8+ — necessario per eseguire Logisim.


### Come compilare e testare


### Contribuire
Contributi benvenuti: aprire issue per bug o feature, inviare pull request con descrizione chiara delle modifiche e test associati.

## Licenza
Questo progetto è distribuito sotto la licenza GNU General Public License v3.0 (GPLv3). Consulta il file LICENSE per i dettagli completi.
