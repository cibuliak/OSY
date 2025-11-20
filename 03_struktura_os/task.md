```txt
-------------------------------------------------------------
|                       POUŽÍVATEĽ                          |
|            (zadáva príkazy, používa programy)             |
-------------------------------------------------------------
                           |
                           v
-------------------------------------------------------------
|                        APLIKÁCIE                          |
|   - COMMAND.COM (príkazový interpret)                     |
|   - Programy .EXE, .COM                                   |
|   - Utility (CHKDSK, COPY, FORMAT...)                     |
|   - TSR (rezidentné programy)                             |
-------------------------------------------------------------
                           |
                           v
-------------------------------------------------------------
|                     JADRO MS-DOS                          |
|                         (Kernel)                          |
|   - IO.SYS        -> nízkoúrovňový vstup/výstup           |
|   - MSDOS.SYS     -> správa súborov, pamäte, zariadení    |
|   - Ovládače zariadení (CONFIG.SYS, DEVICE=...)           |
|   - Podpora FAT12/FAT16                                   |
-------------------------------------------------------------
                           |
                           v
-------------------------------------------------------------
|                          HARDVÉR                          |
|   - CPU (x86)                                              |
|   - RAM                                                    |
|   - Disky (HDD, FDD)                                       |
|   - Grafická karta                                         |
|   - Klávesnica, displej                                    |
|   - Porty (COM, LPT)                                       |
-------------------------------------------------------------
                        BONUSOVÁ OTÁZKA:


   UNIX je bezpečnejší než MS-DOS, pretože oddeľuje používateľov a procesy, chráni pamäť a jadro, používa prístupové práva k súborom, obmedzuje priamy prístup k hardvéru a bol od začiatku navrhnutý ako viacúlohový a viacpoužívateľský systém.