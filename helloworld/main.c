
int myfunc(char* msg){
write(1,msg,3);
return 1;
}

int main(int argc, char *argv[]){
myfunc("hello");
return 0;
};