 clang -S -emit-llvm start.c -O3;
nasm -felf64 _start.s;
clang -static -nostdlib start.ll _start.o -o start -O3;
./start 1 2 3;
