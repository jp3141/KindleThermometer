#include <stdio.h>
#include <stdlib.h>
//#include <inttypes.h>
#define FRAMEBUFFER_NAME "/dev/fb0"
#define fb_X_Size 600L
#define fb_Y_Size 800

/*
                 600
+--------------------------------------+
|          ^                           |				 
|          |                           |				 
|       y offset                       |				 
|          |                           |				 
|          v                           |				 
|<---x---->#############               |				 
|  offset  #############               |				 
|          #############               |8				 
|          #############               |0				 
|          ## SOURCE X##               |0				 
|          #############               |				 
|          #############               |				 
|                                      |				 
|                                      |				 
|                                      |				 
|                                      |				 
|                                      |				 
+--------------------------------------+
*/


char sourceLine[fb_Y_Size]; // 800 is big enough

int main (int argc, char *argv[]) {
int i=0;
long seek;
short sourceXY[2]; // written in LSB,MSB order
int X_offset, Y_offset;
if (argc < 4) {printf("Usage: %s image_file X Y\nwill write image_file to framebuffer at X, Y\nFirst 2 words of gray scale image_file are X and Y dimensions\n", argv[0]);}
printf("argc = %i\n", argc);
printf("This:  %s\n", argv[i++]);
printf("Image: %s\n", argv[i++]);
printf("X pos: %s\n", argv[i++]);
printf("Y pos: %s\n", argv[i++]); 
X_offset = atoi(argv[2]);
Y_offset = atoi(argv[3]);
FILE *framebuffer, *source_Image;
framebuffer=fopen(FRAMEBUFFER_NAME, "r+");
printf("short int is %i\n", sizeof(short int));
source_Image=fopen(argv[1], "r"); 
fread(sourceXY, sizeof(short int), 2, source_Image); // get X, Y size (assumes contiguous in memory)
//fread(& sourceXY[1], sizeof(short int), 1, source_Image); // get Y size
//printf("At %i\n", ftell(source_Image));
printf("pointer=%p\n", &source_Image);
printf("X size = %hi, Y size = %hi\n", sourceXY[0], sourceXY[1]);
for (int iLine=0; iLine < sourceXY[1]; iLine++) { // do each line
  //fseek(source_Image, (long int) 4+sourceXY[0]*iLine, SEEK_SET); // not needed since reading sequentially
  fread(sourceLine, (size_t) sourceXY[0], 1, source_Image); // read 1 line of X size
  for (i=0; i < sourceXY[0]; i++) sourceLine[i]=~sourceLine[i];
  fseek(framebuffer, (long) (X_offset + (Y_offset+iLine)*fb_X_Size), SEEK_SET);
  fwrite(sourceLine, (size_t) sourceXY[0], 1, framebuffer);
}  
fclose(framebuffer); 
fclose(source_Image);
printf("Done\n");
}
