
int myfunc(char* msg){
	write(2,msg,13); //2 - stderr
	return 1;
}

int main(int argc, char *argv[]){
	myfunc("hello my dear friend");
	return 0;
};
