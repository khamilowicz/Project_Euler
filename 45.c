#include <math.h>
#include <stdio.h>
#include <locale.h>

int hexagonal(int num);
int triangle(int num);
int pentagonal(int num);

int main(int argc, const char *argv[])
{
setlocale(LC_ALL, "");

  int cur = 1533776805;
  /*int cur = 40755;*/
  printf("\ntri: %i, hex: %i , pen: %i ", triangle(cur), hexagonal(cur), pentagonal(cur));	
	printf("\n");
	/*cur = 1;*/
  /*while (1){*/
    /*cur = cur + 1;*/
    /*if (triangle(cur) == 1 && pentagonal(cur) == 1 && hexagonal(cur) == 1){*/
						/*break;*/
    /*}*/
		/*if(cur%1000 == 0)*/
    /*printf("%'i \r", cur);	*/
  /*}*/
  /*printf("\nanswer: %i ", cur);	*/
  /*printf("\ntri: %i, hex: %i , pen: %i ", triangle(cur), hexagonal(cur), pentagonal(cur));	*/
  return 0;
}

int hexagonal(int num){
	double d_1 = (1- sqrt((1+8*num)))/4.0;
  double d_2 = (1+ sqrt((1+8*num)))/4.0;
	printf("Hex: d_1 = %f, d_2 = %f", d_1, d_2);
	if((d_1 > 0 && d_1 == (int) d_1) || (d_2 > 0 && d_2 == (int) d_2)){
  /*if( (d_2 > 0 && d_2 == (int) d_2)){*/
    return 1;
  }
  else{
    return 0;
  }
}

int pentagonal(int num){
	long double  d_1 = (1- sqrt((1+24*num)))/6.0;
  long double d_2 = (1+ sqrt((1+24*num)))/6.0;
	printf("Pen: d_1 = %Lf, d_2 = %Lf", d_1, d_2);
	if((d_1 > 0 && d_1 == (int) d_1) || (d_2 > 0 && d_2 == (int) d_2)){
  /*if((d_2 > 0 && d_2 == (int) d_2)){*/
    return 1;
  }
  else{
    return 0;
  }
}

int triangle(int num)
{
  num = 2*num;
  long int sqr = sqrt(num);
	printf("Tri: sqr = %li", sqr);
  if(sqr*(sqr+1) == num){
    return 1;
  }
  else {
    return 0;
  }
}

