# MITRE Caldera



http://localhost:8888/login


more conf/local.yml

users:
  blue:
    blue: J7ZLblWmGQGn7tVXYy5ZZqXbGLPBf0TinGo555-EXX4
  red:
    red: xImQZWeM9_NI_Oicp18sBID67EpxMyZkZGMP4mAJT24


> No accede.

De esta forma carga el portal:

git clone https://github.com/mitre/caldera.git --recursive
cd caldera
pip3 install -r requirements.txt
python3 server.py --insecure --build



Once started, log into http://localhost:8888 using the default credentials **red/admin**.  ?




2025-02-12 16:14:21 INFO     Using main config from conf/local.yml                                                                                                                             server.py:235
                    ERROR    Failed to decrypt saved Caldera state due to incorrect encryption key.                                                                                          file_svc.py:246
                              - If attempting to restore secure backup, verify that conf/local.yml exists with correct encryption_key value, and that the server is being run without                       
                             --insecure.                                                                                                                                                                    
                              - If attempting to restore insecure backup, verify that conf/default.yml exists with correct encryption_key value, and that the server is being run with                      
                             --insecure.                                                                                                                                                                    
                              - If correct encryption_key value cannot be recovered, rerun the server with --fresh to disregard stored server state.  



conf/default.yml

users:
  blue:
    blue: admin
  red:
    admin: admin
    red: admin




python3 server.py --fresh --build  (Se queda en el login)





