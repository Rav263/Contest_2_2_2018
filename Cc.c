#include <stdio.h>

int main(void){
  unsigned int input;

  scanf("%u", &input);

  unsigned int result = 0;

  for(int i = 0; i < 31; i++){
    result += input % 2;
    result <<= 1;
    input >>= 1;
  }

  result += input % 2;

  printf("%u\n", result);

  return 0;
}
