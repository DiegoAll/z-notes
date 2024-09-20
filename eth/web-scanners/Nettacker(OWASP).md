# OWASP/Nettacker


    git clone https://github.com/OWASP/Nettacker.git

    poetry install && poetry shell
    python3 nettacker.py --show-all-modules

    python3 nettacker.py -i themagma.io -m all --verbose

    python3 nettacker.py -i themagma.io -m subdomain_scan
    python3 nettacker.py -i themagma.io -m apache_cve_2021_41773_vuln --verbose
    python3 nettacker.py -i themagma.io -m admin_scan --verbose
    python3 nettacker.py -i themagma.io -m adobe_coldfusion_cve_2023_26360_vuln --verbose
    python3 nettacker.py -i themagma.io -m apache_cve_2021_41773_vuln,citrix_cve_2019_19781_vuln --verbose
    python3 nettacker.py -i themagma.io -s critical_severity --verbose




