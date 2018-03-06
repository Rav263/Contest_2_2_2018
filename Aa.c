#include <stdio.h>


int main(void){
  unsigned int n;

  scanf("%u", &n);

  unsigned long long int a = n, b = n - 1;

  a = a ^ b;

  a += 1;

  a >>= 1;

  n = a;

  printf("%u\n", n);

  return 0;
}
