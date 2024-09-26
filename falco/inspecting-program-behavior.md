# Inspecting program behavior


> strace && ltrace



behavior of processes

that you have the source code.

how it behaves when it runs and this is to look the systems calls that it makes and the library calls.


system call <> library call

system call: When a process requests something from the OS . The OS doesnt allow process to do whatever they want with the hardware and so there are times when processes want to do something like write to the screen or write to disk or send something over the network and the process has to make a request to the OS saying .
The OS system will you please write to the screen or write or open a file for me or do something or tell me what time it is all of these are things that the process can't do for itself and so it requires a system call and now in linux you can type ( man syscalls) and got the list of all the different Linux syscalls available.


library calls: calls our calls of the process makes into an existing library now this might be the C standar library or Lib Cas we call it and library call might system calls but a library call doesn't necessarily require us to switch into the kernel a library call could just keep the processor in user mode let's look at how this works again let's start with hello world, this is a nice example.

i'm gonna compiled it and then I'm going to simply I want to look at the system call that it makes and so I'm going to simply type strace:


    #include <stdio.h>

    int main()
    {
        printf("Hello World\n")
    }

    clang syscalls.c
    strace  ./.out


rawsyscall.S  (Es como en assembler)





| Característica | Syscall        | Library Call   |
|----------------|---------------|---------------|
| Nivel          | Bajo           | Alto           |
| Modo de ejecución | Kernel         | Usuario        |
| Propósito       | Interactuar con el sistema operativo | Proporcionar funcionalidades reutilizables |
| Velocidad      | Relativamente lenta | Relativamente rápida |
| Implementación | Parte del núcleo del sistema operativo | Código precompilado en una biblioteca |





De https://snowscan.io/tcp-bind-shellcode/#

ltrace ./shell_bind_tcp_c