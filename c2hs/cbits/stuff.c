#include "stddef.h"
#include "stuff.h"

int doubleMe(int x) {
  return x * 2;
}

const char *redFruit    = "apple";
const char *yellowFruit = "banana";
const char *greenFruit  = "lime";

const char *getFruit(int color) {
  switch (color) {
    case RED:
      return redFruit;
    case YELLOW:
      return yellowFruit;
    case GREEN:
      return greenFruit;
    default:
      return NULL;
  }
}
