#include <stdlib.h>
#include <stdio.h>

#define COLOR_RED   "\x1b[0;31m"
#define COLOR_RESET "\x1b[0m"

int main(int argc, char **argv) {

  if (argc < 2)
    return 0;

  int active_sid = atoi(argv[1]);
  static char *s = "1234yuio";

  for (int i = 2; i < argc; i++) {
    int sid = atoi(argv[i]);
    char c = s[sid - 1];
    // char c = (char) sid + '0';
    if (sid == active_sid)
      printf(COLOR_RED"%c "COLOR_RESET, c);
    else
      printf("%c ", c);
  }
}
