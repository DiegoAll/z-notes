# Pseudo terminals

    python3 -c (allows you to run code directly from the command line without the need for a file)

    python3 -c "print('Hola, mundo')"
    python3 -c "import math; print(math.sqrt(16))"
    python3 -c "print(5 + 10)"
    python3 -c "for i in range(5): print(f'Número: {i}')"
    python3 -c "import os; print(os.getenv('HOME'))"
    python3 -c "import sys; print(len(sys.argv))" argumento1 argumento2
    python3 -c "import os; print([f for f in os.listdir('.') if f.endswith('.py')])"
    python3 -c "import base64; print(base64.b64encode(b'Hola, mundo').decode())"
    python3 -c "import http.server, socketserver; socketserver.TCPServer(('', 8000), http.server.SimpleHTTPRequestHandler).serve_forever()"
    python3 -c "import datetime; print(datetime.datetime.now())"


    La misma del contains quizas la misma del pipe | con los argumentos

    python3 -c 'import pty; pty.spawn("/bin/bash")'
    python -c 'import pty; pty.spawn("/bin/sh")'
    python -c 'import pty; pty.spawn("/bin/bash")'
    python3 -c 'import pty; pty.spawn("/bin/bash")'
    perl -e 'exec "/bin/sh";'



    python -i script.py