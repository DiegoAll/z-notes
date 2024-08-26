# Magic numbers

> xxd 

Descripción: xxd es una utilidad que crea un volcado hexadecimal de un archivo, lo que te permite ver los bytes en su representación hexadecimal y ASCII.

    xxd archivo.class
    xhexdump -c
    od -tx1z archivo.class
    file archivo.class
    strings archivo.class
    Hexadecimal Viewer en editores de texto (Multiplataforma) Ej hexeditor
    print(open('archivo.ext', 'rb').read(8).hex())



Sí, en el mundo de la informática, existen varias constantes mágicas (también conocidas como magic numbers o magic bytes) que se utilizan para identificar tipos específicos de archivos o para denotar el inicio de un archivo en particular. Estas constantes son específicas de diferentes lenguajes de programación o formatos de archivo. A continuación, te menciono algunas de las más conocidas, además de CAFEBABE para los archivos .class de Java:

ELF (Executable and Linkable Format):

Constante mágica: 0x7F 45 4C 46 (corresponde a 0x7F 'E' 'L' 'F' en ASCII)
Uso: Es la constante mágica al inicio de los archivos ejecutables en sistemas Unix/Linux.
Mach-O (Mach Object file format):

Constante mágica: 0xFEEDFACE o 0xCEFAEDFE
Uso: Utilizado en ejecutables, bibliotecas y otros formatos de archivo en sistemas macOS.
PE (Portable Executable):

Constante mágica: 0x4D5A (corresponde a MZ en ASCII)
Uso: Es la firma de los archivos ejecutables en sistemas Windows.
PNG (Portable Network Graphics):

Constante mágica: 0x89 50 4E 47 0D 0A 1A 0A (corresponde a ‰PNG....)
Uso: Identifica archivos de imagen PNG.
ZIP:

Constante mágica: 0x50 4B 03 04 (corresponde a PK..)
Uso: Indica archivos comprimidos en formato ZIP.
PDF (Portable Document Format):

Constante mágica: 0x25 50 44 46 (corresponde a %PDF en ASCII)
Uso: Es el identificador de archivos PDF.
JPEG:

Constante mágica: 0xFF D8 FF E0 (al inicio del archivo)
Uso: Es la firma de archivos de imagen JPEG.
GIF (Graphics Interchange Format):

Constante mágica: 0x47 49 46 38 (corresponde a GIF8)
Uso: Indica archivos de imagen GIF.
Python Bytecode (.pyc):

Constante mágica: 0x42 0D 0D 0A o 0x16 0D 0D 0A (dependiendo de la versión)
Uso: Identifica archivos .pyc, que son bytecode de Python.
Estos patrones o números mágicos son fundamentales en muchos contextos de análisis de archivos y detección de formatos. Similar a CAFEBABE para Java, cada uno de estos lenguajes o formatos de archivo tiene su propia marca de identificación única que ayuda a los sistemas a reconocer y procesar adecuadamente los archivos.