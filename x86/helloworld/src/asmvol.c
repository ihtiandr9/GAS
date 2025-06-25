#include<unistd.h>

void myfunc(char* msg){
    asm volatile(
            "sub  $12, %%esp \n"
            "movl %0,  (%%esp) \n"
            "movl %1,  4(%%esp) \n"
            "movl %2,  8(%%esp) \n"
            "call write \n"
            "add  $12, %%esp \n"
            ::"r"(1),"r"(msg),"r"(13)
            );
    return;
}

int main(int argc, char *argv[]){
	myfunc("hello my dear friend");
	return 0;
};
