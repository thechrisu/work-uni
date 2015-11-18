#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct queueElement{
  unsigned short num;
  struct queueElement * next;
}queueElement;

extern void enqueue(unsigned short number);
extern unsigned short dequeue();
extern int readNextInt(FILE *fp);
extern void getNextConf(char whack, bool current[16], bool (*new)[16]);
extern unsigned short boolToShort(bool currentAr[16]);

extern queueElement **qBack;
extern queueElement **qFront;