# zig cc \
#   -lpcre \
#   `pkg-config --cflags gtk+-3.0` \
#   ./tmp/test.c \
#   `pkg-config --libs gtk+-3.0` 

# zig cc \
#   -lpcre \
#   ./tmp/test.c