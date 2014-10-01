//Do not copy this code or anyone elses
//You would only be hurting yourself
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/utsname.h>
int main() {
    struct utsname ubuffer;
    uname(&ubuffer);
    printf("System name: %s\n", ubuffer.sysname);
    printf("Host name: %s\n", ubuffer.nodename);
    printf("OS Release: %s\n", ubuffer.release);
    printf("OS Version: %s\n", ubuffer.version);
    printf("CPU Type: %s\n", ubuffer.machine);
    return 0;
}
