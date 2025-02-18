# ngrok


    EXAMPLES: 
    ngrok http 80                           # secure public URL for port 80 web server
    ngrok http --url baz.ngrok.dev 8080     # port 8080 available at baz.ngrok.dev
    ngrok http foo.dev:80                   # tunnel to host:port instead of localhost
    ngrok http https://localhost            # expose a local https server
    ngrok tcp 22                            # tunnel arbitrary TCP traffic to port 22
    ngrok tls --url=foo.com 443             # TLS traffic for foo.com to port 443
    ngrok start foo bar baz                 # start tunnels from the configuration file
