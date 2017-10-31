#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>

int main(void) {
    int child_status = -1;
    printf("WIFSIGNALED(-1) = %d, WEXITSTATUS(-1) = %d\n",
           WIFSIGNALED(child_status), WEXITSTATUS(child_status));
}
