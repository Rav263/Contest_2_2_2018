#include <stdio.h>


long long Cnk(unsigned int n,unsigned int k){
  if(k==0 && n > 0)return 1;
  if(n <= 0 || k <= 0)return 0;
  //if(n == k)return 1;
  long long res = n;

  for(int i = 1; i <= k; i ++){
    res /= i;
    if(i == k)break;
    res *= (n - i);
  } 

  return res;
}


int main(void){
  int n, k;

  scanf("%d %d", &n, &k);

 // long long res1 = Cnk(n - 1, k + 1);
  //long long res2 = 0;

  //for(int i = k; i < n - 1; i++){
   // res2 += Cnk(i, k);
  //}

 // printf("%lld %lld\n", res1, res2);


  long long res = 0;
  unsigned int mask = 1;
  mask <<= 31;
  int some = -1;

  for(int i = 0; i < 32; i++){
    unsigned now = mask & n;
    if(now != 0){
      some = i;
      break;
    }

    mask >>= 1;
  }
  printf("\n");

  printf("%d %d %d\n",32 -  some, k + 1, mask);

  res = Cnk(32 - some, k + 1);
  mask >>= 1;
  printf("%lld\n", res);

  for(int i = some + 1; i < 32; i++){
    int now = mask & n;
    mask >>= 1;

    if(now == 0){
      int some = Cnk(31 - i, k);
      printf("%d %d %d\n", 31 - i, k, some);
      res -= Cnk(31 - i, k);
      
      if(k == 0) break;
      k--;
      continue;
    }
  }
  printf("%lld\n", res);

  return 0;
}
