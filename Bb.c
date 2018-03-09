#include <stdio.h>

int main(void){
  unsigned int mask[5] = {0xffff, 0xff00ff, 0xf0f0f0f, 0x33333333, 0x55555555};

  unsigned int input;

  scanf("%u", &input);

  unsigned int *dep = mask + 4;
  unsigned int some = 1;

  do{
    unsigned long long int now_mask = *dep;
    unsigned long long int not_mask = *dep;

    not_mask = ~not_mask;

    //unsigned long long 


    dep --;
  }while(dep != mask - 1);

  return 0;
}
