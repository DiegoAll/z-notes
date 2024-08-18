# Secure copy



scp -i /Users/dposada/.ssh/prgmtc/diegoall DiegoPosadaResume_machete.html diegoall@167.99.227.196:/home/diegoall
scp -i /root/.ssh/diegoall diegoall@167.99.227.196:/home/diegoall/car1.jpg .
scp -ri /root/.ssh/diegoall diegoall@167.99.227.196:/home/diegoall/DiegoPocs .
scp -ri ~/.ssh/prgmtc/diegoall diegoall@167.99.227.196:/home/diegoall/bkp .

scp your_username@remotehost.edu:foobar.txt /some/local/directory

scp foobar.txt your_username@remotehost.edu:/some/remote/directory

scp -r foo your_username@remotehost.edu:/some/remote/directory/bar

scp your_username@rh1.edu:/some/remote/directory/foobar.txt \

scp foo.txt bar.txt your_username@remotehost.edu:~

scp -P 2264 foobar.txt your_username@remotehost.edu:/some/remote/directory
scp your_username@remotehost.edu:/some/remote/directory/\{a,b,c\} .
scp your_username@remotehost.edu:~/\{foo.txt,bar.txt\} .


scp -c blowfish some_file your_username@remotehost.edu:~
scp -c blowfish -C local_file your_username@remotehost.edu:~