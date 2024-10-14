# vuls (future-architect)

https://vuls.io/
https://github.com/future-architect/vuls





    [servers]
    [servers.localhost]
    host = "localhost"
    port = "local"
    scanMode = ["fast-root"]






    # config.toml
    [cveDict]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/cve.sqlite3"

    [ovalDict]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/oval.sqlite3"

    [gost]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/gost.sqlite3"

    [exploit]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/exploit.sqlite3"

    [metasploit]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/metasploit.sqlite3"

    [kevuln]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/kevuln.sqlite3"

    [cti]
    type = "sqlite3"
    SQLite3Path = "/path/to/your/cti.sqlite3"




    ./vuls scan -config /ruta/a/tu/config.toml
    ./vuls server
    ./vuls discover 192.168.0.0/24
    sudo apt-get install debian-goodies  (checkrestart)
    ./vuls configtest
    ./vuls scan
    ./vuls history



    http://localhost:5515
    http://127.0.0.1:5515
    ./vuls tui

    ./vuls report -to-localfile -format-full-text
    ./vuls report -to-localfile -format-json
    ./vuls report -to-localfile -results-dir=/ruta/a/tu/directorio -format-full-text
    ./vuls report -to-localfile -format-csv
    ./vuls report -to-localfile -format-cyclonedx-json


